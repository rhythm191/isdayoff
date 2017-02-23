require 'date'

class DayOffController < ApplicationController

  before_action :bad_request_if_out_of_range, only: :is
  before_action :bad_request_if_unused_country

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

  def bad_request_if_unused_country
    unless Calendar.where(country: get_country, locale: I18n.locale).exists?
      render json: {exception: 'UnusedException', description: I18n.t('error.unused.description') }, status: :bad_request
    end
  end

  # 現在から1年前後でなければOutOfRangeExceptionをだす
  def bad_request_if_out_of_range
    date_range = (Date.today - 1.years)..(Date.today + 1.years)
    unless date_range.include? get_date
      render json: {exception: 'OutOfRangeException', description: I18n.t('error.outofrange.description') }, status: :bad_request
    end
  end
end
