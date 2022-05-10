module Api
  class UserSerializer < ActiveModel::Serializer
    attributes :id, :first_name, :last_name,
               :status, :email, :created_at
  end
end