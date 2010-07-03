class FeedController < ApplicationController
  
  caches_page :show
  
  def show
    @posts = Post.published.limit(50)
    
    respond_to do |format|
      format.atom
    end
  end
end
