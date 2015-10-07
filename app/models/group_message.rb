class GroupMessage < ActiveRecord::Base
  belongs_to :user
  belongs_to :group

  validates :user, presence: true
  validates :group, presence: true
  validates :body, presence: true
end
