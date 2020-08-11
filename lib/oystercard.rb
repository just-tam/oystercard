class Oystercard

  attr_reader :balance
  attr_accessor :in_journey


  MAX_BALANCE = 90
  MIN_BALANCE = 1

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    fail "The maximum limit is £90" if @balance + amount > MAX_BALANCE
    @balance += amount
  end

  def touch_in
    fail "You need to top up" if @balance < MIN_BALANCE
    @in_journey = true
  end

  def touch_out
  	deduct(MIN_BALANCE)
    @in_journey = false
  end


  private

  def deduct(amount)
    @balance -= amount
  end


end
