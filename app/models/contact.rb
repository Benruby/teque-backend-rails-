class Contact < ActiveRecord::Base

	def notify_admin
		UserMailer.notify_admin(self).deliver_now
	end

end
