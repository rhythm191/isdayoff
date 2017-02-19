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
#
# Indexes
#
#  index_holidays_on_date  (date) UNIQUE
#

class Holiday < ApplicationRecord

  validates :date, presence: true
  validates :reason, presence: true

  def existed?
    Holiday.find_by_date(date).present?
  end

  # 時間からHolidayインスタンスを取得する
  # @param [Time] time
  def self.find_by_time(time)
    find_by(date: time.to_date)
  end
end
