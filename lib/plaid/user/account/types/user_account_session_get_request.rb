# frozen_string_literal: true

module Plaid
  module User
    module Account
      module Types
        class UserAccountSessionGetRequest < Internal::Types::Model
          field :public_token, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
