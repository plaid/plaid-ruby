# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Information related to the financial institution.
    class LinkDeliveryInstitution < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: false

      field :institution_id, -> { String }, optional: true, nullable: false
    end
  end
end
