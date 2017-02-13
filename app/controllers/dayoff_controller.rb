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
end
