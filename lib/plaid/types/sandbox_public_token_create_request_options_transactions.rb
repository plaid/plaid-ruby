# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An optional set of parameters corresponding to transactions options.
    class SandboxPublicTokenCreateRequestOptionsTransactions < Internal::Types::Model
      field :start_date, -> { String }, optional: true, nullable: false

      field :end_date, -> { String }, optional: true, nullable: false

      field :days_requested, -> { Integer }, optional: true, nullable: false
    end
  end
end
