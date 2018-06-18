class Golfer < ApplicationRecord
  has_many :tee_times
  has_many :caddies, through: :tee_times
end
