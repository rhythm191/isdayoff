namespace :holiday do
  desc 'get holiday from google calendar api'
  task :get_list, [:date] => :environment do |task, args|
    start_time = args['date'] ? Time.parse(args['date']) : Time.now
    end_time = start_time + 1.years + 6.months
    GetHolidayJob.perform_later(start_time.to_i, end_time.to_i)
  end

  desc 'clean holiday datas'
  task :clean => :environment do
    CleanupHolidayJob.perform_later
  end
end
