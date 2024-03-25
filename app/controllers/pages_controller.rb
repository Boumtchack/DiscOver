class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home]
  before_action :configure_user, if: :user_signed_in?
  
  def home
  end

  private

  def configure_user
    @user = current_user
    @spotify_account = RSpotify::User.find(current_user.uid)
  end
end
