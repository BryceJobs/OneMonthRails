10.times do |n|
	image = Faker::Avatar.image
	description = Faker::Lorem.sentence
	User.find(2).pins.create!(image: image, description: description)
end