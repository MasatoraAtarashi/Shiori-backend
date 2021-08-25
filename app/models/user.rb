class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable
  devise :omniauthable

  include DeviseTokenAuth::Concerns::User

end
