class Api::TeetimesController < ApplicationController
  def index
    @tee_times = TeeTime.all
    render 'index.json.jbuilder'
  end

  def create
    @tee_time = TeeTime.new(
                            user_id: current_user.id,
                            caddy_id: params[:caddy_id],
                            golfer_id: params[:golfer_id],
                            location_id: params[:location_id],
                            confirmed: params[:confirmed],
                            no_caddy: params[:no_caddy],
                            cart: params[:cart],
                            number_of_holes: params[:number_of_holes],
                            start_time: params[:start_time]
      )
    @tee_time.save
    render 'show.json.jbuilder'
  end

  def show
    tee_time_id = params[:id]
    @tee_time = TeeTime.find(tee_time_id)
    render 'show.json.jbuilder'
  end

end
