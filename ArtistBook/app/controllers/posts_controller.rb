class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
 # before_action :authenticate_business!
 # before_action :authenticate_band! 

=begin
  MODIFIED: David Levine 4/9/2018
    -Modified all routing functions to check user is logged in, and 
     redirect if not.
=end

  # GET /posts
  # GET /posts.json

=begin
  CREATED: David Levine 4/9/2018
  Descrtion: a method used to check and reroute the user to the root page
  if they are not logged in
=end

def get_login_type_or_redirect is_band_logged_in, is_business_logged_in
    if !is_band_logged_in && !is_business_logged_in
      flash[:alert] = "You must be logged into an account to access this page."
      redirect_to :root
    else
      if is_band_logged_in
        "band"
      else
        "business"
      end
    end
    
end

=begin
  MODIFIED: David Levine 4/9/2018
    -index will only provide the posts that a buiness has made.
=end
  def index
    user_type = get_login_type_or_redirect band_signed_in?, business_signed_in?
    
    if user_type == "business"
      @posts = Post.where business_id: current_business.id
    elsif user_type == "band"
      @posts = Post.all
    end
    
  end

  # GET /posts/1
  # GET /posts/1.json
=begin
  MODIFIED: David Levine 4/9/2018
    -restricts businesses so they can only view their own posts
=end  
  def show
    user_type = get_login_type_or_redirect band_signed_in?, business_signed_in?
    if user_type == "business" 
      #restrict business from viewing other businesses posts.
      @post = Post.find(params[:id])
      if @post.business_id != current_business.id
        flash[:alert] = "You are not authorized to view other business posts."
        redirect_to action: "index"
      end
    end
  end

  # GET /posts/new
  def new
    user_type = get_login_type_or_redirect band_signed_in?, business_signed_in?
    if user_type == "business"
      @post = Post.new
    elsif user_type == "band"
      flash[:alert] = "You are not authorized to make posts."
      redirect_to action: "index"
    end
  end

  # GET /posts/1/edit
  def edit
    user_type = get_login_type_or_redirect band_signed_in?, business_signed_in?
    if user_type == "business"
      @post = Post.find(params[:id])
      #check if post is made by user trying to edit it
      if @post.business_id != current_business.id
        flash[:alert] = "You are not authorized to edit this post"
        redirect_to action: "index"
      end
      #restrict bands from editing any post
    elsif user_type == "band"
      flash[:alert] = "You are not authorized to edit this post"
      redirect_to action: "index"
    end
  end

  # POST /posts
  # POST /posts.json

=begin
   MODIFIED: David Levine 4/9/2018
      -Changed post so that business_id is assigned from whatever 
       business  is signed in and business doesn't need to specify 
       that it's them.
=end
  def create
    user_type = get_login_type_or_redirect band_signed_in?, business_signed_in?
    if user_type == "business"
      @post = Post.new(post_params)
      @post.business_id = current_business.id

      respond_to do |format|
        if @post.save
          format.html { redirect_to @post, notice: 'Post was successfully created.' }
          format.json { render :show, status: :created, location: @post }
        else
          format.html { render :new }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    elsif user_type == "band"
      flash[:alert] = "You are not authorized to create posts"
      redirect_to action: "index"
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    user_type = get_login_type_or_redirect band_signed_in?, business_signed_in?
    if user_type == "business" && @post.business_id == current_business.id
      respond_to do |format|
        if @post.update(post_params)
          format.html { redirect_to @post, notice: 'Post was successfully updated.' }
          format.json { render :show, status: :ok, location: @post }
        else
          format.html { render :edit }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    elsif user_type == "business"
      flash[:alert] = "You are not authorized to update posts which are not yours"
      redirect_to action: "index"
    elsif user_type == "band"
      flash[:alert] = "You are not authorized to update posts"
      redirect_to action: "index"
    end 
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    user_type = get_login_type_or_redirect band_signed_in?, business_signed_in?
    if user_type == "business" && @post.business_id == current_business.id
      @post.destroy
      respond_to do |format|
        format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
        format.json { head :no_content }
      end
    elsif user_type == "business"
      flash[:alert] = "You are not authorized to delete posts which are not yours"
      redirect_to action: "index"
    elsif user_type == "band"
      flash[:alert] = "You are not authorized to delete posts"
      redirect_to action: "index"
    end 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:message, :date, :business_id, :pay, :location)
    end
end
