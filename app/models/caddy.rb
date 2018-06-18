class Caddy < ApplicationRecord
  has_many :tee_times
  has_many :golfers, through: :tee_times
  

end
