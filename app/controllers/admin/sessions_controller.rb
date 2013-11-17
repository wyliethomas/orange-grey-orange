class Admin::SessionsController < ApplicationController
  def new
  end

  def create
    user = Admin.authenticate(params[:session][:email], params[:session][:password])
    if user
      flash[:notice] = "You signed in!"
      session[:admin_expiry_time] = Time.now
      session[:admin_id] = user.id

      redirect_to admin_root_path
    else
      puts "ERROR"
      flash[:error] = "Invalid email or password"
      redirect_to admin_signin_path
    end
  end

  def destroy
  end
end
