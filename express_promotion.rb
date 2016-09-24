class ExpressPromotion
  VALID = 2

  def value(express_order_quantity)
    express_order_quantity >= VALID ? 15 : 0
  end

end
