require 'rails_helper'

RSpec.describe SafetyController, type: :controller do

  describe "GET #precaution" do
    it "returns http success" do
      get :precaution
      expect(response).to have_http_status(:success)
    end
  end

end
