# frozen_string_literal: true

module Plaid
  module Transfer
    module Platform
      module Types
        class TransferPlatformPersonCreateRequest < Internal::Types::Model
          field :originator_client_id, -> { String }, optional: false, nullable: false

          field :name, -> { Plaid::Types::TransferPlatformPersonName }, optional: true, nullable: false

          field :email_address, -> { String }, optional: true, nullable: false

          field :phone_number, -> { String }, optional: true, nullable: false

          field :address, -> { Plaid::Types::TransferPlatformPersonAddress }, optional: true, nullable: false

          field :id_number, -> { Plaid::Types::TransferPlatformPersonIDNumber }, optional: true, nullable: false

          field :date_of_birth, -> { String }, optional: true, nullable: false

          field :relationship_to_originator, -> { String }, optional: true, nullable: false

          field :ownership_percentage, -> { Integer }, optional: true, nullable: false

          field :title, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
