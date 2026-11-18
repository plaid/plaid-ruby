# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Contains sub-score metadata.
    class TrustIndexSubscores < Internal::Types::Model
      field :device_and_connection, -> { Plaid::Types::TrustIndexSubscore }, optional: true, nullable: true

      field :bank_account_insights, -> { Plaid::Types::TrustIndexSubscore }, optional: true, nullable: true
    end
  end
end
