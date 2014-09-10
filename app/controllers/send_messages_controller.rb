class SendMessagesController < ApplicationController
	def send_mail
    message = SendMessage.new(params)
    message.send_mail_gem
    redirect_to back
	end
end
