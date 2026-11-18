# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The status of an institution is determined by the health of its Item logins, Transactions updates, Investments
    # updates, Liabilities updates, Auth requests, Balance requests, Identity requests, Investments requests, and
    # Liabilities requests. A login attempt is conducted during the initial Item add in Link. If there is not enough
    # traffic to accurately calculate an institution's status, Plaid will return null rather than potentially inaccurate
    # data.
    #
    # Institution status is accessible in the Dashboard and via the API using the `/institutions/get_by_id` endpoint
    # with the `options.include_status` option set to true. In the Sandbox environment, institution status is only
    # available for First Platypus Bank (`ins_109508`) and Houndstooth Bank (`ins_109512`).
    class InstitutionStatus < Internal::Types::Model
      field :item_logins, -> { Plaid::Types::ProductStatus }, optional: false, nullable: true

      field :transactions_updates, -> { Plaid::Types::ProductStatus }, optional: true, nullable: true

      field :auth, -> { Plaid::Types::ProductStatus }, optional: true, nullable: true

      field :identity, -> { Plaid::Types::ProductStatus }, optional: true, nullable: true

      field :investments_updates, -> { Plaid::Types::ProductStatus }, optional: true, nullable: true

      field :liabilities_updates, -> { Plaid::Types::ProductStatus }, optional: true, nullable: true

      field :liabilities, -> { Plaid::Types::ProductStatus }, optional: true, nullable: true

      field :investments, -> { Plaid::Types::ProductStatus }, optional: true, nullable: true

      field :health_incidents, -> { Internal::Types::Array[Plaid::Types::HealthIncident] }, optional: true, nullable: true
    end
  end
end
