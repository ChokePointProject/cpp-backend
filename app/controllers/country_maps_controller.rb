class CountryMapsController < ApplicationController
  # GET /country_maps
  # GET /country_maps.json
  def index
    @country_maps = CountryMap.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @country_maps }
    end
  end

  # GET /country_maps/1
  # GET /country_maps/1.json
  def show
    @country_map = CountryMap.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @country_map }
    end
  end

  # GET /country_maps/new
  # GET /country_maps/new.json
  def new
    @country_map = CountryMap.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @country_map }
    end
  end

  # GET /country_maps/1/edit
  def edit
    @country_map = CountryMap.find(params[:id])
  end

  # POST /country_maps
  # POST /country_maps.json
  def create
    @country_map = CountryMap.new(params[:country_map])

    respond_to do |format|
      if @country_map.save
        format.html { redirect_to @country_map, notice: 'Country map was successfully created.' }
        format.json { render json: @country_map, status: :created, location: @country_map }
      else
        format.html { render action: "new" }
        format.json { render json: @country_map.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /country_maps/1
  # PUT /country_maps/1.json
  def update
    @country_map = CountryMap.find(params[:id])

    respond_to do |format|
      if @country_map.update_attributes(params[:country_map])
        format.html { redirect_to @country_map, notice: 'Country map was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @country_map.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /country_maps/1
  # DELETE /country_maps/1.json
  def destroy
    @country_map = CountryMap.find(params[:id])
    @country_map.destroy

    respond_to do |format|
      format.html { redirect_to country_maps_url }
      format.json { head :ok }
    end
  end
end
