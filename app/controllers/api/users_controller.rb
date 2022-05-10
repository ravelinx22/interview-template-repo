module Api
  class UsersController < ApiApplicationController
    def index
      render json: User.all, each_serializer: UserSerializer
    end
  end
end