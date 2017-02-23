class Recipe < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :brews
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :comments, as: :commentable

  validates :name, presence: true
end
