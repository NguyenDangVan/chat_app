User.create! name: "Dang Van", birthday: "26/07/1997" , address: "Bac Ninh", email: "dinvvan@gmail.com", password: "123123"

20.times do |t|
  name = FFaker::Name.name
  User.create! name: name,
    address: FFaker::Address.street_address,
    email: "example#{t}@gmail.com",
    password: "123123",
    password_confirmation: "123123"
end
