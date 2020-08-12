class Oystercard

  attr_reader :balance
  attr_reader :entry_station
  attr_reader :journeys


  MAX_BALANCE = 90
  MIN_BALANCE = 1

  def initialize
    @balance = 0
    @entry_station = nil
    @journeys = []
  end

  def top_up(amount)
    fail "The maximum limit is £90" if @balance + amount > MAX_BALANCE
    @balance += amount
  end

  def touch_in(station)
    fail "You need to top up" if @balance < MIN_BALANCE
    @entry_station = station

  end

  def touch_out(station)
  	deduct(MIN_BALANCE)
    @entry_station = nil
    @journeys << { :entry => @entry_station, :exit => station }
  end

 
  private

  def deduct(amount)
    @balance -= amount
  end


end
