class LandingPageController < ApplicationController
  def home
    @boards = Board.all
  end
end
