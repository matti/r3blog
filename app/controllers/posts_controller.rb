class PostsController < ApplicationController
  
  caches_page :index, :show

  
  def index
    @posts = Post.published
  end
  
  def show
    @post = Post.published.find(params[:id])
  end
end
