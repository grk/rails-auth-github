class HomeController < ApplicationController
  before_filter :authenticate!, :only => [:user_info]

  def index
  end

  def user_info
  end

  def logout
    logout!
    redirect_to root_path
  end
end
