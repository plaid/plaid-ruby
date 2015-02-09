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
      res = Plaid.add_user('connect','plaid_test','plaid_good','wells')
      it { expect(res).to be_instance_of Plaid::User }
    end

    context 'has valid production keys' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_secret'
        p.environment_location = 'https://api.plaid.com/'
      end
      res = Plaid.add_user('connect','plaid_test','plaid_good','wells')
      it { expect(res).to be_instance_of Plaid::User }
    end

    context 'has invalid dev keys' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_bad'
        p.environment_location = 'https://tartan.plaid.com/'
      end
      it { expect{Plaid.add_user('connect','plaid_bad','plaid_bad','wells')}.to raise_error }
    end

    context 'has invalid production keys' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_bad'
        p.environment_location = 'https://api.plaid.com/'
      end
      it { expect{Plaid.add_user('connect','plaid_bad','plaid_bad','wells')}.to raise_error }
    end
  end

  # Authentication flow specs - returns Plaid::User
  # TODO: Abstract the config from each section with the result in passing tests
  describe '.add_user' do

    context 'has correct credentials for single factor auth, authenticates to the connect level of api access' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_secret'
        p.environment_location = 'https://tartan.plaid.com/'
      end
      user = Plaid.add_user('connect','plaid_test','plaid_good','wells')
      it { expect(user.accounts.empty?).to be_falsey }
    end

    context 'has correct credentials for single factor auth, authenticates to the auth level of api access' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_secret'
        p.environment_location = 'https://tartan.plaid.com/'
      end
      user = Plaid.add_user('auth','plaid_test','plaid_good','wells')
      it { expect(user.accounts[0].numbers.nil?).to be_falsey }
    end

    context 'has correct credentials for single factor auth, authenticates to the info level of api access' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_secret'
        p.environment_location = 'https://tartan.plaid.com/'
      end
      user = Plaid.add_user('info','plaid_test','plaid_good','wells')
      it { expect(user.info).to be_truthy }
    end

    context 'has correct username, but incorrect password for single factor auth under auth level of api access' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_secret'
        p.environment_location = 'https://tartan.plaid.com/'
      end
      it { expect{Plaid.add_user('auth','plaid_test','plaid_bad','wells')}.to raise_error }
    end

    context 'has incorrect username under auth level of api access' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_secret'
        p.environment_location = 'https://tartan.plaid.com/'
      end
      it { expect{Plaid.add_user('auth','plaid_bad','plaid_bad','wells')}.to raise_error }
    end

    context 'has correct username, but incorrect password for single factor auth under connect level of api access' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_secret'
        p.environment_location = 'https://tartan.plaid.com/'
      end
      it { expect{Plaid.add_user('connect','plaid_test','plaid_bad','wells')}.to raise_error }
    end

    context 'has incorrect username under connect level of api access' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_secret'
        p.environment_location = 'https://tartan.plaid.com/'
      end
      it { expect{Plaid.add_user('connect','plaid_bad','plaid_bad','wells')}.to raise_error }
    end

    context 'has correct username, but incorrect password for single factor auth under info level of api access' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_secret'
        p.environment_location = 'https://tartan.plaid.com/'
      end
      it { expect{Plaid.add_user('info','plaid_test','plaid_bad','wells')}.to raise_error }
    end

    context 'has incorrect username under info level of api access' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_secret'
        p.environment_location = 'https://tartan.plaid.com/'
      end
      it { expect{Plaid.add_user('info','plaid_bad','plaid_bad','wells')}.to raise_error }
    end

    context 'enters pin for extra parameter authentication required by certain institutions' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_secret'
        p.environment_location = 'https://tartan.plaid.com/'
      end
      user = Plaid.add_user('connect','plaid_test','plaid_good','usaa','1234')
      it { expect(user.api_res).to eq 'Requires further authentication' }
    end

    context 'enters incorrect pin for extra parameter authentication required by certain institutions' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_secret'
        p.environment_location = 'https://tartan.plaid.com/'
      end
      it { expect{Plaid.add_user('connect','plaid_test','plaid_good','usaa','0000')}.to raise_error }
    end

    context 'has to enter MFA credentials' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_secret'
        p.environment_location = 'https://tartan.plaid.com/'
      end
      user = Plaid.add_user('connect','plaid_selections', 'plaid_good','bofa')
      it { expect(user.api_res).to eq 'Requires further authentication' }
    end

    context 'enters correct information with locked account' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_secret'
        p.environment_location = 'https://tartan.plaid.com/'
      end
      user = Plaid.add_user('connect','plaid_selections', 'plaid_locked','wells')
      it { expect(user.api_res).to eq 'User account is locked' }
    end

    context 'enters webhook option as part of standard call' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_secret'
        p.environment_location = 'https://tartan.plaid.com/'
      end
      user = Plaid.add_user('connect','plaid_test', 'plaid_good','wells',{login_only: true, webhook: 'test.com/test.endpoint.aspx'})
      it { expect(user.accounts.empty?).to be_falsey }
    end

    context 'enters webhook option as part of mfa required institution authentication' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_secret'
        p.environment_location = 'https://tartan.plaid.com/'
      end
      user = Plaid.add_user('connect','plaid_selections', 'plaid_good','bofa',{login_only: true, webhook: 'test.com/test.endpoint.aspx'})
      it { expect(user.api_res).to eq 'Requires further authentication' }
    end

    context 'requests pending transactions from an institution' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_secret'
        p.environment_location = 'https://tartan.plaid.com/'
      end
      user = Plaid.add_user('connect','plaid_selections', 'plaid_good','wells',{pending: true})
      it { expect(user.accounts.empty?).to be_falsey }
    end

    context 'sets the login only option to true' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_secret'
        p.environment_location = 'https://tartan.plaid.com/'
      end
      user = Plaid.add_user('connect','plaid_selections', 'plaid_good','wells',{login_only:true})
      it { expect(user.accounts.empty?).to be_falsey }
    end

    context 'requests a list of options for code based MFA' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_secret'
        p.environment_location = 'https://tartan.plaid.com/'
      end
      user = Plaid.add_user('connect','plaid_selections', 'plaid_good','citi',{list: true})
      it { expect(user.pending_mfa_questions.nil?).to be_falsey }
    end

    context 'sets a start date for transactions' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_secret'
        p.environment_location = 'https://tartan.plaid.com/'
      end
      user = Plaid.add_user('connect','plaid_selections', 'plaid_good','wells',{login_only:true, start_date:'10 days ago'})
      it { expect(user.accounts.empty?).to be_falsey }
    end

    context 'sets an end date for transactions' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_secret'
        p.environment_location = 'https://tartan.plaid.com/'
      end
      user = Plaid.add_user('connect','plaid_selections', 'plaid_good','wells',{login_only:true, end_date: '10 days ago'})
      it { expect(user.accounts.empty?).to be_falsey }
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

    describe 'user vars' do

      context 'valid user has accounts and accounts contain id attribute' do
        Plaid.config do |p|
          p.customer_id = 'test_id'
          p.secret = 'test_secret'
          p.environment_location = 'https://tartan.plaid.com/'
        end
        user = Plaid.add_user('connect','plaid_test','plaid_good','wells')
        it { expect(user.accounts.first.id).to be_truthy }
      end

      context 'valid user has accounts and accounts contain type attribute' do
        Plaid.config do |p|
          p.customer_id = 'test_id'
          p.secret = 'test_secret'
          p.environment_location = 'https://tartan.plaid.com/'
        end
        user = Plaid.add_user('connect','plaid_test','plaid_good','wells')
        it { expect(user.accounts.first.type).to eq('depository') }
      end
    end

    # MFA specs - after user is instantiated,
    describe '#mfa_authentication' do

      context 'enters correct credentials for MFA auth and authenticates' do
        Plaid.config do |p|
          p.customer_id = 'test_id'
          p.secret = 'test_secret'
          p.environment_location = 'https://tartan.plaid.com/'
        end
        new_mfa_user = Plaid.add_user('connect','plaid_selections', 'plaid_good','bofa')
        new_mfa_user.mfa_authentication('tomato','bofa')
        it { expect(new_mfa_user.accounts).to be_truthy }
      end

      context 'has to enter another round of MFA credentials' do
        Plaid.config do |p|
          p.customer_id = 'test_id'
          p.secret = 'test_secret'
          p.environment_location = 'https://tartan.plaid.com/'
        end
        mfa_again = Plaid.add_user('connect','plaid_selections', 'plaid_good','bofa')
        mfa_again.mfa_authentication('again','bofa')
        it { expect(mfa_again.api_res).to eq 'Requires further authentication' }
      end

      context 'enters incorrect credentials for MFA auth' do
        Plaid.config do |p|
          p.customer_id = 'test_id'
          p.secret = 'test_secret'
          p.environment_location = 'https://tartan.plaid.com/'
        end
        mfa_user = Plaid.add_user('connect','plaid_selections', 'plaid_good','bofa')
        mfa_user.mfa_authentication('tomato','bofa')
        mfa_user = Plaid.add_user('connect','plaid_selections', 'plaid_good','bofa')
        it { expect { mfa_user.mfa_authentication('bad','bofa') }.to raise_error }
      end
    end

    # Auth specs
    describe '#get_auth' do
      auth_user = Plaid.add_user('auth','plaid_test','plaid_good','wells')
      connect_user = Plaid.add_user('connect','plaid_test','plaid_good','wells')

      context 'has access and returns accounts' do
        it { expect(auth_user.permissions[0]).to eq('auth') }
      end

      context 'does not have access to auth' do
        it{ expect(connect_user.permissions.include? 'auth' ).to be false }
      end
    end

    # Connect specs
    describe '#get_connect' do
      auth_user = Plaid.add_user('auth','plaid_test','plaid_good','wells')
      connect_user = Plaid.add_user('connect','plaid_test','plaid_good','wells')

      context 'has access and returns accounts' do
        it { expect(connect_user.permissions[0]).to eq('connect') }
      end

      context 'does not have access to auth' do
        it{ expect(auth_user.permissions.include? 'connect' ).to be false }
      end
    end

    # Get info specs
    describe '#get_info' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_secret'
        p.environment_location = 'https://tartan.plaid.com/'
      end
      info_user = Plaid.add_user('info','plaid_test','plaid_good','wells')
      auth_user = Plaid.add_user('auth','plaid_test','plaid_good','wells')

      context 'has access and returns user info' do
        it { expect(info_user.permissions[0]).to eq('info') }
      end

      context 'does not have access to info' do
        it{ expect(auth_user.permissions.include? 'info' ).to be false }
      end
    end

    describe '#get_balance' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_secret'
        p.environment_location = 'https://tartan.plaid.com/'
      end

      user = Plaid.add_user('info','plaid_test','plaid_good','wells')
      user.update_balance
      context 'updates user accounts' do
        it { expect(user.accounts.empty?).to be_falsey }
      end

      context 'should not double up accounts or transactions' do
        dup = user.accounts.select{|element| user.accounts.count(element) > 1}
        dup = dup.length + user.transactions.select{|element| user.transactions.count(element) > 1}.length
        it{ expect(dup).to eq(0) }
      end

    end

=begin
    describe '#update_info' do
      info_user = Plaid.add_user('info','plaid_test','plaid_good','wells')

      context 'updates information correctly' do
        it { expect { info_user.update_info('info','plaid_test','plaid_new','wells') }.to be_truthy }
      end
    end
=end

    describe '#delete_user' do
      Plaid.config do |p|
        p.customer_id = 'test_id'
        p.secret = 'test_secret'
        p.environment_location = 'https://tartan.plaid.com/'
      end

      info_user = Plaid.add_user('info','plaid_test','plaid_good','wells')
      info_user.delete_user

      context 'updates information correctly' do
        it { expect { info_user.get_info }.to raise_error }
      end
    end

    # Upgrade specs - either pass or fails
=begin TODO: Write upgrade methods to pass without paying
    describe '#upgrade' do
      auth_user = Plaid.add_user('auth','plaid_test','plaid_good','wells')
      connect_user = Plaid.add_user('connect','plaid_test','plaid_good','wells')

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