class Recipe < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :description, presence: true
  validates :malt_grains, presence: true
  validates :hops_schedule, presence: true
  validates :directions, presence: true
  validates :yeast, presence: true
  validates :user, presence: true
end
