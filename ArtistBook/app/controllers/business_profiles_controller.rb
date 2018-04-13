class BusinessProfilesController < ApplicationController
  before_action :set_business_profile, only: [:show, :edit, :update, :destroy]

  # GET /business_profiles
  # GET /business_profiles.json
  def index
    @business_profiles = BusinessProfile.all
  end

  # GET /business_profiles/1
  # GET /business_profiles/1.json
  def show
  end

  # GET /business_profiles/new
  def new
    @business_profile = BusinessProfile.new
  end

  # GET /business_profiles/1/edit
  def edit
  end

  # POST /business_profiles
  # POST /business_profiles.json
  def create
    @business_profile = BusinessProfile.new(business_profile_params)

    respond_to do |format|
      if @business_profile.save
        format.html { redirect_to @business_profile, notice: 'Business profile was successfully created.' }
        format.json { render :show, status: :created, location: @business_profile }
      else
        format.html { render :new }
        format.json { render json: @business_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /business_profiles/1
  # PATCH/PUT /business_profiles/1.json
  def update
    respond_to do |format|
      if @business_profile.update(business_profile_params)
        format.html { redirect_to @business_profile, notice: 'Business profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @business_profile }
      else
        format.html { render :edit }
        format.json { render json: @business_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /business_profiles/1
  # DELETE /business_profiles/1.json
  def destroy
    @business_profile.destroy
    respond_to do |format|
      format.html { redirect_to business_profiles_url, notice: 'Business profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business_profile
      @business_profile = BusinessProfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def business_profile_params
      params.fetch(:business_profile, {})
    end
end
