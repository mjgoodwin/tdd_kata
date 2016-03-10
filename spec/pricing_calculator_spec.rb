require_relative '../pricing_calculator'

describe PricingCalculator do
  subject(:calculator) { PricingCalculator.new }

  it "works" do
    expect(subject.price).to be(1000)
  end
end
