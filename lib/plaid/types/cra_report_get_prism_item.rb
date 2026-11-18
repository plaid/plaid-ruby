# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An Item used to generate `cra_prism`.
    class CraReportGetPrismItem < Internal::Types::Model
      field :institution_id, -> { String }, optional: false, nullable: false

      field :institution_name, -> { String }, optional: false, nullable: false

      field :item_id, -> { String }, optional: false, nullable: false

      field :last_updated_time, -> { String }, optional: false, nullable: false

      field :accounts, -> { Internal::Types::Array[Plaid::Types::CraReportGetPrismAccount] }, optional: false, nullable: false
    end
  end
end
