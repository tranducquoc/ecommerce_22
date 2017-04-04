class OrderLib
  class << self
    def total_money_after_discount order
      total_money(order) - calculate_discount(order)
    end

    def calculate_discount order
      order.discount * total_money(order) / 100
    end

    def calculate_product order_detail
      order_detail.price * order_detail.quantity
    end

    def total_money order
      order_details = order.order_details
      total_money = 0
      order_details.each do |o|
        total_money += o.price*o.quantity
      end
      return total_money
    end
  end
end
