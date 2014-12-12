namespace :db do
	desc "Fill the database with sample data"
	task populate: :environment do

		10.times do |n|
			puts "[DEBUG] creating user#{n+1} of 10"
			name = Faker::Name.name
			email = Faker::Internet.email
			password = "password"
			User.create!(name: name, email: email, password: password,
				password_confirmation: password)
		end
		

		User.all.each { |e| 
			puts "[DEBUG] uploading images for user : #{e.id}"
			10.times do |n|
				image = Faker::Avatar.image
				description = Faker::Lorem.sentence
				e.pins.create!(image: image, description: description)
			end
		 }
	end
end