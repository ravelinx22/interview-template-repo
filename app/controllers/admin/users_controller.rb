module Admin
  class UsersController < AdminApplicationController
    def index
    end

    def show
      @name = "James"
    end
  end
end