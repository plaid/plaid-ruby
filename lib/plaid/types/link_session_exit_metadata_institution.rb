# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An institution object. If the Item was created via Same-Day or Instant micro-deposit verification, `name` and
    # `institution_id` will be omitted.
    class LinkSessionExitMetadataInstitution < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: false

      field :institution_id, -> { String }, optional: true, nullable: false
    end
  end
end
