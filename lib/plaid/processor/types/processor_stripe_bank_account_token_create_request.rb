# frozen_string_literal: true

module Plaid
  module Processor
    module Types
      class ProcessorStripeBankAccountTokenCreateRequest < Internal::Types::Model
        field :access_token, -> { String }, optional: false, nullable: false

        field :account_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
