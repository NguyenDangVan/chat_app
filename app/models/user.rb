class User < ApplicationRecord
  before_save { self.email = email.downcase }
  # attr_accessor :remember_token, :activation_token, :reset_token
  has_many :messages, dependent: :destroy
  has_many :user_rooms, dependent: :destroy
  has_many :rooms, through: :user_rooms
  has_many :message_rooms, through: :user_rooms
  has_many :relationships, class_name: "Relationship", foreign_key: :user_id, dependent: :destroy
  has_many :friends, -> {where(relationships: {status_request: 1})}, through: :relationships, source: :friend
  has_many :blocks, -> {where(relationships: {status_request: 2})}, through: :relationships, source: :friend
  has_many :pendings, -> {where(relationships: {status_request: 0})}, through: :relationships, source: :friend

  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: {minimum: 6}, allow_nil: true
  has_secure_password

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

  def accepted user
  end

  def un_friend user
    friends.delete user
  end

  def is_pending? other_user
    pendings.pluck(:id).include?(other_user.id)
  end

  def assign_me? user

  end

  def is_friend? other_user
    list_friends_of_current_user.pluck(:id).include?(other_user.id)
  end

  def not_friend
    ids = User.all.pluck(:id) - self.list_friends_of_current_user.pluck(:id)
    list = ids.map {|id| User.find_by id: id}
  end

  def blocked? other_user
    blocks.pluck(:id).include?(other_user.id)
  end

  def list_relationships
    Relationship.your_friends(self)
  end

  # def list_friend_with_current
  #   id_user = Relationship.your_friends(self).pluck(:user_id).uniq
  #   list = id_user.map {|id| User.find_by id: id}
  # end

  def list_friends_of_current_user
    id_friend = Relationship.your_friends(self).pluck(:friend_id).uniq
    id_user = Relationship.your_friends(self).pluck(:user_id).uniq
    ids = (id_friend + id_user).uniq
    list = ids.map {|id| User.find_by id: id}
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
