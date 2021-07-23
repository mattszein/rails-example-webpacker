class Room < ApplicationRecord
  has_many :messages
  validates :name, uniqueness: {case_sensitive: false}, presence: true
  broadcasts
end
