require 'rails_helper'

RSpec.describe "Idols", type: :request do
  describe "GET /idols" do
    before do
      @idol = FactoryBot.create(:idol)
    end
    it "res code 200" do
			get "/api/v1/idols"
      expect(response.status).to eq 200
      res = JSON.parse(response.body)
    end
  end
end
