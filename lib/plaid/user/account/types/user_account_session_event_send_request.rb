# frozen_string_literal: true

module Plaid
  module User
    module Account
      module Types
        class UserAccountSessionEventSendRequest < Internal::Types::Model
          field :cohort_id, -> { String }, optional: true, nullable: false

          field :link_session_id, -> { String }, optional: false, nullable: false

          field :event, -> { Plaid::Types::UserAccountSessionEvent }, optional: false, nullable: false
        end
      end
    end
  end
end
