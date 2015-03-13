require 'spec_helper.rb'
# Category specs
describe '#Category' do

  before :all do
    Plaid.config do |p|
      p.client_id = 'test_id'
      p.secret = 'test_secret'
      p.environment_location = 'https://tartan.plaid.com/'
    end
  end

  context 'when a single category is found' do
    category = Plaid.category('17001013')
    it { expect(category.class).to eq (Plaid::Category) }
  end

  context 'when all categories are found' do
    category = Plaid.category
    it { expect(category).to be_kind_of(Array)}
  end

  context 'when category is not found' do
    it { expect { Plaid.category('dumb_cat') }.to raise_error }
  end

end
