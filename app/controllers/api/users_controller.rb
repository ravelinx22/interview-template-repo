module Api
  class UsersController < ApiApplicationController
    def index
      render json: User.paginate(
        per_page: pagination_params[:per_page] || 10,
        page: pagination_params[:page] || 1
      ), each_serializer: UserSerializer
    end

    private

    def pagination_params
      params.permit(
        :per_page, :page
      )
    end
  end
end