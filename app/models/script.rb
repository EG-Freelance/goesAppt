class Script < ActiveRecord::Base
	def self.check_dates
		agent = Mechanize.new
		agent.agent.http.verify_mode = OpenSSL::SSL::VERIFY_NONE
		locations = [8120, 5142] # 8120 = Reagan, 5142 = Dulles
		locations.each do |l|
			resp = agent.get("https://ttp.cbp.dhs.gov/schedulerapi/slots?orderBy=soonest&limit=1&locationId=#{l}&minimum=1")
			body = resp.body
			l == 8120 ? reagan = DateTime.parse(JSON.parse(body)[0]["startTimestamp"]) : dulles = DateTime.parse(JSON.parse(body)[0]["startTimestamp"])
		end
		
		if dulles < DateTime.new(2018,8,14,12) || reagan < DateTime.new(2018,8,14,12)
			UserMailer.new_entry(dulles, reagan).deliver_now
		end
			
	end
end
