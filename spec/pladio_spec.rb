require 'pladio'

describe Pladio, "#get" do
  it "returns The getting is good" do
    Pladio.get.should eq("The getting is good")
  end
end