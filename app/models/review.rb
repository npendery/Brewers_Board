class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipe

  validates :user, presence: true
  validates :recipe, uniqueness: true
  validates :title, presence: true
  validates :rating, presence: true

  RATINGS = [1, 2, 3, 4, 5]
end
