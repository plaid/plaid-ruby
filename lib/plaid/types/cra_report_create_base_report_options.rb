# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Configures how the Base Report product is generated.
    class CraReportCreateBaseReportOptions < Internal::Types::Model
      field :require_identity, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :exclude_transactions, -> { Internal::Types::Boolean }, optional: true, nullable: true
    end
  end
end
