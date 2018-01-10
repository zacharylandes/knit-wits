class UsersController < ApplicationController
  before_action :set_states
  before_action :is_user, only: [:edit, :update]

  def new
    @user = User.new
    @button_text = "Register"
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
  end

  def edit
    @user = User.find(params[:id])
    @button_text = "Update my Account"
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
    render file: "/public/404" if logged_in? && current_user.id != params[:id].to_i
  end

  def set_states
    @states = User.states.keys
  end
end
