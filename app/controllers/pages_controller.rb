class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home]
  before_action :configure_user, if: :user_signed_in?

  def home
  end
end
