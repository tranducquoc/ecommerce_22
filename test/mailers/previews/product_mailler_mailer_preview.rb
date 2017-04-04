# Preview all emails at http://localhost:3000/rails/mailers/product_mailler_mailer
class ProductMaillerMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/product_mailler_mailer/regiter_product
  def regiter_product
    ProductMaillerMailer.regiter_product(User.first, Product.first)
  end

end
