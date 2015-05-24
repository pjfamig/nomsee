class PostsController < ApplicationController
  def index
    @posts = Post.paginate(page: params[:page], per_page: 35)
  end

  def show
    @post = Post.find(params[:id])
    
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save 
        flash[:success] = "Photo uploaded!"
        redirect_to @post
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:success] = "Post updated"
      redirect_to @post
    else
      render 'edit'
    end
  end
  
  private

    def post_params
      params.require(:post).permit(:photo, :title, :location)
    end
end
