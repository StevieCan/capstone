class Api::TeetimesController < ApplicationController
  def golfer_index
    @tee_times = TeeTime.all
    render 'index.json.jbuilder'
    end
  end

  def golfer_tee_time_create
    @tee_time = TeeTime.new(
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

  def golfer_tee_time_show
    tee_time_id = params[:id]
    @tee_time = TeeTime.find(golfer_id)
    render 'show.json.jbuilder'
  end

end
