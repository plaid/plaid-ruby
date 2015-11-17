describe Plaid::Institution do
  context 'when a single institution is found' do
    let(:institution) { Plaid.institution('5301a93ac140de84910000e0') }

    it { expect(institution).to be_kind_of(Plaid::Institution) }
    it { expect(institution.mfa).to be_kind_of(Array) }
    it { expect(institution.products).to be_kind_of(Array) }
    it { expect(institution.credentials).to be_kind_of(Hash) }
  end

  context 'when all institutions are found' do
    let(:institution) { Plaid.institution }
    it { expect(institution).to be_kind_of(Array) }
  end

  context 'when institution is not found' do
    it { expect { Plaid.institution('dumb_bank') }.to raise_error(Plaid::NotFound, 'unable to find institution') }
  end
end
