# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Details about the end user's device. These fields are optional, but strongly recommended to increase the accuracy
    # of results when using Signal Transaction Scores. When using a Balance-only ruleset, these fields are ignored.
    class SignalDevice < Internal::Types::Model
      field :ip_address, -> { String }, optional: true, nullable: true

      field :user_agent, -> { String }, optional: true, nullable: true
    end
  end
end
