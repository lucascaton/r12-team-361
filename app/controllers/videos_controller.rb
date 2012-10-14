class VideosController < ApplicationController
  before_filter :assign_user, only: [:index, :results]

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

  def new
    @video = Video.new
  end

  def create
    @video = Video.new params[:video]

    if @video.save
      redirect_to @video
    else
      flash[:erorr] = @video.errors.full_messages.first
      render :new
    end
  end

  def edit
    @video = Video.find params[:id]
  end

  def update
    @video = Video.find params[:id]

    if @video.update_attributes params[:video]
      redirect_to @video
    else
      flash[:erorr] = @video.errors.full_messages.first
      render :edit
    end
  end

  def destroy
    @video = Video.find params[:id]
    @video.destroy
    redirect_to videos_path
  end

  protected

  def assign_user
    @user = UserPresenter.new(current_user)
  end
end
