require 'zones'

class DummyZoneChecker
end

describe 'Zones' do
  before :each do
    @zone_checker = DummyZoneChecker.new
    @zone_checker.extend(Zones)
  end

  it "checks the zone against the name" do
    expect(@zone_checker.grab_zone("Euston")).to eq (1)
  end

  it "checks the zone against the name" do
    expect(@zone_checker.grab_zone("Brixton")).to eq (2)
  end

end
