require_relative 'express_promotion'
require_relative 'spend_promotion'


class Promotion

  DISCOUNT = 10
  STANDARD = 10
  EXPRESS = 20

  attr_reader :customers, :order_value

  def initialize(order_hash)
    @order_hash = order_hash
    @express_promotion = ExpressPromotion.new
    @spend_promotion = SpendPromotion.new
  end

  def order
    standard_order = @order_hash[:Standard]
    express_order = @order_hash[:Express]
    value(standard_order, express_order)
  end

  def discount
    express_discount
    spend_discount
  end

private

  def value(standard_order, express_order)
    @order_value = (STANDARD * standard_order) + (EXPRESS * express_order)
  end

  def express_discount
    @order_value -= @express_promotion.value(@order_hash[:Express])
  end

  def spend_discount
    @order_value -= @spend_promotion.value(@order_value)
  end

end
