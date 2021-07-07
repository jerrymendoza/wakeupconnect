class UsersController < ApplicationController
  skip_before_action :require_login, only: [:welcome]
  def welcome
    if logged_in?
      redirect_to home_path
    else
      render layout: false
    end
  end

  def home
  end
end