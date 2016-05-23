class CommentsController < ApplicationController
  def index
    render json: Comment.prototype('index'), each_serializer: CommentSerializer
  end

  def show
    render json: Comment.prototype('show', params[:id])
  end

  def show_fake
    render json: Fake.prototype('show'), serializer: FakeSerializer
  end
end
