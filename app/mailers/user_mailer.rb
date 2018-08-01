class UserMailer < ApplicationMailer
	def new_entry(dulles, reagan)
		mail(to: 'erik.w.gibbons@gmail.com', subject: "New Cancellation", body: "DULLES: #{dulles} -- REAGAN: #{reagan}")
	end
end
