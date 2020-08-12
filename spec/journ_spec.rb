require "journey"

describe Journey do

  it 'is initially not in a journey' do
    expect(subject).not_to be_in_journey
  end
  
  describe "#start_trip" do 
    it 'change status of oystercard in_journey? = true' do
      subject.start_trip("station")
      expect(subject).to be_in_journey
    end
  end

  describe "#end_trip" do

  it 'change status of oystercard in_journey? = false' do
    subject.start_trip("station")
    subject.end_trip("station")
    expect(subject).not_to be_in_journey
  end
    
  end
  
  describe "#journey_history" do
    it "Expects oystercard to have an empty list of journeys to begin with" do
      expect(subject.journey_history).to eq ([])
    end

    it "Expects that touching in and out will create one journey" do
      subject.start_trip("Angel")
      subject.end_trip("Stockwell")
      expect(subject.journey_history.count).to eq (1)
    end
  end

  describe "#fare" do
    it "charges the minimum fare" do 
      subject.start_trip("Angel")
      subject.end_trip("Stockwell")
      expect(subject.fare).to eq Journey::MINIMUM_FARE
    end

    it "Charges the penalty fare it you don't end the trip" do
      subject.start_trip("Old Street")
      expect(subject.fare).to eq Journey::PENALTY_FARE
    end

  end

end