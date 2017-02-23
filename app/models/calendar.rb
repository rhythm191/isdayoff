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

class Calendar < ApplicationRecord
  validates :country, presence: true
  validates :locale, presence: true
  validates :calendar_id, presence: true
end
