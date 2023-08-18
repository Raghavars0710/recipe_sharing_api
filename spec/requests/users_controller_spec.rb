require 'rails_helper'

RSpec.describe UsersController, type: :request do

  before :each do
    @user = FactoryBot.create(:user, name: "Raghav", username: "raghav", role: "customer", email: "raghav@gmail.com", password: "123456", password_confirmation: "123456")
    @token = JsonWebToken.encode(user_id: @user.id)
    allow(controller).to receive(:authorize_request)
    @username = @user.username
  end

  describe "GET /users" do
    before { get '/users', headers: { Authorization: @token } }
    it 'returns users' do
      expect(json).not_to be_empty
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /users/:username' do
    before { get "/users/#{@username}", headers: { Authorization: @token } }
    context 'when the record exists' do
      it 'returns the user' do
        expect(json).not_to be_empty
        expect(json['username']).to eq(@username)
      end
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      before { get '/users/nonexistent', headers: { Authorization: @token } }
      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'POST #create' do
    it 'creates a new user' do
      user_params = { name: "Ankit", username: "ankit", role: "customer", email: "ankit@gmail.com", password: "123456", password_confirmation: "123456"}
      post '/users', params: user_params
      expect(response).to have_http_status(:created)
    end
    context 'when user creation fails' do
      it 'returns status code 422' do
        invalid_user_params = { name: '', username: '', role: '', email: '', password: '', password_confirmation: '' }
        post '/users', params: invalid_user_params
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'PATCH #update' do
    # it 'updates an existing user' do
    #   updated_name = 'Updated Name'
    #   updated_email = 'updated@example.com'
    #   patch "/users/#{@username}", params: { name: 'Updated Name', email: 'updated@example.com' }, headers: { Authorization: @token }
    #   expect(response).to have_http_status(:ok)
    #   expect(json['name']).to eq(updated_name)
    #   expect(json['email']).to eq(updated_email)
    # end

    context 'when update fails' do
      it 'returns status code 422' do
        invalid_update_params = { name: '', email: '' }
        patch "/users/#{@username}", params: invalid_update_params, headers: { Authorization: @token }
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'DELETE #destroy' do
    before { delete "/users/#{@username}", headers: { Authorization: @token } }
    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end

end
