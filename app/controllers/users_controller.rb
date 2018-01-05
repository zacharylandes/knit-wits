class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:success] = "Logged in as #{current_user.username}"
      redirect_to dashboard_path(id: user.id)
    else
      flash[:notice] = "Unable to create account!"
      render :new
    end
  end

    private

    def user_params
      params.require(:user).permit(:username, :password)
    end
end
