class PostsController < ApplicationController

  http_basic_authenticate_with name: "---", password: "---", only: :index_admin

  def index
    @posts = Post.all.reverse_order
  end

  def index_admin
    @posts = Post.all.reverse_order
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post].permit(:title, :text))
    if @post.save
      redirect_to '/index_admin'
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(params[:post].permit(:title, :text))
      redirect_to '/index_admin'
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to "/index_admin"
  end

end
