# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object representing an [onExit](https://plaid.com/docs/link/web/#onexit) callback from Link. This field is
    # returned only for legacy implementations and has been deprecated in favor of
    # [`exit`](https://plaid.com/docs/api/link/#link-token-get-response-link-sessions-exit), for improved naming
    # consistency. If you are receiving this field, contact your account manager to migrate to the newer `exit` field.
    class LinkSessionExitDeprecated < Internal::Types::Model
      field :error, -> { Plaid::Types::PlaidError }, optional: false, nullable: true

      field :metadata, -> { Plaid::Types::LinkSessionExitMetadata }, optional: false, nullable: true
    end
  end
end
