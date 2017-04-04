class UsersController < ApplicationController
  def index
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:notice] = "You have signed up successfully."
  		redirect_to root_path
  		session[:name] = @user.name
  		session[:token] = @user.token
  		session[:expires_at] = Time.now + 2.hours
  	else
  		render :new
  	end
  end

  def logout
  	session[:name] = nil
  	session[:token] = nil
  	redirect_to root_path
  end



  private

  def user_params
  	params.require(:user).permit(:name, :token)
  end
end
