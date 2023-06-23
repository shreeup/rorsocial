require 'rails_helper'
require 'spec_helper'
require 'byebug'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    it "works! (now write some real specs)" do
      usr = FactoryBot.create(:user)
      get user_path(username: usr.username)
      expect(response).to have_http_status(200)
    end
  end

  

end
