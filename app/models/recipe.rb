class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :reviews

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :description, presence: true
  validates :style, presence: true
  validates :ingredients, presence: true
  validates :instructions, presence: true
  validates :yielder, presence: true
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

  STYLES = ["Light Lager",
            "Pilsner",
            "Europeans Amber Lager",
            "Dark Lager",
            "Bock",
            "Light Hybrid Beer",
            "Amber Hybrid Beer",
            "English Pale Ale",
            "Scottish and Irish Ale",
            "American Ale",
            "English Brown Ale",
            "Porter",
            "Stout",
            "India Pale Ale",
            "German Wheat and Rye Beer",
            "Belgian and French Ale",
            "Sour Ale",
            "Belgian Strong Ale",
            "Strong Ale",
            "Fruit Beer",
            "Spice/Herb/Vegetable Beer",
            "Smoke-Flavored/Wood-Aged Beer",
            "Specialty Beer",
            "Cider",
            "Mead"
           ]
end
