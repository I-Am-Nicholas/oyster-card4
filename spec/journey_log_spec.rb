require 'journey_log'
require 'journey'
describe JourneyLog do
  it 'starts a new journey' do
    subject.start('Aldgate')
    expect(subject.journey.entry_station).to eq "Aldgate"
  end

  it 'finishes a new journey' do
    subject.finish('Charing Cross')
    expect(subject.journey.exit_station).to eq "Charing Cross"
  end

  xit 'returns a list of all previous journeys' do
    expect(subject.journeys).to eq()

  end

=begin
  it 'returns an incomplete journey when touching in' do
    subject.start('Bank')
    expect(subject.current_journey).to eq subject.journey
  end

  it 'returns an incomplete journey when touching out' do
    subject.finish('Piccadilly')
    expect(subject.current_journey).to eq subject.journey
  end

  it 'creates a new journey' do
    subject.start('Aldwych')
    subject.finish('Seven Sisters')
    subject.current_journey
    expect(subject.journey.entry_station).to eq 'nil'
  end
=end
end
