# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An account attached to the connected Item.
    class LinkSessionSuccessMetadataAccount < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false

      field :name, -> { String }, optional: true, nullable: false

      field :mask, -> { String }, optional: true, nullable: true

      field :type, -> { String }, optional: true, nullable: false

      field :subtype, -> { String }, optional: true, nullable: false

      field :verification_status, -> { String }, optional: true, nullable: true

      field :class_type, -> { String }, optional: true, nullable: true
    end
  end
end
