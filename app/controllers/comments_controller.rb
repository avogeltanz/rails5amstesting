class CommentsController < ApplicationController
  def index
    render json: Comment.all, each_serializer: CommentSerializer
  end

  def show
    @comment = Comment.find(params[:id])
    render json: @comment
  end

  def create
    @comment = Comment.create(params.permit(:body))
    if @comment.valid?
      render json: @comment
    else
      render json: {errors: @comment.errors}, status: :unprocessable_entity
    end
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.body = params[:body]
    if @comment.valid?
      @comment.save
      render json: @comment
    else
      render json: {errors: @comment.errors}, status: :unprocessable_entity
    end
  end
end
