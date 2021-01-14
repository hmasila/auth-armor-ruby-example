class InvitessController < ApplicationController
  def register
    Invite.create!(username: params[:username], password: params[:password])
  end
  
  private
  def user_params
    require(user).permit(:username, :password)
  end
end