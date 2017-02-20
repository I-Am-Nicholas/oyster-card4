require 'oystercard'

describe Oystercard do

describe "initialization" do
  it "has a balance of 0 by default" do
    expect(Oystercard.new.balance).to eq(0)
  end
end

end
