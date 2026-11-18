# frozen_string_literal: true

module Plaid
  module Identity
    module Types
      class IdentityDocumentsUploadsGetRequest < Internal::Types::Model
        field :access_token, -> { String }, optional: false, nullable: false

        field :options, -> { Plaid::Types::IdentityDocumentsUploadsGetRequestOptions }, optional: true, nullable: false
      end
    end
  end
end
