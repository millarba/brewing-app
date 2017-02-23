class User < ApplicationRecord
  has_secure_password

  has_many :brews
  has_many :recipes
  has_many :comments


  # validates :username, presence: true
  # validates :email, presence: true
  # validates :email, uniqueness: true
  # validates :email, :email, format: { with: /\w{2,}\@\w+\.\w{2,3}/, message: "only allows valid emails"}

end
