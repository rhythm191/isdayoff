# == Schema Information
#
# Table name: calendars
#
#  id          :integer          not null, primary key
#  country     :string           not null
#  locale      :string           not null
#  calendar_id :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_calendars_on_country_and_locale  (country,locale) UNIQUE
#

require 'rails_helper'

RSpec.describe Calendar, type: :model do
  let(:calendar) { FactoryGirl.build(:calendar) }

  describe 'validates' do
    it 'should be valid factory instance' do
      expect(calendar).to be_valid
    end
    it 'should require country' do
      calendar.country = nil
      expect(calendar).not_to be_valid
    end
    it 'should require locale' do
      calendar.locale = nil
      expect(calendar).not_to be_valid
    end
    it 'should require calendar_id' do
      calendar.calendar_id = nil
      expect(calendar).not_to be_valid
    end
  end

end
