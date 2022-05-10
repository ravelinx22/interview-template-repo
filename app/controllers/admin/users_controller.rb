module Admin
  class UsersController < AdminApplicationController
    def index
      @users = filter_params[:status].blank? ? User : User.where(filter_params)
      @users = @users.paginate(
        page: paginate_params[:page], per_page: 10
      )
    end

    def show
      @name = "James"
    end

    private
    
    def filter_params
      params.permit(
        :status
      )
    end

    def paginate_params
      params.permit(
        :page
      )
    end
  end
end