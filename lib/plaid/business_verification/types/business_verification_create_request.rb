# frozen_string_literal: true

module Plaid
  module BusinessVerification
    module Types
      class BusinessVerificationCreateRequest < Internal::Types::Model
        field :client_user_id, -> { String }, optional: false, nullable: false

        field :business, -> { Plaid::Types::BusinessVerificationCreateRequestBusiness }, optional: false, nullable: false

        field :options, -> { Plaid::Types::BusinessVerificationCreateRequestOptions }, optional: true, nullable: true
      end
    end
  end
end
