class Message < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :user

  validates_presence_of :body
  validates_presence_of :conversation_id
  validates_presence_of :user_id
end