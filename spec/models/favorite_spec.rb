require 'rails_helper'

RSpec.describe Favorite, type: :model do
  subject(:favorite) { build(:favorite) }

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:recipe) }
  end

  describe 'validations' do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:recipe_id) }
  end
end
