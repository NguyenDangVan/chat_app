class Conversation < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :sender, foreign_key: :sender_id, class_name: User
  belongs_to :recipent, foreign_key: :recipent_id, class_name: User

  def opposed_user user
    user == recipent ? sender : recipent
  end
end
