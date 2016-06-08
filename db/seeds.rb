User.create!(name:  "Clone User",
             email: "Clone@railsmail.org",
             birthday: "06/02/2016",
             password:              "123456",
             password_confirmation: "123456",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "Clone-#{n+1}@railstutorial.org"
  birthday = "06/02/2016"
  password = "password"
  User.create!(name:  name,
               email: email,
               birthday: birthday,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end