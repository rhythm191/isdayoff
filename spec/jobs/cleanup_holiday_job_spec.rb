require 'rails_helper'

RSpec.describe CleanupHolidayJob, type: :job do
  describe 'perform' do
    it 'should delete holiday at 10 years ago' do
      Holiday.create(date: 11.years.ago, reason: 'test')
      expect {
        CleanupHolidayJob.new.perform
      }.to change { Holiday.all.size }.by(-1)
    end
  end
end
