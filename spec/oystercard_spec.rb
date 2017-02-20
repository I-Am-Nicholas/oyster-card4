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

  describe ".deduct" do
    it "deducts the fare from the balance" do
      oystercard.top_up(20)
      expect{oystercard.deduct(10)}.to change{ oystercard.balance }.by -10
    end

  end

end
