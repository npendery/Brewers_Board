class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipe

  validates :user, presence: true
  validates :recipe, presence: true
  validates :title, presence: true
  validates :rating, presence: true
  validates :user, uniqueness: { scope: :recipe, message: "You can only review once" }

  def self.search(search)
    where('title ILIKE ?', "%#{search}%")
  end

  RATINGS = [1, 2, 3, 4, 5]
end
