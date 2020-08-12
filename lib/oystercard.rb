require_relative 'journey'

class Oystercard

  attr_reader :balance

  MAX_BALANCE = 90
  MIN_BALANCE = 1

  def initialize
    @balance = 0
    @journey = Journey.new
  end

  def top_up(amount)
    fail "The maximum limit is £90" if @balance + amount > MAX_BALANCE
    @balance += amount
  end

  def touch_in(station)
    fail "You need to top up" if @balance < MIN_BALANCE
    @journey.start_trip(station)
  end

  def touch_out(station)
  	deduct(@journey.fare)
    @journey.end_trip(station)
  end


  private

  def deduct(amount)
    @balance -= amount
  end

end
