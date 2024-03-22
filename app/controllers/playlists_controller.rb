class PlaylistsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show new create]

  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def add_to_spotify
  end
end
