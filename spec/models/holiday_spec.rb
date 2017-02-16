# == Schema Information
#
# Table name: holidays
#
#  id         :integer          not null, primary key
#  year       :integer          not null
#  month      :integer          not null
#  day        :integer          not null
#  reason     :string           not null
#  country    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Holiday, type: :model do
  let(:holiday) { FactoryGirl.build(:holiday) }

  describe 'validates' do
    it 'should be valid factory instance' do
      expect(holiday).to be_valid
    end
    it 'should require year' do
      holiday.year = nil
      expect(holiday).not_to be_valid
    end
    it 'should require month' do
      holiday.month = nil
      expect(holiday).not_to be_valid
    end
    it 'should require day' do
      holiday.day = nil
      expect(holiday).not_to be_valid
    end
    it 'should require reason' do
      holiday.reason = nil
      expect(holiday).not_to be_valid
    end
  end

  describe 'methods' do
    it 'should set value' do
      target = Holiday.new
      target.set_holiday(Time.new(2018, 1, 1), '元旦')
      expect(target.year).to eq(2018)
      expect(target.reason).to eq('元旦')
      expect(target.country).to eq('jp')
    end
  end
end
