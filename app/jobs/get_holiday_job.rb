class GetHolidayJob < ApplicationJob
  queue_as :default

  @@calendar_id = 'japanese__ja@holiday.calendar.google.com'

  # Google calendar apiから祝日を取得してDBに保存する.
  # すでに保存されている日付は何もしない.
  # @param [Integer] 開始時間のunix time
  # @param [Integer] 終了時間のunix time
  def perform(start_unix_time, end_unix_time)
    start_time = Time.at(start_unix_time)
    end_time = Time.at(end_unix_time)
    logger.info("get holiday #{start_time} -> #{end_time}")

    client = CalendarClient.new
    client.list_holiday(@@calendar_id, start_time, end_time).each do |holiday|
      unless holiday.existed?
        logger.info "new create #{holiday.reason}(#{holiday.date})"
        holiday.save
      end
    end
  end
end
