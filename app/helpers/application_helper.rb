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
end
