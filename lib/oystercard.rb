class Oystercard

  attr_reader :balance, :history, :journey

  def initialize
    @balance = 0
    @history = []
    @journey = Journey.new(nil)
  end

  def touch_in(entry_station)
    fail "Insufficient balance" if @balance < MINIMUM_FARE
    @journey = Journey.new(entry_station)
  end

  def touch_out(exit_station)
    @journey.end_journey(exit_station)
    @history << @journey
    deduct(journey.calculate_fare)
    @journey = Journey.new(nil)
  end

  def top_up(amount)
    fail "Balance limit of £#{LIMIT} reached" if (@balance + amount) > LIMIT
    @balance += amount
  end

  private

  def deduct(fare)
    @balance -= fare
  end

  LIMIT = 90
  MINIMUM_FARE = 1
  PENALTY_FARE = 6

end
