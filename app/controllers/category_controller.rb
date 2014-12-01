class CategoryController < ApplicationController

  def create
    @category = Category.new(params[:category].permit(:title))
    if @category.save
      redirect_to '/index_admin'
    else
      render 'new'
    end
  end

  def new
    @category = Category.new
  end

  def show
    @category = Category.find(params[:id])
    @images = Image.where(category: @category.title)
    @post = nil
  end

  def index
    @categories = Category.all
  end
end
