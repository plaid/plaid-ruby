require "spec_helper.rb"

describe Plaidio, "#get" do
  it "returns The getting is good" do
    Plaidio.get.should eq("The getting is good")
  end
end