class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user


  private

  def current_user
  	
  		@current_user = User.find_by(name: session[:name])
  	
  end
end
