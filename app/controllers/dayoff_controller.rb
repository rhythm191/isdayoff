require 'date'

class DayoffController < ApplicationController
  def today
    dayoff = Dayoff.new(Time.now)

    render json: dayoff
  end

  def is
    date = Date.strptime(params[:day],'%Y-%m-%d')
    dayoff = Dayoff.new(date.to_time)

    render json: dayoff
  end

  def get_holiday
    start_time = params['date'].nil? ? Time.now : Time.parse(params['date'])
    end_time = start_time + 1.years + 6.months
    GetHolidayJob.perform_later(start_time.to_i, end_time.to_i)

    render plain: 'ok'
  end
end
