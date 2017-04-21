class NotificationEmailsController < ApplicationController

  def create
    noti = NotificationEmail.find_by user_id: params[:notification_email][:user_id],
    product_id: params[:notification_email][:product_id]
    if noti
      if noti.is_sended?
        @noti = NotificationEmail.new noti_params
        if @noti.save
          message = t "email_noti_success"
        else
          message = t "email_noti_fail"
        end
      else
        message = t "email_noti_indifferent"
      end
    else
      @noti = NotificationEmail.new noti_params
      if @noti.save
        message = t "email_noti_success"
      else
        message = t "email_noti_fail"
      end
    end
    respond_to do |format|
      format.json {
        render json: {message: message}
      }
    end
  end

  private

  def noti_params
    params.require(:notification_email).permit :user_id, :product_id
  end
end
