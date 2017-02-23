namespace :holiday do
  desc 'get holiday from google calendar api'
  task :get_list, [:date] => :environment do |task, args|
    start_time = args['date'] ? Time.parse(args['date']) : Time.now
    end_time = start_time + 1.years + 6.months
    puts "get holiday #{start_time} -> #{end_time}"

    client = CalendarClient.new
    Calendar.all.select(:calendar_id).each do |calendar|
      puts calendar.calendar_id

      client.list_holiday(calendar.calendar_id, start_time, end_time).each do |holiday|
        unless holiday.existed?
          puts "new create  #{holiday.reason}(#{holiday.date})"
          holiday.save
        end
      end
    end
  end

  desc 'clean holiday datas'
  task :clean => :environment do
    Holiday.where('date <= ?', 10.years.ago).destroy_all
  end
end
