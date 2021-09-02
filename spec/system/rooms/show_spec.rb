# frozen_string_literal: true

require "system_helper"

describe "Room" do
  let!(:room) { Room.create(name: "Demo Room") }

  before do
    visit room_path(room.id)
  end

  it "show a room with information and link" do
    expect(page).to have_text room.name
    expect(page).to have_current_path(edit_room_path(room.id))
  end
end
