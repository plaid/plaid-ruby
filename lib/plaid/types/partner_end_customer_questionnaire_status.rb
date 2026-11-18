# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module PartnerEndCustomerQuestionnaireStatus
      extend Plaid::Internal::Types::Enum

      NOT_STARTED = "NOT_STARTED"
      RECEIVED = "RECEIVED"
      COMPLETE = "COMPLETE"
    end
  end
end
