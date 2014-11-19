class ImagesController < ApplicationController
  def new
    @image = Image.new
    @post = Post.find(params[:post_id])
  end

  def create
    @post = Post.find(params[:post_id])
    @image = @post.images.create(params[:image].permit(:title, :description, :photo))
    redirect_to post_path(@post)
  end

  def show
    @post = Post.find(params[:post_id])
    @image = @post.images.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:post_id])
    @image = @post.images.find(params[:id])
    @image.destroy
    redirect_to edit_post_path(@post)
  end
end
