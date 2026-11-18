# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Specifies options for initializing Link for use with the CRA LendScore product.
    class LinkTokenCreateRequestCraOptionsLendScore < Internal::Types::Model
      field :lend_score_version, -> { Plaid::Types::PlaidLendScoreVersion }, optional: true, nullable: true
    end
  end
end
