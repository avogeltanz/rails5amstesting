class PostsController < ApplicationController

  def index
    @posts = Post.all
    render json: @posts
  end

  def show
    @post = Post.find(params[:id])
    render json: @post, serializer: PostSerializer
  end

  def create
    @post = Post.create(params.permit(:title, :description))
    if @post.valid?
      render json: @post
    else
      render json: {errors: @post.errors}, status: :unprocessable_entity
    end
  end

end
