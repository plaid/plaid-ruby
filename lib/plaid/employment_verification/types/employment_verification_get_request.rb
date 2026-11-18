# frozen_string_literal: true

module Plaid
  module EmploymentVerification
    module Types
      class EmploymentVerificationGetRequest < Internal::Types::Model
        field :access_token, -> { String }, optional: false, nullable: false
      end
    end
  end
end
