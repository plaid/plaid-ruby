# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module PersonalFinanceCategoryVersion
      extend Plaid::Internal::Types::Enum

      V1 = "v1"
      V2 = "v2"
    end
  end
end
