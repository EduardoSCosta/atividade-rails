require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    it "returns http success" do
      get users_path
      expect(response).to have_http_status(:success)
    end

    it "returns user list" do
      User.create(name: "Test User")
      users = User.all
      get users_path
      expect(assigns(:users)).to eq(users)
    end    
  end

  describe "GET /users/:id" do
    it "returns http success" do
      user = User.first
      get user_path(user)
      expect(response).to have_http_status(:success)
    end

    it "returns a user" do
      user = User.first
      get user_path(user)
      expect(assigns(:user)).to eq(user)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get users_new_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /users" do
    it "returns http created" do
      post users_path, params: {user: {name: "User Test", age: 42, bio: "This is a test biography"}}
      expect(response).to have_http_status(:found)
    end
  end

  # describe "GET /edit" do
  #   it "returns http success" do
  #     get "/users/edit"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET /update" do
  #   it "returns http success" do
  #     get "/users/update"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET /destroy" do
  #   it "returns http success" do
  #     get "/users/destroy"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end
