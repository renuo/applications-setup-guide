#!/usr/bin/env ruby

project = ENV['PROJECT']
if project.nil?
  abort 'PROJECT=myproject generate-init-script.rb'
end

no_db = ENV['NO_DB']

%w(master develop testing).each do |branch|
  app = "#{project}-#{branch}"
  puts "heroku apps:create --region eu #{app}"
  puts "heroku domains:add #{app}.renuoapp.ch --app #{app}"
  unless no_db
    puts "heroku addons:create heroku-postgresql --version=9.5 --app #{app}"
    puts "heroku pg:backups:schedule --app #{app}"
  end
  puts "heroku addons:create papertrail"
  puts "# Now you should add the users to the project"
  puts "# heroku access:add name.lastname@renuo.ch --app #{app}"
end
