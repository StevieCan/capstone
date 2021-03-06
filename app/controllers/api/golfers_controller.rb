class Api::GolfersController < ApplicationController
  before_action :authenticate_golfer
  
  def index
    p current_golfer
    @golfers = Golfer.all
    render 'index.json.jbuilder'
  end

  def show
    golfer_id = params[:id]
    @golfer = Golfer.find(golfer_id)
    render 'show.json.jbuilder'
  end

  def create
    @golfer = Golfer.new(
                        name: params[:name],
                        member_number: params[:member_number],
                        caddy_preference_1: params[:caddy_preference_1],
                        caddy_preference_2: params[:caddy_preference_2],
                        caddy_preference_3: params[:caddy_preference_3],
                        email: params[:email],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation]
                        )
    if @golfer.save
      render "show.json.jbuilder"
    else
      render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    golfer_id = params[:id]
    @golfer = Golfer.find(golfer_id)
    @golfer.name = params[:name] || @golfer.name
    @golfer.member_number = params[:member_number] || @golfer.member_number
    @golfer.caddy_preference_1 = params[:caddy_preference_1] || @golfer.caddy_preference_1
    @golfer.caddy_preference_2 = params[:caddy_preference_2] || @golfer.caddy_preference_2
    @golfer.caddy_preference_3 = params[:caddy_preference_3] || @golfer.caddy_preference_3
    @golfer.password_digest = params[:password_digest] || @golfer.password_digest
    @golfer.email = params[:email] || @golfer.email
    

    render 'show.json.jbuilder'
  end

  def destroy
    golfer_id = params[:id]
    @golfer = Golfer.find(golfer_id)
    @golfer.destroy
    render json: {message: "Golfer successfully deleted"}    
  end

end
