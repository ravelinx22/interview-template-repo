require 'rails_helper'

RSpec.describe UsersWorker, type: :worker do
  describe '#perform_async' do
    context 'when job is added to the queue' do
      it 'should increase job queue size' do
        UsersWorker.perform_async
        expect(UsersWorker.jobs.size).to eq(1)
        expect(User.count).to eq(0)
      end

      it 'should import users from third party service' do
        UsersWorker.perform_async
        UsersWorker.drain
        expect(User.count).to be > 0
      end
    end
  end  
end
