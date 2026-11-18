# frozen_string_literal: true

module Plaid
  module Issues
    module Types
      class BetaIssuesV1UnsubscribeRequest < Internal::Types::Model
        field :issue_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
