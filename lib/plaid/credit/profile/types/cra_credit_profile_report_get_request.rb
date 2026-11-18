# frozen_string_literal: true

module Plaid
  module Credit
    module Profile
      module Types
        class CraCreditProfileReportGetRequest < Internal::Types::Model
          field :user_id, -> { String }, optional: false, nullable: false

          field :consumer_report_permissible_purpose, -> { Plaid::Types::ConsumerReportPermissiblePurpose }, optional: false, nullable: false

          field :client_report_id, -> { String }, optional: false, nullable: false

          field :report_type, -> { Plaid::Types::CraCreditProfileReportType }, optional: false, nullable: false

          field :inquiry_type, -> { Plaid::Types::CraCreditProfileInquiryType }, optional: false, nullable: false

          field :version, -> { Plaid::Types::CraCreditProfileReportVersion }, optional: false, nullable: false
        end
      end
    end
  end
end
