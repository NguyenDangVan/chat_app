class User < ApplicationRecord
  before_save { self.email = email.downcase }
  # attr_accessor :remember_token, :activation_token, :reset_token
  has_many :messages, dependent: :destroy
  has_many :user_rooms, dependent: :destroy
  has_many :rooms, through: :user_rooms
  has_many :message_rooms, through: :user_rooms

  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  scope :select_by, -> {select :id, :name, :email}

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def authenticated? attribute, token
    digest = send "#{attribute}_digest"
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def find_friend
    user_list = []
    user_list_id = Conversation.where(sender_id: self.id).pluck :recipent_id
    user_list = user_list_id.map {|user_id| User.find_by id: user_id}
    user_list
  end

  def message_private
    list_user = []
    ids_recipient = Message.exist_mess(self.id).pluck(:recipient_id).uniq
    ids_user_id = Message.exist_mess(self.id).pluck(:user_id).uniq
    ids = (ids_recipient + ids_user_id).uniq
    list_user = ids.map {|user_id| User.find_by id: user_id}
    list_user
  end
end
