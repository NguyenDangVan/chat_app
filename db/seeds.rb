User.create! name: "Dang Van", email: "dinvvan@gmail.com", password: "123123"

20.times do |t|
  name = FFaker::Name.name
  User.create! name: name,
    email: "example_#{t}@gmail.com",
    password: "123123",
    password_confirmation: "123123"
end

Conversation.create sender_id: 1,
  recipent_id: 2

Group.create admin_group: 1,
  title: "Chat group"

Room.create user_id: 1,
  group_id: 1

Message.create user_id: 1,
  conversation_id: 1,
  room_id: 1,
  content: "lalala"

Message.create user_id: 2,
  conversation_id: 1,
  room_id: 1,
  content: "laaaaaaaaaaaaaaaaaaaaaaaa"

Conversation.create sender_id: 2,
recipent_id: 1

Conversation.create sender_id: 1,
recipent_id: 3

Conversation.create sender_id: 1,
recipent_id: 4
# do user_id = 3 ma conversation_id = 2

Message.create user_id: 2,
  conversation_id: 2,
  room_id: 1,
  content: "2 hello 1"

Message.create user_id: 1,
  conversation_id: 3,
  room_id: 1,
  content: "1 hello 3"

Message.create user_id: 1,
  conversation_id: 4,
  room_id: 1,
  content: "1 hello 4"
