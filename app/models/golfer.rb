class Golfer < ApplicationRecord
  has_secure_password
  has_many :tee_times
  has_many :caddies, through: :tee_times
end
