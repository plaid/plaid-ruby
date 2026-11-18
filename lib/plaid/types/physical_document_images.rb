# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # URLs for downloading original and cropped images for this document submission. The URLs are designed to only allow
    # downloading, not hot linking, so the URL will only serve the document image for 60 seconds before expiring. The
    # expiration time is 60 seconds after the `GET` request for the associated Identity Verification attempt. A new
    # expiring URL is generated with each request, so you can always rerequest the Identity Verification attempt if one
    # of your URLs expires.
    class PhysicalDocumentImages < Internal::Types::Model
      field :original_front, -> { String }, optional: false, nullable: true

      field :original_back, -> { String }, optional: false, nullable: true

      field :cropped_front, -> { String }, optional: false, nullable: true

      field :cropped_back, -> { String }, optional: false, nullable: true

      field :face, -> { String }, optional: false, nullable: true
    end
  end
end
