class User < ApplicationRecord
  has_secure_password

  has_many :comments
  has_many :brews
  has_many :recipes, through: :brews

  # validates :username, presence: true
  # validates :email, presence: true
  # validates :email, uniqueness: true
  # validates :email, :email, format: { with: /\w{2,}\@\w+\.\w{2,3}/, message: "only allows valid emails"}

end
