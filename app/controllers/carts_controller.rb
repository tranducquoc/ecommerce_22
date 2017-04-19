class CartsController < ApplicationController
  def create
    cart = session[:cart].detect{|c| c["product_id"] == params[:product_id]}
    if cart.nil?
      session[:cart].push cart_sessions
    else
      cart["quantity"] = cart["quantity"].to_i + Settings.minimum_quantily
    end
    respond_to do |format|
      format.js
    end
  end

  def index
    @carts = session[:cart]
    @user = User.new
  end

  def update
    cart = session[:cart].detect{|c| c["product_id"] == params[:id]}
    if cart.nil?
      error_msg = t "find_error"
      render json: error_msg
    else
      if cart.update cart_params_update
        mess = t "update_success"
        render json: {cart: cart}
      else
        error_msg = t "update_fail"
        render json: error_msg
      end
    end
  end

  def destroy
    cart = session[:cart].detect{|c| c["product_id"] == params[:id]}
    if cart.nil?
      flash.now[:danger] = t "find_error"
    else
      if session[:cart].delete cart
        flash[:success] = t "delete_success"
      else
        flash.now[:danger] = t "delete_fail"
      end
    end
    redirect_to carts_path
  end

  private

  def cart_sessions
    params.permit :product_id, :product_name, :product_image,
      :note, :quantity, :price
  end

  def cart_params_update
    params.require(:cart).permit :quantity, :note
  end
end
