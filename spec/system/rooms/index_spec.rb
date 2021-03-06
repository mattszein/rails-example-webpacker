# frozen_string_literal: true

require "system_helper"

describe "Rooms" do
  let!(:room) { Room.create(name: "Demo Room") }

  before do
    visit rooms_path
  end

  it "show a list of rooms with the name and link to open each one" do
    expect(page).to have_text room.name
    expect(page).to have_current_path(rooms_path)
  end
end
