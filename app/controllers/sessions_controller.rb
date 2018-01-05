class SessionsController < ApplicationController
<<<<<<< HEAD
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      if current_admin?
        redirect_to admin_dashboard_index_path
      else
        redirect_to dashboard_path
      end
    else
      flash[:error] = "Username or Password invalid. Try again."
      render :new
    end
  end

=======

  def destroy
    session[:user_id] = nil
    redirect_to items_path
  end
>>>>>>> max-user
end
