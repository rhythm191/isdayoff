class CalendarsController < ApplicationController
  def countries
    @calendars = Calendar.all.select(:country, :locale)
    render 'countries', :formats => [:json], :handlers => [:jbuilder]
  end
end
