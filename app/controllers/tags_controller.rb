class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def show
    @photos = Tag.find(params[:id]).photos
    render 'photos/index'
  end
end
