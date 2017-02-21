require 'station'

describe Station do

  subject(:station) {described_class.new}

  # before :each do
  #   allow(:station).to receive(:zone).and_return(1)
  # end

  # describe "initialization" do
  #   it "gets the correct zone when given a name" do
  #     expect(station).to eq(1)
  #   end
  #
  # end

  it { is_expected.to respond_to(grab_zone).with(1).argument}



end
