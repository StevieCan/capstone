class GolferTokenController < Knock::AuthTokenController
  def create
    email = request.params["auth"] && request.params["auth"]["email"]
    golfer = Golfer.find_by(email: email)
    body = {
      jwt: auth_token.token,
      golfer: { id: golfer.id, name: golfer.name, email: golfer.email }
    }
    render json: body, status: :created
  end
end
