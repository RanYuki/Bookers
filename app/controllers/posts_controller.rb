class PostsController < ApplicationController

  def index
    @posts = Post.all
     @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post), success: 'Book was successfully created.'
    else
      @posts = Post.all
      render :index
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:notice] = "Book was successfully destroyed."
      redirect_to posts_path
    else
      redirect_to posts_path
    end
  end

  private

  def post_params
      params.require(:post).permit(:title, :body)
  end
end
