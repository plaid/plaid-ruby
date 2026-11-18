# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A representation of an Item within a Base Report.
    class BaseReportItem < Internal::Types::Model
      field :institution_name, -> { String }, optional: false, nullable: false

      field :institution_id, -> { String }, optional: false, nullable: false

      field :date_last_updated, -> { String }, optional: false, nullable: false

      field :item_id, -> { String }, optional: false, nullable: false

      field :accounts, -> { Internal::Types::Array[Plaid::Types::BaseReportAccount] }, optional: false, nullable: false
    end
  end
end
