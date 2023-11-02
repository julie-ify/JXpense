class SplashController < ApplicationController
  skip_before_action :authenticate_user!

  def index; end

  def first_screen; end
end
