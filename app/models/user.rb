class User < ActiveRecord::Base
  has_many :recipes
  has_many :reviews
  has_many :memberships, dependent: :destroy
  has_many :groups, through: :memberships
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, uniqueness: true
  validates :username, presence: true
  validates :city, presence: true
  validates :admin, :inclusion => {:in => [true, false]}
end
