class MessagesController < ApplicationController

	def create
		@user = User.find_by(name: session[:name])
		@message = @user.messages.create(message_params)
		if @message.save
			MessageSpeakJob.perform_later(@message)
		end
	end

	private

	def message_params
		params.require(:message).permit(:body, :room_id)
	end
end
