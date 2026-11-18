# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # UserTransferLimitsGetResponse defines the response schema for `/user/transfer/limits/get`.
    class UserTransferLimitsGetResponse < Internal::Types::Model
      field :guarantee_limits, -> { Plaid::Types::UserGuaranteeLimits }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
