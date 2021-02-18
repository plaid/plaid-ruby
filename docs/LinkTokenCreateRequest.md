# Plaid::LinkTokenCreateRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **client_id** | **String** | Your Plaid API &#x60;client_id&#x60;. | [optional] |
| **secret** | **String** | Your Plaid API &#x60;secret&#x60;. | [optional] |
| **client_name** | **String** | The name of your application, as it should be displayed in Link. |  |
| **language** | **String** | The language that Link should be displayed in.  Supported languages are: - English (&#x60;&#39;en&#39;&#x60;) - French (&#x60;&#39;fr&#39;&#x60;) - Spanish (&#x60;&#39;es&#39;&#x60;) - Dutch (&#x60;&#39;nl&#39;&#x60;)  When using a Link customization, the language configured here must match the setting in the customization, or the customization will not be applied. |  |
| **country_codes** | [**Array&lt;CountryCode&gt;**](CountryCode.md) | Specify an array of Plaid-supported country codes using the ISO-3166-1 alpha-2 country code standard. Institutions from all listed countries will be shown.  Supported country codes are: &#x60;US&#x60;, &#x60;CA&#x60;, &#x60;ES&#x60;, &#x60;FR&#x60;, &#x60;GB&#x60;, &#x60;IE&#x60;, &#x60;NL&#x60;. Example value: &#x60;[&#39;US&#39;, &#39;CA&#39;]&#x60;.  If Link is launched with multiple country codes, only products that you are enabled for in all countries will be used by Link. Note that while all countries are enabled by default in Sandbox and Development, in Production only US and Canada are enabled by default. To gain access to European institutions in the Production environment, [file a product access Support ticket](https://dashboard.plaid.com/support/new/product-and-development/product-troubleshooting/request-product-access) via the Plaid dashboard. If you initialize with a European country code, your users will see the European consent panel during the Link flow.  If using a Link customization, make sure the country codes in the customization match those specified in &#x60;country_codes&#x60;. If both &#x60;country_codes&#x60; and a Link customization are used, the value in &#x60;country_codes&#x60; may override the value in the customization.  If using the Auth features Instant Match, Same-day Micro-deposits, or Automated Micro-deposits, &#x60;country_codes&#x60; must be set to &#x60;[&#39;US&#39;]&#x60;. |  |
| **user** | [**LinkTokenCreateRequestUser**](LinkTokenCreateRequestUser.md) |  |  |
| **products** | [**Array&lt;Products&gt;**](Products.md) | List of Plaid product(s) you wish to use. If launching Link in update mode, should be omitted; required otherwise. Valid products are:  &#x60;transactions&#x60;, &#x60;auth&#x60;, &#x60;identity&#x60;, &#x60;assets&#x60;, &#x60;investments&#x60;, &#x60;liabilities&#x60;, &#x60;payment_initiation&#x60;, &#x60;deposit_switch&#x60;  Example: &#x60;[&#39;auth&#39;, &#39;transactions&#39;]&#x60;  &#x60;balance&#x60; is *not* a valid value, the Balance product does not require explicit initalization and will automatically be initialized when any other product is initialized.  Only institutions that support *all* requested products will be shown in Link; to maximize the number of institutions listed, it is recommended to initialize Link with the minimal product set required for your use case. Additional products can be added after Link initialization by calling the relevant endpoints. For details and exceptions, see [Choosing when to initialize products](/docs/link/best-practices/#choosing-when-to-initialize-products).          In Production, you will be billed for each product that you specify when initializing Link. Note that a product cannot be removed from an Item once the Item has been initialized with that product. To stop billing on an Item for subscription-based products, such as Liabilities, Investments, and Transactions, remove the Item via &#x60;/item/remove&#x60;. | [optional] |
| **webhook** | **String** | The destination URL to which any webhooks should be sent. | [optional] |
| **access_token** | **String** | The &#x60;access_token&#x60; associated with the Item to update, used when updating or modifying an existing &#x60;access_token&#x60;. Used when launching Link in update mode, when completing the Same-day (manual) Micro-deposit flow, or (optionally) when initializing Link as part of the Payment Initiation (UK and Europe) flow. | [optional] |
| **link_customization_name** | **String** | The name of the Link customization from the Plaid Dashboard to be applied to Link. If not specified, the &#x60;default&#x60; customization will be used. When using a Link customization, the language in the customization must match the language selected via the &#x60;language&#x60; parameter, and the countries in the customization should match the country codes selected via &#x60;country_codes&#x60;. | [optional] |
| **redirect_uri** | **String** | A URI indicating the destination where a user should be forwarded after completing the Link flow; used to support OAuth authentication flows when launching Link in the browser or via a webview. The &#x60;redirect_uri&#x60; should not contain any query parameters. If &#x60;android_package_name&#x60; is specified, this field should be left blank. Any redirect URI specified here must also be added under the \&quot;Allowed redirect URIs\&quot; configuration on the [developer dashboard](https://dashboard.plaid.com/team/api). In non-Sandbox (Production and Development) environments, the &#x60;redirect_uri&#x60; must begin with https. | [optional] |
| **android_package_name** | **String** | The name of your app&#39;s Android package. Required if using the &#x60;link_token&#x60; to initialize Link on Android. When creating a &#x60;link_token&#x60; for initializing Link on other platforms, this field must be left blank. Any package name specified here must also be added to the Allowed Android package names setting on the [developer dashboard](https://dashboard.plaid.com/team/api).  | [optional] |
| **account_filters** | [**LinkTokenAccountFilters**](LinkTokenAccountFilters.md) |  | [optional] |
| **institution_id** | **String** | Used for certain legacy use cases | [optional] |
| **payment_initiation** | [**LinkTokenCreateRequestPaymentInitiation**](LinkTokenCreateRequestPaymentInitiation.md) |  | [optional] |
| **deposit_switch** | [**LinkTokenCreateRequestDepositSwitch**](LinkTokenCreateRequestDepositSwitch.md) |  | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::LinkTokenCreateRequest.new(
  client_id: null,
  secret: null,
  client_name: null,
  language: null,
  country_codes: null,
  user: null,
  products: null,
  webhook: null,
  access_token: null,
  link_customization_name: null,
  redirect_uri: null,
  android_package_name: null,
  account_filters: null,
  institution_id: null,
  payment_initiation: null,
  deposit_switch: null
)
```

