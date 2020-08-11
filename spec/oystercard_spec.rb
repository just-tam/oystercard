require 'Oystercard'

describe Oystercard do

  it "Expect oystercard to respond to balance method" do
    expect(subject).to respond_to(:balance)
  end

  it "Expects balance to be zero" do
    oystercard = Oystercard.new
    expect(oystercard.balance).to eq (0)
  end

  it "Expect oystercard to respond to top_up method" do
    expect(subject).to respond_to(:top_up)
  end

  it "Expect oystercard to respond to top_up method with an amount" do
    expect(subject).to respond_to(:top_up).with(1).argument
  end

  describe "#top_up" do
    it "Expects balance to increase by top up amount" do
      balance = subject.balance
      amount = 10
      expect{ subject.top_up amount }.to change{ subject.balance }.by 10
    end
  end
end
