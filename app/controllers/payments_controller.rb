class PaymentsController < ApplicationController
  before_action :check_loged, only: [:index, :update]

  def index
    @carts = session[:cart]
    @order = Order.new
  end

  def update
    text = params[:payment][:text]
    voicher = Voicher.find_by name: text.upcase
    if voicher
      render json: {voicher: voicher}
    else
      mess = t "voicher_not_exist"
      render json: mess
    end
  end

  private
  def check_loged
    if !current_user.present?
      redirect_to error1_path
    else
      if session[:cart].size == 0
      flash[:danger] = t "your_cart_is_empty"
      redirect_to :back
      end
    end
  end
end
