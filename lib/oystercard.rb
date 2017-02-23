require_relative 'journey'

class Oystercard


  attr_reader :balance, :history, :journey

  def initialize
    @balance = 0
    @history = []
  end

  def in_journey?
    @journey ? true : false
  end

  def touch_in(station)
    fail "Insufficient balance" if @balance < MINIMUM_FARE
    @journey = Journey.new(station)
  end

  def touch_out(station)
    @history << {journey.entry_station => station}
    deduct(MINIMUM_FARE)
    journey.end_journey(station)
    @journey = nil
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

end
