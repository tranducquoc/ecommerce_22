class Admin::OrdersController < ApplicationController
  layout "admin_layout"

  def index
    @orders = Order.all_orders.paginate page: params[:page],
      per_page: Settings.maximum_per_page
  end

  def show
    @order = Order.find_by id: params[:id]
    if @order.nil?
      flash[:danger] = t "find_error"
      redirect_to admin_orders_path
    else
      @order_details = @order.order_details.paginate page: params[:page],
      per_page: Settings.maximum_per_page
    end
  end
end
