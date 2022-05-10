module Errors
  class GenericError < StandardError
    attr_reader :status, :error, :message

    def initialize(error: nil, status: nil, message: nil)
      @error = error || 422
      @status = status || :unprocessable_entity
      @message = message || I18n.t('errors.something_wrong')
    end
  end

  class ImportingUsersError < GenericError
    def initialize
      super(
        message: "Could not import users from Microverse"
      )
    end
  end
end
