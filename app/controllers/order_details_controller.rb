class OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find_by id: params[:id]
    if !@order_detail.nil?
      if @order_detail.update_attributes order_detail_params
        flash[:success] = t "update_success"
      else
        flash.now[:danger] = t "update_fail"
      end
    else
      flash[:danger] = t "find_error"
    end
    redirect_to :back
  end

  def destroy
    @order_detail = OrderDetail.find_by id: params[:id]
    if !@order_detail.nil?
      if @order_detail.destroy
        flash[:success] = t "delete_product_success"
      else
        flash[:danger] = t "delete_delete_fail"
      end
    else
      flash[:danger] = t "find_error"
    end
    redirect_to :back
  end

  private

  def order_detail_params
    params.require(:order_detail).permit :quantity, :note, :order_id, :product_id
  end
end
