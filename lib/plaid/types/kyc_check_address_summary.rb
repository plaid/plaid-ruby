# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Result summary object specifying how the `address` field matched.
    class KycCheckAddressSummary < Internal::Types::Model
      field :summary, -> { Plaid::Types::MatchSummaryCode }, optional: false, nullable: false

      field :po_box, -> { Plaid::Types::PoBoxStatus }, optional: false, nullable: false

      field :type, -> { Plaid::Types::AddressPurposeLabel }, optional: false, nullable: false

      field :street, -> { Plaid::Types::HiddenMatchSummaryCode }, optional: true, nullable: false

      field :city, -> { Plaid::Types::HiddenMatchSummaryCode }, optional: true, nullable: false

      field :region, -> { Plaid::Types::HiddenMatchSummaryCode }, optional: true, nullable: false

      field :postal_code, -> { Plaid::Types::HiddenMatchSummaryCode }, optional: true, nullable: false

      field :international_details, -> { Plaid::Types::KycCheckDetailsInternationalAddress }, optional: true, nullable: true
    end
  end
end
