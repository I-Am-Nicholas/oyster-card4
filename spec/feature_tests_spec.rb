# require 'journey'
# require 'station'
# require 'oystercard'
#
# describe "Feature tests"
#
# it "calculates the normal fare as the minimum fare" do
#   card = Oystercard.new
#   journey = Journey.new
#   card.top_up(10)
#   card.touch_in('bank')
#   card.touch_out('kilburn')
#   expect(journey.calculate_fare).to eq(Oystercard::MINIMUM_FARE)
# end
