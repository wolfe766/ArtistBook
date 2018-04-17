# CREATED BY: Brandon Brown 04/12/2018
#   - band profile page controller
class BandProfilesController < ApplicationController
  before_action :set_band_profile, only: [:show, :edit, :update, :destroy]

  # GET /band_profiles
  # GET /band_profiles.json
  def index
    @band_profiles = BandProfile.all
  end

  # GET /band_profiles/1
  # GET /band_profiles/1.json
  def show
  end

  # GET /band_profiles/new
  def new
    @band_profile = BandProfile.new
  end

  # GET /band_profiles/1/edit
  def edit
  end

  # POST /band_profiles
  # POST /band_profiles.json
  def create
    @band_profile = BandProfile.new(band_profile_params)

    respond_to do |format|
      if @band_profile.save
        format.html { redirect_to @band_profile, notice: 'Band profile was successfully created.' }
        format.json { render :show, status: :created, location: @band_profile }
      else
        format.html { render :new }
        format.json { render json: @band_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /band_profiles/1
  # PATCH/PUT /band_profiles/1.json
  def update
    respond_to do |format|
      if @band_profile.update(band_profile_params)
        format.html { redirect_to @band_profile, notice: 'Band profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @band_profile }
      else
        format.html { render :edit }
        format.json { render json: @band_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /band_profiles/1
  # DELETE /band_profiles/1.json
  def destroy
    @band_profile.destroy
    respond_to do |format|
      format.html { redirect_to band_profiles_url, notice: 'Band profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_band_profile
      @band_profile = BandProfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def band_profile_params
      params.require(:band_profile).permit(:bio, :photo_path, :spotify_link)
    end
end
