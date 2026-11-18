# frozen_string_literal: true

module Plaid
  module Identity
    module Types
      class IdentityMatchListRequest < Internal::Types::Model
        field :start_time, -> { String }, optional: false, nullable: false

        field :end_time, -> { String }, optional: false, nullable: false

        field :count, -> { Integer }, optional: true, nullable: false

        field :cursor, -> { String }, optional: true, nullable: false
      end
    end
  end
end
