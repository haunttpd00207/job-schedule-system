User.create!(username:  "Admin",
             email: "admin@gmail.com",
             password:              "123123",
             password_confirmation: "123123",
             role: 2)

100.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(username:  name,
              email: email,
              password:              password,
              password_confirmation: password)
end

20.times do |n|
  name  = Faker::Company.name
  Chatroom.create!(name:  name)
end


