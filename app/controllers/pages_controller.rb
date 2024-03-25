class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home]

  def home
    @user = RSpotify::User.find(current_user.uid) if user_signed_in?
  end
end
