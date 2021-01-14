class ApplicationController < ActionController::Base
  helper_method :current_user
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def auth_armor_client
    AuthArmor::Client.new(client_id: "CLIENT_ID", client_secret: "CLIENT_SECRET")
  end
end
