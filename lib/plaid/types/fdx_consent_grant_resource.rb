# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # One permissioned resource on a consent grant.
    class FdxConsentGrantResource < Internal::Types::Model
      field :resource_type, -> { Plaid::Types::FdxConsentResourceType }, optional: false, nullable: false, api_name: "resourceType"

      field :resource_id, -> { String }, optional: false, nullable: false, api_name: "resourceId"

      field :data_clusters, -> { Internal::Types::Array[Plaid::Types::FdxDataCluster] }, optional: false, nullable: false, api_name: "dataClusters"
    end
  end
end
