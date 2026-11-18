# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Specifies options for initializing Link for use with the Auth product. This field can be used to enable or disable
    # extended Auth flows for the resulting Link session. Omitting any field will result in a default that can be
    # configured by your account manager. The default behavior described in the documentation is the default behavior
    # that will apply if you have not requested your account manager to apply a different default. If you have enabled
    # the [Dashboard Account Verification pane](https://dashboard.plaid.com/account-verification), the settings enabled
    # there will override any settings in this object.
    class LinkTokenCreateRequestAuth < Internal::Types::Model
      field :auth_type_select_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :automated_microdeposits_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :instant_match_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :same_day_microdeposits_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :instant_microdeposits_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :reroute_to_credentials, -> { Plaid::Types::LinkTokenCreateRequestAuthRerouteToCredentials }, optional: true, nullable: false

      field :database_match_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :database_insights_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :flow_type, -> { Plaid::Types::LinkTokenCreateRequestAuthFlowType }, optional: true, nullable: false

      field :sms_microdeposits_verification_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
