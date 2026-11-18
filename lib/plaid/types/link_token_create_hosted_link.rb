# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Configuration parameters for Hosted Link. To enable the session for Hosted Link, send this object in the request.
    # It can be empty.
    class LinkTokenCreateHostedLink < Internal::Types::Model
      field :delivery_method, -> { Plaid::Types::HostedLinkDeliveryMethod }, optional: true, nullable: false

      field :completion_redirect_uri, -> { String }, optional: true, nullable: false

      field :url_lifetime_seconds, -> { Integer }, optional: true, nullable: false

      field :is_mobile_app, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
