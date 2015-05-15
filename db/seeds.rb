User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin:     true)

50.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
              email: email,
              password:              password,
              password_confirmation: password)
end

users = User.order(:created_at).take(6)
50.times do
  title = Faker::Lorem.sentence(5)
  body = Faker::Lorem.sentence(5)
  users.each { |user| user.entries.create!(title: title,
                                           body: body ) }
end

users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

entries = Entry.order(:created_at).take(6)
10.times do
  name = Faker::Lorem.sentence(5)
  content = Faker::Lorem.sentence(5)
  arr_user_ids = User.all.map(&:id)
  user_id = arr_user_ids.sample
  entries.each { |entry| entry.comments.create!(name: name,
                                                content: content,
                                                user_id: user_id ) }
end