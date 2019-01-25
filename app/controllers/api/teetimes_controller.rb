class Api::TeetimesController < ApplicationController

  def golfer_tee_time_index
    @tee_times = TeeTime.all
    render 'index.json.jbuilder'
  end

  
  def golfer_tee_time_create
    @tee_time = TeeTime.new(
                            # golfer_id: params[:golfer_id],
                            # location_id: params[:location_id],
                            # confirmed: params[:confirmed],
                            # golfer_id: current_golfer.id,
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
    if current_golfer
      @tee_time = TeeTime.find(tee_time_id)
      render 'show.json.jbuilder'
    end
  end

  
  def caddy_tee_time_index
     @tee_times = TeeTime.where(no_caddy: false, caddy_id: nil, confirmed: false)
     @unconfirmed_tee_times = TeeTime.where(no_caddy: false, caddy_id: nil, confirmed: false)
     @confirmed_tee_times = TeeTime.where(caddy_id: 2)
     # @confirmed_tee_times = current_caddy.tee_times
    render 'caddy_index.json.jbuilder'
  end

  # def sms
  #     phone_number = params[:phone_number]
  #     account_sid = "AC48f49eac7f33bdd27cc797695634a638" # Your Account SID from www.twilio.com/console
  #     auth_token = "1163fbbff5864724d85470b54be287c"   # Your Auth Token from www.twilio.com/console

  #     @client = Twilio::REST::Client.new account_sid, auth_token
  #     message = @client.messages.create(
  #         body: "Your tee time has been confirmed!",
  #         to: "+#{phone_number}",    
  #         from: "+12345678901")  
  #     # puts message.sid
  # end


  def caddy_tee_time_confirm

    @tee_time = TeeTime.find(params[:id])

    @tee_time.caddy_id = params[:caddy_id]
    @tee_time.confirmed = true
    @tee_time.save

    @unconfirmed_tee_times = TeeTime.where(no_caddy: false, caddy_id: nil, confirmed: false)

    @confirmed_tee_times = TeeTime.where(caddy_id: params[:caddy_id])

    render 'caddy_index.json.jbuilder'
  end

  def caddy_tee_time_show
    tee_time_id = params[:id]
    @tee_time = TeeTime.find(tee_time_id)
    render 'show.json.jbuilder'
  end




end
