# frozen_string_literal: true

module Plaid
  module Statements
    module Types
      class StatementsListRequest < Internal::Types::Model
        field :access_token, -> { String }, optional: false, nullable: false
      end
    end
  end
end
