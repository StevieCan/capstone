class CaddyTokenController < Knock::AuthTokenController
  def create
    email = request.params["auth"] && request.params["auth"]["email"]
    caddy = Caddy.find_by(email: email)
    body = {
      jwt: auth_token.token,
      caddy: { id: caddy.id, name: caddy.name, email: caddy.email }
    }
    render json: body, status: :created
  end
end
