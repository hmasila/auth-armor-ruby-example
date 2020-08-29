class V1::UsersController < ApplicationController
	def create
	  User.create!(username: params[:username], nickname: params[:nickname])
	end

  def show
    # @user = User.find_by(username: params[:username])
    render json: {
      user: {
        nickname: "@user.nickname"
      }
    }.to_json
	end
end