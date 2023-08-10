require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { build(:user) }

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should allow_value('raghav@gmail.com').for(:email) }

    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }

    it { should define_enum_for(:role).with_values(customer: 0, admin: 1) }

    it { should validate_length_of(:password).is_at_least(6) }

    context 'when creating a new record or password is not nil' do
      it 'validates password length' do
        user.password = 'short'
        expect(user).to validate_length_of(:password).is_at_least(6)
      end
    end
  end

  describe 'associations' do
    it { should have_many(:recipes).dependent(:destroy) }
    it { should have_many(:favorites).dependent(:destroy) }
  end
end
