require 'rails_helper'

describe 'Dayoff' do

  it 'should be holiday at 2017-01-01' do
    value = Dayoff.new(Time.new(2017, 1, 1))
    expect(value.holiday).to be_truthy
  end

  it 'should be weekday at 2017-02-14' do
    value = Dayoff.new(Time.new(2017, 2, 14))
    expect(value.holiday).to be_falsey
  end
end