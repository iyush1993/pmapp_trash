require 'rails_helper'

RSpec.describe "V1::Contents", type: :request do
  describe "GET /index" do

    before(:all) do
      @user = create(:user)
      @auth_token = "Bearer #{@user.token}"
      @project = create(:project, user: @user)
      @content = 3.times { create(:content, project: @project) }
    end

    it "returns all contents of the project" do
      get "/v1/projects/#{@project.id}/contents", headers: { 'Authorization': @auth_token }
      expect(response.parsed_body['data'].pluck("data").count).to eq(3)
      expect(response).to have_http_status(:success)
    end
  end
end
