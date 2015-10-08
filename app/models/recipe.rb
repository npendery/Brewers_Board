class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :reviews

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :description, presence: true
  validates :malt_grains, presence: true
  validates :hops_schedule, presence: true
  validates :directions, presence: true
  validates :yeast, presence: true
  validates :user, presence: true

  def self.search(search)
    where('name ILIKE ?', "%#{search}%") |
      where('description ILIKE ?', "%#{search}%")
  end
  
  def average_score
    score = 0
    if reviews.count == 0
      score
    else
      reviews.each do |review|
        score += review.rating
      end
      score / reviews.count
    end
  end
end
