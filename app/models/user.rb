class User < ApplicationRecord
  has_secure_password

  has_many :tee_times
end
