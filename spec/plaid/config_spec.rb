describe 'Plaid.config' do
  around(:each) do |example|
    old_customer_id          = Plaid.customer_id
    old_secret               = Plaid.secret
    old_environment_location = Plaid.environment_location

    Plaid.config do |p|
      p.customer_id          = customer_id
      p.secret               = secret
      p.environment_location = environment_location
    end

    example.run

    Plaid.config do |p|
      p.customer_id          = old_customer_id
      p.secret               = old_secret
      p.environment_location = old_environment_location
    end
  end

  let(:customer_id) { 'test_id' }
  let(:secret)      { 'test_secret' }
  let(:dev_url)  { 'https://tartan.plaid.com/' }
  let(:prod_url) { 'https://api.plaid.com/' }


  let(:user) { Plaid.add_user('connect', 'plaid_test', 'plaid_good', 'wells') }

  context ':environment_location' do
    context 'with trailing slash' do
      let(:environment_location) { 'http://example.org/' }
      it 'leaves it as-is' do
        expect(Plaid.environment_location).to eql(environment_location)
      end
    end

    context 'without trailing slash' do
      let(:environment_location) { 'http://example.org' }
      it 'adds a trailing slash' do
        expect(Plaid.environment_location).to eql(environment_location + '/')
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
