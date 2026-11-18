# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Inputs for link session Trust Index models.
    class ProtectLinkModelInputs < Internal::Types::Model
      field :link_session_id, -> { String }, optional: false, nullable: false

      field :require_extracted_data, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
