class VideosController < ApplicationController
  before_filter :assign_user, only: [:index, :results, :show]

  def index
    @video_search = Babycasts::VideoSearch.new
    @videos       = VideoPresenter.collect(Video.all)
  end

  def results
    @video_search = Babycasts::VideoSearch.new(params[:babycasts_video_search])
    @videos       = VideoPresenter.collect(@video_search.results)
    render :index
  end

  def show
    @video = Video.find params[:id]
  end

  protected

  def assign_user
    @user = UserPresenter.new(current_user)
  end
end
