class Oystercard

  LIMIT = 90
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
    fail "Balance limit of £#{LIMIT} reached" if (@balance + amount) > LIMIT
    @balance += amount
  end

  def deduct(fare)
    @balance -= fare
  end
end
