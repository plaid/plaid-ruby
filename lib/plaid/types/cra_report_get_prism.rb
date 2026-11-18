# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The Prism Data scores and insights for the user. Each field is present only when the corresponding version was
    # requested.
    class CraReportGetPrism < Internal::Types::Model
      field :insights, -> { Plaid::Types::CraReportGetPrismInsights }, optional: true, nullable: true

      field :cashscore, -> { Plaid::Types::CraReportGetPrismCashScore }, optional: true, nullable: true

      field :detect, -> { Plaid::Types::CraReportGetPrismDetect }, optional: true, nullable: true

      field :extend_, -> { Plaid::Types::CraReportGetPrismExtend }, optional: true, nullable: true, api_name: "extend"

      field :status, -> { Plaid::Types::CraReportGetPrismStatus }, optional: false, nullable: false
    end
  end
end
