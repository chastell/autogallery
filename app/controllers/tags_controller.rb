class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
    @photos = @tag.photos
    render 'photos/index'
  end
end
