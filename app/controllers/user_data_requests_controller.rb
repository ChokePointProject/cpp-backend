class UserDataRequestsController < ApplicationController

  def index
    if params.empty?
      @user_data_requests = UserDataRequest.includes(:country).all
    else
      @user_data_requests = UserDataRequest.includes(:country)
      if params[:country_code]
        @user_data_requests = @user_data_requests.where('country_id' => Country.find_by_code(params[:country_code]).id)
      end
      if params[:after]
        @user_data_requests = @user_data_requests.where("period_start >= ?", params[:after])
      end
      if params[:before]
        @user_data_requests = @user_data_requests.where("period_end <= ?", params[:before])
      end
    end

    respond_to do |format|
      format.html
      format.json { render json:
        @user_data_requests.to_json(
          :only => [:period_start, :period_end, :requests, :percentage_complied, :accounts],
          :include => {:country => {:only => [:code, :name]}}
        )
      }
    end
  end

  def show
    @user_data_request = UserDataRequest.find(params[:id])
  end

  def new
    @user_data_request = UserDataRequest.new
  end

  def create
    @user_data_request = UserDataRequest.new(params[:user_data_request])
    if @user_data_request.save
      redirect_to @user_data_request, :notice => "Successfully created user data request."
    else
      render :action => 'new'
    end
  end

  def edit
    @user_data_request = UserDataRequest.find(params[:id])
  end

  def update
    @user_data_request = UserDataRequest.find(params[:id])
    if @user_data_request.update_attributes(params[:user_data_request])
      redirect_to @user_data_request, :notice  => "Successfully updated user data request."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @user_data_request = UserDataRequest.find(params[:id])
    @user_data_request.destroy
    redirect_to user_data_requests_url, :notice => "Successfully destroyed user data request."
  end
end
