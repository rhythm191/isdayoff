require 'rails_helper'

RSpec.describe GetHolidayJob, type: :job do

  describe 'queues' do
    it 'should enqueue default queue' do
      expect {
        GetHolidayJob.perform_later
      }.to have_enqueued_job(GetHolidayJob)
    end
  end

  describe 'perform' do
    it 'should save holiday list' do
      expect {
        start_time = Time.new(2018, 1, 1)
        end_time = Time.new(2018, 1, 2)
        job = GetHolidayJob.new
        job.perform(start_time.to_i, end_time.to_i)
      }.to change { Holiday.all.size }.by(1)
    end
  end
end
