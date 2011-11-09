class CityMeasurementsController < ApplicationController
  # GET /city_measurements
  # GET /city_measurements.json
  def index
    if params["city"].nil?
      @city_measurements = []
    else
      begin 
        @city_measurements = CityMeasurement.where(:city => params["city"])
      rescue 
        @city_measurements = []
      end
    end

    # Find suspicious data by computing the derivatives over time and checking for rapid drops
    droplimit = -1.0/2
    if @city_measurements.size > 0 
      @city_measurements[0].is_suspicious = false

        (1..@city_measurements.size-1).each do |i|
          @city_measurements[i].is_suspicious = false
          begin 
            if ((@city_measurements[i].NumberOfClientsSplitByClientAndByServer - @city_measurements[i-1].NumberOfClientsSplitByClientAndByServer)/1) < droplimit
              @city_measurements[i].is_suspicious = true
            end
          rescue 
          end
        end 
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @city_measurements.to_json(:only => [:month, :NumberOfClientsSplitByClientAndByServer], :methods => [:suspicious, :country_code]) }
    end
  end

  # GET /city_measurements/1
  # GET /city_measurements/1.json
  def show
    @city_measurement = CityMeasurement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @city_measurement }
    end
  end

  # GET /city_measurements/new
  # GET /city_measurements/new.json
  def new
    @city_measurement = CityMeasurement.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @city_measurement }
    end
  end

  # GET /city_measurements/1/edit
  def edit
    @city_measurement = CityMeasurement.find(params[:id])
  end

  # POST /city_measurements
  # POST /city_measurements.json
  def create
    @city_measurement = CityMeasurement.new(params[:city_measurement])

    respond_to do |format|
      if @city_measurement.save
        format.html { redirect_to @city_measurement, notice: 'City measurement was successfully created.' }
        format.json { render json: @city_measurement, status: :created, location: @city_measurement }
      else
        format.html { render action: "new" }
        format.json { render json: @city_measurement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /city_measurements/1
  # PUT /city_measurements/1.json
  def update
    @city_measurement = CityMeasurement.find(params[:id])

    respond_to do |format|
      if @city_measurement.update_attributes(params[:city_measurement])
        format.html { redirect_to @city_measurement, notice: 'City measurement was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @city_measurement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /city_measurements/1
  # DELETE /city_measurements/1.json
  def destroy
    @city_measurement = CityMeasurement.find(params[:id])
    @city_measurement.destroy

    respond_to do |format|
      format.html { redirect_to city_measurements_url }
      format.json { head :ok }
    end
  end
end
