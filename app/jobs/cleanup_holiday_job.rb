class CleanupHolidayJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Holiday.where('date <= ?', 10.years.ago).destroy_all
  end
end
