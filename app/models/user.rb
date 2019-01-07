class User < ApplicationRecord
  has_many :messages

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true, length: {maxmimum: 50}
  validates :email, presence: true, lenght: {maximum: 255},
    uniquess: {case_sensitive: false}, format: {with: VALID_EMAIL_REGEX}

  before_save {email.downcase!}
  has_secure_password
end
