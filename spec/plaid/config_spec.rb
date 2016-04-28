describe 'Plaid.config' do
  let(:customer_id) { 'test_id' }
  let(:secret)      { 'test_secret' }
  let(:dev_url)     { 'https://tartan.plaid.com/' }
  let(:prod_url)    { 'https://api.plaid.com/' }
  let(:client)      {
    Plaid.config do |c|
      c.customer_id = customer_id
      c.secret = secret
      c.environment_location = environment_location
    end
  }

  let(:user) { client.add_user('connect', 'plaid_test', 'plaid_good', 'wells') }

  context ':environment_location' do
    context 'with trailing slash' do
      let(:environment_location) { 'http://example.org/' }
      it 'leaves it as-is' do
        expect(client.connection.environment_location).to eql(environment_location)
      end
    end

    context 'without trailing slash' do
      let(:environment_location) { 'http://example.org' }
      it 'adds a trailing slash' do
        expect(client.connection.environment_location).to eql(environment_location + '/')
      end
    end
  end

  context 'has valid dev keys' do
    let(:environment_location) { dev_url }
    it { expect(user).to be_instance_of Plaid::User }
  end

  context 'has valid production keys' do
    let(:environment_location) { prod_url }
    it { expect(user).to be_instance_of Plaid::User }
  end

  context 'has invalid dev keys' do
    let(:secret) { 'test_bad' }
    let(:environment_location) { dev_url }
    it { expect { user }.to raise_error(Plaid::Unauthorized, 'secret or client_id invalid') }
  end

  context 'has invalid production keys' do
    let(:secret) { 'test_bad' }
    let(:environment_location) { prod_url }
    it { expect { user }.to raise_error(Plaid::Unauthorized, 'secret or client_id invalid') }
  end
end
