class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[danger show]
  before_action :set_user, only: %i[show danger]


  def show
  end

  def danger
    @user.send_wpp_messages
    head :ok
  end

  def map
    @user = current_user
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
