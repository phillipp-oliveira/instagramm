class PicturesController < ApplicationController
  before_action :find_pic, only: [:show, :edit, :update, :destroy]

  def index
    @pics = Picture.all.order(created_at: :description)
  end

  def show
  end

  def new
    @pic = Picture.new
  end

  def create
    @pic = Picture.new(pic_params)

    if @pic.save
      redirect_to @pic, notice: "Posted!"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @pic.update?(pic_params)
      redirect_to @pic, notice: "Picture was updated!"
    else
      render 'edit'
    end
  end

  private

  def pic_params
    params.require(:picture).permit(:title, :description)
  end

  def find_pic
    @pic = Picture.find(params[:id])
  end
end
