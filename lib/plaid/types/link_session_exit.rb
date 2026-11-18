# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object representing an [onExit](https://plaid.com/docs/link/web/#onexit) callback from Link. If you are not
    # receiving this field and are instead receiving the deprecated `on_exit` field, contact your account manager to
    # update your integration.
    class LinkSessionExit < Internal::Types::Model
      field :error, -> { Plaid::Types::PlaidError }, optional: false, nullable: true

      field :metadata, -> { Plaid::Types::LinkSessionExitMetadata }, optional: false, nullable: true
    end
  end
end
