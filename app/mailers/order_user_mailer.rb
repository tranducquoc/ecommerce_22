class OrderUserMailer < ApplicationMailer
  default from: "noreply@example.com"

  def order_to_user user, carts, order
    @carts = carts
    @user = user
    @order = order
    mail to: user.email, subject: "Your order..."
  end
end
