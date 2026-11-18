# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Response object for `/protect/cash_advance/decision/create`.
    class ProtectCashAdvanceDecisionCreateResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
