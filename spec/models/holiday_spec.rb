# == Schema Information
#
# Table name: holidays
#
#  id         :integer          not null, primary key
#  date       :date             not null
#  reason     :string           not null
#  country    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  locale     :string
#
# Indexes
#
#  index_holidays_on_date_and_country_and_locale  (date,country,locale)
#

require 'rails_helper'

RSpec.describe Holiday, type: :model do
  let(:holiday) { FactoryGirl.build(:holiday) }

  describe 'validates' do
    it 'should be valid factory instance' do
      expect(holiday).to be_valid
    end
    it 'should require date' do
      holiday.date = nil
      expect(holiday).not_to be_valid
    end
    it 'should require reason' do
      holiday.reason = nil
      expect(holiday).not_to be_valid
    end
  end

  describe 'methods' do
    it 'should return true, if exists' do
      target = Holiday.new(date: Date.new(2018, 1, 1), reason: '元旦')
      target.save
      stored = target.existed?

      expect(stored).to be_truthy
    end


    it 'should return false, if not exists' do
      stored = Holiday.exists?(date: Date.new(2018, 2, 14))
      expect(stored).to be_falsey
    end
  end
end
