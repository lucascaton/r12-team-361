class VideosController < ApplicationController
  respond_to :html
  before_filter :assign_user, :assign_video, :assign_video_search

  def index
    @videos       = VideoPresenter.collect(Video.all)
  end

  def results
    @video_search = Babycasts::VideoSearch.new(params[:babycasts_video_search])
    @videos       = VideoPresenter.collect(@video_search.results)
    render :index
  end

  def show
    @video        = Video.find params[:id]
  end

  def create
    @video = Video.new(params[:video])
    @video.save
    respond_with(@video)
  end

  protected

  def assign_user
    @user = UserPresenter.new(current_user)
  end

  def assign_video
    @video = Video.new
  end

  def assign_video_search
    @video_search = Babycasts::VideoSearch.new
  end
end
