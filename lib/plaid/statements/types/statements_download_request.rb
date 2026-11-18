# frozen_string_literal: true

module Plaid
  module Statements
    module Types
      class StatementsDownloadRequest < Internal::Types::Model
        field :access_token, -> { String }, optional: false, nullable: false

        field :statement_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
