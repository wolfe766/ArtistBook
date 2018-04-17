class BusinessRequestsController < ApplicationController
  before_action :set_business_request, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_business!, only: [:new]
  # GET /business_requests
  # GET /business_requests.json
  def index
    if business_signed_in?
      @business_requests = BusinessRequest.where(business_id: current_business.id)
    elsif band_signed_in?
      @business_requests = BusinessRequest.where(band_id: current_band.id)
    end
  end

  # GET /business_requests/1
  # GET /business_requests/1.json
  def show
  end

  # GET /business_requests/new?band_id=BAND_ID
  # or
  def new
    if params[:band_id]
      @band_id = params[:band_id]
    end
    @business_id = current_business.id
    @business_request = BusinessRequest.new
  end

  # GET /business_requests/1/edit
  def edit
  end

  # POST /business_requests
  # POST /business_requests.json
=begin
    MODIFIED: David Levine 4/16/2018
      -Fixed a bug where a failure to enter the correct
       values would break your ability to create a post. 
=end 
  def create
     print "\n\nEntering create page" +"\n\n"
    @business_request = BusinessRequest.new(business_request_params)
    
    if @business_request.valid?
      respond_to do |format|
          
          flash[:alert] = "Your request has been sent to the artist."
          format.html { redirect_to :action => "index" }
          format.json { render :index, status: :created, location: @business_request }
      end
    else
        respond_to do |format|
        flash[:alert] = "ERROR: you entered incorrect values into your form. Try again."
        format.html { redirect_to :action => "new", band_id: business_request_params[:band_id]}
        #format.html { render :new }
        #format.json { render json: @business_request.errors, status: :unprocessable_entity }
      end
  
    end
  end

  # PATCH/PUT /business_requests/1
  # PATCH/PUT /business_requests/1.json
  def update
    respond_to do |format|
      if @business_request.update(business_request_params)
        format.html { redirect_to :action => "index" }
        format.json { render :index, status: :ok, location: @business_request }
      else
        format.html { render :edit }
        format.json { render json: @business_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /business_requests/1
  # DELETE /business_requests/1.json
  def destroy
    @business_request.destroy
    respond_to do |format|
      format.html { redirect_to business_requests_url, notice: 'Your request was successfully deleted' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business_request
      @business_request = BusinessRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def business_request_params
      params.require(:business_request).permit(:band_decision, :location, :pay, :date, :time, :message, :band_id, :business_id)
    end
end
