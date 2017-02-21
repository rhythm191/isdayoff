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

class Holiday < ApplicationRecord

  validates :date, presence: true
  validates :reason, presence: true

  def existed?
    Holiday.find_by_date(date).present?
  end

  # 時間からHolidayインスタンスを取得する
  # @param [Time] time
  def self.find_by_time(time, country='japanese', locale='en')
    find_by(date: time.to_date, country: country, locale: locale)
  end
end
