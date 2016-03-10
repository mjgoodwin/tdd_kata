require_relative '../pricing_calculator'

describe PricingCalculator do
  subject(:calculator) { PricingCalculator.new }

  it "includes a flat 5% markup" do
    expect(subject.price(1299.99)).to be(1364.99)
  end

  it "includes no markup for zero workers" do
    expect(subject.price(12456.95, workers: 0)).to be(13079.80)
  end

  it "includes a 1.2% markup for each worker" do
    expect(subject.price(12456.95, workers: 4)).to be(13707.63)
  end

  it "raises error on invalid worker input" do
    expect{subject.price(12456.95, workers: -4)}.to raise_error(InvalidWorkersError)
  end
end
