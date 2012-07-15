class HomeController < ApplicationController
  before_filter :login_required, :only => ['dashboard']

  def index
    dashboard if user_signed_in?
  end

  def dashboard
    render action: 'dashboard'
  end

end
