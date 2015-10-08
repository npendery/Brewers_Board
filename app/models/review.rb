class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipe

  validates :user, presence: true
  validates :recipe, uniqueness: true
  validates :title, presence: true
  validates :rating, presence: true

  def self.search(search)
    where('title ILIKE ?', "%#{search}%")
  end

  RATINGS = [1, 2, 3, 4, 5]
end
