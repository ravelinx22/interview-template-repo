module ViewErrorHandler
  extend ActiveSupport::Concern

  def self.included(clazz)
    clazz.class_eval do
      rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    end
  end

  private

  def record_not_found
    redirect_to admin_not_found_path
  end
end
