# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object containing a Bacs account number and sort code. If either value isn't available, it's returned as an
    # empty string.
    class RecipientBacsInResponse < Internal::Types::Model
      field :account, -> { String }, optional: false, nullable: false

      field :sort_code, -> { String }, optional: false, nullable: false
    end
  end
end
