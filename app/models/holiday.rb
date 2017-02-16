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

class Holiday < ApplicationRecord

  validates :year, presence: true
  validates :month, presence: true
  validates :day, presence: true
  validates :reason, presence: true

  # 時間と祝日名からholiday instanceを生成
  # @param [Time] time
  # @param [String] reason 祝日名
  # @return Holiday instance
  def set_holiday(time, reason)
    self.year = time.year
    self.month = time.month
    self.day = time.day
    self.reason = reason
    self.country = 'jp'
    self
  end
end
