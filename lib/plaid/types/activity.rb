# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Describes a consent activity.
    class Activity < Internal::Types::Model
      field :activity, -> { Plaid::Types::ActivityType }, optional: false, nullable: false

      field :initiated_date, -> { String }, optional: false, nullable: false

      field :id, -> { String }, optional: false, nullable: false

      field :initiator, -> { String }, optional: false, nullable: false

      field :state, -> { Plaid::Types::ActionState }, optional: false, nullable: false

      field :target_application_id, -> { String }, optional: true, nullable: false

      field :scopes, -> { Plaid::Types::ScopesNullable }, optional: true, nullable: true

      field :authentication, -> { Plaid::Types::ItemCreateAuthentication }, optional: true, nullable: false
    end
  end
end
