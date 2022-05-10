module Api
  class ApiApplicationController < ApplicationController
    protect_from_forgery unless: -> { request.format.json? }
  end
end
