task :setup_data => :environment do
  %x[ rake db:drop db:create db:migrate create_addresses ]
end