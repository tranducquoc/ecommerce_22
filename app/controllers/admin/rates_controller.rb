class Admin::RatesController < ApplicationController
  layout "admin_layout"
  before_action :check_admin

  def index
    @rates = Rate.all_rates.paginate page: params[:page],
      per_page: Settings.maximum_per_page
  end
end
