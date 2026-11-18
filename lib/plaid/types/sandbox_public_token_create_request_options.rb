# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An optional set of options to be used when configuring the Item. If specified, must not be `null`.
    class SandboxPublicTokenCreateRequestOptions < Internal::Types::Model
      field :webhook, -> { String }, optional: true, nullable: false

      field :override_username, -> { String }, optional: true, nullable: true

      field :override_password, -> { String }, optional: true, nullable: true

      field :transactions, -> { Plaid::Types::SandboxPublicTokenCreateRequestOptionsTransactions }, optional: true, nullable: true

      field :statements, -> { Plaid::Types::SandboxPublicTokenCreateRequestOptionsStatements }, optional: true, nullable: true

      field :income_verification, -> { Plaid::Types::SandboxPublicTokenCreateRequestOptionsIncomeVerification }, optional: true, nullable: false
    end
  end
end
