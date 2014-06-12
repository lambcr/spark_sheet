module Concerns::ErrorHandling
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found
  end

  def handle_record_not_found(exception)
    respond_to do |format|
      format.html { redirect_to root_url, status: :not_found }
    end
  end
end
