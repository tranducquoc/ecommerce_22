class RatesController < ApplicationController
  def create
    @rate = Rate.find_by product_id: params[:rate][:product_id],
      user_id: current_user.id
    if @rate
      @rate.point = params[:rate][:point]
      if @rate.save
        message = t "rate.update_rate_success"
      else
        message = t "rate.update_rate_fail"
      end
    else
      @rate = Rate.new rate_params
      @rate.user_id = current_user.id
      if @rate.save
        message = t "rate.rate_success"
      else
        message = t "rate.rate_fail"
      end
    end
    respond_to do |format|
      format.json {
        render json: {message: message}
      }
    end
  end

  private

  def rate_params
    params.require(:rate).permit :product_id, :point
  end
end
