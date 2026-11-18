# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Defines the response schema for `/transfer/originator/funding_account/update`
    class TransferOriginatorFundingAccountUpdateResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
