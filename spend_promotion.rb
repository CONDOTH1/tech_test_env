class SpendPromotion
  VALID = 30
  DISCOUNT = 10.0
  HUNDRED = 100


  def value(order_value)
    discount = order_value >= VALID ? DISCOUNT : 0
    discount = (discount/HUNDRED) * order_value
    discount
  end

end
