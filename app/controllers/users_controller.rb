class UsersController < ApplicationController
  def register
    if User.find_by(username: params[:username])
      render json: {
        message: "Username taken",
      }, status: 400
      return
    end
	  User.create!(username: params[:username], password: params[:password])
  end
  
  private
  def user_params
    require(user).permit(:username, :password)
  end
end