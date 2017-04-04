class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user


  private

  def current_user
  	unless session[:token] = nil
  		@current_user = User.find_by(token: session[:token])
  	end
  end
end
