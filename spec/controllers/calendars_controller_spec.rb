require 'rails_helper'

RSpec.describe CalendarsController, type: :controller do

  describe 'GET #countries' do
    it 'returns http success' do
      get :countries
      expect(response).to have_http_status(:success)
    end
  end
end
