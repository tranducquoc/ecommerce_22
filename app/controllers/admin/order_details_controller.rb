class Admin::OrderDetailsController < ApplicationController
  layout "admin_layout"
  before_action :check_admin

  def destroy
    order_detail =  OrderDetail.find_by id: params[:id]
    if order_detail
      if order_detail.destroy
        flash[:success] = t "delete_product_success"
      else
        flash[:danger] = t "delete_product_fail"
      end
    else
      flash[:danger] = t "find_error"
    end
    redirect_to :back
  end
end
