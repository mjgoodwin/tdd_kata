class PricingCalculator
  FLAT_MARKUP       = 0.05
  PER_WORKER_MARKUP = 0.012

  def price(base_price, workers: 0, material: nil)
    price = apply_base_markup(base_price)
    price = apply_processing_markup(price, workers, material)
    currency(price)
  end

  private

  def apply_base_markup(price)
    apply_markup(price, FLAT_MARKUP)
  end

  def apply_processing_markup(price, workers, material)
    total_markup = worker_markup(workers) + material_markup(material)
    apply_markup(price, total_markup)
  end

  def worker_markup(workers)
    fail InvalidWorkersError unless workers.is_a?(Integer) && workers >= 0
    workers * PER_WORKER_MARKUP
  end

  def material_markup(material)
    case material
    when :drugs
      0.075
    when :food
      0.13
    when :electronics
      0.02
    else
      0
    end
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
