# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module Source
      extend Plaid::Internal::Types::Enum

      DASHBOARD = "dashboard"
      LINK = "link"
      API = "api"
      SYSTEM = "system"
      RETRO = "retro"
    end
  end
end
