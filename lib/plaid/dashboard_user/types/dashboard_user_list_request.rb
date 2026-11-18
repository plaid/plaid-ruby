# frozen_string_literal: true

module Plaid
  module DashboardUser
    module Types
      class DashboardUserListRequest < Internal::Types::Model
        field :cursor, -> { String }, optional: true, nullable: true
      end
    end
  end
end
