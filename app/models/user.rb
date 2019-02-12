class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :messages, dependent: :destroy
  has_many :rooms, dependent: :destroy
  has_many :conversations, foreign_key: :sender_id
  has_many :blocks
  has_many :friendship, foreign_key: :user_id, class_name: User
  has_many :groups, through: :rooms

  scope :select_by, -> {select :id, :name, :email}

  def find_friend
    user_list = []
    user_list_id = Conversation.where(sender_id: self.id).pluck :recipent_id
    user_list = user_list_id.map {|user_id| User.find_by id: user_id}
    user_list
  end
end
