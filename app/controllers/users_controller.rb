class UsersController < ApplicationController
  before_action :set_states
  before_action :require_logged_in, only: [:edit]
  before_action :is_user, only: [:update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      flash[:alert] = "Invalid Credentials"
      render :new
    end
  end

  def show
    if logged_in?
    else
      render file: "/public/404"
    end
  end

  def edit
    if current_user.id == params[:id].to_i
      @user = User.find(params[:id])
    else
      render file: "/public/404"
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to dashboard_path
  end

private

  def user_params
    params.require(:user).permit(:username, :password, :street, :city, :state, :zipcode, :full_name)
  end

  def is_user
    render file: "/public/404" if current_user.id != params[:id]
  end

  def set_states
    @states = User.states.keys
  end
end
