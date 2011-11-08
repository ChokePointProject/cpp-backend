class WorldMeasurementsController < ApplicationController
  # GET /world_measurements
  # GET /world_measurements.json
  def index
    @world_measurements = WorldMeasurement.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @world_measurements }
    end
  end

  # GET /world_measurements/1
  # GET /world_measurements/1.json
  def show
    @world_measurement = WorldMeasurement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @world_measurement }
    end
  end

  # GET /world_measurements/new
  # GET /world_measurements/new.json
  def new
    @world_measurement = WorldMeasurement.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @world_measurement }
    end
  end

  # GET /world_measurements/1/edit
  def edit
    @world_measurement = WorldMeasurement.find(params[:id])
  end

  # POST /world_measurements
  # POST /world_measurements.json
  def create
    @world_measurement = WorldMeasurement.new(params[:world_measurement])

    respond_to do |format|
      if @world_measurement.save
        format.html { redirect_to @world_measurement, notice: 'World measurement was successfully created.' }
        format.json { render json: @world_measurement, status: :created, location: @world_measurement }
      else
        format.html { render action: "new" }
        format.json { render json: @world_measurement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /world_measurements/1
  # PUT /world_measurements/1.json
  def update
    @world_measurement = WorldMeasurement.find(params[:id])

    respond_to do |format|
      if @world_measurement.update_attributes(params[:world_measurement])
        format.html { redirect_to @world_measurement, notice: 'World measurement was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @world_measurement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /world_measurements/1
  # DELETE /world_measurements/1.json
  def destroy
    @world_measurement = WorldMeasurement.find(params[:id])
    @world_measurement.destroy

    respond_to do |format|
      format.html { redirect_to world_measurements_url }
      format.json { head :ok }
    end
  end
end
