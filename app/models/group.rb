class Group < ActiveRecord::Base
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships
  belongs_to :owner, class_name: "User"

  validates :name, uniqueness: true
  validates :name, presence: true
  validates :location, presence: true
  validates :description, presence: true
end
