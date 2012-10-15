class VideosController < ApplicationController
  respond_to :html, :js
  before_filter :assign_user, :assign_video, :assign_video_search
  before_filter :load_sponsored_video, only: [:index, :results]

  def index
    @pages = Video.available.page(params[:page]).per(4)
    @videos = VideoPresenter.collect(@pages)
  end

  def results
    @video_search = Babycasts::VideoSearch.new(params[:babycasts_video_search])
    @pages        = @video_search.results.page(params[:page]).per(4)
    @videos       = VideoPresenter.collect(@pages)
    render :index
  end

  def show
    @video = VideoPresenter.new(Video.find params[:id])
  end

  def create
    @video = Video.new(params[:video])
    @video.save
    respond_with(@video)
  end

  private

  def assign_user
    @user = UserPresenter.new(current_user)
  end

  def assign_video
    @video = Video.new
  end

  def assign_video_search
    @video_search = Babycasts::VideoSearch.new
  end

  def load_sponsored_video
    @sponsored_video = VideoPresenter.collect([Video.sponsored.sample])
  end
end
