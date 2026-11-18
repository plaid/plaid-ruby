# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module ItemUpdateType
      extend Plaid::Internal::Types::Enum

      BACKGROUND = "background"
      USER_PRESENT_REQUIRED = "user_present_required"
    end
  end
end
