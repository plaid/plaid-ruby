# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # REST application constraint (Hypermedia As The Engine Of Application State)
    class FdxHateoasLink < Internal::Types::Model
      field :href, -> { String }, optional: false, nullable: false

      field :action, -> { Plaid::Types::FdxHateoasLinkAction }, optional: true, nullable: false

      field :rel, -> { String }, optional: true, nullable: false

      field :types, -> { Internal::Types::Array[Plaid::Types::FdxContentTypes] }, optional: true, nullable: false
    end
  end
end
