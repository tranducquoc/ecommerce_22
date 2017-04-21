# Preview all emails at http://localhost:3000/rails/mailers/order_user_mailer
class OrderUserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/order_user_mailer/order_to_user
  def order_to_user
    OrderUserMailer.order_to_user(User.first, Cart.all, Order.first)
  end
end
