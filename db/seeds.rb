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
  description = FFaker::Lorem.paragraph
  Room.create! name: "Group #{n + 1}", owner_id: n + 1, description: "description too long #{n}"
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
  friend_id = n + 1
  Relationship.create! friend_id: friend_id,
    status_request: 1,
    user_id: 1
end

# tao ban user 7 vs user 1
2.times do |n|
  friend_id = n + 1
  Relationship.create! friend_id: friend_id,
    status_request: 1,
    user_id: 7
end

#tao friend request

Relationship.create! friend_id: 1,
  status_request: 0,
  user_id: 8

Relationship.create! friend_id: 1,
  status_request: 0,
  user_id: 9

TodoList.create title: "Daily Work", description: "do tasks everyday", user_room_id: 1, room_id: 1,
  assignee_ids: 1,
  due_date: Time.now
TodoItem.create content: "6am: day nay com", todo_list_id: 1
TodoItem.create content: "7:45am: vao lam", todo_list_id: 1
TodoItem.create content: "11:45am: an com trua", todo_list_id: 1

TodoList.create title: "Task #226523", description: "[Job] save data trường Job 企業担当者名", user_room_id: 1,
  room_id: 1,
  assignee_ids: [2, 3],
  due_date: Time.now
TodoItem.create content: "luu truong cach thuc", todo_list_id: 2
TodoItem.create content: "cho chon nhieu PIC", todo_list_id: 2
TodoList.create title: "Task #226525", description: "[Job] export csv vs search truong Job 企業担当者名", user_room_id: 1,
  room_id: 1,
  assignee_ids: 1,
  due_date: Time.now

TodoList.create title: "Task #226523", description: "[Job] save data trường Job 企業担当者名", user_room_id: 1,
  room_id: 2,
  assignee_ids: 3,
  due_date: Time.now
TodoItem.create content: "7:15am: gio bat dau di lam", todo_list_id: 1
