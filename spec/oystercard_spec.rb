require 'oystercard'

describe Oystercard do
  subject(:oystercard) { described_class.new}
  let(:euston) {double(:station)}
  let(:exit_station) {double(:station)}
  let(:journey) {double(:journey)}

  describe "initialization" do
    it "has a balance of 0 by default" do
      expect(oystercard.balance).to eq(0)
    end

    it "expects journey history to be empty by default" do
      expect(oystercard.history).to eq([])
    end
  end

  describe ".top_up" do
    it "adds the amount to the balance" do
      expect{top_up}.to change{ oystercard.balance }.by 10
    end

    it "will not top up over maximum balance of £#{Oystercard::LIMIT}" do
      expect{10.times{top_up}}.to raise_error "Balance limit of £#{Oystercard::LIMIT} reached"
    end
  end

  # describe ".in_journey?" do
  #   it "checks if oystercard in journey" do
  #     expect(oystercard.in_journey?).to eq false
  #   end
  # end

  describe "using card" do
    before :each do
      top_up
      oystercard.touch_in(euston)
    end

    describe "reports history" do
      it "shows that history saves exit station" do
        oystercard.touch_in('old street')
        oystercard.touch_out('Holborn')
        expect(oystercard.history[-1].exit_station).to eq('Holborn')
      end
      it "shows that history saves exit station" do
        oystercard.touch_in('old street')
        oystercard.touch_out('Holborn')
        expect(oystercard.history[-1].entry_station).to eq('old street')
      end
    end
    # describe ".touch_in" do
    #   it "changes status to in journey" do
    #     expect(oystercard).to be_in_journey
    #   end
    #
    # end

    describe ".touch_out" do
      # it "changes status to not in journey" do
      #   oystercard.touch_out(exit_station)
      #   expect(oystercard).to_not be_in_journey
      # end

      it "deducts minimum fare" do
        expect{oystercard.touch_out(exit_station)}.to change{ oystercard.balance }.by -Oystercard::MINIMUM_FARE
      end

    end
  end

    context "balance too low" do
      it "raises an error if balance is less than £#{Oystercard::MINIMUM_FARE} when touching in" do
        expect{oystercard.touch_in(euston)}.to raise_error "Insufficient balance"
      end
    end
end

def top_up
  oystercard.top_up(10)
end
