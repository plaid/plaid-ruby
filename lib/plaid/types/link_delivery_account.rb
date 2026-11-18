# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Information related to account attached to the connected Item
    class LinkDeliveryAccount < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false

      field :name, -> { String }, optional: true, nullable: false

      field :mask, -> { String }, optional: true, nullable: false

      field :type, -> { String }, optional: true, nullable: false

      field :subtype, -> { String }, optional: true, nullable: false

      field :verification_status, -> { Plaid::Types::LinkDeliveryVerificationStatus }, optional: true, nullable: false

      field :class_type, -> { String }, optional: true, nullable: false
    end
  end
end
