# 日付が休日かどうかを管理するクラス.
class DayOff
  attr_accessor :time, :day_off, :reason

  def initialize(time)
    @time = time
    set_dayoff(time)
  end

  private
  # 時間から休日かどうかを判断してフィールドにセットする
  # @param [Time] time
  def set_dayoff(time)
    @reason = '祝日'
    @day_off = false

    if time.saturday?
      @reason = 'Saturday'
      @day_off = true
      return
    elsif time.sunday?
      @reason = 'Sunday'
      @day_off = true
      return
    end

    # holidays tableをみて祝日でないかを判断する
    holiday = Holiday.find_by_time(time)
    if holiday
      @reason = holiday.reason
      @day_off = true
      return
    end
  end
end