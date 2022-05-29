require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "POST /create" do
    
    it 'signs up new user with valid credentials' do 
      data = { first_name: 'Rabin', last_name: 'Poudyal', password: 'password', email: 'rabin@example.com', country: '' }
      post '/v1/users/signup', params: data
      expect(response).to have_http_status(:created)
    end

    it 'signs up new user with country as a optional value' do 
      data = { first_name: 'Rabin', last_name: 'Poudyal', password: 'password', email: 'rabin1@example.com'}
      post '/v1/users/signup', params: data
      expect(response).to have_http_status(:created)
    end

  end
end
