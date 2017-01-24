class PicturesController < ApplicationController
  def index

  end

  def new
    @pic = Picture.new
  end

  def create
    @pic = Picture.new(pic_params)
  end

  private

  def pic_params
    params.require(:picture).permit(:title, :description)
  end
end
