# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Documentation not found in the MISMO model viewer and not provided by Freddie Mac.
    class AssetHolderName < Internal::Types::Model
      field :full_name, -> { String }, optional: false, nullable: false, api_name: "FullName"
    end
  end
end
