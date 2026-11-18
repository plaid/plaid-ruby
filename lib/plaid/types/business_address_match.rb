# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # How the submitted address matched data provider records, and how the provider validated it.
    class BusinessAddressMatch < Internal::Types::Model
      field :summary, -> { Plaid::Types::MatchSummaryCode }, optional: false, nullable: false

      field :validation, -> { Plaid::Types::BusinessAddressValidation }, optional: false, nullable: true
    end
  end
end
