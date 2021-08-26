# frozen_string_literal: true

require "rails_helper"
require Rails.root.join("spec", "controllers", "shared", "responds.rb")

describe RoomsController, type: :controller do
  render_views
  let!(:room) { Room.create(name: "Room_1") }
  let(:params) { {id: room.id} }

  describe "POST #delete" do
    subject { delete :destroy, params: params }

    context "when valid" do
      it "delete a room" do
        expect { subject }.to change(Room, :count).by(-1)
      end

      it "redirect_to rooms" do
        expect(subject).to have_http_status(302)
        expect(response).to redirect_to "/rooms"
      end
    end

    context "when submitted with invalid id" do
      before { params[:id] = room.id + 1 }

      it_behaves_like "respond to missing"
    end
  end

  describe "GET #show" do
    subject { get :show, params: params }

    context "when valid" do
      it_behaves_like "respond to success"
    end

    context "when submitted with invalid id" do
      before { params[:id] = room.id + 1 }

      it_behaves_like "respond to missing"
    end
  end

  describe "GET #edit" do
    subject { get :edit, params: params }

    context "when valid" do
      it_behaves_like "respond to success"
    end

    context "when invalid id" do
      before { params[:id] = 1000000 }

      it_behaves_like "respond to missing"
    end
  end

  describe "PATCH #update" do
    let(:params_update) { {id: room.id, room: {name: "Room_1_updated"}} }

    subject { patch :update, params: params_update }

    context "when valid" do
      it "should updates room" do
        subject
        expect(response).to have_http_status(302)
        expect(room.reload.name).to eq params_update[:room][:name]
      end
    end

    context "when invalid params" do
      before { params_update[:room][:name] = "" }

      it_behaves_like "respond to invalid params"
    end
  end

  describe "POST #create" do
    let(:params_create) { {room: {name: "Room new"}} }

    subject { post :create, params: params_create }

    context "when valid" do
      it "creates an item" do
        expect { subject }.to change(Room, :count).by(1)
      end

      it "redirect_to rooms" do
        subject
        expect(response).to have_http_status(302)
        expect(response).to redirect_to "/rooms"
      end
    end

    context "when invalid room param is submitted" do
      before { params_create[:room][:name] = nil }

      it_behaves_like "respond to invalid params"
    end
  end
end
