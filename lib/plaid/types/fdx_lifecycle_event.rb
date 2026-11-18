# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Details of consent or payment network identifier or other entity's revocation request or other lifecycle status
    # change event
    class FdxLifecycleEvent < Internal::Types::Model
      field :status, -> { Plaid::Types::FdxEventStatus }, optional: true, nullable: false

      field :reason, -> { Plaid::Types::FdxUpdateReason }, optional: true, nullable: false

      field :other_reason, -> { String }, optional: true, nullable: false, api_name: "otherReason"

      field :initiator, -> { Plaid::Types::FdxPartyType }, optional: true, nullable: false

      field :updated_time, -> { String }, optional: true, nullable: false, api_name: "updatedTime"
    end
  end
end
