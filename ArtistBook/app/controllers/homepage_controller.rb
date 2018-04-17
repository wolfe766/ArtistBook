class HomepageController < ApplicationController
	before_action :authenticate_business!, :only => [:business]
	before_action :authenticate_band!, :only => [:band]
  layout false, only: [:home]
  def business
    @posts = Post.where(business_id: current_business.id)
  end

  def band
    @posts_applied = Response.where(band_id: current_band.id).map{|response| response.post}
    @posts_applied = @posts_applied.first(3);
    @posts_not_applied = Post.find Post.all.map{|p| p.id} - @posts_applied.map{|post| post.id}
    @posts_not_applied = @posts_not_applied.first(3);

    @business_requests = BusinessRequest.where(band_id: current_band.id)
    @requests = @business_requests.count - @business_requests.count(:band_decision)

    if@requests > 0
      @has_requests = true;
    else
      @has_requests = false;
    end
  end

  def home
  	
  end

end
