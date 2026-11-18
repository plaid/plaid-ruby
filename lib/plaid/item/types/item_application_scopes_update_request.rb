# frozen_string_literal: true

module Plaid
  module Item
    module Types
      class ItemApplicationScopesUpdateRequest < Internal::Types::Model
        field :access_token, -> { String }, optional: false, nullable: false

        field :application_id, -> { String }, optional: false, nullable: false

        field :scopes, -> { Plaid::Types::Scopes }, optional: false, nullable: false

        field :state, -> { String }, optional: true, nullable: false

        field :context, -> { Plaid::Types::ScopesContext }, optional: false, nullable: false
      end
    end
  end
end
