# frozen_string_literal: true

module Plaid
  module Auth
    module Types
      class AuthVerifyRequest < Internal::Types::Model
        field :legal_name, -> { String }, optional: true, nullable: true

        field :numbers, -> { Plaid::Types::AuthVerifyRequestNumbers }, optional: false, nullable: false
      end
    end
  end
end
