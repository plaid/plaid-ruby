# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Specifies options for initializing Link for use with Payroll Income (including Document Income). Further
    # customization options for Document Income, such as customizing which document types may be uploaded, are also
    # available via the [Link Customization pane](https://dashboard.plaid.com/link) in the Dashboard. (Requires
    # Production enablement.)
    class LinkTokenCreateRequestIncomeVerificationPayrollIncome < Internal::Types::Model
      field :flow_types, -> { Internal::Types::Array[Plaid::Types::IncomeVerificationPayrollFlowType] }, optional: true, nullable: true

      field :is_update_mode, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :item_id_to_update, -> { String }, optional: true, nullable: true

      field :parsing_config, -> { Internal::Types::Array[Plaid::Types::IncomeVerificationDocParsingConfig] }, optional: true, nullable: true
    end
  end
end
