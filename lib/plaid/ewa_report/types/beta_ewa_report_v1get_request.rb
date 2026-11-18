# frozen_string_literal: true

module Plaid
  module EwaReport
    module Types
      class BetaEwaReportV1GetRequest < Internal::Types::Model
        field :access_token, -> { String }, optional: false, nullable: false
      end
    end
  end
end
