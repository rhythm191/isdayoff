require 'date'

class DayoffController < ApplicationController
  def today
    dayoff = Dayoff.new(Time.now)

    client = CalendarClient.new
    client.list('japanese__ja@holiday.calendar.google.com')

    render json: dayoff
  end

  def is
    date = Date.strptime(params[:day],'%Y-%m-%d')
    dayoff = Dayoff.new(date.to_time)

    render json: dayoff
  end

  def get_holiday
    # time = Time.parse(params['date'])
    start_time = Time.now
    end_time = Time.now + 1.years
    GetHolidayJob.perform_later(start_time.to_i, end_time.to_i)

    render plain: 'ok'
  end
end
