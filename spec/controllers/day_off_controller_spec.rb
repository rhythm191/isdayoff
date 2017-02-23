require 'rails_helper'

RSpec.describe DayOffController, type: :controller do

  before do
    calendar = FactoryGirl.build(:calendar)
    calendar.save
  end

  describe 'GET #today' do
    it 'returns http success' do
      get :today
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #is' do
    it 'returns http success' do
      get :is, { day: '2017-02-14' }
      expect(response).to have_http_status(:success)
    end
  end
end
