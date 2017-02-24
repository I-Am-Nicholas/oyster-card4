class JourneyLog

  attr_reader :journey

  def initialize
    @journey = Journey.new(nil)
  end

  def start(entry_station)
    @journey = Journey.new(entry_station)
  end

  def finish(exit_station)
    @journey.end_journey(exit_station)
  end




private

  def current_journey
    if !!@journey.exit_station && !!@journey.entry_station
      @journey = Journey.new('nil')
    else
      journey
    end
  end

end
