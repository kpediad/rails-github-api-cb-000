class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user

  CLIENT_ID = "dummy"

  private

  def authenticate_user
    redirect_to "https://github.com/login/oauth/authorize?ClientID=#{CLIENT_ID}" and return if !logged_in?
  end

  def logged_in?
    !!session[:token]
  end
end
