class Admin::DashboardController < ApplicationController
  layout 'admin'
  before_filter :authenticate_admin

  def index
    @dashboard_active = 'active'
  end
end
