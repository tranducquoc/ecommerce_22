module ProductsHelper
  def load_rate product
    product.rates.count > 0 ? (product.rates.sum(:point)/product.rates.count) : 0
  end

  def your_rate rate
    rate.nil? ? 0 : rate.point
  end
end
