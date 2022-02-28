require_relative "test_helper"

# Internal: The test for Plaid::IncomeVerification.
class PlaidIncomeVerificationTest < PlaidTest
  def test_income_apis
    # Create an item with the "income" product.
    create_item initial_products: [:income]

    user = {
      first_name: "Jane",
      last_name: "Doe",
      email_address: "janedoe@gmail.com",
      home_address: {
        street: "234 First St.",
        city: "Anytown",
        region: "CA",
        postal_code: "12345",
        country: "US",
      },
    }
    employer = {
      name: "Plaid Inc.",
      tax_id: "123-45-6709",
      address: {
        street: "234 Work St.",
        city: "Anytown",
        region: "CA",
        postal_code: "12345",
        country: "US",
      },
      url: "http://www.employer.com"
    }

    request = Plaid::IncomeVerificationPrecheckRequest.new
    request.user = user
    request.employer = employer

    response = client.income_verification_precheck(request)

    assert_kind_of(Plaid::IncomeVerificationPrecheckResponse, response)


    income_verification_create_request = Plaid::IncomeVerificationCreateRequest.new
    income_verification_create_request.webhook = "YOUR WEB HOOK"

    response = client.income_verification_create(income_verification_create_request)
    refute_empty(response.income_verification_id)

    assert_kind_of(Plaid::IncomeVerificationCreateResponse, response)
    verification_id = response.income_verification_id

    request = Plaid::IncomeVerificationPaystubsGetRequest.new
    request.income_verification_id = verification_id
    response = client.income_verification_paystubs_get(request)
    assert_kind_of(Plaid::IncomeVerificationPaystubsGetResponse, response)

    request = Plaid::IncomeVerificationDocumentsDownloadRequest.new
    request.income_verification_id = verification_id
    request.access_token = access_token
    response = client.income_verification_documents_download(request)
    assert_equal(false, response.inspect.empty?)

    request = Plaid::IncomeVerificationTaxformsGetRequest.new
    request.income_verification_id = verification_id
    response = client.income_verification_taxforms_get(request)
    assert_kind_of(Plaid::IncomeVerificationTaxformsGetResponse, response)

# TODO: Need to re-enable this once /sandbox/public_token_create supports employment
#     request = Plaid::EmploymentVerificationGetRequest.new
#     request.access_token = access_token
#     response = client.employment_verification_get(request)
#     assert_kind_of(Plaid::EmploymentVerificationGetResponse, response)

  end
end

