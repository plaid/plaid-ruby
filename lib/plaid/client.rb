# frozen_string_literal: true

module Plaid
  class PlaidApi
    # @param base_url [String, nil]
    # @param secret [String]
    # @param client_id [String, nil]
    # @param version [String, nil]
    # @param max_retries [Integer]
    # @param timeout [Numeric]
    # @param http_client [Object, nil]
    #
    # @return [void]
    def initialize(base_url: nil, secret: ENV.fetch("PLAID_SECRET", nil), client_id: ENV.fetch("PLAID_CLIENT_ID", nil), version: ENV.fetch("PLAID_VERSION", "2020-09-14"), max_retries: 0, timeout: 60, http_client: nil)
      headers = {
        "User-Agent" => "Plaid Ruby v54.0.0",
        "X-Fern-Language" => "Ruby",
        "PLAID-SECRET" => secret.to_s,
        "Plaid-Version" => version.to_s
      }
      headers["PLAID-CLIENT-ID"] = client_id.to_s unless client_id.nil?
      @raw_client = Plaid::Internal::Http::RawClient.new(
        base_url: base_url || Plaid::Environment::PRODUCTION,
        headers: headers,
        overridable_headers: %w[PLAID-CLIENT-ID Plaid-Version],
        http_client: http_client,
        max_retries: max_retries,
        timeout: timeout
      )
    end

    # @return [Plaid::AssetReport::Client]
    def asset_report
      @asset_report ||= Plaid::AssetReport::Client.new(client: @raw_client)
    end

    # @return [Plaid::MonitoringInsights::Client]
    def monitoring_insights
      @monitoring_insights ||= Plaid::MonitoringInsights::Client.new(client: @raw_client)
    end

    # @return [Plaid::Credit::Client]
    def credit
      @credit ||= Plaid::Credit::Client.new(client: @raw_client)
    end

    # @return [Plaid::CheckReport::Client]
    def check_report
      @check_report ||= Plaid::CheckReport::Client.new(client: @raw_client)
    end

    # @return [Plaid::Loans::Client]
    def loans
      @loans ||= Plaid::Loans::Client.new(client: @raw_client)
    end

    # @return [Plaid::CraReport::Client]
    def cra_report
      @cra_report ||= Plaid::CraReport::Client.new(client: @raw_client)
    end

    # @return [Plaid::ConsumerReport::Client]
    def consumer_report
      @consumer_report ||= Plaid::ConsumerReport::Client.new(client: @raw_client)
    end

    # @return [Plaid::OAuth::Client]
    def o_auth
      @o_auth ||= Plaid::OAuth::Client.new(client: @raw_client)
    end

    # @return [Plaid::Statements::Client]
    def statements
      @statements ||= Plaid::Statements::Client.new(client: @raw_client)
    end

    # @return [Plaid::Consent::Client]
    def consent
      @consent ||= Plaid::Consent::Client.new(client: @raw_client)
    end

    # @return [Plaid::Item::Client]
    def item
      @item ||= Plaid::Item::Client.new(client: @raw_client)
    end

    # @return [Plaid::Application::Client]
    def application
      @application ||= Plaid::Application::Client.new(client: @raw_client)
    end

    # @return [Plaid::Profile::Client]
    def profile
      @profile ||= Plaid::Profile::Client.new(client: @raw_client)
    end

    # @return [Plaid::Network::Client]
    def network
      @network ||= Plaid::Network::Client.new(client: @raw_client)
    end

    # @return [Plaid::Auth::Client]
    def auth
      @auth ||= Plaid::Auth::Client.new(client: @raw_client)
    end

    # @return [Plaid::Transactions::Client]
    def transactions
      @transactions ||= Plaid::Transactions::Client.new(client: @raw_client)
    end

    # @return [Plaid::Sandbox::Client]
    def sandbox
      @sandbox ||= Plaid::Sandbox::Client.new(client: @raw_client)
    end

    # @return [Plaid::CashflowReport::Client]
    def cashflow_report
      @cashflow_report ||= Plaid::CashflowReport::Client.new(client: @raw_client)
    end

    # @return [Plaid::User::Client]
    def user
      @user ||= Plaid::User::Client.new(client: @raw_client)
    end

    # @return [Plaid::Institutions::Client]
    def institutions
      @institutions ||= Plaid::Institutions::Client.new(client: @raw_client)
    end

    # @return [Plaid::Accounts::Client]
    def accounts
      @accounts ||= Plaid::Accounts::Client.new(client: @raw_client)
    end

    # @return [Plaid::Categories::Client]
    def categories
      @categories ||= Plaid::Categories::Client.new(client: @raw_client)
    end

    # @return [Plaid::Identity::Client]
    def identity
      @identity ||= Plaid::Identity::Client.new(client: @raw_client)
    end

    # @return [Plaid::DashboardUser::Client]
    def dashboard_user
      @dashboard_user ||= Plaid::DashboardUser::Client.new(client: @raw_client)
    end

    # @return [Plaid::WatchlistScreeningEntity::Client]
    def watchlist_screening_entity
      @watchlist_screening_entity ||= Plaid::WatchlistScreeningEntity::Client.new(client: @raw_client)
    end

    # @return [Plaid::WatchlistScreeningIndividual::Client]
    def watchlist_screening_individual
      @watchlist_screening_individual ||= Plaid::WatchlistScreeningIndividual::Client.new(client: @raw_client)
    end

    # @return [Plaid::BeaconAccountRisk::Client]
    def beacon_account_risk
      @beacon_account_risk ||= Plaid::BeaconAccountRisk::Client.new(client: @raw_client)
    end

    # @return [Plaid::BeaconUser::Client]
    def beacon_user
      @beacon_user ||= Plaid::BeaconUser::Client.new(client: @raw_client)
    end

    # @return [Plaid::BeaconReport::Client]
    def beacon_report
      @beacon_report ||= Plaid::BeaconReport::Client.new(client: @raw_client)
    end

    # @return [Plaid::BeaconDuplicate::Client]
    def beacon_duplicate
      @beacon_duplicate ||= Plaid::BeaconDuplicate::Client.new(client: @raw_client)
    end

    # @return [Plaid::Protect::Client]
    def protect
      @protect ||= Plaid::Protect::Client.new(client: @raw_client)
    end

    # @return [Plaid::BusinessVerification::Client]
    def business_verification
      @business_verification ||= Plaid::BusinessVerification::Client.new(client: @raw_client)
    end

    # @return [Plaid::Processor::Client]
    def processor
      @processor ||= Plaid::Processor::Client.new(client: @raw_client)
    end

    # @return [Plaid::WebhookEvents::Client]
    def webhook_events
      @webhook_events ||= Plaid::WebhookEvents::Client.new(client: @raw_client)
    end

    # @return [Plaid::Webhook::Client]
    def webhook
      @webhook ||= Plaid::Webhook::Client.new(client: @raw_client)
    end

    # @return [Plaid::Liabilities::Client]
    def liabilities
      @liabilities ||= Plaid::Liabilities::Client.new(client: @raw_client)
    end

    # @return [Plaid::PaymentInitiation::Client]
    def payment_initiation
      @payment_initiation ||= Plaid::PaymentInitiation::Client.new(client: @raw_client)
    end

    # @return [Plaid::Investments::Client]
    def investments
      @investments ||= Plaid::Investments::Client.new(client: @raw_client)
    end

    # @return [Plaid::Link::Client]
    def link
      @link ||= Plaid::Link::Client.new(client: @raw_client)
    end

    # @return [Plaid::Session::Client]
    def session
      @session ||= Plaid::Session::Client.new(client: @raw_client)
    end

    # @return [Plaid::Transfer::Client]
    def transfer
      @transfer ||= Plaid::Transfer::Client.new(client: @raw_client)
    end

    # @return [Plaid::BankTransfer::Client]
    def bank_transfer
      @bank_transfer ||= Plaid::BankTransfer::Client.new(client: @raw_client)
    end

    # @return [Plaid::Employers::Client]
    def employers
      @employers ||= Plaid::Employers::Client.new(client: @raw_client)
    end

    # @return [Plaid::IncomeVerification::Client]
    def income_verification
      @income_verification ||= Plaid::IncomeVerification::Client.new(client: @raw_client)
    end

    # @return [Plaid::EmploymentVerification::Client]
    def employment_verification
      @employment_verification ||= Plaid::EmploymentVerification::Client.new(client: @raw_client)
    end

    # @return [Plaid::Signal::Client]
    def signal
      @signal ||= Plaid::Signal::Client.new(client: @raw_client)
    end

    # @return [Plaid::Wallet::Client]
    def wallet
      @wallet ||= Plaid::Wallet::Client.new(client: @raw_client)
    end

    # @return [Plaid::EwaReport::Client]
    def ewa_report
      @ewa_report ||= Plaid::EwaReport::Client.new(client: @raw_client)
    end

    # @return [Plaid::CashAdvance::Client]
    def cash_advance
      @cash_advance ||= Plaid::CashAdvance::Client.new(client: @raw_client)
    end

    # @return [Plaid::Issues::Client]
    def issues
      @issues ||= Plaid::Issues::Client.new(client: @raw_client)
    end

    # @return [Plaid::PaymentProfile::Client]
    def payment_profile
      @payment_profile ||= Plaid::PaymentProfile::Client.new(client: @raw_client)
    end

    # @return [Plaid::Partner::Client]
    def partner
      @partner ||= Plaid::Partner::Client.new(client: @raw_client)
    end

    # @return [Plaid::Fdx::Client]
    def fdx
      @fdx ||= Plaid::Fdx::Client.new(client: @raw_client)
    end

    # @return [Plaid::Servicing::Client]
    def servicing
      @servicing ||= Plaid::Servicing::Client.new(client: @raw_client)
    end
  end
end
