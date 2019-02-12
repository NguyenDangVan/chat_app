class Room < ApplicationRecord
  belongs_to :user
  has_many :messages, dependent: :destroy
  belongs_to :group, dependent: :destroy
end
