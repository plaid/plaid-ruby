# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module OtherAccountSubtype
      extend Plaid::Internal::Types::Enum

      OTHER = "other"
      ALL = "all"
    end
  end
end
