class UsersController < ApplicationController
  def show
    @user = RSpotify::User.find(current_user.uid) if user_signed_in?
  end
end
