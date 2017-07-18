class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :dashboard, :index]

  def home
  end
  def dashboard
  end
  def index
  end
end
