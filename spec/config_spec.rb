# Configuration specs - used in gem configuration
describe '.config' do
  context 'has valid dev keys' do
    Plaid.config do |p|
      p.client_id = 'test_id'
      p.secret = 'test_secret'
      p.environment_location = 'https://tartan.plaid.com/'
    end
    res = Plaid.add_user('connect','plaid_test','plaid_good','wells')
    it { expect(res).to be_instance_of Plaid::User }
  end

  context 'has valid production keys' do
    Plaid.config do |p|
      p.client_id = 'test_id'
      p.secret = 'test_secret'
      p.environment_location = 'https://api.plaid.com/'
    end
    res = Plaid.add_user('connect','plaid_test','plaid_good','wells')
    it { expect(res).to be_instance_of Plaid::User }
  end

  context 'has invalid dev keys' do
    Plaid.config do |p|
      p.client_id = 'test_id'
      p.secret = 'test_bad'
      p.environment_location = 'https://tartan.plaid.com/'
    end
    it { expect{Plaid.add_user('connect','plaid_bad','plaid_bad','wells')}.to raise_error }
  end

  context 'has invalid production keys' do
    Plaid.config do |p|
      p.client_id = 'test_id'
      p.secret = 'test_bad'
      p.environment_location = 'https://api.plaid.com/'
    end
    it { expect{Plaid.add_user('connect','plaid_bad','plaid_bad','wells')}.to raise_error }
  end
end
