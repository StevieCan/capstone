class Location < ApplicationRecord
  has_many :tee_times
  has_many :caddies, through: :tee_times
  has_many :golfers, through: :tee_times
end
