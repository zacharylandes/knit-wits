class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to dashboard_path(id: user.id)
      flash[:success] = "Logged in as #{current_user.username}"
    else
      flash[:notice] = "Unable to create account!"
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

    private

    def user_params
      params.require(:user).permit(:username, :password)
    end
end
