class Oystercard

  LIMIT = 90
  MINIMUM_BALANCE = 1
  attr_reader :balance

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    fail "Balance limit of £#{LIMIT} reached" if (@balance + amount) > LIMIT
    @balance += amount
  end

  def deduct(fare)
    @balance -= fare
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    fail "Insufficient balance" if @balance < MINIMUM_BALANCE
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

end
