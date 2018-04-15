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
  def create
    @business_request = BusinessRequest.new(business_request_params)
    respond_to do |format|
      if @business_request.valid?
        @business_request.save!
        flash[:notice] = "Your request has been sent to the artist."
        format.html { redirect_to :action => "index" }
        format.json { render :index, status: :created, location: @business_request }
      else
        format.html { render :new }
        format.json { render json: @business_request.errors, status: :unprocessable_entity }
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
