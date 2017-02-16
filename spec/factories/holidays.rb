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

FactoryGirl.define do
  factory :holiday do
    year 2018
    month 1
    day 1
    reason '元旦'
    country 'jp'
  end

end
