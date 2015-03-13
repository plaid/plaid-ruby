require 'spec_helper.rb'
########## Plaid instantiated user specs ##########
describe '#User' do

  Plaid.config do |p|
    p.client_id = 'test_id'
    p.secret = 'test_secret'
    p.environment_location = 'https://tartan.plaid.com/'
  end

  describe 'user vars' do

    context 'valid user has accounts and accounts contain id attribute' do
      user = Plaid.add_user('connect','plaid_test','plaid_good','wells')
      it { expect(user.accounts.first.id).to be_truthy }
    end

    context 'valid user has accounts and accounts contain type attribute' do
      user = Plaid.add_user('connect','plaid_test','plaid_good','wells')
      it { expect(user.accounts.first.type).to eq('depository') }
    end
  end

  # MFA specs - after user is instantiated,
  describe '#mfa_authentication' do

    context 'enters correct credentials for MFA auth and authenticates' do
      new_mfa_user = Plaid.add_user('connect','plaid_selections', 'plaid_good','bofa')
      new_mfa_user.mfa_authentication('tomato','bofa')
      it { expect(new_mfa_user.accounts).to be_truthy }
    end

    context 'has to enter another round of MFA credentials' do
      mfa_again = Plaid.add_user('connect','plaid_selections', 'plaid_good','bofa')
      mfa_again.mfa_authentication('again','bofa')
      it { expect(mfa_again.api_res).to eq 'Requires further authentication' }
    end

    context 'enters incorrect credentials for MFA auth' do
      mfa_user = Plaid.add_user('connect','plaid_selections', 'plaid_good','bofa')
      mfa_user.mfa_authentication('tomato','bofa')
      mfa_user = Plaid.add_user('connect','plaid_selections', 'plaid_good','bofa')
      it { expect { mfa_user.mfa_authentication('bad','bofa') }.to raise_error }
    end

    context 'requests list of MFA credentials' do
      new_mfa_user = Plaid.add_user('auth','plaid_test','plaid_good','chase',nil,'{"list":true}')
      it { expect(new_mfa_user.pending_mfa_questions).to eq({"type"=>"list", "mfa"=>[{"mask"=>"xxx-xxx-5309", "type"=>"phone"}, {"mask"=>"t..t@plaid.com", "type"=>"email"}], "access_token"=>"test"}) }
    end

    context 'selects MFA method and returns successful response' do
      new_mfa_user = Plaid.add_user('auth','plaid_test','plaid_good','chase',nil,'{"list":true}')
      new_mfa_user.select_mfa_method({mask:'xxx-xxx-5309'},'chase')
      it { expect(new_mfa_user.pending_mfa_questions).to eq({"type"=>"device", "mfa"=>{"message"=>"Code sent to xxx-xxx-5309"}, "access_token"=>"test"}) }
    end

    context 'selects MFA method, and delivers correct payload to authenticate user' do
      new_mfa_user = Plaid.add_user('auth','plaid_test','plaid_good','chase',nil,'{"list":true}')
      new_mfa_user.select_mfa_method({mask:'xxx-xxx-5309'},'chase')
      new_mfa_user.mfa_authentication(1234,'chase')
      it { expect(new_mfa_user.accounts).to be_truthy }
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

=begin TODO: This test needs to pass, currently test credentials are failing
  describe '#update_info' do
    info_user = Plaid.add_user('info','plaid_test','plaid_good','wells')
    context 'updates information correctly' do
      it { expect { info_user.update_info('plaid_test','plaid_good') }.to_not raise_error  }
    end
  end
=end

  describe '#delete_user' do
    info_user = Plaid.add_user('info','plaid_test','plaid_good','wells')
    info_user.delete_user

    context 'updates information correctly' do
      it { expect { info_user.get_info }.to raise_error }
    end
  end

  describe '#upgrade' do
    auth_user = Plaid.add_user('auth','plaid_test','plaid_good','wells')
    connect_user = Plaid.add_user('connect','plaid_test','plaid_good','wells')

    context 'auth upgrade is successful' do
      connect_user.upgrade('auth')
      it { expect{ connect_user.get_auth }.to_not raise_error }
    end

    context 'connect upgrade is successful' do
      auth_user.upgrade('connect')
      it { expect{ auth_user.get_connect }.to_not raise_error }
    end
  end

end
