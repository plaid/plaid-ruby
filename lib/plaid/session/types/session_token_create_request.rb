# frozen_string_literal: true

module Plaid
  module Session
    module Types
      class SessionTokenCreateRequest < Internal::Types::Model
        field :template_id, -> { String }, optional: false, nullable: false

        field :user, -> { Plaid::Types::SessionTokenCreateRequestUser }, optional: true, nullable: false

        field :redirect_uri, -> { String }, optional: true, nullable: false

        field :android_package_name, -> { String }, optional: true, nullable: false

        field :webhook, -> { String }, optional: true, nullable: false

        field :user_id, -> { String }, optional: true, nullable: false
      end
    end
  end
end
