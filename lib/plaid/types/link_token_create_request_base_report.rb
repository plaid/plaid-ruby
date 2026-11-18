# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Specifies options for initializing Link for use with the Base Report product. This field is required if `assets`
    # is included in the `products` array and the client is CRA-enabled.
    class LinkTokenCreateRequestBaseReport < Internal::Types::Model
      field :days_requested, -> { Integer }, optional: false, nullable: false

      field :client_report_id, -> { String }, optional: true, nullable: true
    end
  end
end
