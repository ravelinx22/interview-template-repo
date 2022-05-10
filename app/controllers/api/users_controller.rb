module Api
  class UsersController < ApiApplicationController
    def index
      render json: User.where(filter_params).paginate(
        per_page: pagination_params[:per_page] || 10,
        page: pagination_params[:page] || 1
      ), each_serializer: UserSerializer
    end

    private

    def filter_params
      params.permit(
        :status
      )
    end

    def pagination_params
      params.permit(
        :per_page, :page
      )
    end
  end
end