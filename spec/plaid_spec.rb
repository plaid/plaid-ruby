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

      res = Plaid.auth('connect', { username: 'plaid_test', password: 'plaid_good', type: 'wells' })
      it { expect(res).to be_instance_of Plaid::User }
    end

    context 'has valid production keys' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_secret'
        p.environment_location = 'https://api.plaid.com/'
      end

      res = Plaid.auth('connect', { username: 'plaid_test', password: 'plaid_good', type: 'wells' })
      it { expect(res).to be_instance_of Plaid::User }
    end

    context 'has invalid dev keys' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_bad'
        p.environment_location = 'https://tartan.plaid.com/'
      end
      it { expect{Plaid.auth('connect', { username: 'plaid_test', password: 'plaid_good', type: 'wells' })}.to raise_error }
    end

    context 'has invalid production keys' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_bad'
        p.environment_location = 'https://api.plaid.com/'
      end

      it { expect{Plaid.auth('connect', { username: 'plaid_test', password: 'plaid_good', type: 'wells' })}.to raise_error }
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

      user = Plaid.auth('connect', { username: 'plaid_test', password: 'plaid_good', type: 'wells' })
      it { expect(user.accounts.empty?).to be_falsey }
    end

    context 'has correct credentials for single factor auth, authenticates to the auth path' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_secret'
        p.environment_location = 'https://tartan.plaid.com/'
      end

      user = Plaid.auth('auth', { username: 'plaid_test', password: 'plaid_good', type: 'wells' })
      it { expect(user.accounts[0].numbers.nil?).to be_falsey }
    end

    context 'has correct username, but incorrect password for single factor auth under auth path' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_secret'
        p.environment_location = 'https://tartan.plaid.com/'
      end
      options = { username: 'plaid_test', password: 'bad', type: 'wells' }
      it { expect{Plaid.auth('auth', options)}.to raise_error }
    end

    context 'has incorrect username under auth path' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_secret'
        p.environment_location = 'https://tartan.plaid.com/'
      end
      options = { username: 'bad', password: 'plaid_good', type: 'wells' }
      it { expect{Plaid.auth('auth', options)}.to raise_error }
    end

    context 'has correct username, but incorrect password for single factor auth under connect path' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_secret'
        p.environment_location = 'https://tartan.plaid.com/'
      end
      options = { username: 'plaid_test', password: 'bad', type: 'wells' }
      it { expect{Plaid.auth('connect', options)}.to raise_error }
    end

    context 'has incorrect username under connect path' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_secret'
        p.environment_location = 'https://tartan.plaid.com/'
      end
      options = { username: 'bad', password: 'plaid_good', type: 'wells' }
      it { expect{Plaid.auth('connect', options)}.to raise_error }
    end

    context 'has to enter MFA credentials' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_secret'
        p.environment_location = 'https://tartan.plaid.com/'
      end

      user = Plaid.auth('connect',{ username: 'plaid_test', password: 'plaid_good', type: 'bofa' })
      it { expect(user.api_res).to eq 201 }
    end

    context 'enters correct information with locked account' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_secret'
        p.environment_location = 'https://tartan.plaid.com/'
      end
      options = { username: 'plaid_test', password: 'plaid_locked', type: 'wells' }
      it { expect{Plaid.auth('connect', options)}.to raise_error }
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
      it { expect(institution.class).to eq(Plaid::Institution) }
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

=begin TODO: Get this test passing
    context 'when institution is not found' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_secret'
        p.environment_location = 'https://tartan.plaid.com/'
      end
      res = Plaid.institution('dumb_bank')
      it { expect(res).to eq('Bank not found') }
    end
=end
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
      it { expect(category.class).to eq (Plaid::Category) }
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

=begin TODO: Get this test passing
    context 'when category is not found' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_secret'
        p.environment_location = 'https://tartan.plaid.com/'
      end
      it { expect { Plaid.category('dumb_cat') }.to raise_error }
    end
=end

  end
  ########## Plaid instantiated user specs ##########

  describe '#User' do
    # MFA specs - after user is instantiated,
    describe '#mfa_authentication' do

      context 'enters correct credentials for MFA auth and authenticates' do
        Plaid.config do |p|
          p.customer_id = 'test_id'
          p.secret = 'test_secret'
          p.environment_location = 'https://tartan.plaid.com/'
        end
  
        new_mfa_user = Plaid.auth('connect',{ username: 'plaid_test', password: 'plaid_good', type: 'bofa' })
        new_mfa_user.mfa_authentication('tomato','bofa')
        it { expect(new_mfa_user.accounts).to be_truthy }
      end

      context 'has to enter another round of MFA credentials' do
        Plaid.config do |p|
          p.customer_id = 'test_id'
          p.secret = 'test_secret'
          p.environment_location = 'https://tartan.plaid.com/'
        end
  
        mfa_again = Plaid.auth('connect',{ username: 'plaid_test', password: 'plaid_good', type: 'bofa' })
        mfa_again.mfa_authentication('again','bofa')
        it { expect(mfa_again.api_res).to eq 201 }
      end

      context 'enters incorrect credentials for MFA auth' do
        Plaid.config do |p|
          p.customer_id = 'test_id'
          p.secret = 'test_secret'
          p.environment_location = 'https://tartan.plaid.com/'
        end
  
        mfa_user = Plaid.auth('connect',{ username: 'plaid_test', password: 'plaid_good', type: 'bofa' })
        mfa_user.mfa_authentication('tomato','bofa')
        mfa_user = Plaid.auth('connect',{ username: 'plaid_test', password: 'plaid_good', type: 'bofa' })
        it { expect { mfa_user.mfa_authentication('bad','bofa') }.to raise_error }
      end
    end

    # Auth specs
    describe '#get_auth' do

      auth_user = Plaid.auth('auth',{ username: 'plaid_test', password: 'plaid_good', type: 'wells' })
      connect_user = Plaid.auth('connect',{ username: 'plaid_test', password: 'plaid_good', type: 'wells' })

      context 'has access and returns accounts' do
        it { expect(auth_user.permissions[0]).to eq('auth') }
      end

      context 'does not have access to auth' do
        it{ expect(connect_user.permissions.include? 'auth' ).to be false }
      end
    end

    # Connect specs
    describe '#get_connect' do
      auth_user = Plaid.auth('auth',{ username: 'plaid_test', password: 'plaid_good', type: 'wells' })
      connect_user = Plaid.auth('connect',{ username: 'plaid_test', password: 'plaid_good', type: 'wells' })

      context 'has access and returns accounts' do
        it { expect(connect_user.permissions[0]).to eq('connect') }
      end

      context 'does not have access to auth' do
        it{ expect(auth_user.permissions.include? 'connect' ).to be false }
      end
    end

    # Upgrade specs - either pass or fails
=begin TODO: Write upgrade methods to pass without paying
    describe '#upgrade' do


      auth_user = Plaid.auth('auth',{ username: 'plaid_test', password: 'plaid_good', type: 'wells' })
      connect_user = Plaid.auth('connect',{ username: 'plaid_test', password: 'plaid_good', type: 'wells' })

      context 'auth upgrade is successful' do
        connect_user.upgrade
        it { expect(connect_user.get_auth).to be_truthy }
      end

      context 'connect upgrade is successful' do
        auth_user.upgrade
        it { expect(auth_user.get_connect).to be_truthy }
      end
    end
=end

  end
end