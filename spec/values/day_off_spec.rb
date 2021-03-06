require 'rails_helper'

describe 'DayOff' do

  it 'should be holiday at 2017-01-01' do
    value = DayOff.new(Time.new(2017, 1, 1))
    expect(value.day_off).to be_truthy
  end

  it 'should be weekday at 2017-02-14' do
    value = DayOff.new(Time.new(2017, 2, 14))
    expect(value.day_off).to be_falsey
  end

  it 'should be holiday at 2017-01-01 with country and locale' do
    value = DayOff.new(Time.new(2017, 1, 1), 'usa', 'en')
    expect(value.day_off).to be_truthy
  end
end