class Admin::UsersController < ApplicationController
  layout "admin_layout"

  def index
    @users = User.paginate page: params[:page],
      per_page: Settings.maximum_per_page
  end
end
