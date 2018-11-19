class AngelsController < ApplicationController

  def index
    @angels = Angel.all
  end

  def show
    @angel = Angel.find(params[:id])
  end

  def new
    # @user = current_user
    @angel = Angel.new
    # @angel.user_id = current_user.id
  end

  def create
    @angel = Angel.new(angel_params)
    @angel.user_id = current_user.id
    @angel.save!
    redirect_to user_path(current_user)
  end

  def edit
    @angel = Angel.find(params[:id])
  end

  def update
    @angel = Angel.find(params[:id])
    @angel.update(angel_params)
    # redirect_to ??
  end

  def destroy
    @angel = Angel.find(params[:id])
    @angel.destroy
    # redirect_to ??
  end

  private

  def angel_params
    params.require(:angel).permit(:first_name, :last_name, :phone_number)
  end
end
