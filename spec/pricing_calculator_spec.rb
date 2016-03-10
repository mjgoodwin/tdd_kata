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

  # Example Input 3
  it "includes no markup for books" do
    expect(subject.price(12456.95, workers: 4, material: :books)).to be(13707.63)
  end

  # Example Input 2
  it "includes a 7.5% markup for drugs" do
    expect(subject.price(5432, workers: 1, material: :drugs)).to be(6199.81)
  end

  # Example Input 1
  it "includes a 13% markup for food" do
    expect(subject.price(1299.99, workers: 3, material: :food)).to be(1591.58)
  end

  it "includes a 2% markup for electronics" do
    expect(subject.price(1299.99, workers: 3, material: :electronics)).to be(1441.43)
  end
end
