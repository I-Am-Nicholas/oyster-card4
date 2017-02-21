class Oystercard

  LIMIT = 90
  MINIMUM_FARE = 1
  attr_reader :balance, :entry_station

  def initialize
    @balance = 0
  end

  def in_journey?
    entry_station != nil
  end

  def touch_in(station)
    fail "Insufficient balance" if @balance < MINIMUM_FARE
    @entry_station = station
  end

  def touch_out
    @entry_station = nil
    deduct(MINIMUM_FARE)
  end

  def top_up(amount)
    fail "Balance limit of £#{LIMIT} reached" if (@balance + amount) > LIMIT
    @balance += amount
  end

  private

  def deduct(fare)
    @balance -= fare
  end

end
