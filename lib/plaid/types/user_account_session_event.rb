# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Event data for user account session tracking
    class UserAccountSessionEvent < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false

      field :timestamp, -> { String }, optional: false, nullable: false

      field :outcome, -> { String }, optional: true, nullable: false
    end
  end
end
