module Admin
  class AdminApplicationController < ApplicationController
    include ViewErrorHandler

    def not_found
      render 'admin/not_found', status: :not_found
    end
  end
end
