# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module ScopesContext
      extend Plaid::Internal::Types::Enum

      ENROLLMENT = "ENROLLMENT"
      PORTAL = "PORTAL"
    end
  end
end
