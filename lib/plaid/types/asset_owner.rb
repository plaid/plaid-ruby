# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Documentation not found in the MISMO model viewer and not provided by Freddie Mac.
    class AssetOwner < Internal::Types::Model
      field :asset_owner_text, -> { String }, optional: false, nullable: true, api_name: "AssetOwnerText"
    end
  end
end
