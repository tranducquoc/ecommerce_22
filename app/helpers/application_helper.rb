module ApplicationHelper
  def full_title page_title
    base_title = t "litle_websile"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def count_product_of_cart
    session[:cart].size
  end

  def check_status_product product
    case
    when product.selling?
      t "product.status.sell"
    when product.soldout?
      t "product.status.sold"
    when product.prepare?
      t "product.status.prepare"
    else
      t "product.status.stop"
    end
  end
end
