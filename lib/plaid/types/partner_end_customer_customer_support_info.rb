# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # This information is public. Users of your app will see this information when managing connections between your app
    # and their bank accounts in Plaid Portal. Defaults to partner's customer support info if omitted. This field is
    # mandatory for partners whose Plaid accounts were created after November 26, 2024 and will be mandatory for all
    # partners by the 1033 compliance deadline.
    class PartnerEndCustomerCustomerSupportInfo < Internal::Types::Model
      field :email, -> { String }, optional: true, nullable: false

      field :phone_number, -> { String }, optional: true, nullable: false

      field :contact_url, -> { String }, optional: true, nullable: false

      field :link_update_url, -> { String }, optional: true, nullable: false
    end
  end
end
