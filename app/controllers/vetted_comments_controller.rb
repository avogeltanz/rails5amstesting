class VettedCommentsController < ApplicationController
  def index
    render json: VettedComment.vet_comment("Your post was stupid and you should be ashamed!")
  end

  def show
    render json: VettedComment.prototype('show', params[:id])
  end
end
