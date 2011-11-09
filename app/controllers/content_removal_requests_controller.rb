class ContentRemovalRequestsController < ApplicationController

  def index
    @content_removal_requests = ContentRemovalRequest.includes([:content_removal_request_period, :product, :reason])
    if params[:country_code]
      @content_removal_requests = @content_removal_requests.where('content_removal_request_periods.country_id' => Country.find_by_code(params[:country_code]).id)
    end
    if params[:after]
      @content_removal_requests = @content_removal_requests.where("content_removal_request_periods.period_start > ?", params[:after])
    end
    if params[:before]
      @content_removal_requests = @content_removal_requests.where("content_removal_request_periods.period_end < ?", params[:before])
    end
    if params[:product_id]
      @content_removal_requests = @content_removal_requests.where('product_id' => params[:product_id])
    end
    if params[:reason_id]
      @content_removal_requests = @content_removal_requests.where('reason_id' => params[:reason_id])
    end

    respond_to do |format|
      format.html
      format.json { render json:
        @content_removal_requests.to_json(
          :include => {
            :content_removal_request_period => {
              :only => [:period_start, :period_end, :percentage_complied],
              :include => {:country => {:only => [:code, :name]}}
            },
            :product => {:only => :name},
            :reason => {:only => :name}
          },
          :only => [:court_orders, :executive, :items]
        )
      }
    end
  end

  def show
    @content_removal_request = ContentRemovalRequest.find(params[:id])
  end

  def new
    @content_removal_request = ContentRemovalRequest.new
  end

  def create
    @content_removal_request = ContentRemovalRequest.new(params[:content_removal_request])
    if @content_removal_request.save
      redirect_to @content_removal_request, :notice => "Successfully created content removal request."
    else
      render :action => 'new'
    end
  end

  def edit
    @content_removal_request = ContentRemovalRequest.find(params[:id])
  end

  def update
    @content_removal_request = ContentRemovalRequest.find(params[:id])
    if @content_removal_request.update_attributes(params[:content_removal_request])
      redirect_to @content_removal_request, :notice  => "Successfully updated content removal request."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @content_removal_request = ContentRemovalRequest.find(params[:id])
    @content_removal_request.destroy
    redirect_to content_removal_requests_url, :notice => "Successfully destroyed content removal request."
  end
end
