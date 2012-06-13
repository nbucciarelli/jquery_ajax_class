task :create_addresses => :environment do
  10000.times do |x|
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    Address.create(
      :first_name => first_name,
      :last_name => last_name,
      :email => "#{first_name}.#{last_name}@#{Faker::Internet.domain_name}",
      :address => Faker::Address.street_address,
      :city => Faker::Address.city,
      :state => Faker::Address.state,
      :zip => Faker::Address.zip_code
    )
  end

end
