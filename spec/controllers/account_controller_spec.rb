require 'spec_helper'

describe AccountController, :authenticated => true do
  describe "GET #show" do
    it "returns http success" do
      get :show

      expect(response.code).to eq("200")
    end
  end
end
