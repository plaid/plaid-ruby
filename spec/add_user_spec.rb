require 'spec_helper.rb'
# Authentication flow specs - returns Plaid::User
describe '.add_user' do

  Plaid.config do |p|
    p.customer_id = 'test_id'
    p.secret = 'test_secret'
    p.environment_location = 'https://tartan.plaid.com/'
  end

  context 'has correct credentials for single factor auth, authenticates to the connect level of api access' do
    user = Plaid.add_user('connect','plaid_test','plaid_good','wells')
    it { expect(user.accounts.empty?).to be_falsey }
  end

  context 'has correct credentials for single factor auth, authenticates to the auth level of api access' do
    user = Plaid.add_user('auth','plaid_test','plaid_good','wells')
    it { expect(user.accounts[0].numbers.nil?).to be_falsey }
  end

  context 'has correct credentials for single factor auth, authenticates to the info level of api access' do
    user = Plaid.add_user('info','plaid_test','plaid_good','wells')
    it { expect(user.info).to be_truthy }
  end

  context 'has correct username, but incorrect password for single factor auth under auth level of api access' do
    it { expect{Plaid.add_user('auth','plaid_test','plaid_bad','wells')}.to raise_error }
  end

  context 'has incorrect username under auth level of api access' do
    it { expect{Plaid.add_user('auth','plaid_bad','plaid_bad','wells')}.to raise_error }
  end

  context 'has correct username, but incorrect password for single factor auth under connect level of api access' do
    it { expect{Plaid.add_user('connect','plaid_test','plaid_bad','wells')}.to raise_error }
  end

  context 'has incorrect username under connect level of api access' do
    it { expect{Plaid.add_user('connect','plaid_bad','plaid_bad','wells')}.to raise_error }
  end

  context 'has correct username, but incorrect password for single factor auth under info level of api access' do
    it { expect{Plaid.add_user('info','plaid_test','plaid_bad','wells')}.to raise_error }
  end

  context 'has incorrect username under info level of api access' do
    it { expect{Plaid.add_user('info','plaid_bad','plaid_bad','wells')}.to raise_error }
  end

  context 'enters pin for extra parameter authentication required by certain institutions' do
    user = Plaid.add_user('connect','plaid_test','plaid_good','usaa','1234')
    it { expect(user.api_res).to eq 'Requires further authentication' }
  end

  context 'enters incorrect pin for extra parameter authentication required by certain institutions' do
    it { expect{Plaid.add_user('connect','plaid_test','plaid_good','usaa','0000')}.to raise_error }
  end

  context 'has to enter MFA credentials' do
    user = Plaid.add_user('connect','plaid_test', 'plaid_good','bofa')
    it { expect(user.api_res).to eq 'Requires further authentication' }
  end

  context 'enters correct information with locked account' do
    user = Plaid.add_user('connect','plaid_test', 'plaid_locked','wells')
    it { expect(user.api_res).to eq 'User account is locked' }
  end

  context 'enters webhook option as part of standard call' do
    user = Plaid.add_user('connect','plaid_test', 'plaid_good','wells',{login_only: true, webhook: 'test.com/test.endpoint.aspx'})
    it { expect(user.accounts.empty?).to be_falsey }
  end

  context 'enters webhook option as part of mfa required institution authentication' do
    user = Plaid.add_user('connect','plaid_test', 'plaid_good','bofa',{login_only: true, webhook: 'test.com/test.endpoint.aspx'})
    it { expect(user.api_res).to eq 'Requires further authentication' }
  end

  context 'requests pending transactions from an institution' do
    user = Plaid.add_user('connect','plaid_test', 'plaid_good','wells',{pending: true})
    it { expect(user.accounts.empty?).to be_falsey }
  end

  context 'sets the login only option to true' do
    user = Plaid.add_user('connect','plaid_test', 'plaid_good','wells',{login_only:true})
    it { expect(user.accounts.empty?).to be_falsey }
  end

  context 'requests a list of options for code based MFA' do
    user = Plaid.add_user('connect','plaid_test', 'plaid_good','citi',{list: true})
    it { expect(user.pending_mfa_questions.nil?).to be_falsey }
  end

  context 'sets a start date for transactions' do
    user = Plaid.add_user('connect','plaid_test', 'plaid_good','wells',{login_only:true, start_date:'10 days ago'})
    it { expect(user.accounts.empty?).to be_falsey }
  end

  context 'sets an end date for transactions' do
    user = Plaid.add_user('connect','plaid_test', 'plaid_good','wells',{login_only:true, end_date: '10 days ago'})
    it { expect(user.accounts.empty?).to be_falsey }
  end

  context 'sets start and end dates for transactions' do
    user = Plaid.add_user('connect','plaid_test','plaid_good','wells',"{'gte':'05/10/2014' , 'lte':'06/10/2014'}")
    it{ expect(user.transactions).to be_truthy }
  end

  context 'sets a user with an existing access token' do
    user = Plaid.set_user('test')
    it{ expect(user.access_token).to eq('test')}
  end
end