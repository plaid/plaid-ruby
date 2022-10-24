require_relative 'test_helper'

class PlaidSandboxTest < PlaidTest
    # rubocop:disable Metrics/MethodLength
    def test_sandbox_income_verification
        skip "TODO (czhou): unskip when tests are fixed"
        # test sandbox public token for income verification
        sandbox_public_token_create_request = Plaid::SandboxPublicTokenCreateRequest.new
        sandbox_public_token_create_request.institution_id = SANDBOX_INSTITUTION
        sandbox_public_token_create_request.initial_products = ["income_verification"]
        
        options_payload = {}
        options_payload[:income_verification] = {
            income_verification: {
                income_source_types: ["bank"],
                bank_income: {
                    days_requested: 180,
                }
            }
        }
        
        sandbox_public_token_create_request.options = options_payload

        public_token_response = client.sandbox_public_token_create(
        sandbox_public_token_create_request
        )

        refute_empty(public_token_response.to_hash)
        refute_empty(public_token_response.public_token)
    end
end
