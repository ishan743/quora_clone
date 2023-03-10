class PostsController < ApplicationController
  def index
    @posts = Post.all
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
      redirect_to @post
    else
      render 'new'
    end
  end

  # def like
  #   @post = Post.find(params[:id])
  #   @post.likes += 1
  #   @post.save
  #   redirect_to @post
  # end

  # def dislike
  #   @post = Post.find(params[:id])
  #   @post.dislikes += 1
  #   @post.save
  #   redirect_to @post
  # end

  def like
    @post = Post.find(params[:id])
    @post.increment!(:likes)
    respond_to do |format|
      format.js
    end
  end
  
  def dislike
    @post = Post.find(params[:id])
    @post.increment!(:dislikes)
    respond_to do |format|
      format.js
    end
  end
  
  private
    def post_params
      params.require(:post).permit(:content)
    end
end
