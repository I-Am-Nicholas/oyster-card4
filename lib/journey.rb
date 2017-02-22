class Journey

  attr_reader :entry_station, :exit_station


  def initialize(station)
    @entry_station = station
    @exit_station = nil
  end

  def complete?
    @exit_station ? true : false
  end

  def end_journey(station)
    @exit_station = station
  end


end
