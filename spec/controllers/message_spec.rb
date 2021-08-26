# frozen_string_literal: true

require "rails_helper"
require Rails.root.join("spec", "controllers", "shared", "responds.rb")

describe MessagesController, type: :controller do
  render_views
  let!(:room) { Room.create(name: "Room_1") }
  let(:params) { {room_id: room.id} }

  describe "POST #create" do
    let(:params) { {room_id: room.id, message: {content: "Message_1"}} }

    subject { post :create, params: params }

    context "when valid" do
      it "creates a message" do
        expect { subject }.to change(room.messages, :count).by(1)
      end
    end

    context "when invalid param is submitted" do
      before { params[:message][:content] = nil }

      it_behaves_like "respond to invalid params"
    end
  end

  describe "GET #new" do
    let(:params) { {room_id: room.id} }

    subject { get :new, params: params }

    context "when valid" do
      it_behaves_like "respond to success"
    end

    context "when invalid id" do
      before { params[:room_id] = 1000000 }

      it_behaves_like "respond to missing"
    end
  end
end
