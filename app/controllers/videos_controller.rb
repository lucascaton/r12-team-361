class VideosController < ApplicationController
  def index
    @videos = Video.all
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
end
