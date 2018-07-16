require 'faker'

# Creates Seeded Users
5.times do

  User.create!(
    email: Faker::Internet.email,
    password: "Password"
  )
end
users = User.all

# Creates Seeded Topics
25.times do

  Topic.create!(
    title: Faker::Hacker.noun,
    user: users.sample
  )
end
topics = Topic.all

# Creates Seeded Bookmarks
50.times do
  Bookmark.create!(
    url: Faker::Internet.url('example.com'),
    topic: topics.sample
  )
end

# Creates Specail User
User.create!(
  email: "the.coolest.test.user@gmail.com",
  password: "Password"
)

puts "#{User.count} users created!"
puts "#{Topic.count} topics created!"
puts "#{Bookmark.count} bookmarks created!"
