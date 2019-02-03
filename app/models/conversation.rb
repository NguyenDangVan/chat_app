class Conversation < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :sender, foreign_key: :sender_id, class_name: User
  belongs_to :recipent, foreign_key: :recipent_id, class_name: User

  validates :sender_id, uniqueness: {scope: :recipent_id} #gioi han duy nhat chi attribute recipent_id

  scope :between, -> (sender_id, recipent_id) do
    where(sender_id: sender_id, recipent_id: recipent_id).or(
      where(sender_id: recipent_id, recipent_id: sender_id)
    )
  end
  QUERRY_USER = "id IN(SELECT recipent_id FROM conversations WHERE conversations.sender_id = :sender_id)"
  scope :select_recipent, ( lambda do |sender_id|
    where QUERRY_USER, sender_id: sender_id
  end)

  def self.get sender_id, recipent_id
    conversation = between(sender_id, recipent_id).first
    return conversation if conversation.present?

    create(sender_id: sender_id, recipent_id: recipent_id)
  end

  def opposed_user user
    user == recipent ? sender : recipent
  end
end
