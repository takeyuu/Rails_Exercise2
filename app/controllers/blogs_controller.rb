class BlogsController < ApplicationController
  before_action :blog_select, only: [:edit, :update, :destroy]
  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def confirm
    @blog = Blog.new(blog_params)
  end

  def create
    @blog = Blog.new(blog_params)
    if params[:back]
      render :new
    else
      if @blog.save
        redirect_to blogs_path, notice: 'ブログを作成しました'
      else
        render :new
      end
    end
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: 'ブログを編集しました'
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice: 'ブログを削除しました'
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :content)
  end

  def blog_select
    @blog = Blog.find(params[:id])
  end
end
