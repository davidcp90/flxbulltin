class Team < ApplicationRecord
  belongs_to :organization
  has_and_belongs_to_many :users
  has_and_belongs_to_many :bulletins

  validates :name, presence: true
end
