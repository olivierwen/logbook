class Pilot < ApplicationRecord
  has_many :flights, dependent: :destroy
  validates :pseudo, :uniqueness => true
  validates :password, :length => { :in => 6..20, :too_short => "doit faire au moins %{count} caractères"}
  has_secure_password
end
