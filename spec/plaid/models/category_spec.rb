describe Plaid::Category do
  context 'when a single category is found' do
    let(:category) { Plaid.category('17001013') }
    it { expect(category).to be_kind_of(Plaid::Category) }
  end

  context 'when all categories are found' do
    let(:category) { Plaid.category }
    it { expect(category).to be_kind_of(Array)}
  end

  context 'when category is not found' do
    it { expect { Plaid.category('dumb_cat') }.to raise_error(Plaid::NotFound, 'unable to find category') }
  end

end
