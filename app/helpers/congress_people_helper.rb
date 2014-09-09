require 'mail'
module CongressPeopleHelper

	class << self
		def send_mail(from_add,to_add,e_subject,e_body)
			mail = Mail.new(from: from_add, to: to_add, subject: e_subject, body: e_body)
			mail.to_s
			mail.delivery_method :sendmail
			mail.deliver
		end
	end
end
