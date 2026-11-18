# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An error object plus the `item_id` of an Item that the end user can repair via Link [update
    # mode](https://plaid.com/docs/link/update-mode). The `error_code` will be in the `ITEM_LOGIN_REQUIRED` family.
    class CheckReportRepairableItem < Internal::Types::Model
      field :error_type, -> { Plaid::Types::PlaidErrorType }, optional: false, nullable: false

      field :error_code, -> { String }, optional: false, nullable: false

      field :error_message, -> { String }, optional: false, nullable: false

      field :display_message, -> { String }, optional: false, nullable: true

      field :item_id, -> { String }, optional: false, nullable: false
    end
  end
end
