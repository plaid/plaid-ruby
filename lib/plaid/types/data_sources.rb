# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module DataSources
      extend Plaid::Internal::Types::Enum

      INSTITUTION = "INSTITUTION"
      INSTITUTION_MASK = "INSTITUTION_MASK"
      USER = "USER"
    end
  end
end
