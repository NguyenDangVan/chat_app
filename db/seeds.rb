User.create! name: "Dang Van", birthday: "26/07/1997" , address: "Bac Ninh", email: "dinvvan@gmail.com", password: "123123", password_confirmation: "123123"

20.times do |t|
  name = FFaker::Name.name
  User.create! name: name,
    address: FFaker::Address.street_address,
    email: "example#{t}@gmail.com",
    password: "123123",
    password_confirmation: "123123"
end

5.times do |t|
  content = FFaker::Lorem.sentences
  recipient_id = t + 1
  Message.create! content: content,
                  user_id: 1,
                  recipient_id: recipient_id
end

5.times do |n|
  content = FFaker::Lorem.paragraph
  recipient_id = n + 1
  Message.create! content: content,
                  user_id: 2,
                  recipient_id: recipient_id
end

7.times do |n|
  name = FFaker::Name.name
  description = FFaker::Lorem.paragraph
  Room.create! name: name, owner_id: n + 1, description: description
end

5.times do |n|
  user_id = n + 1
  room_id = 1
  UserRoom.create! room_id: room_id,
                  user_id: user_id
end

5.times do |n|
  user_id = n + 1
  room_id = 2
  UserRoom.create! room_id: room_id,
                  user_id: user_id
end


5.times do |n|
  user_room_id = 1
  MessageRoom.create! user_room_id: user_room_id,
                  content: "Hello #{n}"
end

4.times do |n|
  friend_id = n +1
  Relationship.create! friend_id: friend_id,
    status_request: 1,
    user_id: 1
end

2.times do |n|
  friend_id = n + 1
  Relationship.create! friend_id: friend_id,
    status_request: 1,
    user_id: 7
end
