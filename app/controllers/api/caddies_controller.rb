class Api::CaddiesController < ApplicationController

  def index
    @caddies = Caddy.all
    render 'index.json.jbuilder'
  end

  def show
    caddy_id = params[:id]
    @caddy = Caddy.find(caddy_id)
    # caddy_tee_time = TeeTime.find_by(caddy_id)
    render 'show.json.jbuilder'
  end

  def create
    @caddy = Caddy.new(
                      name: params[:name],
                      email: params[:email],
                      phone_number: params[:phone_number],
                      username: params[:username],
                      password_digest: params[:password_digest],
                      ranking: params[:ranking],
                      admin: params[:admin]
      )    
    if @caddy.save
      render "show.json.jbuilder"
    else
      render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    caddy_id = params[:id]
    @caddy = Caddy.find(caddy_id)
    @caddy.name = params[:name] || @caddy.name
    @caddy.email = params[:email] || @caddy.email
    @caddy.phone_number = params[:phone_number] || @caddy.phone_number
    @caddy.username = params[:username] || @caddy.username
    @caddy.password_digest = params[:password_digest] || @caddy.password_digest
    @caddy.ranking = params[:ranking] || @caddy.ranking
    @caddy.admin = params[:admin] || @caddy.admin

    render 'show.json.jbuilder'
  end

  def destroy
    caddy_id = params[:id]
    @caddy = Caddy.find(caddy_id)
    @caddy.destroy
    render json: {message: "Caddy successfully deleted"}
  end

end
