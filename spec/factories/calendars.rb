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


FactoryGirl.define do
  factory :calendar do
    country 'japanese'
    locale 'en'
    calendar_id 'japanese__ja@holiday.calendar.google.com'
  end
end
