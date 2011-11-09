class CountriesController < ApplicationController
  def index
    if params[:code]
      @countries = Country.find_by_code(params[:code])
    else
      @countries = Country.all
    end

    respond_to do |format|
      format.html
      format.json { render json: @countries.to_json(:only => [:code, :name]) }
    end
  end

  def show
    @country = Country.find(params[:id])
  end

  def new
    @country = Country.new
  end

  def create
    @country = Country.new(params[:country])
    if @country.save
      redirect_to @country, :notice => "Successfully created country."
    else
      render :action => 'new'
    end
  end

  def edit
    @country = Country.find(params[:id])
  end

  def update
    @country = Country.find(params[:id])
    if @country.update_attributes(params[:country])
      redirect_to @country, :notice  => "Successfully updated country."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @country = Country.find(params[:id])
    @country.destroy
    redirect_to countries_url, :notice => "Successfully destroyed country."
  end
end
