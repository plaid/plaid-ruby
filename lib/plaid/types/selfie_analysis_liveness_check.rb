# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module SelfieAnalysisLivenessCheck
      extend Plaid::Internal::Types::Enum

      SUCCESS = "success"
      FAILED = "failed"
    end
  end
end
