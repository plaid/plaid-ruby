# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Data on the W2 Box 12
    class W2Box12 < Internal::Types::Model
      field :code, -> { String }, optional: true, nullable: true

      field :amount, -> { String }, optional: true, nullable: true
    end
  end
end
