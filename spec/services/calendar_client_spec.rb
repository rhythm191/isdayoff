require 'rails_helper'

describe 'CalendarClient' do

  let(:client) { CalendarClient.new }
  let(:holiday_cal) { 'japanese__ja@holiday.calendar.google.com' }

  it 'should get calendar event list' do
    response = client.list_events(holiday_cal, Time.new(2018, 1, 1), Time.new(2018, 1, 2))
    expect(response).not_to be_nil
    expect(response.items[0].summary).to eq '元日'
    expect(response.items[0].start.date).to eq '2018-01-01'
  end

  it 'should get holiday list' do
    holidays = client.list_holiday(holiday_cal, Time.new(2018, 1, 1), Time.new(2018, 1, 2))
    expect(holidays).not_to be_nil
    expect(holidays[0].reason).to eq '元日'
    expect(holidays[0].date.to_s).to eq '2018-01-01'
  end

  it 'should return country name' do
    expect(client.country(holiday_cal)).to eq 'japanese'
    expect(client.country('usa_ja@holiday.calendar.google.com')).to eq 'usa'
  end

  it 'should return locale name' do
    expect(client.locale(holiday_cal)).to eq 'ja'
    expect(client.locale('usa@holiday.calendar.google.com')).to eq 'en'
    expect(client.locale('japanese__en@holiday.calendar.google.com')).to eq 'en'
  end
end