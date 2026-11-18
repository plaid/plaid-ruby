# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A detailed breakdown of the institution's performance for a request type. The values for `success`, `error_plaid`,
    # and `error_institution` sum to 1. The time range used for calculating the breakdown may range from the most recent
    # few minutes to the past six hours. In general, smaller institutions will show status that was calculated over a
    # longer period of time. For Investment updates, which are refreshed less frequently, the period assessed may be 24
    # hours or more. For more details, see [Institution status
    # details](https://plaid.com/docs/account/activity/#troubleshooting-institution-insights).
    class ProductStatusBreakdown < Internal::Types::Model
      field :success, -> { Float }, optional: false, nullable: false

      field :error_plaid, -> { Float }, optional: false, nullable: false

      field :error_institution, -> { Float }, optional: false, nullable: false

      field :refresh_interval, -> { Plaid::Types::ProductStatusBreakdownRefreshInterval }, optional: true, nullable: false
    end
  end
end
