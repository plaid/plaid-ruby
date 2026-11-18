# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module CraReportDecisionStage
      extend Plaid::Internal::Types::Enum

      PREQUALIFICATION = "PREQUALIFICATION"
      DECISIONING = "DECISIONING"
      SERVICING = "SERVICING"
    end
  end
end
