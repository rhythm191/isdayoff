require 'date'

class DayOffController < ApplicationController

  def today
    day_off = DayOff.new(Time.now, get_country, I18n.locale)
    render json: day_off
  end

  def is
    date = Date.strptime(params[:day],'%Y-%m-%d')

    # 現在から1年前後でなければOutOfRangeExceptionをだす
    bad_request_if_out_of_range(date.to_time) and return

    day_off = DayOff.new(date.to_time, get_country, I18n.locale)
    render json: day_off
  end


  private
  def get_country
    params['country'] || 'japanese'
  end

  # 現在から1年前後でなければOutOfRangeExceptionをだす
  # @param [Time] time
  def bad_request_if_out_of_range(time)
    time_range = (Time.now - 1.years)..(Time.now + 1.years)
    unless time_range.include? time
      render json: {exception: 'OutOfRangeException', description: I18n.t('error.outofrange.description') }, status: :bad_request
    end
  end
end
