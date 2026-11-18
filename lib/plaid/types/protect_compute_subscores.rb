# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Per-bucket subscores returned alongside the overall Trust Index score. For cash-advance models, each key maps to
    # an amount-bucket subscore (0-100); higher values indicate lower fraud risk. Only buckets that were scored are
    # included in the response.
    class ProtectComputeSubscores < Internal::Types::Model
      field :cash_advance_bucket025, -> { Integer }, optional: true, nullable: true, api_name: "cash_advance_bucket_0_25"

      field :cash_advance_bucket2550, -> { Integer }, optional: true, nullable: true, api_name: "cash_advance_bucket_25_50"

      field :cash_advance_bucket50100, -> { Integer }, optional: true, nullable: true, api_name: "cash_advance_bucket_50_100"

      field :cash_advance_bucket100200, -> { Integer }, optional: true, nullable: true, api_name: "cash_advance_bucket_100_200"

      field :cash_advance_bucket200300, -> { Integer }, optional: true, nullable: true, api_name: "cash_advance_bucket_200_300"

      field :cash_advance_bucket300400, -> { Integer }, optional: true, nullable: true, api_name: "cash_advance_bucket_300_400"

      field :cash_advance_bucket400500, -> { Integer }, optional: true, nullable: true, api_name: "cash_advance_bucket_400_500"
    end
  end
end
