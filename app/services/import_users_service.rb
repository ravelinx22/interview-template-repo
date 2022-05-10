class ImportUsersService < ApplicationService    
  attr_accessor :step
  attr_accessor :limit

  def initialize
    @step = 20
    @limit = 20
  end

  def call
    offset = 0
    users = get_users(offset: offset)
    while users.any?
      users = get_users(offset: offset)
      create_users_from_microverse_users(users)
      offset += @step
    end
  end

  private

  def get_users(offset:)
    users_json = MicroverseClient.instance.get_users(
      limit: @limit, offset: offset
    ) 
    raise Errors::ImportingUsersError if users_json.blank?

    MicroverseUser.from_json_array(users_json)
  end

  def create_users_from_microverse_users(users)
    users.each do |user|
      User.create!(user.to_h)
    end
  end
end