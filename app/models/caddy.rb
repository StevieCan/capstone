class Caddy < ApplicationRecord
  has_secure_password
  has_many :tee_times
  has_many :golfers, through: :tee_times
end
