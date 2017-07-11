class Pilot < ApplicationRecord
  has_many :flights, dependent: :destroy

  has_secure_password
end
