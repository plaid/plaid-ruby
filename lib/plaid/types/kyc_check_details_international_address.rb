# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Result summary object specifying how the `address` field matched for fields that are only present on an
    # international KYC check.
    class KycCheckDetailsInternationalAddress < Internal::Types::Model
      field :building, -> { Plaid::Types::HiddenMatchSummaryCode }, optional: false, nullable: false

      field :county, -> { Plaid::Types::HiddenMatchSummaryCode }, optional: false, nullable: false

      field :district, -> { Plaid::Types::HiddenMatchSummaryCode }, optional: false, nullable: false

      field :house_number, -> { Plaid::Types::HiddenMatchSummaryCode }, optional: false, nullable: false

      field :subpremise, -> { Plaid::Types::HiddenMatchSummaryCode }, optional: false, nullable: false

      field :thoroughfare, -> { Plaid::Types::HiddenMatchSummaryCode }, optional: false, nullable: false
    end
  end
end
