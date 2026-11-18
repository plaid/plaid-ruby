# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The legal name and other information for the account holder.  If the account has multiple account holders, provide
    # the information for the account holder on whose behalf the authorization is being requested. The `user.legal_name`
    # field is required. Other fields are optional (for `rfp` transfers, `address` is required, including `street`,
    # `city`, `region`, `postal_code`, and `country`), but if provided, they must be validly formatted and may be used
    # in Plaid's risk evaluation.
    class TransferAuthorizationUserInRequest < Internal::Types::Model
      field :legal_name, -> { String }, optional: false, nullable: false

      field :phone_number, -> { String }, optional: true, nullable: false

      field :email_address, -> { String }, optional: true, nullable: false

      field :address, -> { Plaid::Types::TransferUserAddressInRequest }, optional: true, nullable: false
    end
  end
end
