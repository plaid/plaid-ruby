# frozen_string_literal: true

module Plaid
  module Credit
    module Types
      class CreditBankEmploymentGetRequest < Internal::Types::Model
        field :user_token, -> { String }, optional: false, nullable: false
      end
    end
  end
end
