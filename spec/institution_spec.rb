# Institution specs
describe '#Institution' do

  before :all do
    Plaid.config do |p|
      p.client_id = 'test_id'
      p.secret = 'test_secret'
      p.environment_location = 'https://tartan.plaid.com/'
    end
  end

  context 'when a single institution is found' do
    institution = Plaid.institution('5301a93ac140de84910000e0')
    it { expect(institution.class).to eq(Plaid::Institution) }
  end

  context 'when all institutions are found' do
    institution = Plaid.institution
    it { expect(institution).to be_kind_of(Array) }
  end

  context 'when institution is not found' do
    it { expect { Plaid.institution('dumb_bank') }.to raise_error }
  end
end
