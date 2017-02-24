require 'journey'
require 'station'
require 'oystercard'

describe Journey do
  let(:shoreditch) {double(:station)}
  let(:angel) {double(:station)}
  let(:oyster) {double(:oystercard)}
  subject(:journey) {described_class.new(shoreditch)}
  card = Oystercard.new
  card.top_up(20)

  describe 'initialization' do
    it "is initialized with complete = false by default " do
      expect(journey.complete?).to eq false
    end
  end

  it "records journey as complete when ending a journey" do
    journey.end_journey(angel)
    expect(journey.complete?).to eq true
  end

  it 'saves the entry station on touch_in', :entry => true do
    expect(journey.entry_station).to eq shoreditch
  end

  it "remembers the entry station" do
    card.touch_in('bank')
    expect(card.journey.entry_station).to eq('bank')
  end

  it "remembers the exit station" do
    card.touch_in('bank')
    card.touch_out('kilburn')
    expect(card.history[-1].exit_station).to eq('kilburn')
  end

  it "calculates the deduction of the penalty fare if no touch out" do
    card.touch_in('bank')
    card.touch_in('bank')
    expect(card.journey.calculate_fare).to eq(Oystercard::PENALTY_FARE)
  end

  it "calculates the deduction of the penalty fare if no touch in", :error do
    card.touch_out('kilburn')
    card.touch_out('kilburn')
    expect(card.journey.calculate_fare).to eq(Oystercard::PENALTY_FARE)
  end

  it "calculates the normal fare as the minimum fare" do
    card.touch_in('bank')
    card.touch_out('kilburn')
    expect(card.history[-1].calculate_fare).to eq(Oystercard::MINIMUM_FARE)
  end

  it "calculates the penalty fare when no touch out" do
    card.touch_in('kilburn')
    expect(card.journey.calculate_fare).to eq(Oystercard::PENALTY_FARE)
  end

  it "calculates the penalty fare when no touch in" do
    card.touch_out('bank')
    expect(card.journey.calculate_fare).to eq(Oystercard::PENALTY_FARE)
  end

    it "calculates penalty if touching out without touching in" do
      card.touch_in('Whitechapel')
      card.touch_out('Aldgate')
      card.touch_out('Aldgate')
      expect(card.journey.calculate_fare).to eq(Oystercard::PENALTY_FARE)
    end
end
