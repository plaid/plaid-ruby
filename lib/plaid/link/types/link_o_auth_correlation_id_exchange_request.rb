# frozen_string_literal: true

module Plaid
  module Link
    module Types
      class LinkOAuthCorrelationIDExchangeRequest < Internal::Types::Model
        field :link_correlation_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
