require 'rails_helper'

RSpec.describe "V1::Projects", type: :request do

  before(:all) do 
    user = create(:user)
    @auth_token = "Bearer #{user.token}"
  end

  describe "POST /projects" do
    it "returns creates a new project" do
      data = { title: 'Project1', description: '', type: 'international', location: 'Kathmandu', thumbnail: Rack::Test::UploadedFile.new("#{Rails.root}/spec/data/skyline.jpeg") }
      post "/v1/projects", params: data, headers: { 'Authorization' => @auth_token }
      expect(response).to have_http_status(:success)
    end
  end

end
