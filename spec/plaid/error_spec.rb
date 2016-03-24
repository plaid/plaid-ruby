describe Plaid::PlaidError do
  describe "#new" do
    it "displays code, message, and resolution when thrown" do
      error = described_class.new(
        1200,
        "invalid credentials",
        "The username or password provided is not correct"
      )

      expect(error.message).to include("1200")
      expect(error.message).to include("invalid credentials")
      expect(error.message).to include("The username or password provided is not correct")
    end
  end
end
