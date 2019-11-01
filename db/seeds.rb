# building cities (requires nothing)
10.times do
  City.create!(name: Faker::Address.unique.city, zip_code: Faker::Address.unique.zip)
end


# create some users (requires cities)
10.times do
  name = Faker::FunnyName.unique.two_word_name
  description = Faker::Lorem.sentence(word_count: 10,random_words_to_add: 5)
  email = Faker::Internet.unique.safe_email(name: name)
  name = name.split(' ')
  age = rand(16..70),
  password = Faker::Internet.password(min_length: 6)
  city = rand(1..10)
  User.create(first_name: name[0], last_name: name[1],description: description, email: email, age: age,password:password,city_id: City.all.sample.id)
end

# getting to the gossips (requires users)
20.times do
  title = Faker::Book.unique.title
  sentences = rand(3..8)
  content = ([Faker::Lorem.sentence(word_count: 5,random_words_to_add: 15)] * sentences).join(' ')
  user = rand(1..10)
  Gossip.create(title: title, content: content, user_id: user)
end

