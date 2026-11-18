# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Specifies optional parameters for `/institutions/get_by_id`. If provided, must not be `null`.
    class InstitutionsGetByIDRequestOptions < Internal::Types::Model
      field :include_optional_metadata, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :include_status, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :include_auth_metadata, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :include_payment_initiation_metadata, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
