# frozen_string_literal: true

module Plaid
  module OAuth
    module Types
      class OAuthTokenRequest < Internal::Types::Model
        field :grant_type, -> { Plaid::Types::OAuthGrantType }, optional: false, nullable: false

        field :client_secret, -> { String }, optional: true, nullable: false

        field :scope, -> { String }, optional: true, nullable: false

        field :refresh_token, -> { String }, optional: true, nullable: false

        field :resource, -> { String }, optional: true, nullable: false

        field :audience, -> { String }, optional: true, nullable: false

        field :subject_token, -> { String }, optional: true, nullable: false

        field :subject_token_type, -> { Plaid::Types::OAuthSubjectTokenType }, optional: true, nullable: false
      end
    end
  end
end
