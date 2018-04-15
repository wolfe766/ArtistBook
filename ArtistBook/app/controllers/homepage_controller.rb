class HomepageController < ApplicationController
	before_action :authenticate_business!, :only => [:business]
	before_action :authenticate_band!, :only => [:band]
  layout false, only: [:home]
  def business
    @posts = Post.where(business_id: current_business.id)
  end

  def band
    @posts_applied = Response.where(band_id: current_band.id).map{|response| response.post}
  end

  def home
  	
  end

end
