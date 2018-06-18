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

  def create
    @golfer = Golfer.new(
                        name: params[:name],
                        member_number: params[:member_number],
                        caddy_preference_one: params[:caddy_preference_one],
                        caddy_preference_2: params[:caddy_preference_2],
                        caddy_preference_3: params[:caddy_preference_3],
                        email: params[:email],
                        password_digest: params[:password_digest]
                        )
    render 'show.json.jbuilder'
  end

  def update
    golfer_id = params[:id]
    @golfer = Golfer.find(golfer_id)
    @golfer.name = params[:name] || @golfer.name
    @golfer.member_number = params[:member_number] || @golfer.member_number
    @golfer.caddy_preference_one = params[:caddy_preference_one] || @golfer.caddy_preference_one
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
