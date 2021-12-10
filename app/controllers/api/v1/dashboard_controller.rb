class Api::V1::DashboardController < ApplicationController
  def index
    fetch_recently_heard
    fetch_recomendations
  end

  private

  def fetch_recently_heard
    @recently_albums = current_user.recently_heards.order(created_at: :DESC).limit(4).map(&:album)
  end

  def fetch_recomendations
    heard_categories = @recent_albums.map(&:category)
    if heard_categories.present?
      @recommended_albums = Album.joins(:categories, :songs)
                                 .where(category: heard_categories)
                                 .order('songs.played_count')
    else
      @recommended_albums = Album.all.sample(12)
    end
  end
end
