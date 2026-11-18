# frozen_string_literal: true

module Plaid
  module Sandbox
    module Types
      class SandboxTransferTestClockListRequest < Internal::Types::Model
        field :start_virtual_time, -> { String }, optional: true, nullable: true

        field :end_virtual_time, -> { String }, optional: true, nullable: true

        field :count, -> { Integer }, optional: true, nullable: true

        field :offset, -> { Integer }, optional: true, nullable: false
      end
    end
  end
end
