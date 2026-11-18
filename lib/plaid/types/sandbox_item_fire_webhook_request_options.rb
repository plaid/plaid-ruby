# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Values to set on the fired webhook's payload. Each field is named after the webhook field it sets. If specified,
    # must not be `null`.
    class SandboxItemFireWebhookRequestOptions < Internal::Types::Model
      field :new_transactions, -> { Integer }, optional: true, nullable: false
    end
  end
end
