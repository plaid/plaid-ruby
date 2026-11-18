# frozen_string_literal: true

module Plaid
  module Issues
    module Types
      class BetaIssuesV1ListRequest < Internal::Types::Model
        field :institution_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
