require 'spec_helper.rb'
# Authentication flow specs - returns Plaid::User
RSpec.describe Plaid do
  Plaid.config do |p|
    p.customer_id = 'test_id'
    p.secret = 'test_secret'
    p.environment_location = 'https://tartan.plaid.com/'
  end

  describe '.add_user' do
    let(:user) { Plaid.add_user api_level, username, password, type, pin, options }

    let(:api_level) { raise "Define let(:api_level)" }
    let(:username)  { raise "Define let(:username)" }
    let(:password)  { raise "Define let(:password)" }
    let(:type)      { raise "Define let(:type)" }
    let(:pin)       { nil }
    let(:options)   { nil }

    context 'with correct credentials for single user auth' do
      let(:username)  { 'plaid_test' }
      let(:password)  { 'plaid_good' }
      let(:type)      { 'wells' }

      context 'and "connect" level of api access' do
        let(:api_level) { 'connect' }

        it { expect(user.accounts).not_to be_empty }

        context 'with webhook' do
          let(:options) { { login_only: true, webhook: 'test.com/test.endpoint.aspx' } }
          it { expect(user.accounts).not_to be_empty }
        end

        context 'when account is locked' do
          let(:password) { 'plaid_locked' }
          it { expect(user.api_res).to eq 'User account is locked' }
        end

        context 'with connection options' do
          context 'when requests pending transactions from an institution' do
            let(:options) { { pending: true } }
            it { expect(user.accounts).not_to be_empty }
          end

          context 'when login only is true' do
            let(:options) { { login_only: true } }
            it { expect(user.accounts).not_to be_empty }
          end

          context 'sets a start date for transactions' do
            let(:options) { { login_only: true, start_date: '10 days ago'} }
            it { expect(user.accounts).not_to be_empty }
          end

          context 'sets an end date for transactions' do
            let(:options) { { login_only: true, end_date: '10 days ago'} }
            it { expect(user.accounts).not_to be_empty }
          end

          context 'sets start and end dates for transactions' do
            let(:options) { { gte: "05/10/2014" , lte: "06/10/2014" } }
            it { expect(user.transactions).not_to be_nil }
          end
        end
      end

      context 'and "auth" level of api access' do
        let(:api_level) { 'auth' }
        it { expect(user.accounts.first.numbers).not_to be_empty }
      end

      context 'and "info" level of api access' do
        let(:api_level) { 'info' }
        it { expect(user.info).not_to be_empty }
      end
    end

    context 'with incorrect credentials for single factor auth' do
      # Set up correct credentials. Override with bad element
      # within each context block
      let(:username)  { 'plaid_test' }
      let(:password)  { 'plaid_good' }
      let(:type)      { 'wells' }

      context 'at "auth" level api access' do
        let(:api_level) { 'auth' }

        context 'using incorrect password' do
          let(:password) { 'plaid_bad' }
          it { expect { user }.to raise_error }
        end

        context 'using incorrect username' do
          let(:username) { 'plaid_bad' }
          it { expect { user }.to raise_error }
        end
      end

      context 'at "connect" level api access' do
        let(:api_level) { 'connect' }

        context 'using incorrect password' do
          let(:password) { 'plaid_bad' }
          it { expect { user }.to raise_error }
        end

        context 'using incorrect username' do
          let(:username) { 'plaid_bad' }
          it { expect { user }.to raise_error }
        end
      end

      context 'at "info" level api access' do
        let(:api_level) { 'info' }

        context 'using incorrect password' do
          let(:password) { 'plaid_bad' }
          it { expect { user }.to raise_error }
        end

        context 'using incorrect username' do
          let(:username) { 'plaid_bad' }
          it { expect { user }.to raise_error }
        end
      end
    end

    context 'when institution requires PIN' do
      let(:api_level) { 'connect' }
      let(:username)  { 'plaid_test' }
      let(:password)  { 'plaid_good' }
      let(:type)      { 'usaa' }

      context 'using correct PIN' do
        let(:pin) { '1234' }
        it { expect(user.api_res).to eq 'Requires further authentication' }
      end

      context 'using incorrect PIN' do
        let(:pin) { '0000' }
        it { expect { user }.to raise_error }
      end
    end

    context 'when institution requires MFA' do
      let(:api_level) { 'connect' }
      let(:username)  { 'plaid_test' }
      let(:password)  { 'plaid_good' }
      let(:type)      { 'bofa' }

      context 'with only standard credentials' do
        it { expect(user.api_res).to eq 'Requires further authentication' }
      end

      context 'with options' do
        context 'with webhook' do
          let(:options) { { login_only: true, webhook: 'test.com/test.endpoint.aspx' } }
          it { expect(user.api_res).to eq 'Requires further authentication' }
        end

        context 'requests a list of options for code based MFA' do
          let(:type) { 'citi' }
          let(:options) { { list: true } }

          it { expect(user.pending_mfa_questions).not_to be_nil }
        end
      end
    end
  end

  describe '.set_user' do
    subject { Plaid.set_user(access_token) }
    let(:access_token) { 'test' }

    it { expect(subject.access_token).to eq(access_token)}
  end
end
