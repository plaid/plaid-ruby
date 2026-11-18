# frozen_string_literal: true

module Plaid
  module Link
    module Types
      class LinkTokenGetRequest < Internal::Types::Model
        field :link_token, -> { String }, optional: false, nullable: false
      end
    end
  end
end
