class Admin::BlogsController < ApplicationController
  layout 'admin'
  before_filter :authenticate_admin

  def index
    @blogs = Post.blogs
    @blog_active = 'active'
  end

  def show
    @blog = Post.find(params[:id])
    @blog_active = 'active'
  end

  def new
    @blog_active = 'active'
  end

  def create
    blog = Post.new(params[:page])
    blog.type_id = 2
    if blog.save
      flash[:notice] = "Blog was created"
      redirect_to admin_blogs_path
    else
      flash[:alert] = "Failed to create blog"
      render :new
    end
  end

  def edit
    @blog = Post.find(params[:id])
    @blog_active = 'active'
  end

  def update
    @blog = Post.find(params[:id])
    if @blog.update_attributes(params[:blog])
      flash[:notice] = "Blog was updated"
      redirect_to admin_blogs_path
    else
      flash[:alert] = "Failed to update blog"
      render :edit
    end
  end

  def destroy
    blog = Post.find(params[:id])
    if blog.destroy
      flash[:notice] = "Blog was deleted"
      redirect_to admin_blogs_path
    else
      flash[:alert] = "Failed to delete blog"
      redirect_to admin_blogs_path
    end
  end
end
