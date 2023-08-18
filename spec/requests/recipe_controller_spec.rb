# require 'rails_helper'

# RSpec.describe RecipesController, type: :request do

#   before :each do
#     @user = FactoryBot.create(:user, name: "Raghav", username: "raghav", role: "customer", email: "raghav@gmail.com", password: "123456", password_confirmation: "123456")
#     @token = JsonWebToken.encode(user_id: @user.id)
#     allow(controller).to receive(:authorize_request)
#     @username = @user.username
#   end

#   describe "GET /recipes" do
#     before { get '/recipes', headers: { Authorization: @token } }
#     it 'returns recipes' do
#       expect(json).not_to be_empty
#     end
#     it 'returns status code 200' do
#       expect(response).to have_http_status(200)
#     end
#   end

#   describe 'GET /recipes/:id' do
#     before { get "/recipes/1", headers: { Authorization: @token } }
#     context 'when the record exists' do
#       it 'returns the recipe' do
#         expect(json).not_to be_empty
#         expect(json['id']).to eq(1)
#       end
#       it 'returns status code 200' do
#         expect(response).to have_http_status(200)
#       end
#     end

#     context 'when the record does not exist' do
#       before { get '/recipes/999', headers: { Authorization: @token } }
#       it 'returns status code 404' do
#         expect(response).to have_http_status(404)
#       end
#     end
#   end

#   describe 'POST #create' do
#     it 'creates a new recipe' do
#       recipe_params = { title: "New Recipe", ingredients: "Ingredient 1, Ingredient 2", instructions: "Step 1, Step 2", tags: "tag1, tag2", user_id: @user.id }
#       post '/recipes', params: { recipe: recipe_params }, headers: { Authorization: @token }
#       expect(response).to have_http_status(:created)
#     end
#     context 'when recipe creation fails' do
#       it 'returns status code 422' do
#         invalid_recipe_params = { title: '', ingredients: '', instructions: '', tags: '', user_id: nil }
#         post '/recipes', params: { recipe: invalid_recipe_params }, headers: { Authorization: @token }
#         expect(response).to have_http_status(422)
#       end
#     end
#   end

#   describe 'PATCH #update' do
#     it 'updates an existing recipe' do
#       updated_title = 'Updated Title'
#       updated_ingredients = 'Ingredient X, Ingredient Y'
#       patch "/recipes/1", params: { recipe: { title: updated_title, ingredients: updated_ingredients } }, headers: { Authorization: @token }
#       expect(response).to have_http_status(:ok)
#       expect(json['title']).to eq(updated_title)
#       expect(json['ingredients']).to eq(updated_ingredients)
#     end

#     context 'when update fails' do
#       it 'returns status code 422' do
#         invalid_update_params = { title: '', ingredients: '' }
#         patch "/recipes/1", params: { recipe: invalid_update_params }, headers: { Authorization: @token }
#         expect(response).to have_http_status(422)
#       end
#     end
#   end

#   describe 'DELETE #destroy' do
#     before { delete "/recipes/1", headers: { Authorization: @token } }
#     it 'returns status code 204' do
#       expect(response).to have_http_status(204)
#     end
#   end

# end
