# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module BusinessWebsiteBuildStatus
      extend Plaid::Internal::Types::Enum

      COMING_SOON = "coming_soon"
      ACTIVE = "active"
      INACTIVE = "inactive"
    end
  end
end
