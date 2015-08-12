describe Plaid::PlaidError do
  describe "#new" do
    it "allows code, message and resolution" do
      error = Plaid::PlaidError.new 1, "testing", "fix it"
      expect(error.code).to eq(1)
      expect(error.message).to eq("testing")
      expect(error.resolve).to eq("fix it")
    end
  end
end
