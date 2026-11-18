# frozen_string_literal: true

module Plaid
  module Link
    module Types
      class LinkTokenCreateRequest < Internal::Types::Model
        field :client_name, -> { String }, optional: false, nullable: false

        field :language, -> { String }, optional: false, nullable: false

        field :country_codes, -> { Internal::Types::Array[Plaid::Types::CountryCode] }, optional: false, nullable: false

        field :user, -> { Plaid::Types::LinkTokenCreateRequestUser }, optional: true, nullable: false

        field :user_id, -> { String }, optional: true, nullable: false

        field :products, -> { Internal::Types::Array[Plaid::Types::Products] }, optional: true, nullable: true

        field :required_if_supported_products, -> { Internal::Types::Array[Plaid::Types::Products] }, optional: true, nullable: true

        field :optional_products, -> { Internal::Types::Array[Plaid::Types::Products] }, optional: true, nullable: true

        field :additional_consented_products, -> { Internal::Types::Array[Plaid::Types::Products] }, optional: true, nullable: true

        field :webhook, -> { String }, optional: true, nullable: false

        field :access_token, -> { String }, optional: true, nullable: true

        field :access_tokens, -> { Internal::Types::Array[String] }, optional: true, nullable: false

        field :link_customization_name, -> { String }, optional: true, nullable: false

        field :appearance_mode, -> { Plaid::Types::LinkTokenCreateRequestAppearanceMode }, optional: true, nullable: true

        field :redirect_uri, -> { String }, optional: true, nullable: false

        field :android_package_name, -> { String }, optional: true, nullable: false

        field :institution_data, -> { Plaid::Types::LinkTokenCreateInstitutionData }, optional: true, nullable: false

        field :card_switch, -> { Plaid::Types::LinkTokenCreateCardSwitch }, optional: true, nullable: false

        field :account_filters, -> { Plaid::Types::LinkTokenAccountFilters }, optional: true, nullable: false

        field :eu_config, -> { Plaid::Types::LinkTokenEuConfig }, optional: true, nullable: false

        field :institution_id, -> { String }, optional: true, nullable: false

        field :payment_configuration, -> { Plaid::Types::LinkTokenCreateRequestPaymentConfiguration }, optional: true, nullable: false

        field :payment_initiation, -> { Plaid::Types::LinkTokenCreateRequestPaymentInitiation }, optional: true, nullable: false

        field :employment, -> { Plaid::Types::LinkTokenCreateRequestEmployment }, optional: true, nullable: false

        field :income_verification, -> { Plaid::Types::LinkTokenCreateRequestIncomeVerification }, optional: true, nullable: false

        field :base_report, -> { Plaid::Types::LinkTokenCreateRequestBaseReport }, optional: true, nullable: false

        field :credit_partner_insights, -> { Plaid::Types::LinkTokenCreateRequestCreditPartnerInsights }, optional: true, nullable: false

        field :cra_options, -> { Plaid::Types::LinkTokenCreateRequestCraOptions }, optional: true, nullable: false

        field :cra_report_parameter, -> { Plaid::Types::LinkTokenCreateRequestCraReportParameter }, optional: true, nullable: false

        field :consumer_report_permissible_purpose, -> { Plaid::Types::ConsumerReportPermissiblePurpose }, optional: true, nullable: false

        field :auth, -> { Plaid::Types::LinkTokenCreateRequestAuth }, optional: true, nullable: false

        field :transfer, -> { Plaid::Types::LinkTokenCreateRequestTransfer }, optional: true, nullable: false

        field :update, -> { Plaid::Types::LinkTokenCreateRequestUpdate }, optional: true, nullable: false

        field :identity_verification, -> { Plaid::Types::LinkTokenCreateRequestIdentityVerification }, optional: true, nullable: false

        field :statements, -> { Plaid::Types::LinkTokenCreateRequestStatements }, optional: true, nullable: false

        field :third_party_user_token, -> { String }, optional: true, nullable: false

        field :investments, -> { Plaid::Types::LinkTokenInvestments }, optional: true, nullable: false

        field :investments_auth, -> { Plaid::Types::LinkTokenInvestmentsAuth }, optional: true, nullable: false

        field :hosted_link, -> { Plaid::Types::LinkTokenCreateHostedLink }, optional: true, nullable: false

        field :transactions, -> { Plaid::Types::LinkTokenTransactions }, optional: true, nullable: false

        field :cashflow_report, -> { Plaid::Types::LinkTokenCashflowReport }, optional: true, nullable: false

        field :cra_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false

        field :identity, -> { Plaid::Types::LinkTokenCreateIdentity }, optional: true, nullable: false

        field :financekit_supported, -> { Internal::Types::Boolean }, optional: true, nullable: false

        field :enable_multi_item_link, -> { Internal::Types::Boolean }, optional: true, nullable: false

        field :user_token, -> { String }, optional: true, nullable: false
      end
    end
  end
end
