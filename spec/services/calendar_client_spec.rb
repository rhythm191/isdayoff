require 'rails_helper'

describe 'CalendarClient' do

  let(:client) { CalendarClient.new }
  let(:holiday_cal) { 'japanese__ja@holiday.calendar.google.com' }

  it 'should do list calendar event' do
    response = client.list(holiday_cal, Time.new(2018, 1, 1), Time.new(2018, 1, 2))
    expect(response).not_to be_nil
    expect(response.items[0].summary).to eq '元日'
    expect(response.items[0].start.date).to eq '2018-01-01'
  end
end