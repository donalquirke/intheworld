desc "This task is called by the Heroku scheduler add-on"

task :daily_intention => :environment do
  puts "running daily_intention"
  Users.daily_intention
  puts "done"
end
