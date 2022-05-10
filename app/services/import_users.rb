class ImportUsers < ApplicationService  
  def initialize; end

  def call
    users_response = MicroverseClient.instance.get_users
    # TODO: Handle error

    users = MicroverseUser.fromJSONArray(users_response)
    users.each do |user|
      User.create!(user.to_h)
    end
  end
end