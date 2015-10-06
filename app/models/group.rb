class Group < ActiveRecord::Base
  has_many :users_in_groups
  has_many :users, through: :users_in_groups
  belongs_to :admin, class_name: "User"

  validates :name, uniqueness: true
  validates :name, presence: true
  validates :location, presence: true
  validates :description, presence: true
end
