describe Plaid::User do
  let(:auth_user)    { Plaid.add_user('auth',    'plaid_test', 'plaid_good', 'wells') }
  let(:connect_user) { Plaid.add_user('connect', 'plaid_test', 'plaid_good', 'wells') }
  let(:info_user)    { Plaid.add_user('info',    'plaid_test', 'plaid_good', 'wells') }

  context 'user vars' do
    context 'valid user has accounts and accounts contain id attribute' do
      let(:user) { Plaid.add_user('connect', 'plaid_test', 'plaid_good', 'wells') }
      it { expect(user.accounts.first.id).not_to be_nil }
    end

    context 'valid user has accounts and accounts contain type attribute' do
      let(:user) { Plaid.add_user('connect', 'plaid_test', 'plaid_good', 'wells') }
      it { expect(user.accounts.first.type).to eq('depository') }
    end
  end

  # MFA specs - after user is instantiated,
  describe '#mfa_authentication' do
    let(:user) { Plaid.add_user('connect', 'plaid_test', 'plaid_good', 'bofa') }
    let(:new_mfa_user) { user.mfa_authentication('tomato') }

    context 'enters correct credentials for MFA auth and authenticates' do
      it { expect(new_mfa_user.accounts).not_to be_empty }
    end

    context 'enters old method of adding type strongly in each method and authenticates correctly using 2FA' do
      let(:new_mfa_user) { user.mfa_authentication('tomato', 'bofa') }
      it { expect(new_mfa_user.accounts).to be_truthy }
    end

    context 'has to enter another round of MFA credentials' do
      let(:mfa_again) { user.mfa_authentication('again') }
      it { expect(mfa_again.api_res).to eq 'Requires further authentication' }
    end

    context 'enters incorrect credentials for MFA auth' do
      let(:mfa_user) { user.mfa_authentication('tomato') }
      let(:mfa_bad)  { mfa_user; Plaid.add_user('connect', 'plaid_test', 'plaid_good', 'bofa') }
      it { expect { mfa_bad.mfa_authentication('bad') }.to raise_error(Plaid::RequestFailed, 'invalid mfa') }
    end

    context 'requests list of MFA credentials' do
      let(:new_mfa_user) { Plaid.add_user('auth', 'plaid_test', 'plaid_good', 'chase', nil, '{"list":true}') }
      let(:expected_questions) do
           {
             "type"=>"list",
             "mfa"=> [
               {"mask"=>"xxx-xxx-5309", "type"=>"phone"},
               {"mask"=>"t..t@plaid.com", "type"=>"email"}
             ],
             "access_token"=>"test_chase"
           }
      end
      it { expect(new_mfa_user.pending_mfa_questions).to eql(expected_questions) }
    end

    context 'selects MFA method and returns successful response' do
      let(:user) { Plaid.add_user('auth', 'plaid_test', 'plaid_good', 'chase', nil, '{"list":true}') }
      let(:new_mfa_user) { user.select_mfa_method({mask: 'xxx-xxx-5309' }, 'chase') }
      let(:expected_pending_questions) do
        {
          "type" => "device",
          "mfa"  => { "message" => "Code sent to xxx-xxx-5309" },
          "access_token" => "test_chase"
        }
      end
      it { expect(new_mfa_user.pending_mfa_questions).to eql(expected_pending_questions) }
    end

    context 'selects MFA method, and delivers correct payload to authenticate user' do
      let(:user) { Plaid.add_user('auth', 'plaid_test', 'plaid_good', 'chase', nil, '{"list":true}') }
      let(:user_select_method) { user.select_mfa_method({mask:'xxx-xxx-5309'}) }
      let(:new_mfa_user) { user_select_method.mfa_authentication(1234) }

      it { expect(new_mfa_user.accounts).not_to be_empty }
    end
  end

  context 'when authenticating' do
    # Auth specs
    describe '#get_auth' do

      context 'has access and returns accounts' do
        it { expect(auth_user.permissions[0]).to eq('auth') }
      end

      context 'does not have access to auth' do
        it { expect(connect_user.permissions.include? 'auth' ).to eql(false) }
      end
    end

    # Connect specs
    describe '#get_connect' do
      context 'has access and returns accounts' do
        it { expect(connect_user.permissions[0]).to eq('connect') }
      end

      context 'does not have access to auth' do
        it { expect(auth_user.permissions.include? 'connect' ).to eql(false) }
      end
    end

    # Get info specs
    describe '#get_info' do
      context 'has access and returns user info' do
        it { expect(info_user.permissions[0]).to eq('info') }
      end

      context 'does not have access to info' do
        it{ expect(auth_user.permissions.include? 'info' ).to eql(false) }
      end
    end
  end

  describe '#get_balance' do
    subject { user.tap(&:update_balance) }
    let(:user) { Plaid.add_user('info', 'plaid_test', 'plaid_good', 'wells') }

    context 'updates user accounts' do
      it { expect(subject.accounts).not_to be_empty }
    end

    # TODO: This test needs to be rewritten better, such as using #uniq instead of this
    context 'does not double up accounts or transactions' do
      let(:total_duplicates) { duplicate_accounts.length + duplicate_transactions.length }
      let(:duplicate_accounts)     { subject.accounts.select {|element| user.accounts.count(element) > 1} }
      let(:duplicate_transactions) { subject.transactions.select {|element| user.transactions.count(element) > 1} }
      it{ expect(total_duplicates).to eql(0) }
    end
  end

  describe '#update_info' do
    let(:info_user) { Plaid.add_user('info', 'plaid_test', 'plaid_good', 'wells') }
    context 'updates information correctly' do
      # TODO: This test needs to pass, currently test credentials are failing
      pending { expect { info_user.update_info('plaid_test', 'plaid_good') }.to_not raise_error  }
    end
  end

  describe '#delete_user' do
    subject { info_user.tap(&:delete_user) }
    let(:info_user) { Plaid.add_user('info', 'plaid_test', 'plaid_good', 'wells') }

    context 'updates information correctly' do
      it { expect { subject.get_info }.to raise_error(Plaid::Unauthorized, 'client_id missing') }
    end
  end

  describe '#upgrade' do
    subject { user.tap(&upgrade!) }
    let(:upgrade!) { ->(x) { x.upgrade(upgrade_level) } }
    let(:upgrade_level) { raise 'Define upgrade level' }

    context 'auth upgrade is successful' do
      let(:user)          { connect_user }
      let(:upgrade_level) { 'auth' }
      it { expect{ subject.get_auth }.to_not raise_error }
    end

    context 'connect upgrade is successful' do
      let(:user)          { auth_user }
      let(:upgrade_level) { 'connect' }
      it { expect{ subject.get_connect }.to_not raise_error }
    end
  end

  # This stuff needs to be tested and rewritten. Have already
  # surfaced up a bug in it
  pending '#populate_user'

end
