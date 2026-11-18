# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Information about the last change made to the parent object specifying what caused the change as well as when it
    # occurred.
    class WatchlistScreeningAuditTrail < Internal::Types::Model
      field :source, -> { Plaid::Types::Source }, optional: false, nullable: false

      field :dashboard_user_id, -> { String }, optional: false, nullable: true

      field :timestamp, -> { String }, optional: false, nullable: false
    end
  end
end
