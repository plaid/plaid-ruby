# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An optional object to configure `/item/import` request. Retained for the legacy Plaid Exchange integration; not
    # required for Permissions Manager callers.
    class ItemImportRequestOptions < Internal::Types::Model
      field :webhook, -> { String }, optional: true, nullable: false
    end
  end
end
