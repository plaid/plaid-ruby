# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The details of an Item add in Link.
    class CreditSessionItemAddResult < Internal::Types::Model
      field :public_token, -> { String }, optional: true, nullable: false

      field :item_id, -> { String }, optional: true, nullable: false

      field :institution_id, -> { String }, optional: true, nullable: false
    end
  end
end
