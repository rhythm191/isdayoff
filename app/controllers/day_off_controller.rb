require 'date'

class DayOffController < ApplicationController
  def today
    day_off = DayOff.new(Time.now)
    render json: day_off
  end

  def is
    date = Date.strptime(params[:day],'%Y-%m-%d')

    # 現在から1年前後でなければOutOfRangeExceptionをだす
    time_range = (Time.now - 1.years)..(Time.now + 1.years)
    unless time_range.include? date.to_time
      render json: {exception: 'OutOfRangeException' }, status: :bad_request and return
    end

    day_off = DayOff.new(date.to_time)
    render json: day_off
  end

  def get_holiday
    start_time = params['date'].nil? ? Time.now : Time.parse(params['date'])
    end_time = start_time + 1.years + 6.months
    GetHolidayJob.perform_later(start_time.to_i, end_time.to_i)

    render plain: 'ok'
  end
end
