class CountryMeasurementsController < ApplicationController
  # GET /country_measurements
  # GET /country_measurements.json
  def index
    @country_measurements = CountryMeasurement.where(:country => params["country_map_id"])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @country_measurements }
    end
  end

  # GET /country_measurements/1
  # GET /country_measurements/1.json
  def show
    @country_measurement = CountryMeasurement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @country_measurement }
    end
  end

  # GET /country_measurements/new
  # GET /country_measurements/new.json
  def new
    @country_measurement = CountryMeasurement.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @country_measurement }
    end
  end

  # GET /country_measurements/1/edit
  def edit
    @country_measurement = CountryMeasurement.find(params[:id])
  end

  # POST /country_measurements
  # POST /country_measurements.json
  def create
    @country_measurement = CountryMeasurement.new(params[:country_measurement])

    respond_to do |format|
      if @country_measurement.save
        format.html { redirect_to @country_measurement, notice: 'Country measurement was successfully created.' }
        format.json { render json: @country_measurement, status: :created, location: @country_measurement }
      else
        format.html { render action: "new" }
        format.json { render json: @country_measurement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /country_measurements/1
  # PUT /country_measurements/1.json
  def update
    @country_measurement = CountryMeasurement.find(params[:id])

    respond_to do |format|
      if @country_measurement.update_attributes(params[:country_measurement])
        format.html { redirect_to @country_measurement, notice: 'Country measurement was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @country_measurement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /country_measurements/1
  # DELETE /country_measurements/1.json
  def destroy
    @country_measurement = CountryMeasurement.find(params[:id])
    @country_measurement.destroy

    respond_to do |format|
      format.html { redirect_to country_measurements_url }
      format.json { head :ok }
    end
  end
end
