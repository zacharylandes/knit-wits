class SessionsController < ApplicationController

  def destroy
    session[:user_id] = nil
    redirect_to items_path
  end
end
