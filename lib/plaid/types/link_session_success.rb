# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object representing an [onSuccess](https://plaid.com/docs/link/web/#onsuccess) callback from Link. This field
    # is returned only for legacy integrations and is deprecated in favor of
    # [`results.item_add_results`](https://plaid.com/docs/api/link/#link-token-get-response-link-sessions-results-item-add-results)
    # which can support multiple public tokens in a single Link session, for flows such as multi-Item Link. If you are
    # receiving `on_success`, contact your account manager to migrate to `results.item_add_results` instead.
    class LinkSessionSuccess < Internal::Types::Model
      field :public_token, -> { String }, optional: false, nullable: false

      field :metadata, -> { Plaid::Types::LinkSessionSuccessMetadata }, optional: false, nullable: true
    end
  end
end
