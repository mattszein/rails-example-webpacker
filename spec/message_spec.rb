# spec/models/message_spec.rb

require 'rails_helper'

RSpec.describe Message, :type => :model do
  describe "Associations" do
    it { should belong_to(:room) }
    it { should validate_presence_of(:content) }
  end

  let(:room) {
    Room.create(name: "Room_1")
  }
  subject {
    described_class.new(content: "Content_1", room_id: room.id)
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.content = nil
    expect(subject).to_not be_valid
  end
  
  it "is not valid without a room" do
    subject.room_id = nil
    expect(subject).to_not be_valid
  end

end
