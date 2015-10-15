module MessagesHelper
  def self_or_other(message)
    message.user == current_user ? "self" : "other"
  end

  def message_interlocutor(message)
    if message.user == message.conversation.sender
      message.conversation.sender
    else
      message.conversation.recipient
    end
  end
end
