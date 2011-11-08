class CityMapsController < ApplicationController
  # GET /city_maps
  # GET /city_maps.json
  def index
    @city_maps = CityMap.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @city_maps }
    end
  end

  # GET /city_maps/1
  # GET /city_maps/1.json
  def show
    @city_map = CityMap.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @city_map }
    end
  end

  # GET /city_maps/new
  # GET /city_maps/new.json
  def new
    @city_map = CityMap.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @city_map }
    end
  end

  # GET /city_maps/1/edit
  def edit
    @city_map = CityMap.find(params[:id])
  end

  # POST /city_maps
  # POST /city_maps.json
  def create
    @city_map = CityMap.new(params[:city_map])

    respond_to do |format|
      if @city_map.save
        format.html { redirect_to @city_map, notice: 'City map was successfully created.' }
        format.json { render json: @city_map, status: :created, location: @city_map }
      else
        format.html { render action: "new" }
        format.json { render json: @city_map.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /city_maps/1
  # PUT /city_maps/1.json
  def update
    @city_map = CityMap.find(params[:id])

    respond_to do |format|
      if @city_map.update_attributes(params[:city_map])
        format.html { redirect_to @city_map, notice: 'City map was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @city_map.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /city_maps/1
  # DELETE /city_maps/1.json
  def destroy
    @city_map = CityMap.find(params[:id])
    @city_map.destroy

    respond_to do |format|
      format.html { redirect_to city_maps_url }
      format.json { head :ok }
    end
  end
end
