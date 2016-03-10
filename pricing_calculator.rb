class PricingCalculator
  FLAT_MARKUP       = 0.05
  PER_WORKER_MARKUP = 0.012

  def price(base_price, workers: 0)
    price = apply_base_markup(base_price)
    price = apply_worker_markup(price, workers)
    currency(price)
  end

  private

  def apply_base_markup(price)
    apply_markup(price, FLAT_MARKUP)
  end

  def apply_worker_markup(price, workers)
    fail InvalidWorkersError unless workers.is_a?(Integer) && workers >= 0
    apply_markup(price, workers * PER_WORKER_MARKUP)
  end

  def apply_markup(price, markup)
    price * (1 + markup)
  end

  def currency(price)
    price.round(2)
  end
end

class InvalidWorkersError < StandardError
end
