require 'google/apis/calendar_v3'

class CalendarClient

  def initialize
    @service = Google::Apis::CalendarV3::CalendarService.new
    @service.client_options.application_name = "IsDayOff"
    @service.key = Rails.application.secrets.calendar_key
  end

  # google calendar api のレスポンスを返す
  # @param [String] calendar_id
  # @param [Time] start_time 取得したいカレンダーの開始時間(default: Timer.now)
  # @param [Time] end_time 取得したいカレンダーの終了時間(default: 1年後)
  # @param [Integer] limit 取得上限
  # @return [Google::Apis::CalendarV3::Events] eventのリスト
  def list_events(calendar_id, start_time = Time.now, end_time = (Time.now + 1.year), limit= 30)
    @service.list_events(calendar_id,
                         max_results: limit,
                         single_events: true,
                         time_min: start_time.iso8601,
                         time_max: end_time.iso8601,
                         order_by: 'startTime')
  end

  # google calendar api を使って祝日の情報を返す
  # @param [String] calendar_id
  # @param [Time] start_time 取得したいカレンダーの開始時間(default: Timer.now)
  # @param [Time] end_time 取得したいカレンダーの終了時間(default: 1年後)
  # @param [Integer] limit 取得上限
  # @return [Holiday] holidayのリスト
  def list_holiday(calendar_id, start_time = Time.now, end_time = (Time.now + 1.year), limit= 30)
    list_events(calendar_id, start_time, end_time, limit).items.map do |item|
      Holiday.new(
          date: Date.parse(item.start.date),
          reason: item.summary,
          country: country(calendar_id),
          locale: locale(calendar_id))
    end
  end

  # calendar_id から country を返す
  # @param [String] calendar_id
  # @return [String] country
  def country(calendar_id)
    calendar_id =~ /^([^_@]+).*/
    $1
  end

  # calendar_id から locale を返す
  # @param [String] calendar_id
  # @return [String] locale
  def locale(calendar_id)
    calendar_id =~ /^([^_]+)__([^@]+)@.+/
    $2 || 'en'
  end
end