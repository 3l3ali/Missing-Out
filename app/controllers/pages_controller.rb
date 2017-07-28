class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index]

  def home
    redirect_to dashboard_path if user_signed_in?
  end

  def dashboard
  end

  def index
    @locations = Location.where.not(latitude: nil, longitude: nil)
    @posts = Post.order(created_at: :desc)
    set_category
    set_hash

    if params[:search_j].present?
      @posts = Post.search(params[:search_j]).order(created_at: :desc)
      @locations = @locations.where("address LIKE ?", "%#{params[:search_j]}%")
      set_category
      set_hash
    elsif params[:lat] && params[:lng]
      @lat = params[:lat]
      @lng = params[:lng]
      @bounds = params[:bounds].to_i
      @bounds = 1 if @bounds.zero?

      @locations = @locations.near([params[:lat], params[:lng]], @bounds)
      @posts = Post.where(location_id: @locations.map(&:id))
      set_category
      set_hash
    end


    respond_to do |format|
      if (params[:lat] && params[:lng]) || (params[:not_allowed]) || (params[:search_j].present?)
        format.js
      else
        format.html
      end
    end
  end

  def travel_guide
    if params[:language].blank?
      if params[:place].present?
        @users = User.where(travel_guide: true)
        @users = @users.where("location ILIKE ?", "%#{params[:place]}%")
      else
        @users = User.where(travel_guide: true)
      end
    else
      @users = User.where(travel_guide: true)
      @users = @users.where("location LIKE ?", "%#{params[:place]}%")
      @users = @users.select { |user| user.languages.pluck(:name).include?(params[:language]) }
    end
  end


  private
    def set_category
      if params[:category].present?
        if params[:category] == "all"
          @posts = @posts.order(created_at: :desc)
        else
          @posts = @posts.where(category: params[:category]).order(created_at: :desc)
          @locations = @locations.where(id: @posts.map(&:location_id) )
        end
      end
    end

    def set_hash
      @hash = Gmaps4rails.build_markers(@locations) do |location, marker|
        marker.lat location.latitude
        marker.lng location.longitude
        marker.infowindow render_to_string(partial: "/locations/map_box", locals: { location: location })
      end
    end
end
