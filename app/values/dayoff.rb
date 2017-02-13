# json response

class Dayoff
  attr_accessor :day, :holiday

  def initialize(time)
    @time = time
    @reason = ''
    @holiday = isHoliday(time)
  end

  def isHoliday(time)
    if time.saturday?
      @reason = 'Saturday'
      @holiday = true
      return true
    elsif time.sunday?
      @reason = 'Sunday'
      @holiday = true
      return true
    end


    if @@holidays.include?(time)
      @reason = '祝日'
      @holiday = true
      return true
    end

    @holiday = false
    return false
  end


  @@holidays = [
        Date.new(2017, 1, 1),
        Date.new(2017, 1, 9),
        Date.new(2017, 2, 11),
        Date.new(2017, 3, 20),
        Date.new(2017, 4, 29),
        Date.new(2017, 5, 3),
        Date.new(2017, 5, 4),
        Date.new(2017, 5, 5),
        Date.new(2017, 7, 17),
        Date.new(2017, 8, 11),
        Date.new(2017, 9, 18),
        Date.new(2017, 9, 23),
        Date.new(2017, 10, 19),
        Date.new(2017, 11, 3),
        Date.new(2017, 11, 23),
        Date.new(2017, 12, 23)
    ]
end