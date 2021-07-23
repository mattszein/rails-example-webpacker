# spec/models/room_spec.rb

require 'rails_helper'

RSpec.describe Room, :type => :model do
  describe "Associations" do
    it { should have_many(:messages) }
    it { should validate_uniqueness_of(:name).case_insensitive }
  end

  subject {
    described_class.new(name: "Room_1")
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  

end
