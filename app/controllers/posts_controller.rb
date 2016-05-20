class PostsController < ApplicationController

  def index
    @posts = Post.all
    render json: @posts
  end

  def show
    params | find_post | serialize
  end

  def create
    @post = Post.create(params.permit(:title, :description))
    if @post.valid?
      render json: @post
    else
      render json: {errors: @post.errors}, status: :unprocessable_entity
    end
  end

  private
  def find_post
    -> (params) {
      @post ||= Post.find(params[:id])
    }
  end

  def serialize
    -> (post) {
      render json: post
    }
  end

end
