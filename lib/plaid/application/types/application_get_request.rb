# frozen_string_literal: true

module Plaid
  module Application
    module Types
      class ApplicationGetRequest < Internal::Types::Model
        field :application_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
