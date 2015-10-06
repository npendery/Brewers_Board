class User < ActiveRecord::Base
  has_many :recipes
  has_many :reviews
  has_many :users_in_groups
  has_many :groups, through: :users_in_groups
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, uniqueness: true
  validates :username, presence: true
  validates :city, presence: true
end
