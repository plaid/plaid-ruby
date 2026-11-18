# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Metadata about an event that occurred while the user was going through Link
    class LinkEventMetadata < Internal::Types::Model
      field :error_code, -> { String }, optional: true, nullable: false

      field :error_message, -> { String }, optional: true, nullable: false

      field :error_type, -> { String }, optional: true, nullable: false

      field :exit_status, -> { String }, optional: true, nullable: false

      field :institution_id, -> { String }, optional: true, nullable: false

      field :institution_name, -> { String }, optional: true, nullable: false

      field :institution_search_query, -> { String }, optional: true, nullable: false

      field :request_id, -> { String }, optional: true, nullable: false

      field :mfa_type, -> { String }, optional: true, nullable: false

      field :view_name, -> { String }, optional: true, nullable: false

      field :selection, -> { String }, optional: true, nullable: false

      field :brand_name, -> { String }, optional: true, nullable: false

      field :match_reason, -> { String }, optional: true, nullable: false

      field :routing_number, -> { String }, optional: true, nullable: false

      field :account_number_mask, -> { String }, optional: true, nullable: false
    end
  end
end
