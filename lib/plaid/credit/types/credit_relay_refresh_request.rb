# frozen_string_literal: true

module Plaid
  module Credit
    module Types
      class CreditRelayRefreshRequest < Internal::Types::Model
        field :relay_token, -> { String }, optional: false, nullable: false

        field :report_type, -> { Plaid::Types::ReportType }, optional: false, nullable: false

        field :webhook, -> { String }, optional: true, nullable: true
      end
    end
  end
end
