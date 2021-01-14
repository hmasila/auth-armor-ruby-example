class SessionsController < ApplicationController
  def create
    @user = User.find_by(username: params[:username])
    if @user.nil?
      render json: {
        message: "Username does not exist",
      }, status: 404
      return
    end
    if @user.authenticate(params[:password])
      session[:user_id] = user.id
    end
  end

  def confirm_login
    if current_user.nil?
      render json: {
        message: "Please login before verifying 2fa",
      }, status: 404
      return
    end
    @user = User.find_by(id: current_user.id)
    
    auth_armor_client.auth_request(
      nickname: user.nickname,
      action_name: "Login",
      short_msg: "Someone is trying to login to the sample demo"
    );
  end

  def destroy
    session[:user_id] = nil
    session[:auth_armor] = false
  end
end