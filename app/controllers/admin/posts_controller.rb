class Admin::PostsController < AdminController
  
  
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def new
    @post = Post.new
  end
  
  def create
    post = Post.create params[:post]
        
    redirect_to edit_admin_post_path(post)
  end
  
  def update
    @post = Post.find(params[:id])

    @post.update_attributes params[:post]
    
    redirect_to edit_admin_post_path(@post)
  end

  def toggle_publish
    post = Post.find(params[:id])
    post.toggle_publish!
    
    redirect_to edit_admin_post_path(post)
  end
  
end
