class UsersWorker
  include Sidekiq::Worker

  def perform(*)
    ImportUsersService.call
  end
end
