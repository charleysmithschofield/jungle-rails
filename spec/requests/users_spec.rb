require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /index" do
    it "returns a success response" do
      get users_path
      expect(response).to have_http_status(:success)
    end

    it "renders the index template" do
      get users_path
      expect(response).to render_template(:index)
    end

    it "loads all of the users into @users" do
      user1 = User.create(email: 'test1@example.com', first_name: 'Test1', last_name: 'User1', password: 'password1', password_confirmation: 'password1')
      user2 = User.create(email: 'test2@example.com', first_name: 'Test2', last_name: 'User2', password: 'password2', password_confirmation: 'password2')
      get users_path
      expect(assigns(:users)).to match_array([user1, user2])
    end
  end
end
