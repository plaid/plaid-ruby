# frozen_string_literal: true

module Plaid
  module BusinessVerification
    module Types
      class BusinessVerificationGetRequest < Internal::Types::Model
        field :business_verification_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
