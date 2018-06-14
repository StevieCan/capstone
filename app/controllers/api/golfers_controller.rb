class Api::GolfersController < ApplicationController

  def index
    @golfer = Golfer.all
    render 'index.json.jbuilder'
  end

  def show
    golfer_id = params[:id]
    @golfer = Golfer.find(golfer_id)
    render 'show.json.jbuilder'
  end

end
