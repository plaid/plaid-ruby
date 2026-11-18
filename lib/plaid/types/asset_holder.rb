# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Documentation not found in the MISMO model viewer and not provided by Freddie Mac.
    class AssetHolder < Internal::Types::Model
      field :name, -> { Plaid::Types::AssetHolderName }, optional: false, nullable: false, api_name: "NAME"
    end
  end
end
