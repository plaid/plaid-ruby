# frozen_string_literal: true

module Plaid
  module Issues
    module Types
      class BetaIssuesV1SubscribeRequest < Internal::Types::Model
        field :issue_id, -> { String }, optional: false, nullable: false

        field :webhook, -> { String }, optional: false, nullable: false
      end
    end
  end
end
