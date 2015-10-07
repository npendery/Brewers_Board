class Group < ActiveRecord::Base
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships
  has_many :group_messages
  has_many :events
  belongs_to :owner, class_name: "User"

  validates :name, uniqueness: true
  validates :name, presence: true
  validates :location, presence: true
  validates :description, presence: true

  # def upcoming_events
  #   list = []
  #   self.each do |event|
  #     if event.date >= Date.today
  #       list << event
  #     end
  #   end
  #   list
  # end
  #
  # def past_events
  #   list = []
  #   self.each do |event|
  #     if event.date < Date.today
  #       list << event
  #     end
  #   end
  #   list
  # end
end
