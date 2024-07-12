class UserBulletinActivity < ApplicationRecord
  belongs_to :user
  belongs_to :bulletin

  validates :user_id, presence: true
  validates :bulletin_id, presence: true
end
