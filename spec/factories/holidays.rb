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
#  index_holidays_on_date                         (date) UNIQUE
#  index_holidays_on_date_and_country_and_locale  (date,country,locale)
#

FactoryGirl.define do
  factory :holiday do
    date Date.new(2018, 1, 1)
    reason '元旦'
    country 'jp'
  end

end
