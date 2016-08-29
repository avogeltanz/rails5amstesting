class TestModelsController < ApplicationController

  def show
    @tm = TestModel.find(params[:id])
    puts @tm.inspect
    render json: @tm
  end

end