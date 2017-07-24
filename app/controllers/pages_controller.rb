class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index]

  def home
    redirect_to dashboard_path if user_signed_in?
  end

  def dashboard
  end

  def index
    @locations = Location.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@locations) do |location, marker|
      marker.lat location.latitude
      marker.lng location.longitude
      marker.infowindow render_to_string(partial: "/locations/map_box", locals: { location: location })
    end


    if params[:category] == "all"
      @posts = Post.order(created_at: :desc)
    elsif params[:category] == ""
      @posts = Post.search(params[:search]).order(created_at: :desc)
    else
      @posts = Post.where(category: params[:category]).order(created_at: :desc)
    end
  end
end
