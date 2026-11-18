# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # ID number of the person
    class TransferPlatformPersonIDNumber < Internal::Types::Model
      field :value, -> { String }, optional: false, nullable: false

      field :type, -> { Plaid::Types::IDNumberType }, optional: false, nullable: false
    end
  end
end
