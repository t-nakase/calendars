class ToppagesController < ApplicationController
  def index
    if logged_in?
      redirect_to blogs_path
    end
  end
end
