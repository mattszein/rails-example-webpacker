# frozen_string_literal: true

# spec/models/room_spec.rb

require "rails_helper"

RSpec.describe Room, type: :model do
  subject {
    described_class.new(name: "Room_1")
  }

  describe "Associations" do
    it { expect(subject).to have_many(:messages) }
    it { expect(subject).to validate_uniqueness_of(:name).case_insensitive }
  end

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  end
end
