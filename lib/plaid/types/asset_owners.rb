# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Documentation not found in the MISMO model viewer and not provided by Freddie Mac.
    class AssetOwners < Internal::Types::Model
      field :asset_owner, -> { Internal::Types::Array[Plaid::Types::AssetOwner] }, optional: false, nullable: false, api_name: "ASSET_OWNER"
    end
  end
end
