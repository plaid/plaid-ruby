# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Account information associated with a team member with access to the Plaid dashboard.
    class DashboardUserGetResponse < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :created_at, -> { String }, optional: false, nullable: false

      field :email_address, -> { String }, optional: false, nullable: false

      field :status, -> { Plaid::Types::DashboardUserStatus }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
