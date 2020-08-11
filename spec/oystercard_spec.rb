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
      amount = 10
      expect{ subject.top_up amount }.to change{ subject.balance }.by 10
    end

    it "Expects error if balance exceeds £90" do
      amount = 100
      expect{ subject.top_up amount }.to raise_error "The maximum limit is £90"
    end
  end

  describe "#deduct" do
    it "Expext balance to decrease by deduct amount" do
      amount = 10
      expect{ subject.deduct amount }.to change{ subject.balance }.by -10
    end
  end

  describe '#touch_in' do

    context 'card has been touched in with valid balance' do
      before do
        subject.top_up(Oystercard::MAX_BALANCE)
          it 'change status of oystercard in_journey? = true' do
          expect{ subject.touch_in }.to change{ subject.in_journey }.to true
        end
      end
    end
  end

  describe '#touch_out' do
    it 'change status of oystercard in_journey? = false' do
      subject.touch_in
      expect{ subject.touch_out }.to change{ subject.in_journey }.to false
    end 

  end

  describe '#in_journey' do
    it "Expect in_journey to equal to false" do
    expect(subject.in_journey).to eq false
    end

  end


end
