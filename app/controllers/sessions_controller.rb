class SessionsController < ApplicationController

  def new
    render layout: params[:iframe] ? 'iframe' : true
  end

  def create
    auth = {:provider => request.env['omniauth.auth']['provider'].to_s,
            :uid => request.env['omniauth.auth']['uid'].to_s,
            :name => request.env['omniauth.auth']['info']['name'].to_s}
    unless @auth = Authorization.find_from_hash(auth)
      # Create a new user or add an auth to existing user, depending on
      # whether there is already a user signed in.
      @auth = Authorization.create_from_hash(auth, current_user)
    end
    # Log the authorizing user in.
    self.current_user = @auth.user

    flash[:notice] = "Welcome, #{current_user.name}."
    redirect_back_or_default(root_path)
  end

  def failure
    flash[:error] = params[:message].humanize || "Authentication failed"
    redirect_to(login_path)
  end

  def destroy
    # Log the authorizing user in.
    session[:user_id] = nil
    flash[:notice] = "Succesfully logged Out"
    redirect_to(root_path)
  end
end