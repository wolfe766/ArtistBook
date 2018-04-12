class HomepageController < ApplicationController
	before_action :authenticate_business!, :only => [:business]
	before_action :authenticate_band!, :only => [:band]
  def business
    @posts = Post.where(business_id: current_business.id)
  end

  def band
    @band_posts = Post.all
  end

  def home
  	
  end

end
