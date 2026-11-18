# frozen_string_literal: true

module Plaid
  module IncomeVerification
    module Types
      class IncomeVerificationCreateRequest < Internal::Types::Model
        field :webhook, -> { String }, optional: false, nullable: false

        field :precheck_id, -> { String }, optional: true, nullable: false

        field :options, -> { Plaid::Types::IncomeVerificationCreateRequestOptions }, optional: true, nullable: false
      end
    end
  end
end
