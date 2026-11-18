# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A representation of the status health of a request type. Auth requests, Balance requests, Identity requests,
    # Investments requests, Liabilities requests, Transactions updates, Investments updates, Liabilities updates, and
    # Item logins each have their own status object.
    class ProductStatus < Internal::Types::Model
      field :status, -> { Plaid::Types::ProductStatusStatus }, optional: false, nullable: false

      field :last_status_change, -> { String }, optional: false, nullable: false

      field :breakdown, -> { Plaid::Types::ProductStatusBreakdown }, optional: false, nullable: false
    end
  end
end
