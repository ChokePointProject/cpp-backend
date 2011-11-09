class ReasonsController < ApplicationController
  def index
    @reasons = Reason.all

    respond_to do |format|
      format.html
      format.json { render json: @reasons.to_json(:only => [:id, :name]) }
    end
  end

  def show
    @reason = Reason.find(params[:id])
  end

  def new
    @reason = Reason.new
  end

  def create
    @reason = Reason.new(params[:reason])
    if @reason.save
      redirect_to @reason, :notice => "Successfully created reason."
    else
      render :action => 'new'
    end
  end

  def edit
    @reason = Reason.find(params[:id])
  end

  def update
    @reason = Reason.find(params[:id])
    if @reason.update_attributes(params[:reason])
      redirect_to @reason, :notice  => "Successfully updated reason."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @reason = Reason.find(params[:id])
    @reason.destroy
    redirect_to reasons_url, :notice => "Successfully destroyed reason."
  end
end
