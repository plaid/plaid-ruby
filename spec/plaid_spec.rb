require 'spec_helper.rb'
########## Plaid specs ##########
describe Plaid do
  # Configuration specs - used in gem configuration
  describe '.config' do
    context 'has valid dev keys' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_secret'
        p.environment_location = 'https://tartan.plaid.com/'
      end
      res = Plaid.auth('connect','plaid_test','plaid_good','wells')
      it { expect(res).to be instance_of Plaid::User }
    end

    context 'has valid production keys' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_secret'
        p.environment_location = 'https://api.plaid.com/'
      end
      #TODO: Test production level credentials
      res = Plaid.auth('connect','plaid_test','plaid_good','wells')
      it { expect(res).to raise_error }
    end

    context 'has invalid dev keys' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_bad'
        p.environment_location = 'https://tartan.plaid.com/'
      end
      it { expect(Plaid.auth('connect','plaid_test','plaid_good','wells')).to raise_error }
    end

    context 'has invalid production keys' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_bad'
        p.environment_location = 'https://api.plaid.com/'
      end
      it { expect(Plaid.auth('connect','plaid_test','plaid_good','wells')).to raise_error }
    end
  end

  # Authentication flow specs - returns Plaid::User
  # TODO: Abstract the config from each section with the result in passing tests
  describe '.auth' do

    context 'has correct credentials for single factor auth, authenticates to the connect path' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_secret'
        p.environment_location = 'https://tartan.plaid.com/'
      end
      user = Plaid.auth('connect','plaid_test','plaid_good','wells')
      it { expect(user.accounts.blank?).to be_false }
    end

    context 'has correct credentials for single factor auth, authenticates to the auth path' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_secret'
        p.environment_location = 'https://tartan.plaid.com/'
      end
      user = Plaid.auth('auth','plaid_test','plaid_good','wells')
      it { expect(user.accounts[0].numbers.nil?).to be_false }
    end

    context 'has correct username, but incorrect password for single factor auth under auth path' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_secret'
        p.environment_location = 'https://tartan.plaid.com/'
      end
      it { expect(Plaid.auth('auth','plaid_test','plaid_bad','wells')).to raise_error }
    end

    context 'has incorrect username under auth path' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_secret'
        p.environment_location = 'https://tartan.plaid.com/'
      end
      it { expect(Plaid.auth('auth','plaid_bad','plaid_bad','wells')).to raise_error }
    end

    context 'has correct username, but incorrect password for single factor auth under connect path' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_secret'
        p.environment_location = 'https://tartan.plaid.com/'
      end
      it { expect(Plaid.auth('connect','plaid_test','plaid_bad','wells')).to raise_error }
    end

    context 'has incorrect username under connect path' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_secret'
        p.environment_location = 'https://tartan.plaid.com/'
      end
      it { expect(Plaid.auth('connect','plaid_bad','plaid_bad','wells')).to raise_error }
    end

    context 'has to enter MFA credentials' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_secret'
        p.environment_location = 'https://tartan.plaid.com/'
      end
      user = Plaid.auth('connect','plaid_selections', 'plaid_good','wells')
      it { expect(user.accounts).to eq 'Requires further authentication' }
    end

    context 'enters correct information with locked account' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_secret'
        p.environment_location = 'https://tartan.plaid.com/'
      end
      user = Plaid.auth('connect','plaid_selections', 'plaid_locked','wells')
      it { expect(user.accounts).to eq 'User account is locked' }
    end
  end

=begin
  TODO: Finish up these tests
  # Institution specs
  describe Plaid::Institution do

    context 'when institution is found' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_secret'
        p.environment_location = 'https://tartan.plaid.com/'
      end
      institution = Plaid.institution('amex')
      it { expect(institution).to be instance_of Plaid::Institution }
    end

    context 'when institution is not found' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_secret'
        p.environment_location = 'https://tartan.plaid.com/'
      end
      it { expect(Plaid.institution('dumb_bank')).to raise_error }
    end
  end

  # Category specs
  describe Plaid::Category do

    context 'when category is found' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_secret'
        p.environment_location = 'https://tartan.plaid.com/'
      end
      category = Plaid.category('17001013')
      it { expect(category).to be instance_of Plaid::Category }
    end

    context 'when category is not found' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_secret'
        p.environment_location = 'https://tartan.plaid.com/'
      end
      it { expect(Plaid.category('dumb_cat')).to raise_error }
    end

  end
end

########## Plaid instantiated user specs ##########

describe Plaid::User do
  subject(:success_user) { Plaid.auth('connect','plaid_test','plaid_good','wells') }
  subject(:mfa_user) { Plaid.auth('connect','plaid_selections', 'plaid_good','wells') }

  # MFA specs - after user is instantiated,
  describe '#mfa_authentication' do
    context 'has to enter another round of MFA credentials' do
      res = user.mfa_authenticaiton('again')
      expect(res).to eq 'Another round requested'
    end

    context 'enters correct credentials for MFA auth and authenticates' do
      user.mfa_authentication('tomato')
      expect(user.accounts).to be_truthy
    end

    context 'enters incorrect credentials for MFA auth' do
      res = user.mfa_authentication('bad')
      expect(res).to eq 'Incorrect answer to MFA'
    end
  end

  # Upgrade specs - either pass or fails
  describe '#upgrade' do
    context 'auth upgrade is successful' do
      user.upgrade('auth')
      expect(user.auth).to be true
    end

    context 'auth upgrade failed' do
      user.upgrade('auth')
      expect(user.auth).to be false
    end

    context 'connect upgrade is successful' do
      user.upgrade('connect')
      expect(user.auth).to be true
    end

    context 'connect upgrade failed' do
      user.upgrade('connect')
      expect(user.auth).to be false
    end
  end

  # Auth specs
  describe '#auth' do
    context 'has access and returns accounts' do
      auth = user.auth
      expect(auth).to be true
      expect(user.accounts).to be_truthy
    end

    context 'does not have access to auth' do
      auth = user.auth
      expect(auth).to be false
    end
  end

  # Connect specs
  describe '#connect' do
    context 'has access and returns accounts' do
      expect(user.connect).to be true
      expect(user.transactions).to be_truthy
    end

    context 'does not have access to auth' do
      expect(user.connect).to be false
    end
  end

=end

end