class ContinentsController < ApplicationController
  def index
    if params[:code]
      @continents = Continent.find_by_code(params[:code])
    else
      @continents = Continent.all
    end

    respond_to do |format|
      format.html
      format.json { render json: @continents.to_json(:only => [:code, :name]) }
    end
  end

  def show
    @continent = Continent.find(params[:id])
  end

  def new
    @continent = Continent.new
  end

  def create
    @continent = Continent.new(params[:continent])
    if @continent.save
      redirect_to @continent, :notice => "Successfully created continent."
    else
      render :action => 'new'
    end
  end

  def edit
    @continent = Continent.find(params[:id])
  end

  def update
    @continent = Continent.find(params[:id])
    if @continent.update_attributes(params[:continent])
      redirect_to @continent, :notice  => "Successfully updated continent."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @continent = Continent.find(params[:id])
    @continent.destroy
    redirect_to continents_url, :notice => "Successfully destroyed continent."
  end
end
