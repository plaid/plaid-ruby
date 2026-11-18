# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Plaid's prediction of whether the account is the user's primary account. `null` if the account could not be scored
    # or if scoring is not supported by the product.
    class CraReportGetAccountPrimaryAccount < Internal::Types::Model
      field :is_primary, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :score, -> { Float }, optional: false, nullable: false
    end
  end
end
