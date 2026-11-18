# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Documentation not found in the MISMO model viewer and not provided by Freddie Mac.
    class Assets < Internal::Types::Model
      field :asset, -> { Internal::Types::Array[Plaid::Types::Asset] }, optional: false, nullable: false, api_name: "ASSET"
    end
  end
end
