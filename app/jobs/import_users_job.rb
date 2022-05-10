class ImportUsersServiceJob < ApplicationJob
  queue_as :default

  def perform(*args)
    ImportUsersService.call
  end
end
