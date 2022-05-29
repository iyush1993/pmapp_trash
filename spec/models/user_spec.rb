require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_length_of(:password).is_at_least(6) }
  end

  describe 'associations' do
    #it { should have_many(:orders) }
  end

  describe '#token' do
    it 'returns a token' do
      user = User.create(first_name: 'Rabin', last_name: 'Poudyal', email: 'rabin@example.com', password: 'password')
      expect(user.token).to_not be_nil
    end

  end

  describe '#name' do
    it 'returns a name' do
      user = User.create(first_name: 'Rabin', last_name: 'Poudyal', email: 'rabin@example.com', password: 'password')
      expect(user.name).to eq('Rabin Poudyal')
    end
  end

end
