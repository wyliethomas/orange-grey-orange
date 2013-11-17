class Admin::PagesController < ApplicationController
  layout 'admin'
  before_filter :authenticate_admin

  def index
    @pages = Post.pages
    @page_active = 'active'
  end

  def show
    @page = Post.find(params[:id])
    @page_active = 'active'
  end

  def new
    @page_active = 'active'
  end

  def create
    page = Post.new(params[:page])
    page.type_id = 1
    if page.save
      flash[:notice] = "Page was created"
      redirect_to admin_pages_path
    else
      flash[:alert] = "Failed to create page"
      render :new
    end
  end

  def edit
    @page = Post.find(params[:id])
    @page_active = 'active'
  end

  def update
    @page = Post.find(params[:id])
    if @page.update_attributes(params[:page])
      flash[:notice] = "Page was updated"
      redirect_to admin_pages_path
    else
      flash[:alert] = "Failed to update page"
      render :edit
    end
  end

  def destroy
    page = Post.find(params[:id])
    if page.destroy
      flash[:notice] = "Page was deleted"
      redirect_to admin_pages_path
    else
      flash[:alert] = "Failed to delete page"
      redirect_to admin_pages_path
    end
  end
end
