class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :bulletin, foreign_key: :thread_id

  validates :message, presence: true
end
