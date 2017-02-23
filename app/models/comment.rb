class Comment < ApplicationRecord
  # belongs_to :user
  # belongs_to :recipe
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable
end
