# frozen_string_literal: true

module Plaid
  module Credit
    module Types
      class CreditRelayGetRequest < Internal::Types::Model
        field :relay_token, -> { String }, optional: false, nullable: false

        field :report_type, -> { Plaid::Types::ReportType }, optional: false, nullable: false

        field :include_insights, -> { Internal::Types::Boolean }, optional: true, nullable: false
      end
    end
  end
end
