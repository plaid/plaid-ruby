# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The secrets for the newly created end customer.
    class PartnerEndCustomerSecrets < Internal::Types::Model
      field :sandbox, -> { String }, optional: true, nullable: false

      field :development, -> { String }, optional: true, nullable: false

      field :production, -> { String }, optional: true, nullable: false
    end
  end
end
