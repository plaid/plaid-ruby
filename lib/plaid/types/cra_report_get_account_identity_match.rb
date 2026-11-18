# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Scores for how closely the user's identity, as provided via `/user/create` or `/user/update`, matches the account
    # owner information reported by the financial institution. `null` if the account was not scored or if identity
    # matching is not supported by the product. Within each score object, `score` is `null` when either the user or the
    # financial institution did not provide that field.
    class CraReportGetAccountIdentityMatch < Internal::Types::Model
      field :legal_name, -> { Plaid::Types::NameMatchScore }, optional: false, nullable: false

      field :phone_number, -> { Plaid::Types::PhoneNumberMatchScore }, optional: false, nullable: false

      field :email_address, -> { Plaid::Types::EmailAddressMatchScore }, optional: false, nullable: false

      field :address, -> { Plaid::Types::AddressMatchScore }, optional: false, nullable: false
    end
  end
end
