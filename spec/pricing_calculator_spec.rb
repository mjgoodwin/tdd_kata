require_relative '../pricing_calculator'

describe PricingCalculator do
  subject(:calculator) { PricingCalculator.new }

  it "includes a flat 5% markup" do
    expect(subject.price(1299.99)).to be(1364.99)
  end
end
