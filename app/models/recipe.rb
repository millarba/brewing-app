class Recipe < ApplicationRecord
  belongs_to :user
  has_many :brews
  has_many :ingredients
  has_many :comments, as: :commentable

  validates :name, presence: true

  def mash_duration
    if self.boil_time == 60
      duration = 0.0278
    else
     duration = 0.0185
    end
   duration
  end
end
