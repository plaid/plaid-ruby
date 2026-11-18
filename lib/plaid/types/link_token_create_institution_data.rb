# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A map containing data used to highlight institutions in Link.
    class LinkTokenCreateInstitutionData < Internal::Types::Model
      field :routing_number, -> { String }, optional: true, nullable: false

      field :institution_id, -> { String }, optional: true, nullable: false
    end
  end
end
