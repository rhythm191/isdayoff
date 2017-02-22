require 'date'

class DayOffController < ApplicationController

  before_action :bad_request_if_out_of_range, only: :is

  def today
    day_off = DayOff.new(Time.now, get_country, I18n.locale)
    render json: day_off
  end

  def is
    day_off = DayOff.new(get_date.to_time, get_country, I18n.locale)
    render json: day_off
  end


  private
  def get_date
    Date.strptime(params[:day],'%Y-%m-%d')
  end

  def get_country
    params['country'] || 'japanese'
  end

  # 現在から1年前後でなければOutOfRangeExceptionをだす
  def bad_request_if_out_of_range
    date_range = (Date.today - 1.years)..(Date.today + 1.years)
    unless date_range.include? get_date
      render json: {exception: 'OutOfRangeException', description: I18n.t('error.outofrange.description') }, status: :bad_request
    end
  end
end
