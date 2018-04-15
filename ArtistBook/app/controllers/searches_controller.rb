class SearchesController < ApplicationController
  before_action :set_search, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_business!

  # GET /searches
  # GET /searches.json
  def index
    @searches = Search.where(business_id: current_business.id)
  end

  # GET /searches/1
  # GET /searches/1.json
  def show
    if !@search.genre && !@search.band_name
      redirect_to action: show, id: params[:id]
    end
    # Get array of band ids that match the genre and name searched for. Empty array if not searched for.
    @band_id_by_genre = @search.genre ? Band.where(genre: @search.genre).map{|b| b.id} : []
    @band_id_by_name = @search.band_name ? Band.where(band_name: @search.band_name).map{|b| b.id} : []
    # Get the unique bands that match the search.
    @bands = Band.find((@band_id_by_genre + @band_id_by_name).uniq)
    @new_search = Search.new
  end

  # GET /searches/new
  def new
    @search = Search.new
  end

  # GET /searches/1/edit
  def edit
  end

  # POST /searches
  # POST /searches.json
  def create
    @search = Search.new(search_params)
    @search.business_id = current_business.id

    respond_to do |format|
      if @search.save
        format.html { redirect_to @search}
        format.json { render :show, status: :created, location: @search }
      else
        format.html { render :new }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /searches/1
  # PATCH/PUT /searches/1.json
  def update
    respond_to do |format|
      if @search.update(search_params)
        format.html { redirect_to @search}
        format.json { render :show, status: :ok, location: @search }
      else
        format.html { render :edit }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /searches/1
  # DELETE /searches/1.json
  def destroy
    @search.destroy
    respond_to do |format|
      format.html { redirect_to searches_url, notice: 'Search was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_search
      @search = Search.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def search_params
      params.require(:search).permit(:genre, :business_id)
    end
end
