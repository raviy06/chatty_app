class UsersController < ApplicationController

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:notice] = "You have signed up successfully."
  		redirect_to rooms_path
  		session[:name] = @user.name
  		session[:expires_at] = Time.now + 2.hours
      puts @user.token
  	else
  		render :new
  	end
  end

  def logout
  	session[:name] = nil
  	redirect_to root_path
  end



  private

  def user_params
  	params.require(:user).permit(:name)
  end
end
