# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Additional options that will be used to filter institutions by various Payment Initiation configurations.
    class InstitutionsSearchPaymentInitiationOptions < Internal::Types::Model
      field :payment_id, -> { String }, optional: true, nullable: true

      field :consent_id, -> { String }, optional: true, nullable: true
    end
  end
end
