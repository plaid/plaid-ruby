# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # How the submitted TIN matched IRS records.
    class BusinessTinMatch < Internal::Types::Model
      field :summary, -> { Plaid::Types::MatchSummaryCode }, optional: false, nullable: false

      field :tin_type, -> { Plaid::Types::BusinessTinType }, optional: false, nullable: true
    end
  end
end
