class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def redirect_unless_admin
  	unless Rails.env == "development"
		  authenticate_or_request_with_http_basic do |username, password|
		    username == ENV['LEIGH_PART_DEUX_USERNAME'] && password == ENV['LEIGH_PART_DEUX_PASSWORD']
		  end
		end
  end
end
