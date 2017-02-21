# 日付が休日かどうかを管理するクラス.
class DayOff
  attr_accessor :time, :day_off, :reason

  def initialize(time, country='japanese', locale='en')
    @time = time
    @country = country
    set_dayoff(time, country, locale)
  end

  private
  # 時間から休日かどうかを判断してフィールドにセットする
  # @param [Time] time
  # @param [String] country
  # @param [String] locale
  def set_dayoff(time, country, locale)
    @reason = ''
    @day_off = false

    if time.saturday?
      @reason = I18n.t('Saturday')
      @day_off = true
      return
    elsif time.sunday?
      @reason = I18n.t('Sunday')
      @day_off = true
      return
    end

    # holidays tableをみて祝日でないかを判断する
    holiday = Holiday.find_by_time(time, country, locale)
    if holiday
      @reason = holiday.reason
      @day_off = true
      return
    end
  end
end