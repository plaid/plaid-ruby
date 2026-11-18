# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module ActivityType
      extend Plaid::Internal::Types::Enum

      UNKNOWN = "UNKNOWN"
      ITEM_CREATE = "ITEM_CREATE"
      ITEM_IMPORT = "ITEM_IMPORT"
      ITEM_UPDATE = "ITEM_UPDATE"
      ITEM_UNLINK = "ITEM_UNLINK"
      PORTAL_UNLINK = "PORTAL_UNLINK"
      PORTAL_ITEMS_DELETE = "PORTAL_ITEMS_DELETE"
      ITEM_REMOVE = "ITEM_REMOVE"
      INVARIANT_CHECKER_DELETION = "INVARIANT_CHECKER_DELETION"
      SCOPES_UPDATE = "SCOPES_UPDATE"
    end
  end
end
