class FakesController < ApplicationController

  def index
    render json: Fake.prototype('index')
  end

  def show
    @fake = Fake.prototype('show', params[:id])
    render json: @fake
  end

end
