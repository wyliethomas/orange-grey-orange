class Admin::UsersController < ApplicationController
  layout 'admin'
  before_filter :authenticate_admin

  def index
    @users = Admin.all
  end

  def show
    @user = Admin.find(params[:id])
  end

  def new
  end

  def create
    user = Admin.new(params[:user])
    if user.save
      flash[:notice] = "User was created"
      redirect_to admin_user_path
    else
      flash[:alert] = "Failed to create user"
      render :new
    end
  end

  def edit
    @user = Admin.find(params[:id])
  end

  def update
    @user = Admin.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "User was updated"
      redirect_to admin_user_path
    else
      flash[:alert] = "Failed to update user"
      render :edit
    end
  end

  def destroy
    user = Admin.find(params[:id])
    if user.destroy
      flash[:notice] = "User was deleted"
      redirect_to admin_user_path
    else
      flash[:alert] = "Failed to delete user"
      render :new
    end
  end
end
