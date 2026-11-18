# frozen_string_literal: true

module Plaid
  module DashboardUser
    module Types
      class DashboardUserGetRequest < Internal::Types::Model
        field :dashboard_user_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
