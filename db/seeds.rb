require 'faker'

#Ces lignes pour ne pas se retrouver avec 1000 données, permet de supprimer les données précédentes à chaques qu'on $rails db:seed
User.destroy_all
Gossip.destroy_all
Comment.destroy_all
City.destroy_all
JoinGossipTag.destroy_all
Tag.destroy_all
PrivateMessage.destroy_all

10.times do
#city n'a pas besoin des autres, donc en premier
	City.create!(name: Faker::Nation.capital_city, zip_code: Faker::Address.postcode)
end


10.times do
	user = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, age: rand(15..110), city: City.all.sample, description: Faker::TvShows::RuPaul.queen, password: Faker::Hipster.words(number: 1))
end


20.times do 
  Gossip.create!(title: Faker::Book.title[0..12], content: Faker::GreekPhilosophers.quote , user: User.all.sample)
end

10.times do
	Tag.create!(title: Faker::Book.title)
end

30.times do
	JoinGossipTag.create!(gossip: Gossip.all.sample, tag: Tag.all.sample)
end

5.times do
	PrivateMessage.create!(sender: User.all.sample, recipient: User.all.sample, content: Faker::Quotes::Shakespeare.hamlet_quote )
end

30.times do
	Comment.create!(content:Faker::Movies::Lebowski.quote, user: User.all.sample, gossip: Gossip.all.sample, commentable_type: Faker::Quotes::Shakespeare.hamlet_quote)
end

20.times do
	Like.create!(user: User.all.sample, gossip: Gossip.all.sample)
	Like.create!(user: User.all.sample, comment: Comment.all.sample)
end