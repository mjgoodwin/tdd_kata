class PricingCalculator
  FLAT_MARKUP = 0.05

  def price(base_price)
    price = apply_markup(base_price, FLAT_MARKUP)
    currency(price)
  end

  private

  def apply_markup(price, markup)
    price * (1 + markup)
  end

  def currency(price)
    price.round(2)
  end
end
