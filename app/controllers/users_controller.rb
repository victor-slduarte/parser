class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def dashboard
    @angels = Angels.new
  end

  def
  end

end
