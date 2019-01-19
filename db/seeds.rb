User.create! name: "Dang Van", email: "dinvvan@gmail.com", password: "123123"

20.times do |t|
  name = FFaker::Name.name
  User.create! name: name,
    email: "example_#{t}@gmail.com",
    password: "123123",
    password_confirmation: "123123"
end
