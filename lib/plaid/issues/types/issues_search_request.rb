# frozen_string_literal: true

module Plaid
  module Issues
    module Types
      class IssuesSearchRequest < Internal::Types::Model
        field :item_id, -> { String }, optional: true, nullable: false

        field :link_session_id, -> { String }, optional: true, nullable: false

        field :link_session_request_id, -> { String }, optional: true, nullable: false
      end
    end
  end
end
