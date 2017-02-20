require 'oystercard'

describe Oystercard do

  describe "initialization" do
    it "has a balance of 0 by default" do
      expect(subject.balance).to eq(0)
    end
  end

end
