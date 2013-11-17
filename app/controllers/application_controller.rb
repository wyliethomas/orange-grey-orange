class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate_admin
    if session[:admin_id] && session[:admin_expiry_time]
      user = Admin.find(session[:admin_id])
      if session[:admin_expiry_time] >= 20.minutes.ago
        session[:admin_expiry_time] = Time.now
      else
        session[:admin_id] = nil
        #redirect
        redirect_to admin_signin_path
      end
    else
      #redirect
      redirect_to admin_signin_path
    end
  end




  private
  
  def current_admin
    if session[:admin_id].nil? || session[:admin_id] == ''
      @current_admin = nil
    else
      if @current_admin.nil? || @current_admin.id != session[:admin_id]
        @current_admin = Admin.find(session[:admin_id])
      end
    end
    
    @current_admin
  end

end
