module Api
  class ApiApplicationController < ApplicationController
    include ApiErrorHandler
    protect_from_forgery unless: -> { request.format.json? }
  end
end
