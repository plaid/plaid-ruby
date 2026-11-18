# frozen_string_literal: true

module Plaid
  module Consent
    module Types
      class ConsentEventsGetRequest < Internal::Types::Model
        field :access_token, -> { String }, optional: false, nullable: false
      end
    end
  end
end
