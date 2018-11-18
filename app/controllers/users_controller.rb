class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[danger show]
  before_action :set_user, only: %i[show danger]
  require 'open-uri'

  def show
  end

  def danger
    @user.send_wpp_messages
    head :ok
  end

  def map
    @user = current_user
    url = "https://api.thingspeak.com/channels/630025/feeds.json?api_key=O082B0T51Z0IM9UP&results=2"
    serialized_location = open(url).read
    hash = JSON.parse(serialized_location)
    @latitude = hash["feeds"][1]["field1"]
    @longitude = hash["feeds"][1]["field2"]
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
