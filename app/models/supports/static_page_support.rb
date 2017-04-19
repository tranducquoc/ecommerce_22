class Supports::StaticPageSupport
  def top_order_products
    Product.top_order_products
  end

  def top_new_products
    Product.top_new_products
  end
end
