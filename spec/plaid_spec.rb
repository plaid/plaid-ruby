# Authentication flow specs - returns Plaid::User

describe Plaid do
  let(:api_level) { raise "Define let(:api_level)" }
  let(:username)  { raise "Define let(:username)" }
  let(:password)  { raise "Define let(:password)" }
  let(:type)      { raise "Define let(:type)" }
  let(:pin)       { nil }
  let(:options)   { nil }

  describe '.add_user' do
    let(:user) { Plaid.add_user api_level, username, password, type, pin, options }

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

          it 'raises a locked error' do
            expect { user }.to raise_error(Plaid::RequestFailed) { |error|
              expect(error.code).to eq(1205)
            }
          end
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

          pending 'with JSON-encoded string for options'
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
          it { expect { user }.to raise_error(Plaid::RequestFailed, 'invalid credentials') }
        end

        context 'using incorrect username' do
          let(:username) { 'plaid_bad' }
          it { expect { user }.to raise_error(Plaid::RequestFailed, 'invalid credentials') }
        end
      end

      context 'at "connect" level api access' do
        let(:api_level) { 'connect' }

        context 'using incorrect password' do
          let(:password) { 'plaid_bad' }
          it { expect { user }.to raise_error(Plaid::RequestFailed, 'invalid credentials') }
        end

        context 'using incorrect username' do
          let(:username) { 'plaid_bad' }
          it { expect { user }.to raise_error(Plaid::RequestFailed, 'invalid credentials') }
        end
      end

      context 'at "info" level api access' do
        let(:api_level) { 'info' }

        context 'using incorrect password' do
          let(:password) { 'plaid_bad' }
          it { expect { user }.to raise_error(Plaid::RequestFailed, 'invalid credentials') }
        end

        context 'using incorrect username' do
          let(:username) { 'plaid_bad' }
          it { expect { user }.to raise_error(Plaid::RequestFailed, 'invalid credentials') }
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
        it { expect { user }.to raise_error(Plaid::RequestFailed, 'invalid pin') }
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

    context 'gets a valid user with accounts and transactions' do
      let(:user) { Plaid.set_user('test_wells',['connect']) }
      it { expect(user.transactions).not_to be_empty }
    end

    context 'gets a valid user with accounts' do
      let(:user) { Plaid.set_user('test_wells',['auth']) }
      it { expect(user.accounts).not_to be_empty }
    end

    #TODO: Fully vet the info api endpoint for the beta functions before adding this as a supported function.
    pending 'need to vet the info api endpoint' do
      context 'gets a valid user with info' do
        let(:user) { Plaid.set_user('test_wells',['info']) }
        it { expect(user.accounts).to be_truthy}
      end

      context 'gets a fully validated user with all access granted' do
        let(:user) { Plaid.set_user('test_wells', ['connect', 'info', 'auth']) }
        it { expect(user.transactions).to be_truthy}
      end
    end
  end

  describe '.exchange_token' do
    subject { Plaid.exchange_token('test,chase,connected', 'QPO8Jo8vdDHMepg41PBwckXm4KdK1yUdmXOwK') }

    it { expect(subject.access_token).to eql('test_chase') }
  end

  describe '.transactions' do
    subject { Plaid.transactions(access_token, options) }
    let(:access_token) { 'test_wells' }
    let(:options)      { nil }

    context 'without options' do
      it 'returns all accounts' do
        expect(subject.accounts).not_to be_empty
      end

      it 'returns all transactions' do
        expect(subject.transactions).not_to be_empty
      end
    end

    context 'when filtering by account' do
      let(:options) { { account: account } }
      let(:account) { 'QPO8Jo8vdDHMepg41PBwckXm4KdK1yUdmXOwK' }

      it 'returns a subset of transactions' do
        expect(subject.transactions.size).to eql(2)
      end

      it 'return only transactions from the requested account' do
        expect(subject.transactions.map(&:account).uniq).to eql([account])
      end
    end

    context 'when filtering by date' do
      let(:options) { { gte: "2014-07-24", lte: "2014-07-25" } }

      it 'returns a subset of transactions' do
        expect(subject.transactions.size).to eql(1)
      end

      it 'return only transactions from the requested date range' do
        expect(subject.transactions.map(&:date).uniq).to eql(['2014-07-24'])
      end
    end

    context 'when filtering by account and date' do
      let(:options) { { account: account , gte: "2014-07-24", lte: "2014-07-25" } }
      let(:account) { 'XARE85EJqKsjxLp6XR8ocg8VakrkXpTXmRdOo' }

      it 'returns a subset of transactions' do
        expect(subject.transactions.size).to eql(1)
      end

      it 'returns only transactions from the requested account and date range' do
        expect(subject.transactions.map(&:date).uniq).to eql(['2014-07-24'])
        expect(subject.transactions.map(&:account).uniq).to eql([account])
      end
    end
  end
end
