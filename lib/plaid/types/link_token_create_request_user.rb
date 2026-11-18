# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object specifying information about the end user who will be linking their account. **Required** if `user_id`
    # isn't included.
    class LinkTokenCreateRequestUser < Internal::Types::Model
      field :client_user_id, -> { String }, optional: false, nullable: false

      field :legal_name, -> { String }, optional: true, nullable: false

      field :name, -> { Plaid::Types::LinkTokenCreateRequestUserName }, optional: true, nullable: true

      field :phone_number, -> { String }, optional: true, nullable: false

      field :phone_number_verified_time, -> { String }, optional: true, nullable: true

      field :email_address, -> { String }, optional: true, nullable: false

      field :email_address_verified_time, -> { String }, optional: true, nullable: true

      field :ssn, -> { String }, optional: true, nullable: false

      field :date_of_birth, -> { String }, optional: true, nullable: true

      field :address, -> { Plaid::Types::LinkTokenCreateRequestUserAddress }, optional: true, nullable: true

      field :id_number, -> { Plaid::Types::LinkTokenCreateRequestUserIDNumber }, optional: true, nullable: true
    end
  end
end
