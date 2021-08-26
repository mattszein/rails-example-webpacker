class ApplicationController < ActionController::Base
  
  include ErrorResponseActions
  
  rescue_from ActiveRecord::RecordNotFound, with: :resource_not_found
  
end
