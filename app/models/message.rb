# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :room
  validates :content, presence: true
  broadcasts_to :room
end
