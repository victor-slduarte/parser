class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[danger show]

  before_action :set_user, only: %i[show danger]

  def show
  end

  def dashboard
    @user = current_user
  end

  def map
  end

  def danger
    @user.send_wpp_messages

    head :ok
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
