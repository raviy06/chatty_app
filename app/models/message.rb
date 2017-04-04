class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  after_create_commit { MessageSpeakJob.perform_later(self) }



  def timestamp
	  created_at.strftime('%H:%M:%S %d %B %Y')
	end
end
