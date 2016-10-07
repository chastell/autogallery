class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      TaggingService.new.tag(@photo)
      redirect_to '/tags'
    else
      render :new
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:image, :title)
  end
end
