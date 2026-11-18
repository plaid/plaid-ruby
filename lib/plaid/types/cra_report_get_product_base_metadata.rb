# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Fields common to every /cra/report/get product's metadata.
    class CraReportGetProductBaseMetadata < Internal::Types::Model
      field :generated_time, -> { String }, optional: false, nullable: true

      field :item_count, -> { Integer }, optional: false, nullable: false

      field :account_count, -> { Integer }, optional: false, nullable: false

      field :institution_ids, -> { Internal::Types::Array[String] }, optional: false, nullable: false
    end
  end
end
