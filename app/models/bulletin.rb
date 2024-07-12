class Bulletin < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_and_belongs_to_many :teams
  has_many :comments, foreign_key: :thread_id
  has_many :user_bulletin_activities

  validates :title, presence: true
  validates :slug, presence: true, uniqueness: true
end
