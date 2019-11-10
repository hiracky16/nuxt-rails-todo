require 'rails_helper'

RSpec.describe "Groups", type: :request do
  describe "GET /groups" do
    before do
      @group = FactoryBot.create(:groups)
    end
    it "res code 200" do
			get "/api/v1/groups"
      expect(response.status).to eq 200
      res = JSON.parse(response.body)
    end
  end
end
