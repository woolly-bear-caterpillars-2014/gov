class SendMessage
	def initialize(args={})
		@from = args[:from]
		@to = args[:to]
		@subject = "From a constituent of yours"
		@body = args[:body]
	end

	def send_mail_gem
		mail = Mail.new(from: @from, to: @to, subject: @subject, body: @body)
		mail.to_s
		mail.delivery_method :sendmail
		mail.deliver
	end
end
