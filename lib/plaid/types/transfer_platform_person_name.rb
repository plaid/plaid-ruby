# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The person's legal name
    class TransferPlatformPersonName < Internal::Types::Model
      field :given_name, -> { String }, optional: false, nullable: false

      field :family_name, -> { String }, optional: false, nullable: false
    end
  end
end
