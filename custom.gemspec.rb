# frozen_string_literal: true

# Custom gemspec configuration file
# This file is automatically loaded by the main gemspec file. The 'spec' variable is available
# in this context from the main gemspec file. You can modify this file to add custom metadata,
# dependencies, or other gemspec configurations. If you do make changes to this file, you will
# need to add it to the .fernignore file to prevent your changes from being overwritten.

def add_custom_gemspec_data(spec)
  spec.homepage = "https://plaid.com"
  spec.license = "MIT"
  spec.metadata["source_code_uri"] = "https://github.com/plaid/plaid-ruby"
  spec.metadata["changelog_uri"] = "https://github.com/plaid/plaid-ruby/blob/master/CHANGELOG.md"
  spec.metadata["bug_tracker_uri"] = "https://github.com/plaid/plaid-ruby/issues"

  # Ship the library and its docs, not generator state or test fixtures.
  spec.files = spec.files.reject do |f|
    f.start_with?(".fern/", "wiremock/") ||
      %w[.fernignore .rubocop.yml .gitattributes custom.gemspec.rb].include?(f)
  end

  # BEGIN legacy SDK dependencies (managed by megabin openapi generate-legacy)
  spec.add_dependency "faraday", ">= 1.0.1", "< 3.0"
  spec.add_dependency "faraday-multipart", ">= 1.0.1", "< 2.0"
  # END legacy SDK dependencies
end
