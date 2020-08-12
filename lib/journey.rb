class Journey
  MINIMUM_FARE = 1
  PENALTY_FARE = 6
  attr_reader :entry_station, :journey_history

  def initialize
    @entry_station
    @journey_history = []
  end

  def start_trip(station)
    @entry_station = station
    @journey_history << {:entry_station => @entry_station, :exit_station => nil}
  end

  def end_trip(station)
    @entry_station = nil
    @journey_history[-1][:exit_station] = station
  end

  def fare 
    if @journey_history[-1][:exit_station] == nil
      return PENALTY_FARE
    end
    MINIMUM_FARE
  end

  def in_journey?
    !!entry_station
  end

end