class ImagesController < ApplicationController
  def new
    @image = Image.new
    @post = Post.find(params[:post_id])
  end

  def create
    @post = Post.find(params[:post_id])
    @image = @post.images.create(params[:image].permit(:title, :description, :photo, :category))
    redirect_to post_path(@post)
  end

  def show
    @post = Post.find(params[:post_id])
    @image = @post.images.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])
    @post = @image.post

    if @image.update(params[:image].permit(:category))
      redirect_to edit_post_path(@post)
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @image = @post.images.find(params[:id])
    @image.destroy
    redirect_to edit_post_path(@post)
  end
end
