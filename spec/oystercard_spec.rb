require 'oystercard'

describe Oystercard do

  describe "initialization" do
    it "has a balance of 0 by default" do
      expect(subject.balance).to eq(0)
    end
  end

  describe ".top_up" do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it "adds the amount to the balance" do
      expect{subject.top_up(10)}.to change{ subject.balance }.by 10
    end    
  end

end
