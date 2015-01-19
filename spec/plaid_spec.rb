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
      it { expect(res).to be_instance_of Plaid::User }
    end

    context 'has valid production keys' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_secret'
        p.environment_location = 'https://api.plaid.com/'
      end
      res = Plaid.auth('connect','plaid_test','plaid_good','wells')
      it { expect(res).to be_instance_of Plaid::User }
    end

    context 'has invalid dev keys' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_bad'
        p.environment_location = 'https://tartan.plaid.com/'
      end
      it { expect{Plaid.auth('connect','plaid_bad','plaid_bad','wells')}.to raise_error }
    end

    context 'has invalid production keys' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_bad'
        p.environment_location = 'https://api.plaid.com/'
      end
      it { expect{Plaid.auth('connect','plaid_bad','plaid_bad','wells')}.to raise_error }
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
      it { expect(user.accounts.empty?).to be_falsey }
    end

    context 'has correct credentials for single factor auth, authenticates to the auth path' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_secret'
        p.environment_location = 'https://tartan.plaid.com/'
      end
      user = Plaid.auth('auth','plaid_test','plaid_good','wells')
      it { expect(user.accounts[0].numbers.nil?).to be_falsey }
    end

    context 'has correct username, but incorrect password for single factor auth under auth path' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_secret'
        p.environment_location = 'https://tartan.plaid.com/'
      end
      it { expect{Plaid.auth('auth','plaid_test','plaid_bad','wells')}.to raise_error }
    end

    context 'has incorrect username under auth path' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_secret'
        p.environment_location = 'https://tartan.plaid.com/'
      end
      it { expect{Plaid.auth('auth','plaid_bad','plaid_bad','wells')}.to raise_error }
    end

    context 'has correct username, but incorrect password for single factor auth under connect path' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_secret'
        p.environment_location = 'https://tartan.plaid.com/'
      end
      it { expect{Plaid.auth('connect','plaid_test','plaid_bad','wells')}.to raise_error }
    end

    context 'has incorrect username under connect path' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_secret'
        p.environment_location = 'https://tartan.plaid.com/'
      end
      it { expect{Plaid.auth('connect','plaid_bad','plaid_bad','wells')}.to raise_error }
    end

    context 'has to enter MFA credentials' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_secret'
        p.environment_location = 'https://tartan.plaid.com/'
      end
      user = Plaid.auth('connect','plaid_selections', 'plaid_good','bofa')
      it { expect(user.accounts[0]).to eq 'Requires further authentication' }
    end

    context 'enters correct information with locked account' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_secret'
        p.environment_location = 'https://tartan.plaid.com/'
      end
      user = Plaid.auth('connect','plaid_selections', 'plaid_locked','wells')
      it { expect(user.accounts[0]).to eq 'User account is locked' }
    end
  end

  # Institution specs
  describe '#Institution' do
    context 'when a single institution is found' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_secret'
        p.environment_location = 'https://tartan.plaid.com/'
      end
      institution = Plaid.institution('5301a93ac140de84910000e0')
      it { expect(institution).to be instance_of Plaid::Institution }
    end

    context 'when all institutions are found' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_secret'
        p.environment_location = 'https://tartan.plaid.com/'
      end
      institution = Plaid.institution
      it { expect(institution).to be_kind_of(Array) }
    end

    context 'when institution is not found' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_secret'
        p.environment_location = 'https://tartan.plaid.com/'
      end
      it { expect{ Plaid.institution('dumb_bank') }.to raise_error }
    end
  end

  # Category specs
  describe '#Category' do
    context 'when a single category is found' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_secret'
        p.environment_location = 'https://tartan.plaid.com/'
      end
      category = Plaid.category('17001013')
      it { expect(category).to be instance_of Plaid::Category }
    end

    context 'when all categories are found' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_secret'
        p.environment_location = 'https://tartan.plaid.com/'
      end
      category = Plaid.category
      it { expect(category).to be_kind_of(Array)}
    end

    context 'when category is not found' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_secret'
        p.environment_location = 'https://tartan.plaid.com/'
      end
      it { expect { Plaid.category('dumb_cat') }.to raise_error }
    end

  end
  ########## Plaid instantiated user specs ##########

  describe '#User' do
    # MFA specs - after user is instantiated,
    describe '#mfa_authentication' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_secret'
        p.environment_location = 'https://tartan.plaid.com/'
      end
      mfa_user = Plaid.auth('connect','plaid_selections', 'plaid_good','bofa')

      context 'has to enter another round of MFA credentials' do
        new_user = Plaid.auth('connect','plaid_selections', 'plaid_good','chase')
        new_user.mfa_authentication('again')
        it { expect(mfa_user.accounts[0]).to eq 'Requires further authentication' }
      end

      context 'enters correct credentials for MFA auth and authenticates' do
        mfa_user.mfa_authentication('tomato')
        it { expect(mfa_user.accounts).to be_truthy }
      end

      context 'enters incorrect credentials for MFA auth' do
        it { expect(mfa_user.mfa_authentication('bad')).to raise_error }
      end
    end

    # Auth specs
    describe '#get_auth' do
      auth_user = Plaid.auth('auth','plaid_test','plaid_good','wells')
      connect_user = Plaid.auth('connect','plaid_test','plaid_good','wells')

      context 'has access and returns accounts' do
        it { expect(auth_user.permissions[0]).to eq('auth') }
      end

      context 'does not have access to auth' do
        it{ expect(connect_user.permissions.include? 'auth' ).to be false }
      end
    end

    # Connect specs
    describe '#get_connect' do
      auth_user = Plaid.auth('auth','plaid_test','plaid_good','wells')
      connect_user = Plaid.auth('connect','plaid_test','plaid_good','wells')

      context 'has access and returns accounts' do
        it { expect(connect_user.permissions[0]).to eq('connect') }
      end

      context 'does not have access to auth' do
        it{ expect(auth_user.permissions.include? 'connect' ).to be false }
      end
    end

    # Upgrade specs - either pass or fails
    describe '#upgrade' do
      auth_user = Plaid.auth('auth','plaid_test','plaid_good','wells')
      connect_user = Plaid.auth('connect','plaid_test','plaid_good','wells')

      context 'auth upgrade is successful' do
        connect_user.upgrade
        it { expect(connect_user.get_auth).to be_truthy }
      end

      context 'connect upgrade is successful' do
        auth_user.upgrade
        it { expect(auth_user.get_connect).to be_truthy }
      end
    end

  end
end