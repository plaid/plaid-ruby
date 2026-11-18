# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module PartnerEndCustomerFlowdownStatus
      extend Plaid::Internal::Types::Enum

      NOT_STARTED = "NOT_STARTED"
      IN_REVIEW = "IN_REVIEW"
      NEGOTIATION = "NEGOTIATION"
      COMPLETE = "COMPLETE"
    end
  end
end
