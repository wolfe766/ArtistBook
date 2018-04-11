class BusinessRequestsController < ApplicationController
  before_action :set_business_request, only: [:show, :edit, :update, :destroy]
  # GET /business_requests
  # GET /business_requests.json
  def index
    @business_requests = BusinessRequest.all
  end

  # GET /business_requests/1
  # GET /business_requests/1.json
  def show
  end

  # GET /business_requests/new
  def new
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
      if @business_request.save
        format.html { redirect_to @business_request, notice: 'Your request has been sent to the artist.' }
        format.json { render :show, status: :created, location: @business_request }
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
        format.html { redirect_to @business_request, notice: 'Your request was successfully updated.' }
        format.json { render :show, status: :ok, location: @business_request }
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
      params.require(:business_request).permit(:band_decision, :location, :pay, :date, :time, :message)
    end
end
