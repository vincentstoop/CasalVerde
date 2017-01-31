require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  describe "GET #photogallery" do
    it "returns http success" do
      get :photogallery
      expect(response).to have_http_status(:success)
    end
  end

end
