class V1::UsersController < ApplicationController
	def create
	  User.create!(username: params[:username])
	end

  def show
    @user = User.find_by(username: params[:username])
    if @user.present?
      render json: {
        success: "User found",
      }, status: 200
    else
      render json: {
        error: "No such user; check the submitted username",
      }, status: 404
    end
	end
end