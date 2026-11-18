# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module AccountHolderCategory
      extend Plaid::Internal::Types::Enum

      BUSINESS = "business"
      PERSONAL = "personal"
      UNRECOGNIZED = "unrecognized"
    end
  end
end
