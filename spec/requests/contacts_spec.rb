require 'rails_helper'

RSpec.describe "Contacts", type: :request do
  describe "GET /contacts" do
    it "returns http success" do
      get "/contacts"
      expect(response).to have_http_status(:success)
    end
  end

end
