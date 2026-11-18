# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Documentation not found in the MISMO model viewer and not provided by Freddie Mac.
    class VerificationOfAssetResponse < Internal::Types::Model
      field :assets, -> { Plaid::Types::Assets }, optional: false, nullable: false, api_name: "ASSETS"
    end
  end
end
