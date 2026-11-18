# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module HumanReviewStatus
      extend Plaid::Internal::Types::Enum

      SUCCESS = "success"
      FAILED = "failed"
      NO_DATA = "no_data"
    end
  end
end
