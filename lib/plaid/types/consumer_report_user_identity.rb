# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # This field is only used by integrations created before December 10, 2025. All other integrations must use the
    # `identity` object instead. For more details, see [New User APIs](https://plaid.com/docs/api/users/user-apis).
    # To create a Plaid Check Consumer Report for a user when using a `user_token`, this field must be present. If this
    # field is not provided during user token creation, you can add it to the user later by calling `/user/update`. Once
    # the field has been added to the user, you will be able to call `/link/token/create` with a non-empty
    # `consumer_report_permissible_purpose` (which will automatically create a Plaid Check Consumer Report), or call
    # `/cra/check_report/create` for that user.
    class ConsumerReportUserIdentity < Internal::Types::Model
      field :first_name, -> { String }, optional: false, nullable: false

      field :last_name, -> { String }, optional: false, nullable: false

      field :phone_numbers, -> { Internal::Types::Array[String] }, optional: false, nullable: false

      field :emails, -> { Internal::Types::Array[String] }, optional: false, nullable: false

      field :ssn_full, -> { String }, optional: true, nullable: true

      field :ssn_last4, -> { String }, optional: true, nullable: true, api_name: "ssn_last_4"

      field :date_of_birth, -> { String }, optional: false, nullable: true

      field :primary_address, -> { Plaid::Types::AddressData }, optional: false, nullable: false
    end
  end
end
