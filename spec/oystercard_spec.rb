require 'oystercard'

describe Oystercard do
  subject(:oystercard) { described_class.new}

  describe "initialization" do
    it "has a balance of 0 by default" do
      expect(oystercard.balance).to eq(0)
    end
  end

  describe ".top_up" do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it "adds the amount to the balance" do
      expect{oystercard.top_up(10)}.to change{ oystercard.balance }.by 10
    end

    it "will not top up over maximum balance of £#{Oystercard::LIMIT}" do
      expect{oystercard.top_up(91)}.to raise_error "Balance limit of £#{Oystercard::LIMIT} reached"
    end
  end

  describe ".in_journey?" do
    it "checks if oystercard in journey" do
      expect(oystercard.in_journey?).to eq false
    end
  end

  describe "touching in and out" do
    before :each do
      oystercard.top_up(10)
      oystercard.touch_in
    end

    describe ".touch_in" do
      it "changes status to in journey" do
        expect(oystercard).to be_in_journey
      end
    end

    describe ".touch_out" do
      it "changes status to not in journey" do
        oystercard.touch_out
        expect(oystercard).to_not be_in_journey
      end

      it "deducts minimum fare" do
        expect{oystercard.touch_out}.to change{ oystercard.balance }.by -Oystercard::MINIMUM_FARE
      end
    end
  end

    context "balance too low" do
      it "raises an error if balance is less than £#{Oystercard::MINIMUM_FARE} when touching in" do
        expect{oystercard.touch_in}.to raise_error "Insufficient balance"
      end
    end

end
