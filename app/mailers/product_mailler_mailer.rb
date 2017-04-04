class ProductMaillerMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.product_mailler_mailer.regiter_product.subject
  #
  def regiter_product user, product
    @user = user
    @product = product
    mail to: user.email, subject: "Product returned..."
  end
end
