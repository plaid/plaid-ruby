# frozen_string_literal: true

module Plaid
  module Statements
    module Types
      class StatementsRefreshRequest < Internal::Types::Model
        field :access_token, -> { String }, optional: false, nullable: false

        field :start_date, -> { String }, optional: false, nullable: false

        field :end_date, -> { String }, optional: false, nullable: false
      end
    end
  end
end
