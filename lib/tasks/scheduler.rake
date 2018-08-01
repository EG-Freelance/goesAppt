desc "Check times"
task :check_times => :environment do
  puts "Checking times..."
  Script.check_dates
  puts "Done checking."
end