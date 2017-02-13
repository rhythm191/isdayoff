require 'google/apis/calendar_v3'

class CalendarClient

  def initialize
    @service = Google::Apis::CalendarV3::CalendarService.new
    @service.client_options.application_name = "isDayoff"
    @service.key = Rails.application.secrets.calendar_key
  end

  def list(calendar_id, startTime = Time.now, endTime = (Time.now + 1.year))
    @service.list_events(calendar_id,
                         max_results: 30,
                         single_events: true,
                         time_min: startTime.iso8601,
                         time_max: endTime.iso8601,
                         order_by: 'startTime')
  end
end