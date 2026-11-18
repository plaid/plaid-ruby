# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Balance data for an account in a Home Lending VOA report. Omitted in the Employment Refresh format.
    class CraReportGetHomeLendingVoaAccountBalances < Internal::Types::Model
      field :available, -> { Float }, optional: false, nullable: true

      field :current, -> { Float }, optional: false, nullable: true

      field :iso_currency_code, -> { String }, optional: false, nullable: true

      field :unofficial_currency_code, -> { String }, optional: false, nullable: true

      field :most_recent_thirty_day_average_balance, -> { Float }, optional: false, nullable: true

      field :most_recent_sixty_day_average_balance, -> { Float }, optional: false, nullable: true
    end
  end
end
