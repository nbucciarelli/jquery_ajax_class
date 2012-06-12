task :create_addresses => :environment do
  10000.times do |x|
    Address.create(
      :first_name => Faker::Name.first_name,
      :last_name => Faker::Name.last_name,
      :email => Faker::Internet.email,
      :address => Faker::Address.street_address,
      :city => Faker::Address.city,
      :state => Faker::Address.state,
      :zip => Faker::Address.zip_code
    )
  end

end
