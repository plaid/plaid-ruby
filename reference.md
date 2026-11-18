# Reference
## AssetReport
<details><summary><code>client.asset_report.<a href="/lib/plaid/asset_report/client.rb">create</a>(request) -> Plaid::Types::AssetReportCreateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/asset_report/create` endpoint initiates the process of creating an Asset Report, which can then be retrieved by passing the `asset_report_token` return value to the `/asset_report/get` or `/asset_report/pdf/get` endpoints.

The Asset Report takes some time to be created and is not available immediately after calling `/asset_report/create`. The exact amount of time to create the report will vary depending on how many days of history are requested and will typically range from a few seconds to about one minute. When the Asset Report is ready to be retrieved using `/asset_report/get` or `/asset_report/pdf/get`, Plaid will fire a `PRODUCT_READY` webhook. For full details of the webhook schema, see [Asset Report webhooks](https://plaid.com/docs/api/products/assets/#webhooks).

The `/asset_report/create` endpoint creates an Asset Report at a moment in time. Asset Reports are immutable. To get an updated Asset Report, use the `/asset_report/refresh` endpoint.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.asset_report.create(days_requested: 1)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**access_tokens:** `Internal::Types::Array[String]` — An array of access tokens corresponding to the Items that will be included in the report. The `assets` product must have been initialized for the Items during Link; the Assets product cannot be added after initialization.
    
</dd>
</dl>

<dl>
<dd>

**days_requested:** `Integer` 

The maximum integer number of days of history to include in the Asset Report. If using Fannie Mae Day 1 Certainty, `days_requested` must be at least 61 for new originations or at least 31 for refinancings.

An Asset Report requested with "Additional History" (that is, with more than 61 days of transaction history) will incur an Additional History fee.
    
</dd>
</dl>

<dl>
<dd>

**options:** `Plaid::Types::AssetReportCreateRequestOptions` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::AssetReport::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.asset_report.<a href="/lib/plaid/asset_report/client.rb">get</a>(request) -> Plaid::Types::AssetReportGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/asset_report/get` endpoint retrieves the Asset Report in JSON format. Before calling `/asset_report/get`, you must first create the Asset Report using `/asset_report/create` (or filter an Asset Report using `/asset_report/filter`) and then wait for the [`PRODUCT_READY`](https://plaid.com/docs/api/products/assets/#product_ready) webhook to fire, indicating that the Report is ready to be retrieved.

By default, an Asset Report includes transaction descriptions as returned by the bank, as opposed to parsed and categorized by Plaid. You can also receive cleaned and categorized transactions, as well as additional insights like merchant name or location information. We call this an Asset Report with Insights. An Asset Report with Insights provides transaction category, location, and merchant information in addition to the transaction strings provided in a standard Asset Report. To retrieve an Asset Report with Insights, call the `/asset_report/get` endpoint with `include_insights` set to `true`.

For latency-sensitive applications, you can optionally call `/asset_report/create` with `options.add_ons` set to `["fast_assets"]`. This will cause Plaid to create two versions of the Asset Report: one with only current and available balance and identity information, and then later on the complete Asset Report. You will receive separate webhooks for each version of the Asset Report.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.asset_report.get
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**asset_report_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**user_token:** `String` — The user token associated with the User for which to create an asset report for. The latest asset report associated with the User will be returned
    
</dd>
</dl>

<dl>
<dd>

**include_insights:** `Internal::Types::Boolean` — If `true`, retrieves the Asset Report with Insights.
    
</dd>
</dl>

<dl>
<dd>

**fast_report:** `Internal::Types::Boolean` — If `true`, retrieves the Fast Asset Report. If `false`, retrieves the Full Asset Report. To set this field to `true`, you must call `/asset_report/create` with `options.add_ons` set to `["fast_assets"]`.
    
</dd>
</dl>

<dl>
<dd>

**options:** `Plaid::Types::AssetReportGetRequestOptions` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::AssetReport::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.asset_report.<a href="/lib/plaid/asset_report/client.rb">get_pdf</a>(request) -> String</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/asset_report/pdf/get` endpoint retrieves the Asset Report in PDF format. Before calling `/asset_report/pdf/get`, you must first create the Asset Report using `/asset_report/create` (or filter an Asset Report using `/asset_report/filter`) and then wait for the [`PRODUCT_READY`](https://plaid.com/docs/api/products/assets/#product_ready) webhook to fire, indicating that the Report is ready to be retrieved.

The response to `/asset_report/pdf/get` is the PDF binary data. The `request_id`  is returned in the `Plaid-Request-ID` header.

[View a sample PDF Asset Report](https://plaid.com/documents/sample-asset-report.pdf).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.asset_report.get_pdf(asset_report_token: "asset_report_token")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**asset_report_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**options:** `Plaid::Types::AssetReportPdfGetRequestOptions` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::AssetReport::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.asset_report.<a href="/lib/plaid/asset_report/client.rb">refresh</a>(request) -> Plaid::Types::AssetReportRefreshResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

An Asset Report is an immutable snapshot of a user's assets. In order to "refresh" an Asset Report you created previously, you can use the `/asset_report/refresh` endpoint to create a new Asset Report based on the old one, but with the most recent data available.

The new Asset Report will contain the same Items as the original Report, as well as the same filters applied by any call to `/asset_report/filter`. By default, the new Asset Report will also use the same parameters you submitted with your original `/asset_report/create` request, but the original `days_requested` value and the values of any parameters in the `options` object can be overridden with new values. To change these arguments, simply supply new values for them in your request to `/asset_report/refresh`. Submit an empty string ("") for any previously-populated fields you would like set as empty.

Note: Asset Report refresh is not supported in Canada.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.asset_report.refresh(asset_report_token: "asset_report_token")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**asset_report_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**days_requested:** `Integer` — The maximum number of days of history to include in the Asset Report. Must be an integer. If not specified, the value from the original call to `/asset_report/create` will be used.
    
</dd>
</dl>

<dl>
<dd>

**options:** `Plaid::Types::AssetReportRefreshRequestOptions` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::AssetReport::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.asset_report.<a href="/lib/plaid/asset_report/client.rb">filter</a>(request) -> Plaid::Types::AssetReportFilterResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

By default, an Asset Report will contain all of the accounts on a given Item. In some cases, you may not want the Asset Report to contain all accounts. For example, you might have the end user choose which accounts are relevant in Link using the Account Select view, which you can enable in the dashboard. Or, you might always exclude certain account types or subtypes, which you can identify by using the `/accounts/get` endpoint. To narrow an Asset Report to only a subset of accounts, use the `/asset_report/filter` endpoint.

To exclude certain Accounts from an Asset Report, first use the `/asset_report/create` endpoint to create the report, then send the `asset_report_token` along with a list of `account_ids` to exclude to the `/asset_report/filter` endpoint, to create a new Asset Report which contains only a subset of the original Asset Report's data.

Because Asset Reports are immutable, calling `/asset_report/filter` does not alter the original Asset Report in any way; rather, `/asset_report/filter` creates a new Asset Report with a new token and id. Asset Reports created via `/asset_report/filter` do not contain new Asset data, and are not billed.

Plaid will fire a [`PRODUCT_READY`](https://plaid.com/docs/api/products/assets/#product_ready) webhook once generation of the filtered Asset Report has completed.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.asset_report.filter(
  asset_report_token: "asset_report_token",
  account_ids_to_exclude: ["account_ids_to_exclude"]
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**asset_report_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**account_ids_to_exclude:** `Internal::Types::Array[String]` — The accounts to exclude from the Asset Report, identified by `account_id`.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::AssetReport::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.asset_report.<a href="/lib/plaid/asset_report/client.rb">remove</a>(request) -> Plaid::Types::AssetReportRemoveResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/item/remove` endpoint allows you to invalidate an `access_token`, meaning you will not be able to create new Asset Reports with it. Removing an Item does not affect any Asset Reports or Audit Copies you have already created, which will remain accessible until you remove them specifically.

The `/asset_report/remove` endpoint allows you to remove access to an Asset Report. Removing an Asset Report invalidates its `asset_report_token`, meaning you will no longer be able to use it to access Report data or create new Audit Copies. Removing an Asset Report does not affect the underlying Items, but does invalidate any `audit_copy_tokens` associated with the Asset Report.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.asset_report.remove(asset_report_token: "asset_report_token")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**asset_report_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::AssetReport::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.asset_report.<a href="/lib/plaid/asset_report/client.rb">create_audit_copy</a>(request) -> Plaid::Types::AssetReportAuditCopyCreateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Plaid can provide an Audit Copy of any Asset Report directly to a participating third party on your behalf. For example, Plaid can supply an Audit Copy directly to the GSEs on your behalf if you participate in Fannie Mae's Day 1 Certainty™ program or utilize Freddie Mac's Loan Product Advisor® (LPA®) Asset and Income Modeler (AIM). An Audit Copy contains the same underlying data as the Asset Report.

To grant access to an Audit Copy, use the `/asset_report/audit_copy/create` endpoint to create an `audit_copy_token` and then pass that token to the third party who needs access. Each third party has its own `auditor_id`, for example `fannie_mae`. You'll need to create a separate Audit Copy for each third party to whom you want to grant access to the Report.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.asset_report.create_audit_copy(asset_report_token: "asset_report_token")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**asset_report_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**auditor_id:** `String` — The `auditor_id` of the third party with whom you would like to share the Asset Report.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::AssetReport::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.asset_report.<a href="/lib/plaid/asset_report/client.rb">get_audit_copy</a>(request) -> Plaid::Types::AssetReportGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

`/asset_report/audit_copy/get` allows auditors to get a copy of an Asset Report that was previously shared via the `/asset_report/audit_copy/create` endpoint.  The caller of `/asset_report/audit_copy/create` must provide the `audit_copy_token` to the auditor.  This token can then be used to call `/asset_report/audit_copy/get`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.asset_report.get_audit_copy(audit_copy_token: "audit_copy_token")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**audit_copy_token:** `String` — The `audit_copy_token` granting access to the Audit Copy you would like to get.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::AssetReport::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.asset_report.<a href="/lib/plaid/asset_report/client.rb">get_audit_copy_pdf</a>(request) -> String</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/asset_report/audit_copy/pdf/get` endpoint retrieves an Asset Report Audit Copy in PDF format. The caller must provide the `audit_copy_token` that was shared via the `/asset_report/audit_copy/create` endpoint.

The response to `/asset_report/audit_copy/pdf/get` is the PDF binary data. The `request_id` is returned in the `Plaid-Request-ID` header.

[View a sample PDF Asset Report](https://plaid.com/documents/sample-asset-report.pdf).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.asset_report.get_audit_copy_pdf(audit_copy_token: "audit_copy_token")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**audit_copy_token:** `String` — The `audit_copy_token` granting access to the Audit Copy you would like to get as a PDF.
    
</dd>
</dl>

<dl>
<dd>

**options:** `Plaid::Types::AssetReportPdfGetRequestOptions` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::AssetReport::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.asset_report.<a href="/lib/plaid/asset_report/client.rb">remove_audit_copy</a>(request) -> Plaid::Types::AssetReportAuditCopyRemoveResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/asset_report/audit_copy/remove` endpoint allows you to remove an Audit Copy. Removing an Audit Copy invalidates the `audit_copy_token` associated with it, meaning both you and any third parties holding the token will no longer be able to use it to access Report data. Items associated with the Asset Report, the Asset Report itself and other Audit Copies of it are not affected and will remain accessible after removing the given Audit Copy.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.asset_report.remove_audit_copy(audit_copy_token: "audit_copy_token")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**audit_copy_token:** `String` — The `audit_copy_token` granting access to the Audit Copy you would like to revoke.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::AssetReport::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## MonitoringInsights
<details><summary><code>client.monitoring_insights.<a href="/lib/plaid/monitoring_insights/client.rb">subscribe</a>(request) -> Plaid::Types::CraMonitoringInsightsSubscribeResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

This endpoint allows you to subscribe to insights for a user's linked CRA Item, which are updated between one and four times per day (best-effort). Only one Item per user may be subscribed. This endpoint is part of the legacy Cash Flow Updates product and is available only to integrations already using it; other integrations should use `/cra/servicing/subscription/create` instead.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.monitoring_insights.subscribe(webhook: "webhook")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**user_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**item_id:** `String` — The Item ID to subscribe for Cash Flow Updates.
    
</dd>
</dl>

<dl>
<dd>

**webhook:** `String` — URL to which Plaid will send Cash Flow Updates webhooks, for example when the requested Cash Flow Updates report is ready.
    
</dd>
</dl>

<dl>
<dd>

**income_categories:** `Internal::Types::Array[Plaid::Types::CreditBankIncomeCategory]` — Income categories to include in Cash Flow Updates. If empty or `null`, this field will default to including all possible categories.
    
</dd>
</dl>

<dl>
<dd>

**user_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::MonitoringInsights::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.monitoring_insights.<a href="/lib/plaid/monitoring_insights/client.rb">unsubscribe</a>(request) -> Plaid::Types::CraMonitoringInsightsUnsubscribeResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

This endpoint allows you to remove a subscription created by `/cra/monitoring_insights/subscribe`. This endpoint is part of the legacy Cash Flow Updates product and is available only to integrations already using it; other integrations should use `/cra/servicing/subscription/delete` instead.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.monitoring_insights.unsubscribe(subscription_id: "subscription_id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**subscription_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::MonitoringInsights::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.monitoring_insights.<a href="/lib/plaid/monitoring_insights/client.rb">get</a>(request) -> Plaid::Types::CraMonitoringInsightsGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

This endpoint allows you to retrieve a Cash Flow Updates report by passing in the `user_id` referred to in the webhook you received. This endpoint is part of the legacy Cash Flow Updates product and is available only to integrations already using it. CRA Servicing has no direct equivalent; other integrations should handle the `CRA_REPORT_UPDATED` webhook and pass its `report_id` to the relevant product `/get` endpoint, such as `/cra/check_report/base_report/get`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.monitoring_insights.get(consumer_report_permissible_purpose: "ACCOUNT_REVIEW_CREDIT")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**user_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**consumer_report_permissible_purpose:** `Plaid::Types::MonitoringConsumerReportPermissiblePurpose` 
    
</dd>
</dl>

<dl>
<dd>

**user_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::MonitoringInsights::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Credit
<details><summary><code>client.credit.<a href="/lib/plaid/credit/client.rb">update_audit_copy_token</a>(request) -> Plaid::Types::CreditAuditCopyTokenUpdateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/credit/audit_copy_token/update` endpoint updates an existing Audit Copy Token by adding the report tokens in the `report_tokens` field to the `audit_copy_token`. If the Audit Copy Token already contains a report of a certain type, it will be replaced with the token provided in the `report_tokens` field.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.credit.update_audit_copy_token(
  audit_copy_token: "audit_copy_token",
  report_tokens: ["report_tokens"]
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**audit_copy_token:** `String` — The `audit_copy_token` you would like to update.
    
</dd>
</dl>

<dl>
<dd>

**report_tokens:** `Internal::Types::Array[String]` — Array of tokens which the specified Audit Copy Token will be updated with. The types of token supported are asset report token and employment report token. There can be at most 1 of each token type in the array.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Credit::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.credit.<a href="/lib/plaid/credit/client.rb">get_sessions</a>(request) -> Plaid::Types::CreditSessionsGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

This endpoint can be used for your end users after they complete the Link flow. This endpoint returns a list of Link sessions that your user completed, where each session includes the results from the Link flow.

These results include details about the Item that was created and some product related metadata (showing, for example, whether the user finished the bank income verification step).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.credit.get_sessions
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**user_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**user_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Credit::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.credit.<a href="/lib/plaid/credit/client.rb">create_audit_copy_token</a>(request) -> Plaid::Types::CreditAuditCopyTokenCreateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Plaid can create an Audit Copy token of an Asset Report and/or Income Report to share with a participating Government-Sponsored Enterprise (GSE) if you participate in Fannie Mae's Day 1 Certainty™ program or utilize Freddie Mac's Loan Product Advisor® (LPA®) Asset and Income Modeler (AIM). An Audit Copy token contains the same underlying data as the Asset Report and/or Income Report (result of `/credit/payroll_income/get`).

Use the `/credit/audit_copy_token/create` endpoint to create an `audit_copy_token` and then pass that token to the GSE who needs access.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.credit.create_audit_copy_token(report_tokens: ["report_tokens"])
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**report_tokens:** `Internal::Types::Array[String]` — List of report tokens; can include at most one VOA/standard Asset Report tokens and one VOE Asset Report Token.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Credit::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.credit.<a href="/lib/plaid/credit/client.rb">remove_audit_copy_token</a>(request) -> Plaid::Types::CreditAuditCopyTokenRemoveResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/credit/audit_copy_token/remove` endpoint allows you to remove an Audit Copy. Removing an Audit Copy invalidates the `audit_copy_token` associated with it, meaning both you and any third parties holding the token will no longer be able to use it to access Report data. Items associated with the Report data and other Audit Copies of it are not affected and will remain accessible after removing the given Audit Copy.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.credit.remove_audit_copy_token(audit_copy_token: "audit_copy_token")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**audit_copy_token:** `String` — The `audit_copy_token` granting access to the Audit Copy you would like to revoke.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Credit::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.credit.<a href="/lib/plaid/credit/client.rb">get_asset_report_freddie_mac</a>(request) -> Plaid::Types::AssetReportFreddieGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/credit/asset_report/freddie_mac/get` endpoint retrieves the Asset Report in Freddie Mac's JSON format.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.credit.get_asset_report_freddie_mac(audit_copy_token: "audit_copy_token")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**audit_copy_token:** `String` — A token that can be shared with a third party auditor to allow them to obtain access to the Asset Report. This token should be stored securely.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Credit::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.credit.<a href="/lib/plaid/credit/client.rb">get_freddie_mac_reports</a>(request) -> Plaid::Types::CreditFreddieMacReportsGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/credit/freddie_mac/reports/get` endpoint retrieves the Verification of Assets and Verification of Employment reports.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.credit.get_freddie_mac_reports(audit_copy_token: "audit_copy_token")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**audit_copy_token:** `String` — A token that can be shared with a third party auditor to allow them to obtain access to the Asset Report. This token should be stored securely.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Credit::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.credit.<a href="/lib/plaid/credit/client.rb">get_bank_employment</a>(request) -> Plaid::Types::CreditBankEmploymentGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

`/beta/credit/v1/bank_employment/get` returns the employment report(s) derived from bank transaction data for a specified user.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.credit.get_bank_employment(user_token: "user_token")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**user_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Credit::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.credit.<a href="/lib/plaid/credit/client.rb">get_bank_income</a>(request) -> Plaid::Types::CreditBankIncomeGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

`/credit/bank_income/get` returns the bank income report(s) for a specified user. A single report corresponds to all institutions linked in a single Link session. To include multiple institutions in a single report, use [Multi-Item Link](https://plaid.com/docs/link/multi-item-link). To return older reports, use the `options.count` field.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.credit.get_bank_income
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**user_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**user_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**options:** `Plaid::Types::CreditBankIncomeGetRequestOptions` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Credit::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.credit.<a href="/lib/plaid/credit/client.rb">get_bank_income_pdf</a>(request) -> String</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

`/credit/bank_income/pdf/get` returns the most recent bank income report for a specified user in PDF format.  A single report corresponds to all institutions linked in a single Link session. To include multiple institutions in a single report, use [Multi-Item Link](https://plaid.com/docs/link/multi-item-link).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.credit.get_bank_income_pdf
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**user_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**user_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Credit::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.credit.<a href="/lib/plaid/credit/client.rb">refresh_bank_income</a>(request) -> Plaid::Types::CreditBankIncomeRefreshResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

`/credit/bank_income/refresh` is deprecated. The backend implementation was removed (returns an `Unimplemented` error at runtime), and the endpoint is no longer part of the documented API surface. To refresh Bank Income data for an existing user, send the user through Link's update mode so they can confirm their income sources. For a fully backend refresh, migrate to CRA Income Insights and call `/cra/check_report/create`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.credit.refresh_bank_income(user_token: "user_token")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**user_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**user_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**options:** `Plaid::Types::CreditBankIncomeRefreshRequestOptions` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Credit::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.credit.<a href="/lib/plaid/credit/client.rb">update_bank_income_webhook</a>(request) -> Plaid::Types::CreditBankIncomeWebhookUpdateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

`/credit/bank_income/webhook/update` is deprecated and no longer available; requests return an `INVALID_REQUEST` error with code `NOT_FOUND`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.credit.update_bank_income_webhook(
  user_token: "user_token",
  enable_webhooks: true
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**user_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**user_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**enable_webhooks:** `Internal::Types::Boolean` — Whether the user should be enabled for proactive webhook notifications when their income changes
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Credit::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.credit.<a href="/lib/plaid/credit/client.rb">update_payroll_income_parsing_config</a>(request) -> Plaid::Types::CreditPayrollIncomeParsingConfigUpdateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

`/credit/payroll_income/parsing_config/update` updates the parsing configuration for a document income verification.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.credit.update_payroll_income_parsing_config(parsing_config: ["ocr"])
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**user_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**user_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**item_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**parsing_config:** `Internal::Types::Array[Plaid::Types::IncomeVerificationDocParsingConfig]` — The types of analysis to enable for the document income verification session
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Credit::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.credit.<a href="/lib/plaid/credit/client.rb">get_bank_statements_uploads</a>(request) -> Plaid::Types::CreditBankStatementsUploadsGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

`/credit/bank_statements/uploads/get` returns parsed data from bank statements uploaded by users as part of the Document Income flow. If your account is not enabled for Document Parsing, contact your account manager to request access.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.credit.get_bank_statements_uploads
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**user_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**user_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**options:** `Plaid::Types::CreditBankStatementsUploadsGetRequestOptions` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Credit::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.credit.<a href="/lib/plaid/credit/client.rb">get_payroll_income</a>(request) -> Plaid::Types::CreditPayrollIncomeGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

This endpoint gets payroll income information for a specific user, either as a result of the user connecting to their payroll provider or uploading a pay related document.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.credit.get_payroll_income
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**user_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**user_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**options:** `Plaid::Types::CreditPayrollIncomeGetRequestOptions` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Credit::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.credit.<a href="/lib/plaid/credit/client.rb">get_payroll_income_risk_signals</a>(request) -> Plaid::Types::CreditPayrollIncomeRiskSignalsGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

`/credit/payroll_income/risk_signals/get` can be used as part of the Document Income flow to assess a user-uploaded document for signs of potential fraud or tampering. It returns a risk score for each uploaded document that indicates the likelihood of the document being fraudulent, in addition to details on the individual risk signals contributing to the score.

To trigger risk signal generation for an Item, call `/link/token/create` with `parsing_config` set to include `risk_signals`, or call `/credit/payroll_income/parsing_config/update`. Once risk signal generation has been triggered, `/credit/payroll_income/risk_signals/get` can be called at any time after the `INCOME_VERIFICATION_RISK_SIGNALS` webhook has been fired.

`/credit/payroll_income/risk_signals/get` is offered as an add-on to Document Income and is billed separately. To request access to this endpoint, submit a product access request or contact your Plaid account manager.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.credit.get_payroll_income_risk_signals
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**user_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**user_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Credit::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.credit.<a href="/lib/plaid/credit/client.rb">precheck_payroll_income</a>(request) -> Plaid::Types::CreditPayrollIncomePrecheckResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

`/credit/payroll_income/precheck` is an optional endpoint that can be called before initializing a Link session for income verification. It evaluates whether a given user is supportable by digital income verification. If the user is eligible for digital verification, that information will be associated with the user token, and in this way will generate a Link UI optimized for the end user and their specific employer. If the user cannot be confirmed as eligible, the user can still use the income verification flow, but they may be required to manually upload a paystub to verify their income.

While all request fields are optional, providing `employer` data will increase the chance of receiving a useful result.

When testing in Sandbox, you can control the results by providing special test values in the `access_tokens` field. `access_good` and `access_bad` will result in `HIGH` and `LOW` confidence values, respectively. Any other valid Sandbox access token will result in `UNKNOWN` confidence; other strings return an `INVALID_ACCESS_TOKEN` error.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.credit.precheck_payroll_income
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**user_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**user_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**access_tokens:** `Internal::Types::Array[String]` — An array of access tokens corresponding to Items belonging to the user whose eligibility is being checked. Note that if the Items specified here are not already initialized with `transactions`, providing them in this field will cause these Items to be initialized with (and billed for) the Transactions product.
    
</dd>
</dl>

<dl>
<dd>

**employer:** `Plaid::Types::IncomeVerificationPrecheckEmployer` 
    
</dd>
</dl>

<dl>
<dd>

**us_military_info:** `Plaid::Types::IncomeVerificationPrecheckMilitaryInfo` 
    
</dd>
</dl>

<dl>
<dd>

**payroll_institution:** `Plaid::Types::IncomeVerificationPrecheckPayrollInstitution` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Credit::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.credit.<a href="/lib/plaid/credit/client.rb">get_employment</a>(request) -> Plaid::Types::CreditEmploymentGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

`/credit/employment/get` returns a list of items with employment information from a user's payroll provider that was verified by an end user.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.credit.get_employment
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**user_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**user_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Credit::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.credit.<a href="/lib/plaid/credit/client.rb">refresh_payroll_income</a>(request) -> Plaid::Types::CreditPayrollIncomeRefreshResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

`/credit/payroll_income/refresh` refreshes a given digital payroll income verification.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.credit.refresh_payroll_income
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**user_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**user_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**options:** `Plaid::Types::CreditPayrollIncomeRefreshRequestOptions` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Credit::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.credit.<a href="/lib/plaid/credit/client.rb">create_relay</a>(request) -> Plaid::Types::CreditRelayCreateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Plaid can share an Asset Report directly with a participating third party on your behalf. The shared Asset Report is the exact same Asset Report originally created in `/asset_report/create`.

To grant a third party access to an Asset Report, use the `/credit/relay/create` endpoint to create a `relay_token` and then pass that token to your third party. Each third party has its own `secondary_client_id`; for example, `ce5bd328dcd34123456`. You'll need to create a separate `relay_token` for each third party that needs access to the report on your behalf.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.credit.create_relay(
  report_tokens: ["report_tokens"],
  secondary_client_id: "secondary_client_id"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**report_tokens:** `Internal::Types::Array[String]` — List of report token strings, with at most one token of each report type. Currently only Asset Report token is supported.
    
</dd>
</dl>

<dl>
<dd>

**secondary_client_id:** `String` — The `secondary_client_id` is the client id of the third party with whom you would like to share the relay token.
    
</dd>
</dl>

<dl>
<dd>

**webhook:** `String` — URL to which Plaid will send webhooks when the Secondary Client successfully retrieves an Asset Report by calling `/credit/relay/get`.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Credit::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.credit.<a href="/lib/plaid/credit/client.rb">get_relay</a>(request) -> Plaid::Types::AssetReportGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

`/credit/relay/get` allows third parties to receive a report that was shared with them, using a `relay_token` that was created by the report owner.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.credit.get_relay(
  relay_token: "relay_token",
  report_type: "asset"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**relay_token:** `String` — The `relay_token` granting access to the report you would like to get.
    
</dd>
</dl>

<dl>
<dd>

**report_type:** `Plaid::Types::ReportType` 
    
</dd>
</dl>

<dl>
<dd>

**include_insights:** `Internal::Types::Boolean` — `true` if you would like to retrieve the Asset Report with Insights, `false` otherwise. This field defaults to `false` if omitted.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Credit::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.credit.<a href="/lib/plaid/credit/client.rb">get_relay_pdf</a>(request) -> String</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

`/credit/relay/pdf/get` allows third parties to receive a PDF report that was shared with them, using a `relay_token` that was created by the report owner.

The `/credit/relay/pdf/get` endpoint retrieves the Asset Report in PDF format. Before calling `/credit/relay/pdf/get`, you must first create the Asset Report using `/credit/relay/create` and then wait for the [`PRODUCT_READY`](https://plaid.com/docs/api/products/assets/#product_ready) webhook to fire, indicating that the Report is ready to be retrieved.

The response to `/credit/relay/pdf/get` is the PDF binary data. The `request_id` is returned in the `Plaid-Request-ID` header.

[View a sample PDF Asset Report](https://plaid.com/documents/sample-asset-report.pdf).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.credit.get_relay_pdf(
  relay_token: "relay_token",
  report_type: "asset"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**relay_token:** `String` — The `relay_token` granting access to the report you would like to get.
    
</dd>
</dl>

<dl>
<dd>

**report_type:** `Plaid::Types::ReportType` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Credit::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.credit.<a href="/lib/plaid/credit/client.rb">refresh_relay</a>(request) -> Plaid::Types::CreditRelayRefreshResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/credit/relay/refresh` endpoint allows third parties to refresh a report that was relayed to them, using a `relay_token` that was created by the report owner. A new report will be created with the original report parameters, but with the most recent data available based on the `days_requested` value of the original report.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.credit.refresh_relay(
  relay_token: "relay_token",
  report_type: "asset"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**relay_token:** `String` — The `relay_token` granting access to the report you would like to refresh.
    
</dd>
</dl>

<dl>
<dd>

**report_type:** `Plaid::Types::ReportType` 
    
</dd>
</dl>

<dl>
<dd>

**webhook:** `String` — The URL registered to receive webhooks when the report of a relay token has been refreshed.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Credit::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.credit.<a href="/lib/plaid/credit/client.rb">remove_relay</a>(request) -> Plaid::Types::CreditRelayRemoveResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/credit/relay/remove` endpoint allows you to invalidate a `relay_token`. The third party holding the token will no longer be able to access or refresh the reports which the `relay_token` gives access to. The original report, associated Items, and other relay tokens that provide access to the same report are not affected and will remain accessible after removing the given `relay_token`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.credit.remove_relay(relay_token: "relay_token")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**relay_token:** `String` — The `relay_token` you would like to revoke.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Credit::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## CheckReport
<details><summary><code>client.check_report.<a href="/lib/plaid/check_report/client.rb">get_income_insights</a>(request) -> Plaid::Types::CraCheckReportIncomeInsightsGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

This endpoint allows you to retrieve the Income Insights report for your user. You should call this endpoint after you've received a `CHECK_REPORT_READY` or a `USER_CHECK_REPORT_READY` webhook, either after the Link session for the user or after calling `/cra/check_report/create`. If the most recent consumer report for the user doesn't have sufficient data to generate the report, or the consumer report has expired, you will receive an error indicating that you should create a new consumer report by calling `/cra/check_report/create`.

NOTE: The following schema was updated in April 2026 to reflect the response when the provided version is "II2". Please see [this document](https://docs.google.com/document/d/1kQkQ7FOgFaC4n-sUGUk74hoXZNY_L_nJeCuMe7Keip4/edit?tab=t.0#heading=h.rudamzinus2i) for guidance on migrating to II2 if you are currently using the II1 version, and [this section](https://docs.google.com/document/d/1kQkQ7FOgFaC4n-sUGUk74hoXZNY_L_nJeCuMe7Keip4/edit?tab=t.0#bookmark=id.tdcc2wpk0h60) for an example II1 response along with its [documentation](https://docs.google.com/document/d/1kQkQ7FOgFaC4n-sUGUk74hoXZNY_L_nJeCuMe7Keip4/edit?tab=t.36c85n2ircqk#heading=h.79dwr5c1iszl).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.check_report.get_income_insights
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**user_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**third_party_user_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**user_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**options:** `Plaid::Types::CraCheckReportIncomeInsightsGetOptions` 
    
</dd>
</dl>

<dl>
<dd>

**report_id:** `String` — The CRA report token (formatted `cra-report-<env>-<uuid>`) identifying a specific consumer report. When provided alongside `consumer_report_permissible_purpose`, pins retrieval to that report and stamps its permissible purpose. If omitted, the most recently generated report for the user is returned.
    
</dd>
</dl>

<dl>
<dd>

**consumer_report_permissible_purpose:** `Plaid::Types::CraCheckReportPermissiblePurpose` — The permissible purpose under which the consumer report is being retrieved.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::CheckReport::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.check_report.<a href="/lib/plaid/check_report/client.rb">get_base_report</a>(request) -> Plaid::Types::CraCheckReportBaseReportGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

This endpoint allows you to retrieve the Base Report for your user, allowing you to receive comprehensive bank account and cash flow data. You should call this endpoint after you've received a `CHECK_REPORT_READY` or a `USER_CHECK_REPORT_READY` webhook, either after the Link session for the user or after calling `/cra/check_report/create`. If the most recent consumer report for the user doesn't have sufficient data to generate the base report, or the consumer report has expired, you will receive an error indicating that you should create a new consumer report by calling `/cra/check_report/create`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.check_report.get_base_report
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**user_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**third_party_user_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**item_ids:** `Internal::Types::Array[String]` — The Item IDs to include in the Base Report. If not provided, all Items associated with the user will be included.
    
</dd>
</dl>

<dl>
<dd>

**user_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**user_tier:** `Plaid::Types::CraUserTier` 
    
</dd>
</dl>

<dl>
<dd>

**report_id:** `String` — The CRA report token (formatted `cra-report-<env>-<uuid>`) identifying a specific consumer report. When provided alongside `consumer_report_permissible_purpose`, pins retrieval to that report and stamps its permissible purpose. If omitted, the most recently generated report for the user is returned.
    
</dd>
</dl>

<dl>
<dd>

**consumer_report_permissible_purpose:** `Plaid::Types::CraCheckReportPermissiblePurpose` — The permissible purpose under which the consumer report is being retrieved.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::CheckReport::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.check_report.<a href="/lib/plaid/check_report/client.rb">get_pdf</a>(request) -> String</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

`/cra/check_report/pdf/get` retrieves the most recent Consumer Report in PDF format. The most recent Base Report for the user is always included. Use the `add_ons` field to also include the most recent Income Insights, Partner Insights or LendScore report in the PDF.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.check_report.get_pdf
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**user_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**third_party_user_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**add_ons:** `Internal::Types::Array[Plaid::Types::CraPdfAddOns]` — Use this field to include the most recent Income Insights, Partner Insights, or LendScore report in the PDF.
    
</dd>
</dl>

<dl>
<dd>

**user_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::CheckReport::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.check_report.<a href="/lib/plaid/check_report/client.rb">create</a>(request) -> Plaid::Types::CraCheckReportCreateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use `/cra/check_report/create` to refresh data in an existing report. A Consumer Report will last for 24 hours before expiring; you should call any `/get` endpoints on the report before it expires. If a report expires, you can call `/cra/check_report/create` again to re-generate it and refresh the data in the report. The report is generated from all Items associated with the user, excluding [duplicate Items](https://plaid.com/docs/check/add-to-app/#duplicate-items) and Items that cannot supply data.

Each call to `/cra/check_report/create` creates a new, independent report. `/get` endpoints will retrieve the most recently created report for the requested user.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.check_report.create(
  webhook: "webhook",
  days_requested: 1,
  consumer_report_permissible_purpose: "ACCOUNT_REVIEW_CREDIT"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**user_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**user_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**webhook:** `String` — The destination URL to which webhooks will be sent
    
</dd>
</dl>

<dl>
<dd>

**days_requested:** `Integer` — The number of days of data to request for the report. Maximum is 731; minimum is 180. If a value lower than 180 is provided, a minimum of 180 days of history will be requested.
    
</dd>
</dl>

<dl>
<dd>

**days_required:** `Integer` — The minimum number of days of data required for the report to be successfully generated.
    
</dd>
</dl>

<dl>
<dd>

**client_report_id:** `String` — Client-generated identifier, which can be used by lenders to track loan applications.
    
</dd>
</dl>

<dl>
<dd>

**products:** `Internal::Types::Array[Plaid::Types::Products]` — Specifies a list of products to generate when creating the report (in addition to the Base Report, which is always generated except for requests for only `cra_network_insights` or for FICO-only Partner Insights). These products will be made available before a success webhook is sent. Note that specifying `cra_partner_insights` in this field will trigger a billable event. Other products are not billed until the respective reports are retrieved via their product-specific `/get` endpoints.
    
</dd>
</dl>

<dl>
<dd>

**base_report:** `Plaid::Types::CraCheckReportCreateBaseReportOptions` 
    
</dd>
</dl>

<dl>
<dd>

**cashflow_insights:** `Plaid::Types::CraCheckReportCreateCashflowInsightsOptions` 
    
</dd>
</dl>

<dl>
<dd>

**partner_insights:** `Plaid::Types::CraCheckReportCreatePartnerInsightsOptions` 
    
</dd>
</dl>

<dl>
<dd>

**lend_score:** `Plaid::Types::CraCheckReportCreateLendScoreOptions` 
    
</dd>
</dl>

<dl>
<dd>

**network_insights:** `Plaid::Types::CraCheckReportCreateNetworkInsightsOptions` 
    
</dd>
</dl>

<dl>
<dd>

**include_investments:** `Internal::Types::Boolean` — Indicates that investment data should be extracted from the linked account(s).
    
</dd>
</dl>

<dl>
<dd>

**income_insights:** `Plaid::Types::CraCheckReportCreateIncomeInsightsOptions` 
    
</dd>
</dl>

<dl>
<dd>

**consumer_report_permissible_purpose:** `Plaid::Types::ConsumerReportPermissiblePurpose` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::CheckReport::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.check_report.<a href="/lib/plaid/check_report/client.rb">get_partner_insights</a>(request) -> Plaid::Types::CraCheckReportPartnerInsightsGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

This endpoint allows you to retrieve the Partner Insights report for your user. You should call this endpoint after you've received a `CHECK_REPORT_READY` or a `USER_CHECK_REPORT_READY` webhook, either after the Link session for the user or after calling `/cra/check_report/create`. If the most recent consumer report for the user doesn't have sufficient data to generate the report, or the consumer report has expired, you will receive an error indicating that you should create a new consumer report by calling `/cra/check_report/create`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.check_report.get_partner_insights
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**user_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**third_party_user_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**user_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**user_tier:** `Plaid::Types::CraUserTier` 
    
</dd>
</dl>

<dl>
<dd>

**partner_insights:** `Plaid::Types::CraCheckReportPartnerInsightsGetPartnerInsights` 
    
</dd>
</dl>

<dl>
<dd>

**options:** `Plaid::Types::CraCheckReportPartnerInsightsGetOptions` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::CheckReport::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.check_report.<a href="/lib/plaid/check_report/client.rb">get_cashflow_insights</a>(request) -> Plaid::Types::CraCheckReportCashflowInsightsGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

This endpoint allows you to retrieve the Cashflow Insights report for your user. You should call this endpoint after you've received a `CHECK_REPORT_READY` or a `USER_CHECK_REPORT_READY` webhook, either after the Link session for the user or after calling `/cra/check_report/create`. If the most recent consumer report for the user doesn't have sufficient data to generate the report, or the consumer report has expired, you will receive an error indicating that you should create a new consumer report by calling `/cra/check_report/create`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.check_report.get_cashflow_insights
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**user_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**third_party_user_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**user_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**options:** `Plaid::Types::CraCheckReportCashflowInsightsGetOptions` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::CheckReport::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.check_report.<a href="/lib/plaid/check_report/client.rb">get_lend_score</a>(request) -> Plaid::Types::CraCheckReportLendScoreGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

This endpoint allows you to retrieve the LendScore report for your user. You should call this endpoint after you've received a `CHECK_REPORT_READY` or a `USER_CHECK_REPORT_READY` webhook, either after the Link session for the user or after calling `/cra/check_report/create`. If the most recent consumer report for the user doesn't have sufficient data to generate the report, or the consumer report has expired, you will receive an error indicating that you should create a new consumer report by calling `/cra/check_report/create`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.check_report.get_lend_score
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**user_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**third_party_user_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**user_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**options:** `Plaid::Types::CraCheckReportLendScoreGetOptions` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::CheckReport::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.check_report.<a href="/lib/plaid/check_report/client.rb">get_network_insights</a>(request) -> Plaid::Types::CraCheckReportNetworkInsightsGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

This endpoint allows you to retrieve the Network Insights report for your user. You should call this endpoint after you've received a `CHECK_REPORT_READY` or a `USER_CHECK_REPORT_READY` webhook, either after the Link session for the user or after calling `/cra/check_report/create`. If the most recent consumer report for the user doesn't have sufficient data to generate the report, or the consumer report has expired, you will receive an error indicating that you should create a new consumer report by calling `/cra/check_report/create`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.check_report.get_network_insights
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**user_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**options:** `Plaid::Types::CraCheckReportNetworkInsightsGetOptions` 
    
</dd>
</dl>

<dl>
<dd>

**third_party_user_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**user_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::CheckReport::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.check_report.<a href="/lib/plaid/check_report/client.rb">get_verification</a>(request) -> Plaid::Types::CraCheckReportVerificationGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

This endpoint allows you to retrieve home lending reports for a user. To obtain a VoA or Employment Refresh report, you need to make sure that `cra_base_report` is included in the `products` parameter when calling `/link/token/create` or `/cra/check_report/create`.

You should call this endpoint after you've received a `CHECK_REPORT_READY` or a `USER_CHECK_REPORT_READY` webhook, either after the Link session for the user or after calling `/cra/check_report/create`.

If the most recent consumer report for the user doesn't have sufficient data to generate the report, or the consumer report has expired, you will receive an error indicating that you should create a new consumer report by calling `/cra/check_report/create`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.check_report.get_verification(reports_requested: ["VOA"])
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**user_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**reports_requested:** `Internal::Types::Array[Plaid::Types::CraCheckReportVerificationGetReportType]` — Specifies which types of home lending reports are expected in the response
    
</dd>
</dl>

<dl>
<dd>

**employment_refresh_options:** `Plaid::Types::CraCheckReportVerificationGetEmploymentRefreshOptions` 
    
</dd>
</dl>

<dl>
<dd>

**user_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::CheckReport::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.check_report.<a href="/lib/plaid/check_report/client.rb">get_verification_pdf</a>(request) -> String</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/cra/check_report/verification/pdf/get` endpoint retrieves the most recent Consumer Report in PDF format, specifically formatted for Home Lending verification use cases. Before calling this endpoint, ensure that you've created a VOA report through Link or the `/cra/check_report/create` endpoint, and have received a `CHECK_REPORT_READY` or a `USER_CHECK_REPORT_READY` webhook.

The response to `/cra/check_report/verification/pdf/get` is the PDF binary data. The `request_id`  is returned in the `Plaid-Request-ID` header.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.check_report.get_verification_pdf
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**user_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**third_party_user_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**report_requested:** `Plaid::CheckReport::Types::CraCheckReportVerificationPdfGetRequestReportRequested` — Deprecated. Use `reports_requested` instead.
    
</dd>
</dl>

<dl>
<dd>

**reports_requested:** `Internal::Types::Array[Plaid::Types::CraCheckReportVerificationPdfReportType]` — Specifies which types of verification reports to include in the returned PDF. Supported combinations are: `[voa]`, `[employment_refresh]`, `[income]`, or `[voa, income]`. Other combinations are not supported.
    
</dd>
</dl>

<dl>
<dd>

**hide_gse_details:** `Internal::Types::Boolean` — If `true`, the GSE identifiers (the Report ID and `gse_reference_id`) are omitted from the returned Home Lending Report PDF. Defaults to `false`. These identifiers are always present in the `/cra/check_report/verification/get` JSON response regardless of this field.
    
</dd>
</dl>

<dl>
<dd>

**user_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::CheckReport::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Loans
<details><summary><code>client.loans.<a href="/lib/plaid/loans/client.rb">register_applications</a>(request) -> Plaid::Types::CraLoansApplicationsRegisterResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

`/cra/loans/applications/register` registers loan applications and decisions.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.loans.register_applications(applications: [{
  user_token: "user_token",
  application_id: "application_id",
  type: "PERSONAL",
  decision: "APPROVED"
}])
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**applications:** `Internal::Types::Array[Plaid::Types::CraLoanApplication]` — A list of loan applications to register.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Loans::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.loans.<a href="/lib/plaid/loans/client.rb">register</a>(request) -> Plaid::Types::CraLoansRegisterResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

`/cra/loans/register` registers a list of loans to their applicants.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.loans.register(loans: [{
  user_token: "user_token",
  loan_id: "loan_id",
  type: "PERSONAL",
  payment_schedule: "DAILY",
  opened_date: "2023-01-15",
  opened_with_status: {
    status: "APPROVED",
    date: "2023-01-15"
  }
}])
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**loans:** `Internal::Types::Array[Plaid::Types::CraLoanRegister]` — A list of loans to register.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Loans::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.loans.<a href="/lib/plaid/loans/client.rb">update</a>(request) -> Plaid::Types::CraLoansUpdateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

`/cra/loans/update` updates loan information such as the status and payment history.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.loans.update(loans: [{}])
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**loans:** `Internal::Types::Array[Plaid::Types::CraLoanUpdate]` — A list of loans to update.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Loans::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.loans.<a href="/lib/plaid/loans/client.rb">unregister</a>(request) -> Plaid::Types::CraLoanUnregisterResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

`/cra/loans/unregister` indicates the loans have reached a final status and no further updates are expected.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.loans.unregister(loans: [{
  loan_id: "loan_id",
  closed_with_status: {
    status: "APPROVED",
    date: "2023-01-15"
  }
}])
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**loans:** `Internal::Types::Array[Plaid::Types::CraLoanUnregister]` — A list of loans to unregister.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Loans::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## CraReport
<details><summary><code>client.cra_report.<a href="/lib/plaid/cra_report/client.rb">create</a>(request) -> Plaid::Types::CraReportCreateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

`/cra/report/create` generates a Consumer Report for a user. With `scope` set to `PLAID_NETWORK`, the report is generated from the Plaid Network view of the user's profile. With `CLIENT_USER`, the report is generated from only the Items the user linked to your client.

Each requested product is generated asynchronously. Use the returned `report_id` to retrieve the report once its products are ready.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.cra_report.create(
  user_id: "user_id",
  products: [],
  scope: "PLAID_NETWORK",
  decision_stage: "PREQUALIFICATION",
  consumer_report_permissible_purpose: "ACCOUNT_REVIEW_CREDIT"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**user_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**products:** `Internal::Types::Array[Plaid::Types::CraReportProduct]` — The Plaid Check products, versions, and options to generate for the report.
    
</dd>
</dl>

<dl>
<dd>

**scope:** `Plaid::CraReport::Types::CraReportCreateRequestScope` — Determines which Items are used to generate the report. `PLAID_NETWORK` uses the Plaid Network view of the user's profile. `CLIENT_USER` uses only the Items linked by this client.
    
</dd>
</dl>

<dl>
<dd>

**decision_stage:** `Plaid::Types::CraReportDecisionStage` 
    
</dd>
</dl>

<dl>
<dd>

**consumer_report_permissible_purpose:** `Plaid::CraReport::Types::CraReportCreateRequestConsumerReportPermissiblePurpose` 

Describes the reason you are generating a Consumer Report for this user. The purpose must be one of the allowable permissible purposes for the `decision_stage`.

`EXTENSION_OF_CREDIT`: In connection with a credit transaction initiated by and involving the consumer pursuant to FCRA Section 604(a)(3)(A).

`LEGITIMATE_BUSINESS_NEED_TENANT_SCREENING`: For a legitimate business need in connection with a business transaction initiated by the consumer primarily for personal, family, or household purposes in connection with a property rental assessment pursuant to FCRA Section 604(a)(3)(F)(i).

`LEGITIMATE_BUSINESS_NEED_OTHER`: For a legitimate business need in connection with a business transaction made primarily for personal, family, or household initiated by the consumer pursuant to FCRA Section 604(a)(3)(F)(i).

`WRITTEN_INSTRUCTION_PREQUALIFICATION`: In accordance with the written instructions of the consumer pursuant to FCRA Section 604(a)(2), to evaluate an application's profile to make an offer to the consumer.

`WRITTEN_INSTRUCTION_OTHER`: In accordance with the written instructions of the consumer pursuant to FCRA Section 604(a)(2), such as when an individual agrees to act as a guarantor or assumes personal liability for a consumer, business, or commercial loan.

`ELIGIBILITY_FOR_GOVT_BENEFITS`: In connection with an eligibility determination for a government benefit where the entity is required to consider an applicant's financial status pursuant to FCRA Section 604(a)(3)(D).

`INSURANCE_UNDERWRITING`: In connection with the underwriting of insurance involving the consumer pursuant to FCRA Section 604(a)(3)(C).
    
</dd>
</dl>

<dl>
<dd>

**client_report_id:** `String` — Client-generated identifier, which can be used by lenders to track loan applications.
    
</dd>
</dl>

<dl>
<dd>

**days_requested:** `Integer` — The number of days of history to include in Plaid Check products. Maximum is 731. If a value lower than 180 is provided, a minimum of 180 days of history will be requested.
    
</dd>
</dl>

<dl>
<dd>

**days_required:** `Integer` — The minimum number of days of data required for the report to be successfully generated.
    
</dd>
</dl>

<dl>
<dd>

**include_investments:** `Internal::Types::Boolean` — Indicates that investment data should be extracted from the linked account(s).
    
</dd>
</dl>

<dl>
<dd>

**include_identity_match:** `Internal::Types::Boolean` — Indicates that identity match results should be included for all products in the report that contain identity information. Defaults to `false`.
    
</dd>
</dl>

<dl>
<dd>

**webhook:** `String` — The destination URL to which the report's webhooks will be sent.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::CraReport::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.cra_report.<a href="/lib/plaid/cra_report/client.rb">get</a>(request) -> Plaid::Types::CraReportGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

`/cra/report/get` retrieves a Consumer Report for a user.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.cra_report.get(
  user_id: "user_id",
  products: [],
  decision_stage: "PREQUALIFICATION",
  consumer_report_permissible_purpose: "ACCOUNT_REVIEW_CREDIT"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**user_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**products:** `Internal::Types::Array[Plaid::Types::CraReportGetRequestProduct]` — The requested products and their versions, e.g. `[{"product":"cra_income_insights","version":"V2"}]`.
    
</dd>
</dl>

<dl>
<dd>

**scope:** `Plaid::Types::CraReportScope` 
    
</dd>
</dl>

<dl>
<dd>

**decision_stage:** `Plaid::Types::CraReportDecisionStage` 
    
</dd>
</dl>

<dl>
<dd>

**consumer_report_permissible_purpose:** `Plaid::CraReport::Types::CraReportGetRequestConsumerReportPermissiblePurpose` 

Describes the reason you are generating a Consumer Report for this user. The purpose must be one of the allowable permissible purposes for the `decision_stage`.

`EXTENSION_OF_CREDIT`: In connection with a credit transaction initiated by and involving the consumer pursuant to FCRA Section 604(a)(3)(A).

`LEGITIMATE_BUSINESS_NEED_TENANT_SCREENING`: For a legitimate business need in connection with a business transaction initiated by the consumer primarily for personal, family, or household purposes in connection with a property rental assessment pursuant to FCRA Section 604(a)(3)(F)(i).

`LEGITIMATE_BUSINESS_NEED_OTHER`: For a legitimate business need in connection with a business transaction made primarily for personal, family, or household initiated by the consumer pursuant to FCRA Section 604(a)(3)(F)(i).

`WRITTEN_INSTRUCTION_PREQUALIFICATION`: In accordance with the written instructions of the consumer pursuant to FCRA Section 604(a)(2), to evaluate an application's profile to make an offer to the consumer.

`WRITTEN_INSTRUCTION_OTHER`: In accordance with the written instructions of the consumer pursuant to FCRA Section 604(a)(2), such as when an individual agrees to act as a guarantor or assumes personal liability for a consumer, business, or commercial loan.

`ELIGIBILITY_FOR_GOVT_BENEFITS`: In connection with an eligibility determination for a government benefit where the entity is required to consider an applicant's financial status pursuant to FCRA Section 604(a)(3)(D).

`INSURANCE_UNDERWRITING`: In connection with the underwriting of insurance involving the consumer pursuant to FCRA Section 604(a)(3)(C).
    
</dd>
</dl>

<dl>
<dd>

**report_id:** `String` — A unique ID identifying a Consumer Report. Like all Plaid identifiers, this ID is case sensitive. Required when `scope` is `CLIENT_USER`. When provided, that specific report is returned. Otherwise, the most recent report matching the request is returned. Omit this field when retrieving a report without a prior `/cra/report/create` or `/link/token/create` request.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::CraReport::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## ConsumerReport
<details><summary><code>client.consumer_report.<a href="/lib/plaid/consumer_report/client.rb">get_pdf</a>(request) -> String</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves all existing CRB Bank Income and Base reports for the consumer in PDF format.

Response is PDF binary data. The `request_id` is returned in the `Plaid-Request-ID` header.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.consumer_report.get_pdf(user_token: "user_token")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**user_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::ConsumerReport::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## OAuth
<details><summary><code>client.o_auth.<a href="/lib/plaid/o_auth/client.rb">token</a>(request) -> Plaid::Types::OAuthTokenResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

`/oauth/token` issues an access token and refresh token depending on the `grant_type` provided. This endpoint supports `Content-Type: application/x-www-form-urlencoded` as well as JSON. The fields for the form are equivalent to the fields for JSON and conform to the OAuth 2.0 specification.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.o_auth.token(grant_type: "refresh_token")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**grant_type:** `Plaid::Types::OAuthGrantType` 
    
</dd>
</dl>

<dl>
<dd>

**client_secret:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**scope:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**refresh_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**resource:** `String` — URI of the target resource server
    
</dd>
</dl>

<dl>
<dd>

**audience:** `String` 

Used when exchanging a token. The meaning depends on the `subject_token_type`:

- For `urn:plaid:params:tokens:user`: Must be the same as the `client_id`.
- For `urn:plaid:params:oauth:user-token`: The other `client_id` to exchange tokens to.
- For `urn:plaid:params:credit:multi-user`:  a `client_id` or one of the supported CRA partner URNs: `urn:plaid:params:cra-partner:experian`, `urn:plaid:params:cra-partner:fannie-mae`, or `urn:plaid:params:cra-partner:freddie-mac`.
    
</dd>
</dl>

<dl>
<dd>

**subject_token:** `String` — Token representing the subject. The meaning depends on the `subject_token_type`. For `urn:plaid:params:tokens:user`, the `subject_token` must be a Plaid-issued user token from the `/user/create` endpoint. For `urn:plaid:params:oauth:user-token`, the `subject_token` must be an OAuth refresh token issued from the `/oauth/token` endpoint.
    
</dd>
</dl>

<dl>
<dd>

**subject_token_type:** `Plaid::Types::OAuthSubjectTokenType` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::OAuth::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.o_auth.<a href="/lib/plaid/o_auth/client.rb">introspect</a>(request) -> Plaid::Types::OAuthIntrospectResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

`/oauth/introspect` returns metadata about an access token or refresh token.

Note: This endpoint supports `Content-Type: application/x-www-form-urlencoded` as well as JSON. The fields for the form are equivalent to the fields for JSON and conform to the OAuth 2.0 specification.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.o_auth.introspect(token: "token")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**client_secret:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::OAuth::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.o_auth.<a href="/lib/plaid/o_auth/client.rb">revoke</a>(request) -> Plaid::Types::OAuthRevokeResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

`/oauth/revoke` revokes an access or refresh token, preventing any further use. If a refresh token is revoked, all access and refresh tokens derived from it are also revoked, including exchanged tokens.

Note: This endpoint supports `Content-Type: application/x-www-form-urlencoded` as well as JSON. The fields for the form are equivalent to the fields for JSON and conform to the OAuth 2.0 specification.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.o_auth.revoke(token: "token")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**client_secret:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::OAuth::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Statements
<details><summary><code>client.statements.<a href="/lib/plaid/statements/client.rb">list</a>(request) -> Plaid::Types::StatementsListResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/statements/list` endpoint retrieves a list of all statements associated with an Item.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.statements.list(access_token: "access_token")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**access_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Statements::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.statements.<a href="/lib/plaid/statements/client.rb">download</a>(request) -> String</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/statements/download` endpoint retrieves a single statement PDF in binary format.  The response will contain a `Plaid-Content-Hash` header containing a SHA 256 checksum of the statement. This can be used to verify that the file being sent by Plaid is the same file that was downloaded to your system.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.statements.download(
  access_token: "access_token",
  statement_id: "statement_id"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**access_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**statement_id:** `String` — Plaid's unique identifier for the statement.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Statements::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.statements.<a href="/lib/plaid/statements/client.rb">refresh</a>(request) -> Plaid::Types::StatementsRefreshResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

`/statements/refresh` initiates an on-demand extraction to fetch the statements for the provided dates.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.statements.refresh(
  access_token: "access_token",
  start_date: "2023-01-15",
  end_date: "2023-01-15"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**access_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**start_date:** `String` — The start date for statements, in "YYYY-MM-DD" format, e.g. "2023-08-30". To determine whether a statement falls within the specified date range, Plaid will use the statement posted date. The statement posted date is typically either the last day of the statement period, or the following day.
    
</dd>
</dl>

<dl>
<dd>

**end_date:** `String` — The end date for statements, in "YYYY-MM-DD" format, e.g. "2023-10-30". You can request up to two years of data. To determine whether a statement falls within the specified date range, Plaid will use the statement posted date. The statement posted date is typically either the last day of the statement period, or the following day.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Statements::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Consent
<details><summary><code>client.consent.<a href="/lib/plaid/consent/client.rb">get_events</a>(request) -> Plaid::Types::ConsentEventsGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

List a historical log of Item consent events. Consent logs are only available for events occurring on or after November 7, 2024. Extremely recent events (occurring within the past 12 hours) may not be available via this endpoint. Up to three years of consent logs will be available via the endpoint.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.consent.get_events(access_token: "access_token")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**access_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Consent::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Item
<details><summary><code>client.item.<a href="/lib/plaid/item/client.rb">list_activity</a>(request) -> Plaid::Internal::CursorItemIterator</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

List a historical log of user consent events

Returns a `Plaid::Internal::CursorItemIterator` that yields each `Plaid::Types::Activity` in the `activities` field of every page, requesting pages as they are needed. Call `pages` on it to get each page as a `Plaid::Types::ItemActivityListResponse`, including its other fields.

No request is sent by this call. The first page is requested when you start iterating (or call `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.item.list_activity
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**access_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` — Cursor used for pagination.
    
</dd>
</dl>

<dl>
<dd>

**count:** `Integer` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Item::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.item.<a href="/lib/plaid/item/client.rb">list_applications</a>(request) -> Plaid::Types::ItemApplicationListResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

List a user's connected applications
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.item.list_applications
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**access_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Item::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.item.<a href="/lib/plaid/item/client.rb">unlink_application</a>(request) -> Plaid::Types::ItemApplicationUnlinkResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Unlink a user's connected application. On an unlink request, Plaid will immediately revoke the Application's access to the User's data.  The User will have to redo the OAuth authentication process in order to restore functionality.

This endpoint only removes ongoing data access permissions, therefore the User will need to reach out to the Application itself in order to disable and delete their account and delete any data that the Application already received (if the Application does not do so by default).

This endpoint should be called in real time as the User is unlinking an Application, and should not be batched in order to ensure that the change is reflected as soon as possible.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.item.unlink_application(
  access_token: "access_token",
  application_id: "application_id"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**access_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**application_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Item::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.item.<a href="/lib/plaid/item/client.rb">update_application_scopes</a>(request) -> Plaid::Types::ItemApplicationScopesUpdateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Enable consumers to update product access on selected accounts for an application.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.item.update_application_scopes(
  access_token: "access_token",
  application_id: "application_id",
  scopes: {},
  context: "ENROLLMENT"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**access_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**application_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**scopes:** `Plaid::Types::Scopes` 
    
</dd>
</dl>

<dl>
<dd>

**state:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**context:** `Plaid::Types::ScopesContext` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Item::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.item.<a href="/lib/plaid/item/client.rb">get</a>(request) -> Plaid::Types::ItemGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns information about the status of an Item.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.item.get(access_token: "access_token")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**access_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Item::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.item.<a href="/lib/plaid/item/client.rb">remove</a>(request) -> Plaid::Types::ItemRemoveResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/item/remove` endpoint allows you to remove an Item. Once removed, the `access_token`, as well as any processor tokens or bank account tokens associated with the Item, is no longer valid and cannot be used to access any data that was associated with the Item.

Calling `/item/remove` is a recommended best practice when offboarding users or if a user chooses to disconnect an account linked via Plaid. For subscription products, such as Transactions, Liabilities, and Investments, calling `/item/remove` is required to end subscription billing for the Item, unless the end user revoked permission (e.g. via [https://my.plaid.com/](https://my.plaid.com/)). For more details, see [Subscription fee model](https://plaid.com/docs/account/billing/#subscription-fee).

On a Trial plan, calling `/item/remove` does not impact the number of remaining Trial Items (bank connections) you have available.

Removing an Item does not affect any Asset Reports or Audit Copies you have already created, which will remain accessible until you remove access to them specifically using the `/asset_report/remove` endpoint.

Also note that for certain OAuth-based institutions, an Item removed via `/item/remove` may still show as an active connection in the institution's OAuth permission manager.

API versions 2019-05-29 and earlier return a `removed` boolean as part of the response.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.item.remove(access_token: "access_token")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**access_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**reason_code:** `Plaid::Types::ItemRemoveReasonCode` 
    
</dd>
</dl>

<dl>
<dd>

**reason_note:** `String` — Additional context or details about the reason for removing the Item. Personally identifiable information, such as an email address or phone number, should not be included in the `reason_note`.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Item::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.item.<a href="/lib/plaid/item/client.rb">terminate_products</a>(request) -> Plaid::Types::ItemProductsTerminateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/item/products/terminate` endpoint allows you to terminate an Item. Once terminated, the `access_token` associated with the Item is no longer valid, billing for the Item's products is ended, and relevant webhooks are fired.

`/item/products/terminate` is the recommended way to offboard users or disconnect accounts linked via Plaid.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.item.terminate_products(
  access_token: "access_token",
  reason_code: "FRAUD_FIRST_PARTY"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**access_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**reason_code:** `Plaid::Types::ProductsTerminateReasonCode` 
    
</dd>
</dl>

<dl>
<dd>

**reason_note:** `String` — Additional context or details about the reason for terminating products on the Item. Personally identifiable information, such as an email address or phone number, should not be included in the `reason_note`.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Item::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.item.<a href="/lib/plaid/item/client.rb">update_webhook</a>(request) -> Plaid::Types::ItemWebhookUpdateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The POST `/item/webhook/update` allows you to update the webhook URL associated with an Item. This request triggers a [`WEBHOOK_UPDATE_ACKNOWLEDGED`](https://plaid.com/docs/api/items/#webhook_update_acknowledged) webhook to the newly specified webhook URL.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.item.update_webhook(access_token: "access_token")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**access_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**webhook:** `String` — The new webhook URL to associate with the Item. To remove a webhook from an Item, set to `null`.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Item::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.item.<a href="/lib/plaid/item/client.rb">invalidate_access_token</a>(request) -> Plaid::Types::ItemAccessTokenInvalidateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

By default, the `access_token` associated with an Item does not expire and should be stored in a persistent, secure manner.

You can use the `/item/access_token/invalidate` endpoint to rotate the `access_token` associated with an Item. The endpoint returns a new `access_token` and immediately invalidates the previous `access_token`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.item.invalidate_access_token(access_token: "access_token")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**access_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Item::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.item.<a href="/lib/plaid/item/client.rb">exchange_public_token</a>(request) -> Plaid::Types::ItemPublicTokenExchangeResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Exchange a Link `public_token` for an API `access_token`. Link hands off the `public_token` client-side via the `onSuccess` callback once a user has successfully created an Item. The `public_token` is ephemeral and expires after 30 minutes. An `access_token` does not expire, but can be revoked by calling `/item/remove`.

The response also includes an `item_id` that should be stored with the `access_token`. The `item_id` is used to identify an Item in a webhook. The `item_id` can also be retrieved by making an `/item/get` request.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.item.exchange_public_token(public_token: "public_token")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**public_token:** `String` — Your `public_token`, obtained from the Link `onSuccess` callback or `/sandbox/public_token/create`.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Item::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.item.<a href="/lib/plaid/item/client.rb">create_public_token</a>(request) -> Plaid::Types::ItemPublicTokenCreateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Note: As of July 2020, the `/item/public_token/create` endpoint is deprecated. Instead, use `/link/token/create` with an `access_token` to create a Link token for use with [update mode](https://plaid.com/docs/link/update-mode).

If you need your user to take action to restore or resolve an error associated with an Item, generate a public token with the `/item/public_token/create` endpoint and then initialize Link with that `public_token`.

A `public_token` is one-time use and expires after 30 minutes. You use a `public_token` to initialize Link in [update mode](https://plaid.com/docs/link/update-mode) for a particular Item. You can generate a `public_token` for an Item even if you did not use Link to create the Item originally.

The `/item/public_token/create` endpoint is **not** used to create your initial `public_token`. If you have not already received an `access_token` for a specific Item, use Link to obtain your `public_token` instead. See the [Quickstart](https://plaid.com/docs/quickstart) for more information.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.item.create_public_token(access_token: "access_token")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**access_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Item::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.item.<a href="/lib/plaid/item/client.rb">import</a>(request) -> Plaid::Types::ItemImportResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

`/item/import` creates an Item for one of your customers and returns an `access_token`, which the other Permissions Manager endpoints take in place of a customer identifier. You supply your own identifier for the customer as `user_auth.user_id`.

The endpoint is idempotent and the `access_token` it returns is long-lived: repeated calls for the same `user_auth.user_id` return the same token.

Upon creating an Item via `/item/import`, Plaid will automatically begin an extraction of that Item through the data provider API endpoints you have already integrated.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.item.import(user_auth: {
  user_id: "user_id"
})
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**institution_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**products:** `Internal::Types::Array[Plaid::Types::Products]` — Array of product strings. Sent only by a Plaid-internal caller, the Data Partner Dashboard validation tool; external callers never need it. Not required for Permissions Manager callers, who authenticate with `user_auth.user_id`.
    
</dd>
</dl>

<dl>
<dd>

**user_auth:** `Plaid::Types::ItemImportRequestUserAuth` 
    
</dd>
</dl>

<dl>
<dd>

**options:** `Plaid::Types::ItemImportRequestOptions` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Item::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Application
<details><summary><code>client.application.<a href="/lib/plaid/application/client.rb">get</a>(request) -> Plaid::Types::ApplicationGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Allows financial institutions to retrieve information about Plaid clients for the purpose of building control-tower experiences
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.application.get(application_id: "application_id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**application_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Application::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Profile
<details><summary><code>client.profile.<a href="/lib/plaid/profile/client.rb">get_network_status</a>(request) -> Plaid::Types::ProfileNetworkStatusGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/profile/network_status/get` endpoint can be used to check whether Plaid has a matching profile for the user.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.profile.get_network_status(user: {
  phone_number: "phone_number"
})
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**user:** `Plaid::Types::NetworkStatusGetUser` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Profile::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Network
<details><summary><code>client.network.<a href="/lib/plaid/network/client.rb">get_status</a>(request) -> Plaid::Types::NetworkStatusGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/network/status/get` endpoint can be used to check whether Plaid has a matching profile for the user.
This is useful for determining if a user is eligible for a streamlined experience, such as Layer. To access this endpoint, contact your Plaid account manager.

Note: it is strongly recommended to check for Layer eligibility in the frontend. `/network/status/get` should only be used for checking Layer eligibility if a frontend check is not possible for your use case.
For instructions on performing a frontend eligibility check, see the [Layer documentation](https://plaid.com/docs/layer/#integration-overview).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.network.get_status(user: {
  phone_number: "phone_number"
})
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**user:** `Plaid::Types::NetworkStatusGetUser` 
    
</dd>
</dl>

<dl>
<dd>

**template_id:** `String` — The id of a template defined in Plaid Dashboard. This field is used if you have additional criteria that you want to check against (e.g. Layer eligibility).
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Network::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Auth
<details><summary><code>client.auth.<a href="/lib/plaid/auth/client.rb">get</a>(request) -> Plaid::Types::AuthGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/auth/get` endpoint returns the bank account and bank identification numbers (such as routing numbers, for US accounts) associated with an Item's checking, savings, and cash management accounts, along with high-level account data and balances when available.

Versioning note: In API version 2017-03-08, the schema of the `numbers` object returned by this endpoint is substantially different. For details, see [Plaid API versioning](https://plaid.com/docs/api/versioning/#version-2018-05-22).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.auth.get(access_token: "access_token")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**access_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**options:** `Plaid::Types::AuthGetRequestOptions` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Auth::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.auth.<a href="/lib/plaid/auth/client.rb">verify</a>(request) -> Plaid::Types::AuthVerifyResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/auth/verify` endpoint verifies bank account and routing numbers and (optionally) account owner names against Plaid's database via [Database Auth](https://plaid.com/docs/auth/coverage/database-auth/). It can be used to verify account numbers that were not collected via the Plaid Link flow.

This endpoint is currently in Early Availability; contact sales or your Plaid account manager to request access.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.auth.verify(numbers: {
  ach: {
    account: "account",
    routing: "routing"
  }
})
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**legal_name:** `String` — Account owner's legal name
    
</dd>
</dl>

<dl>
<dd>

**numbers:** `Plaid::Types::AuthVerifyRequestNumbers` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Auth::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Transactions
<details><summary><code>client.transactions.<a href="/lib/plaid/transactions/client.rb">get</a>(request) -> Plaid::Internal::OffsetItemIterator</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Note: All new implementations are encouraged to use `/transactions/sync` rather than `/transactions/get`. `/transactions/sync` provides the same functionality as `/transactions/get` and improves developer ease-of-use for handling transactions updates.
The `/transactions/get` endpoint allows developers to receive user-authorized transaction data for credit, depository, and loan-type accounts (coverage may be limited). For transaction history from investment accounts, use the [Investments endpoint](https://plaid.com/docs/api/products/investments/) instead. Transaction data is standardized across financial institutions, and in many cases transactions are linked to a clean name, entity type, location, and category. Similarly, account data is standardized and returned with a clean name, number, balance, and other meta information where available.
Transactions are returned in reverse-chronological order, and the sequence of transaction ordering is stable and will not shift.  Transactions are not immutable and can also be removed altogether by the institution; a removed transaction will no longer appear in `/transactions/get`.  For more details, see [Pending and posted transactions](https://plaid.com/docs/transactions/transactions-data/#pending-and-posted-transactions).
Due to the potentially large number of transactions associated with an Item, results are paginated. Manipulate the `count` and `offset` parameters in conjunction with the `total_transactions` response body field to fetch all available transactions.
Data returned by `/transactions/get` will be the data available for the Item as of the most recent successful check for new transactions. Plaid typically checks for new data multiple times a day, but these checks may occur less frequently, such as once a day, depending on the institution. To find out when the Item was last updated, use the [Item Debugger](https://plaid.com/docs/account/activity/#troubleshooting-with-item-debugger) or call `/item/get`; the `item.status.transactions.last_successful_update` field will show the timestamp of the most recent successful update. To force Plaid to check for new transactions, you can use the `/transactions/refresh` endpoint.


Note that data may not be immediately available to `/transactions/get`. Plaid will begin to prepare transactions data upon Item link, if Link was initialized with `transactions`, or upon the first call to `/transactions/get`, if it wasn't. To be alerted when transaction data is ready to be fetched, listen for the [`INITIAL_UPDATE`](https://plaid.com/docs/api/products/transactions/#initial_update) and [`HISTORICAL_UPDATE`](https://plaid.com/docs/api/products/transactions/#historical_update) webhooks. If no transaction history is ready when `/transactions/get` is called, it will return a `PRODUCT_NOT_READY` error.

Returns a `Plaid::Internal::OffsetItemIterator` that yields each `Plaid::Types::Transaction` in the `transactions` field of every page, requesting pages as they are needed. Call `pages` on it to get each page as a `Plaid::Types::TransactionsGetResponse`, including its other fields.

No request is sent by this call. The first page is requested when you start iterating (or call `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.transactions.get(
  access_token: "access_token",
  start_date: "2023-01-15",
  end_date: "2023-01-15"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**options:** `Plaid::Types::TransactionsGetRequestOptions` 
    
</dd>
</dl>

<dl>
<dd>

**access_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**start_date:** `String` — The earliest date for which data should be returned. Dates should be formatted as YYYY-MM-DD. Plaid returns all transaction history stored for the Item (up to 2 years prior to the initial linking of the Item).
    
</dd>
</dl>

<dl>
<dd>

**end_date:** `String` — The latest date for which data should be returned. Dates should be formatted as YYYY-MM-DD.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Transactions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.transactions.<a href="/lib/plaid/transactions/client.rb">refresh</a>(request) -> Plaid::Types::TransactionsRefreshResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

`/transactions/refresh` is an optional endpoint that initiates an on-demand extraction to fetch the newest transactions for an Item. The on-demand extraction takes place in addition to the periodic extractions that automatically occur one or more times per day for any Transactions-enabled Item. The Item must already have Transactions added as a product in order to call `/transactions/refresh`.

If changes to transactions are discovered after calling `/transactions/refresh`, Plaid will fire a webhook: for `/transactions/sync` users, [`SYNC_UPDATES_AVAILABLE`](https://plaid.com/docs/api/products/transactions/#sync_updates_available) will be fired if there are any transactions updated, added, or removed. For users of both `/transactions/sync` and `/transactions/get`, [`TRANSACTIONS_REMOVED`](https://plaid.com/docs/api/products/transactions/#transactions_removed) will be fired if any removed transactions are detected, and [`DEFAULT_UPDATE`](https://plaid.com/docs/api/products/transactions/#default_update) will be fired if any new transactions are detected. New transactions can be fetched by calling `/transactions/get` or `/transactions/sync`.

Note that the `/transactions/refresh` endpoint is not supported for Capital One (`ins_128026`) non-depository accounts and will result in a `PRODUCTS_NOT_SUPPORTED` error if called on an Item that contains only non-depository accounts from that institution.

As this endpoint triggers a synchronous request for fresh data, latency may be higher than for other Plaid endpoints (typically less than 10 seconds, but occasionally up to 30 seconds or more); if you encounter errors, you may find it necessary to adjust your timeout period when making requests.

`/transactions/refresh` is offered as an optional add-on to Transactions and has a separate [fee model](https://plaid.com/docs/account/billing/#per-request-flat-fee). To request access to this endpoint, submit a [product access request](https://dashboard.plaid.com/team/products) or contact your Plaid account manager.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.transactions.refresh(access_token: "access_token")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**access_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Transactions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.transactions.<a href="/lib/plaid/transactions/client.rb">get_recurring</a>(request) -> Plaid::Types::TransactionsRecurringGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/transactions/recurring/get` endpoint allows developers to receive a summary of the recurring outflow and inflow streams (expenses and deposits) from a user's checking, savings or credit card accounts. Additionally, Plaid provides key insights about each recurring stream including the category, merchant, last amount, and more. Developers can use these insights to build tools and experiences that help their users better manage cash flow, monitor subscriptions, reduce spend, and stay on track with bill payments.

This endpoint is offered as an add-on to Transactions. To request access to this endpoint, submit a [product access request](https://dashboard.plaid.com/team/products) or contact your Plaid account manager.

This endpoint can only be called on an Item that has already been initialized with Transactions (either during Link, by specifying it in `/link/token/create`; or after Link, by calling `/transactions/get` or `/transactions/sync`).

When using Recurring Transactions, for best results, make sure to use the [`days_requested`](https://plaid.com/docs/api/link/#link-token-create-request-transactions-days-requested) parameter to request at least 180 days of history when initializing Items with Transactions. Once all historical transactions have been fetched, call `/transactions/recurring/get` to receive the Recurring Transactions streams and subscribe to the [`RECURRING_TRANSACTIONS_UPDATE`](https://plaid.com/docs/api/products/transactions/#recurring_transactions_update) webhook. To know when historical transactions have been fetched, if you are using `/transactions/sync` listen for the [`SYNC_UPDATES_AVAILABLE`](https://plaid.com/docs/api/products/transactions/#SyncUpdatesAvailableWebhook-historical-update-complete) webhook and check that the `historical_update_complete` field in the payload is `true`. If using `/transactions/get`, listen for the [`HISTORICAL_UPDATE`](https://plaid.com/docs/api/products/transactions/#historical_update) webhook.

After the initial call, you can call the `/transactions/recurring/get` endpoint at any point in the future to retrieve the latest summary of recurring streams. Listen to the [`RECURRING_TRANSACTIONS_UPDATE`](https://plaid.com/docs/api/products/transactions/#recurring_transactions_update) webhook to be notified when new updates are available.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.transactions.get_recurring(access_token: "access_token")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**access_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**options:** `Plaid::Types::TransactionsRecurringGetRequestOptions` 
    
</dd>
</dl>

<dl>
<dd>

**account_ids:** `Internal::Types::Array[String]` 

An optional list of `account_ids` to retrieve for the Item. Retrieves all active accounts on item if no `account_id`s are provided.

Note: An error will be returned if a provided `account_id` is not associated with the Item.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Transactions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.transactions.<a href="/lib/plaid/transactions/client.rb">sync</a>(request) -> Plaid::Types::TransactionsSyncResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/transactions/sync` endpoint retrieves transactions associated with an Item and can fetch updates using a cursor to track which updates have already been seen.

For important instructions on integrating with `/transactions/sync`, see the [Transactions integration overview](https://plaid.com/docs/transactions/#integration-overview). If you are migrating from an existing integration using `/transactions/get`, see the [Transactions Sync migration guide](https://plaid.com/docs/transactions/sync-migration/).

This endpoint supports `credit`, `depository`, and `loan`-type accounts. For `investments` accounts, use `/investments/transactions/get` instead.

When retrieving paginated updates, track both the `next_cursor` from the latest response and the original cursor from the first call in which `has_more` was `true`; if a call to `/transactions/sync` fails when retrieving a paginated update (e.g. due to the [`TRANSACTIONS_SYNC_MUTATION_DURING_PAGINATION`](https://plaid.com/docs/errors/transactions/#transactions_sync_mutation_during_pagination) error), the entire pagination request loop must be restarted beginning with the cursor for the first page of the update, rather than retrying only the single request that failed.

If transactions data is not yet available for the Item, which can happen if the Item was not initialized with transactions during the `/link/token/create` call or if `/transactions/sync` was called within a few seconds of Item creation, `/transactions/sync` will return empty transactions arrays.

Plaid typically checks for new transactions data between one and four times per day, depending on the institution. To find out when transactions were last updated for an Item, use the [Item Debugger](https://plaid.com/docs/account/activity/#troubleshooting-with-item-debugger) or call `/item/get`; the `item.status.transactions.last_successful_update` field will show the timestamp of the most recent successful update. To force Plaid to check for new transactions, use the `/transactions/refresh` endpoint.

To be alerted when new transactions are available, listen for the [`SYNC_UPDATES_AVAILABLE`](https://plaid.com/docs/api/products/transactions/#sync_updates_available) webhook.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.transactions.sync(access_token: "access_token")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**access_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` 

The cursor value represents the last update requested. Providing it will cause the response to only return changes after this update.
If omitted, the entire history of updates will be returned, starting with the first-added transactions on the Item. The cursor also accepts the special value of `"now"`, which can be used to fast-forward the cursor as part of migrating an existing Item from `/transactions/get` to `/transactions/sync`. For more information, see the [Transactions sync migration guide](https://plaid.com/docs/transactions/sync-migration/). Note that using the `"now"` value is not supported for any use case other than migrating existing Items from `/transactions/get`.

The upper-bound length of this cursor is 256 characters of base64.
    
</dd>
</dl>

<dl>
<dd>

**count:** `Integer` — The number of transaction updates to fetch.
    
</dd>
</dl>

<dl>
<dd>

**options:** `Plaid::Types::TransactionsSyncRequestOptions` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Transactions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.transactions.<a href="/lib/plaid/transactions/client.rb">enrich</a>(request) -> Plaid::Types::TransactionsEnrichResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/transactions/enrich` endpoint enriches raw transaction data generated by your own banking products or retrieved from other non-Plaid sources.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.transactions.enrich(
  account_type: "account_type",
  transactions: [{
    id: "id",
    description: "description",
    amount: 1.1,
    direction: "INFLOW",
    iso_currency_code: "iso_currency_code"
  }]
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**account_type:** `String` — The account type for the requested transactions (either `depository` or `credit`).
    
</dd>
</dl>

<dl>
<dd>

**transactions:** `Internal::Types::Array[Plaid::Types::ClientProvidedTransaction]` — An array of transaction objects to be enriched by Plaid. Maximum of 100 transactions per request.
    
</dd>
</dl>

<dl>
<dd>

**options:** `Plaid::Types::TransactionsEnrichRequestOptions` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Transactions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.transactions.<a href="/lib/plaid/transactions/client.rb">create_rule</a>(request) -> Plaid::Types::TransactionsRulesCreateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/beta/transactions/rules/v1/create` endpoint creates transaction categorization rules.

Rules will be applied on the Item's transactions returned in `/transactions/get` response.

The product is currently in beta. To request access, contact transactions-feedback@plaid.com.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.transactions.create_rule(
  client_user_id: "your-client-user-id",
  pfc_primary_category: "FOOD_AND_DRINK",
  pfc_detailed_category: "FOOD_AND_DRINK_FAST_FOOD",
  rule_details: {
    field: "MERCHANT_NAME",
    type: "SUBSTRING_MATCH",
    query: "Burger Shack"
  }
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**client_user_id:** `String` — A unique ID representing the end user. This ID is used to associate rules with a specific user.
    
</dd>
</dl>

<dl>
<dd>

**pfc_primary_category:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**pfc_detailed_category:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**rule_details:** `Plaid::Types::TransactionsRuleDetails` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Transactions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.transactions.<a href="/lib/plaid/transactions/client.rb">list_rules</a>(request) -> Plaid::Types::TransactionsRulesListResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/beta/transactions/rules/v1/list` returns a list of transaction rules created for the end user specified by `client_user_id`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.transactions.list_rules(client_user_id: "your-client-user-id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**client_user_id:** `String` — A unique ID representing the end user whose rules should be listed.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Transactions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.transactions.<a href="/lib/plaid/transactions/client.rb">remove_rule</a>(request) -> Plaid::Types::TransactionsRulesRemoveResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/beta/transactions/rules/v1/remove` endpoint is used to remove a transaction rule.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.transactions.remove_rule(
  client_user_id: "your-client-user-id",
  rule_id: "eVBnVMp7zdTJLkRNr33Rs6zr7KNJqBF"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**client_user_id:** `String` — A unique ID representing the end user the rule belongs to.
    
</dd>
</dl>

<dl>
<dd>

**rule_id:** `String` — A rule's unique identifier
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Transactions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.transactions.<a href="/lib/plaid/transactions/client.rb">get_user_insights</a>(request) -> Plaid::Types::TransactionsUserInsightsGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/beta/transactions/user_insights/v1/get` gets user insights for clients who have enriched data with `/transactions/enrich`.

The product is currently in beta.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.transactions.get_user_insights(client_user_id: "client_user_id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**client_user_id:** `String` — A unique client-provided `client_user_id` to retrieve insights for.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Transactions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Sandbox
<details><summary><code>client.sandbox.<a href="/lib/plaid/sandbox/client.rb">create_transactions</a>(request) -> Plaid::Types::SandboxTransactionsCreateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use the `/sandbox/transactions/create` endpoint to create new transactions for an existing Item. This endpoint can be used to add up to 10 transactions to any Item at a time.

This endpoint can be used with any Item created in the Sandbox environment. Added transactions persist across subsequent calls to `/transactions/get` and `/transactions/sync`.

Each transaction is added to the account named by its `account_id`. When `account_id` is omitted, the transaction is added to the Item's checking account, or, for a custom Sandbox user, to the first depository account listed in its `override_accounts`, or its first account if it has no depository account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.sandbox.create_transactions(
  access_token: "access_token",
  transactions: [{
    date_transacted: "2023-01-15",
    date_posted: "2023-01-15",
    amount: 1.1,
    description: "description"
  }]
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**access_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**transactions:** `Internal::Types::Array[Plaid::Types::CustomSandboxTransaction]` — List of transactions to be added
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Sandbox::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.sandbox.<a href="/lib/plaid/sandbox/client.rb">create_processor_token</a>(request) -> Plaid::Types::SandboxProcessorTokenCreateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use the `/sandbox/processor_token/create` endpoint to create a valid `processor_token` for an arbitrary institution ID and test credentials. The created `processor_token` corresponds to a new Sandbox Item. You can then use this `processor_token` with the `/processor/` API endpoints in Sandbox. You can also use `/sandbox/processor_token/create` with the [`user_custom` test username](https://plaid.com/docs/sandbox/user-custom) to generate a test account with custom data.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.sandbox.create_processor_token(institution_id: "institution_id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**institution_id:** `String` — The ID of the institution the Item will be associated with
    
</dd>
</dl>

<dl>
<dd>

**options:** `Plaid::Types::SandboxProcessorTokenCreateRequestOptions` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Sandbox::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.sandbox.<a href="/lib/plaid/sandbox/client.rb">create_public_token</a>(request) -> Plaid::Types::SandboxPublicTokenCreateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use the `/sandbox/public_token/create` endpoint to create a valid `public_token`  for an arbitrary institution ID, initial products, and test credentials. The created `public_token` maps to a new Sandbox Item. You can then call `/item/public_token/exchange` to exchange the `public_token` for an `access_token` and perform all API actions. `/sandbox/public_token/create` can also be used with the [`user_custom` test username](https://plaid.com/docs/sandbox/user-custom) to generate a test account with custom data, or with Plaid's [pre-populated Sandbox test accounts](https://plaid.com/docs/sandbox/test-credentials/).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.sandbox.create_public_token(
  institution_id: "institution_id",
  initial_products: ["assets"]
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**institution_id:** `String` — The ID of the institution the Item will be associated with
    
</dd>
</dl>

<dl>
<dd>

**initial_products:** `Internal::Types::Array[Plaid::Types::Products]` — The products to initially pull for the Item. May be any products that the specified `institution_id` supports. This array may not be empty.
    
</dd>
</dl>

<dl>
<dd>

**options:** `Plaid::Types::SandboxPublicTokenCreateRequestOptions` 
    
</dd>
</dl>

<dl>
<dd>

**user_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**user_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Sandbox::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.sandbox.<a href="/lib/plaid/sandbox/client.rb">fire_item_webhook</a>(request) -> Plaid::Types::SandboxItemFireWebhookResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/sandbox/item/fire_webhook` endpoint is used to test that code correctly handles webhooks. This endpoint can trigger the following webhooks:

`DEFAULT_UPDATE`: Webhook to be fired for a given Sandbox Item simulating a default update event for the respective product as specified with the `webhook_type` in the request body. Valid Sandbox `DEFAULT_UPDATE` webhook types include: `AUTH`, `IDENTITY`, `TRANSACTIONS`, `INVESTMENTS_TRANSACTIONS`, `LIABILITIES`, `HOLDINGS`. If the Item does not support the product, a `SANDBOX_PRODUCT_NOT_ENABLED` error will result.

`NEW_ACCOUNTS_AVAILABLE`: Fired to indicate that a new account is available on the Item and you can launch update mode to request access to it.

`SMS_MICRODEPOSITS_VERIFICATION`: Fired when a given Same-Day Micro-deposit Item is verified via SMS verification.

`LOGIN_REPAIRED`: Fired when an Item recovers from the `ITEM_LOGIN_REQUIRED` without the user going through update mode in your app.

`PENDING_DISCONNECT`: Fired when an Item will stop working in the near future (e.g. due to a planned bank migration) and must be sent through update mode to continue working.

`CONSENT_UPDATED`: Fired when the user changes the consent duration at their institution and the Item's `consent_expiration_time` changes. Sandbox Items have no stored consent expiration, so the payload's `consent_expiration_time` is one year from the time the webhook is fired.

`RECURRING_TRANSACTIONS_UPDATE`: Recurring Transactions webhook to be fired for a given Sandbox Item. If your client is not enabled for Recurring Transactions, a `SANDBOX_PRODUCT_NOT_ENABLED` error will result.

`SYNC_UPDATES_AVAILABLE`: Transactions webhook to be fired for a given Sandbox Item.  If your client is not enabled for Transactions, a `SANDBOX_PRODUCT_NOT_ENABLED` error will result.

`PRODUCT_READY`: Assets webhook to be fired when a given asset report has been successfully generated. If the Item does not support Assets, a `SANDBOX_PRODUCT_NOT_ENABLED` error will result.

`ERROR`: Assets webhook to be fired when asset report generation has failed. If the Item does not support Assets, a `SANDBOX_PRODUCT_NOT_ENABLED` error will result.

`USER_PERMISSION_REVOKED`: Indicates an end user has revoked the permission that they previously granted to access an Item. May not always fire upon revocation, as some institutions' consent portals do not trigger this webhook. Upon receiving this webhook, it is recommended to delete any stored data from Plaid associated with the account or Item.

`USER_ACCOUNT_REVOKED`: Fired when an end user has revoked access to their account on the Data Provider's portal. This webhook is currently sent only for Chase, PNC, and Truist Items, but may be sent in the future for other financial institutions. Upon receiving this webhook, it is recommended to delete any stored data from Plaid associated with the account or Item.

Note that this endpoint is provided for developer ease-of-use and is not required for testing webhooks; webhooks will also fire in Sandbox under the same conditions that they would in Production (except for webhooks of type `TRANSFER`).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.sandbox.fire_item_webhook(
  access_token: "access_token",
  webhook_code: "DEFAULT_UPDATE"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**access_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**webhook_type:** `Plaid::Types::WebhookType` 
    
</dd>
</dl>

<dl>
<dd>

**webhook_code:** `Plaid::Sandbox::Types::SandboxItemFireWebhookRequestWebhookCode` — The webhook codes that can be fired by this test endpoint.
    
</dd>
</dl>

<dl>
<dd>

**options:** `Plaid::Types::SandboxItemFireWebhookRequestOptions` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Sandbox::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.sandbox.<a href="/lib/plaid/sandbox/client.rb">fire_user_webhook</a>(request) -> Plaid::Types::SandboxUserFireWebhookResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

`/sandbox/user/fire_webhook` functions the same as `/sandbox/item/fire_webhook`, but fires webhooks associated with a user rather than an Item. This endpoint can trigger the following webhooks:

`USER_CHECK_REPORT_READY`: Fired when a Check Report is ready to be retrieved.

`USER_CHECK_REPORT_FAILED`: Fired when a Check Report has failed to generate.

`CHECK_REPORT_READY` / `CHECK_REPORT_FAILED`: The equivalents of the above for integrations that predate the [New User APIs](https://plaid.com/docs/api/users/user-apis).

Note that this endpoint is provided for developer ease-of-use and is not required for testing webhooks; webhooks will also fire in Sandbox under the same conditions that they would in Production.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.sandbox.fire_user_webhook(
  webhook_type: "CHECK_REPORT",
  webhook_code: "USER_CHECK_REPORT_READY",
  webhook: "webhook"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**user_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**user_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**webhook_type:** `Plaid::Types::SandboxUserFireWebhookType` 
    
</dd>
</dl>

<dl>
<dd>

**webhook_code:** `Plaid::Types::SandboxUserFireWebhookCode` 
    
</dd>
</dl>

<dl>
<dd>

**webhook:** `String` — The destination URL that the test webhook will be sent to.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Sandbox::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.sandbox.<a href="/lib/plaid/sandbox/client.rb">reset_item_login</a>(request) -> Plaid::Types::SandboxItemResetLoginResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

`/sandbox/item/reset_login` forces an Item into an `ITEM_LOGIN_REQUIRED` state in order to simulate an Item whose login is no longer valid. This makes it easy to test Link's [update mode](https://plaid.com/docs/link/update-mode) flow in the Sandbox environment.  After calling `/sandbox/item/reset_login`, you can then use Plaid Link update mode to restore the Item to a good state. An `ITEM_LOGIN_REQUIRED` webhook will also be fired after a call to this endpoint, if one is associated with the Item.
In the Sandbox, Items will transition to an `ITEM_LOGIN_REQUIRED` error state automatically after 30 days, even if this endpoint is not called.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.sandbox.reset_item_login(access_token: "access_token")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**access_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Sandbox::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.sandbox.<a href="/lib/plaid/sandbox/client.rb">seed_item_application</a>(request) -> Plaid::Types::SandboxItemApplicationSeedResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

`/sandbox/item/application/seed` creates a test connected application on an existing Permissions Manager Item's login. The seeded application will appear in subsequent calls to `/item/application/list`.

The `access_token` must belong to a Permissions Manager Item created via `/item/import` in Sandbox. The `application_id` identifies the application to seed as a connected app. To disconnect a seeded application, use `/item/application/unlink`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.sandbox.seed_item_application(
  access_token: "access_token",
  application_id: "application_id"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**access_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**application_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Sandbox::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.sandbox.<a href="/lib/plaid/sandbox/client.rb">seed_fdx_consent</a>(request) -> Plaid::Types::SandboxFdxConsentSeedResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

`/sandbox/fdx/consent/seed` creates a test FDX consent grant (and a backing Item) for a data provider's customer in Sandbox, so the FDX Consent API endpoints can be exercised end-to-end without a live data provider connection.

`customer_id` is the data provider's identifier for the end user and `application_id` identifies the data recipient application the consent is granted to; both are required. Optionally provide `consent_id` (a UUIDv4) to control the seeded grant's identifier; one is generated when omitted. The seeded grant is returned by `/fdx/consents` and `/fdx/consents/{consentId}`, and can be revoked via `/fdx/consents/{consentId}/revocation`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.sandbox.seed_fdx_consent(
  customer_id: "customer_id",
  application_id: "application_id"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**customer_id:** `String` — The data provider's identifier for the end user to associate the seeded consent grant with.
    
</dd>
</dl>

<dl>
<dd>

**application_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**consent_id:** `String` — Optional UUIDv4 identifier for the seeded consent grant. If omitted, one is generated. Seeding fails if a grant with this identifier already exists.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Sandbox::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.sandbox.<a href="/lib/plaid/sandbox/client.rb">set_item_verification_status</a>(request) -> Plaid::Types::SandboxItemSetVerificationStatusResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/sandbox/item/set_verification_status` endpoint can be used to change the verification status of an Item in the Sandbox in order to simulate the Automated Micro-deposit flow.

For more information on testing Automated Micro-deposits in Sandbox, see [Auth full coverage testing](https://plaid.com/docs/auth/coverage/testing#).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.sandbox.set_item_verification_status(
  access_token: "access_token",
  account_id: "account_id",
  verification_status: "automatically_verified"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**access_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**account_id:** `String` — The `account_id` of the account whose verification status is to be modified
    
</dd>
</dl>

<dl>
<dd>

**verification_status:** `Plaid::Sandbox::Types::SandboxItemSetVerificationStatusRequestVerificationStatus` — The verification status to set the account to.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Sandbox::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.sandbox.<a href="/lib/plaid/sandbox/client.rb">reset_user_login</a>(request) -> Plaid::Types::SandboxUserResetLoginResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

`/sandbox/user/reset_login` functions the same as `/sandbox/item/reset_login`, but will modify Items related to a User. This endpoint forces each Item into an `ITEM_LOGIN_REQUIRED` state in order to simulate an Item whose login is no longer valid. This makes it easy to test Link's [update mode](https://plaid.com/docs/link/update-mode) flow in the Sandbox environment.  After calling `/sandbox/user/reset_login`, you can then use Plaid Link update mode to restore Items associated with the User to a good state. An `ITEM_LOGIN_REQUIRED` webhook will also be fired after a call to this endpoint, if one is associated with the Item.
In the Sandbox, Items will transition to an `ITEM_LOGIN_REQUIRED` error state automatically after 30 days, even if this endpoint is not called.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.sandbox.reset_user_login
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**user_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**item_ids:** `Internal::Types::Array[String]` — An array of `item_id`s associated with the User to be reset.  If empty or `null`, this field will default to resetting all Items associated with the User.
    
</dd>
</dl>

<dl>
<dd>

**user_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Sandbox::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.sandbox.<a href="/lib/plaid/sandbox/client.rb">simulate_bank_transfer</a>(request) -> Plaid::Types::SandboxBankTransferSimulateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use the `/sandbox/bank_transfer/simulate` endpoint to simulate a bank transfer event in the Sandbox environment.  Note that while an event will be simulated and will appear when using endpoints such as `/bank_transfer/event/sync` or `/bank_transfer/event/list`, no transactions will actually take place and funds will not move between accounts, even within the Sandbox.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.sandbox.simulate_bank_transfer(
  bank_transfer_id: "bank_transfer_id",
  event_type: "event_type"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**bank_transfer_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**event_type:** `String` 

The asynchronous event to be simulated. May be: `posted`, `failed`, or `reversed`.

An error will be returned if the event type is incompatible with the current transfer status. Compatible status --> event type transitions include:

`pending` --> `failed`

`pending` --> `posted`

`posted` --> `reversed`
    
</dd>
</dl>

<dl>
<dd>

**failure_reason:** `Plaid::Types::BankTransferFailure` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Sandbox::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.sandbox.<a href="/lib/plaid/sandbox/client.rb">simulate_transfer_sweep</a>(request) -> Plaid::Types::SandboxTransferSweepSimulateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use the `/sandbox/transfer/sweep/simulate` endpoint to create a sweep and associated events in the Sandbox environment. Upon calling this endpoint, all transfers with a sweep status of `swept` will become `swept_settled`, all `posted` or `pending` transfers with a sweep status of `unswept` will become `swept`, and all `returned` transfers with a sweep status of `swept` will become `return_swept`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.sandbox.simulate_transfer_sweep
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**test_clock_id:** `String` — Plaid's unique identifier for a test clock. If provided, the sweep to be simulated is created on the day of the `virtual_time` on the `test_clock`. If the date of `virtual_time` is on weekend or a federal holiday, the next available banking day is used.
    
</dd>
</dl>

<dl>
<dd>

**webhook:** `String` — The webhook URL to which a `TRANSFER_EVENTS_UPDATE` webhook should be sent.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Sandbox::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.sandbox.<a href="/lib/plaid/sandbox/client.rb">simulate_transfer</a>(request) -> Plaid::Types::SandboxTransferSimulateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use the `/sandbox/transfer/simulate` endpoint to simulate a transfer event in the Sandbox environment.  Note that while an event will be simulated and will appear when using endpoints such as `/transfer/event/sync` or `/transfer/event/list`, no transactions will actually take place and funds will not move between accounts, even within the Sandbox.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.sandbox.simulate_transfer(
  transfer_id: "transfer_id",
  event_type: "event_type"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**transfer_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**test_clock_id:** `String` — Plaid's unique identifier for a test clock. If provided, the event to be simulated is created at the `virtual_time` on the provided `test_clock`.
    
</dd>
</dl>

<dl>
<dd>

**event_type:** `String` 

The asynchronous event to be simulated. May be: `posted`, `settled`, `failed`, `funds_available`, or `returned`.

An error will be returned if the event type is incompatible with the current transfer status. Compatible status --> event type transitions include:

`pending` --> `failed`

`pending` --> `posted`

`posted` --> `returned`

`posted` --> `settled`

`settled` --> `funds_available` (only applicable to ACH debits.)
    
</dd>
</dl>

<dl>
<dd>

**failure_reason:** `Plaid::Types::TransferFailure` 
    
</dd>
</dl>

<dl>
<dd>

**webhook:** `String` — The webhook URL to which a `TRANSFER_EVENTS_UPDATE` webhook should be sent.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Sandbox::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.sandbox.<a href="/lib/plaid/sandbox/client.rb">simulate_transfer_refund</a>(request) -> Plaid::Types::SandboxTransferRefundSimulateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use the `/sandbox/transfer/refund/simulate` endpoint to simulate a refund event in the Sandbox environment.  Note that while an event will be simulated and will appear when using endpoints such as `/transfer/event/sync` or `/transfer/event/list`, no transactions will actually take place and funds will not move between accounts, even within the Sandbox.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.sandbox.simulate_transfer_refund(
  refund_id: "refund_id",
  event_type: "event_type"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**refund_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**test_clock_id:** `String` — Plaid's unique identifier for a test clock. If provided, the event to be simulated is created at the `virtual_time` on the provided `test_clock`.
    
</dd>
</dl>

<dl>
<dd>

**event_type:** `String` 

The asynchronous event to be simulated. May be: `refund.posted`, `refund.settled`, `refund.failed`, or `refund.returned`.

An error will be returned if the event type is incompatible with the current refund status. Compatible status --> event type transitions include:

`refund.pending` --> `refund.failed`

`refund.pending` --> `refund.posted`

`refund.posted` --> `refund.returned`

`refund.posted` --> `refund.settled`

`refund.posted` events can only be simulated if the refunded transfer has been transitioned to settled. This mimics the ordering of events in Production.
    
</dd>
</dl>

<dl>
<dd>

**failure_reason:** `Plaid::Types::TransferFailure` 
    
</dd>
</dl>

<dl>
<dd>

**webhook:** `String` — The webhook URL to which a `TRANSFER_EVENTS_UPDATE` webhook should be sent.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Sandbox::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.sandbox.<a href="/lib/plaid/sandbox/client.rb">simulate_transfer_ledger_available</a>(request) -> Plaid::Types::SandboxTransferLedgerSimulateAvailableResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use the `/sandbox/transfer/ledger/simulate_available` endpoint to simulate converting pending balance to available balance for all originators in the Sandbox environment.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.sandbox.simulate_transfer_ledger_available
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**ledger_id:** `String` — Specify which ledger balance to simulate converting pending balance to available balance. If this field is left blank, pending balance is converted to available balance for all of your ledgers (or all of the given originator's ledgers).
    
</dd>
</dl>

<dl>
<dd>

**originator_client_id:** `String` — Client ID of the end customer (i.e. the originator). Only applicable to Transfer for Platforms customers.
    
</dd>
</dl>

<dl>
<dd>

**test_clock_id:** `String` — Plaid's unique identifier for a test clock. If provided, only the pending balance that is due before the `virtual_time` on the test clock will be converted.
    
</dd>
</dl>

<dl>
<dd>

**webhook:** `String` — The webhook URL to which a `TRANSFER_EVENTS_UPDATE` webhook should be sent.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Sandbox::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.sandbox.<a href="/lib/plaid/sandbox/client.rb">simulate_transfer_ledger_deposit</a>(request) -> Plaid::Types::SandboxTransferLedgerDepositSimulateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use the `/sandbox/transfer/ledger/deposit/simulate` endpoint to simulate a ledger deposit event in the Sandbox environment.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.sandbox.simulate_transfer_ledger_deposit(
  sweep_id: "sweep_id",
  event_type: "sweep.posted"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**sweep_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**event_type:** `Plaid::Types::TransferLedgerSweepSimulateEventType` 
    
</dd>
</dl>

<dl>
<dd>

**failure_reason:** `Plaid::Types::TransferFailure` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Sandbox::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.sandbox.<a href="/lib/plaid/sandbox/client.rb">simulate_transfer_ledger_withdraw</a>(request) -> Plaid::Types::SandboxTransferLedgerWithdrawSimulateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use the `/sandbox/transfer/ledger/withdraw/simulate` endpoint to simulate a ledger withdraw event in the Sandbox environment.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.sandbox.simulate_transfer_ledger_withdraw(
  sweep_id: "sweep_id",
  event_type: "sweep.posted"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**sweep_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**event_type:** `Plaid::Types::TransferLedgerSweepSimulateEventType` 
    
</dd>
</dl>

<dl>
<dd>

**failure_reason:** `Plaid::Types::TransferFailure` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Sandbox::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.sandbox.<a href="/lib/plaid/sandbox/client.rb">fire_transfer_webhook</a>(request) -> Plaid::Types::SandboxTransferFireWebhookResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use the `/sandbox/transfer/fire_webhook` endpoint to manually trigger a `TRANSFER_EVENTS_UPDATE` webhook in the Sandbox environment.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.sandbox.fire_transfer_webhook(webhook: "webhook")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**webhook:** `String` — The URL to which the webhook should be sent.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Sandbox::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.sandbox.<a href="/lib/plaid/sandbox/client.rb">create_transfer_test_clock</a>(request) -> Plaid::Types::SandboxTransferTestClockCreateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use the `/sandbox/transfer/test_clock/create` endpoint to create a `test_clock` in the Sandbox environment.

A test clock object represents an independent timeline and has a `virtual_time` field indicating the current timestamp of the timeline. Test clocks are used for testing recurring transfers in Sandbox.

A test clock can be associated with up to 5 recurring transfers.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.sandbox.create_transfer_test_clock
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**virtual_time:** `String` — The virtual timestamp on the test clock. If not provided, the current timestamp will be used. This will be of the form `2006-01-02T15:04:05Z`.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Sandbox::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.sandbox.<a href="/lib/plaid/sandbox/client.rb">advance_transfer_test_clock</a>(request) -> Plaid::Types::SandboxTransferTestClockAdvanceResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use the `/sandbox/transfer/test_clock/advance` endpoint to advance a `test_clock` in the Sandbox environment.

A test clock object represents an independent timeline and has a `virtual_time` field indicating the current timestamp of the timeline. A test clock can be advanced by incrementing `virtual_time`, but may never go back to a lower `virtual_time`.

If a test clock is advanced, we will simulate the changes that ought to occur during the time that elapsed.

For example, a client creates a weekly recurring transfer with a test clock set at t. When the client advances the test clock by setting `virtual_time` = t + 15 days, 2 new originations should be created, along with the webhook events.

The advancement of the test clock from its current `virtual_time` should be limited such that there are no more than 20 originations resulting from the advance operation on each `recurring_transfer` associated with the `test_clock`.

For example, if the recurring transfer associated with this test clock originates once every 4 weeks, you can advance the `virtual_time` up to 80 weeks on each API call.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.sandbox.advance_transfer_test_clock(
  test_clock_id: "test_clock_id",
  new_virtual_time: "2024-01-15T09:30:00Z"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**test_clock_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**new_virtual_time:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Sandbox::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.sandbox.<a href="/lib/plaid/sandbox/client.rb">get_transfer_test_clock</a>(request) -> Plaid::Types::SandboxTransferTestClockGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use the `/sandbox/transfer/test_clock/get` endpoint to get a `test_clock` in the Sandbox environment.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.sandbox.get_transfer_test_clock(test_clock_id: "test_clock_id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**test_clock_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Sandbox::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.sandbox.<a href="/lib/plaid/sandbox/client.rb">list_transfer_test_clocks</a>(request) -> Plaid::Internal::OffsetItemIterator</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use the `/sandbox/transfer/test_clock/list` endpoint to see a list of all your test clocks in the Sandbox environment, by descending `virtual_time`. Results are paginated; use the `count` and `offset` query parameters to retrieve the desired test clocks.

Returns a `Plaid::Internal::OffsetItemIterator` that yields each `Plaid::Types::TransferTestClock` in the `test_clocks` field of every page, requesting pages as they are needed. Call `pages` on it to get each page as a `Plaid::Types::SandboxTransferTestClockListResponse`, including its other fields.

No request is sent by this call. The first page is requested when you start iterating (or call `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.sandbox.list_transfer_test_clocks
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**start_virtual_time:** `String` — The start virtual timestamp of test clocks to return. This should be in RFC 3339 format (i.e. `2019-12-06T22:35:49Z`)
    
</dd>
</dl>

<dl>
<dd>

**end_virtual_time:** `String` — The end virtual timestamp of test clocks to return. This should be in RFC 3339 format (i.e. `2019-12-06T22:35:49Z`)
    
</dd>
</dl>

<dl>
<dd>

**count:** `Integer` — The maximum number of test clocks to return.
    
</dd>
</dl>

<dl>
<dd>

**offset:** `Integer` — The number of test clocks to skip before returning results.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Sandbox::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.sandbox.<a href="/lib/plaid/sandbox/client.rb">reset_payment_profile_login</a>(request) -> Plaid::Types::SandboxPaymentProfileResetLoginResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

`/sandbox/payment_profile/reset_login` forces a Payment Profile into a state where the login is no longer valid. This makes it easy to test update mode for Payment Profile in the Sandbox environment.

 After calling `/sandbox/payment_profile/reset_login`, calls to the `/transfer/authorization/create` with the Payment Profile will result in a `decision_rationale` `PAYMENT_PROFILE_LOGIN_REQUIRED`. You can then use update mode for Payment Profile to restore it into a good state.

 In order to invoke this endpoint, you must first [create a Payment Profile](https://plaid.com/docs/transfer/add-to-app/#create-a-payment-profile-optional) and [go through the Link flow](https://plaid.com/docs/transfer/add-to-app/#create-a-link-token).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.sandbox.reset_payment_profile_login(payment_profile_token: "payment_profile_token")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**payment_profile_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Sandbox::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.sandbox.<a href="/lib/plaid/sandbox/client.rb">simulate_payment</a>(request) -> Plaid::Types::SandboxPaymentSimulateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use the `/sandbox/payment/simulate` endpoint to simulate various payment events in the Sandbox environment. This endpoint will trigger the corresponding payment status webhook.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.sandbox.simulate_payment(
  payment_id: "payment_id",
  webhook: "webhook",
  status: "status"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**payment_id:** `String` — The ID of the payment to simulate
    
</dd>
</dl>

<dl>
<dd>

**webhook:** `String` — The webhook URL to use for any payment events triggered by the simulated status change. Used only if the payment is not yet associated with an Item; otherwise, events are sent to the Item's webhook.
    
</dd>
</dl>

<dl>
<dd>

**status:** `String` 

The status to set the payment to.

Valid statuses include:
- `PAYMENT_STATUS_INITIATED`
- `PAYMENT_STATUS_INSUFFICIENT_FUNDS`
- `PAYMENT_STATUS_FAILED`
- `PAYMENT_STATUS_EXECUTED`
- `PAYMENT_STATUS_SETTLED`
- `PAYMENT_STATUS_CANCELLED`
- `PAYMENT_STATUS_REJECTED`
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Sandbox::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.sandbox.<a href="/lib/plaid/sandbox/client.rb">fire_bank_transfer_webhook</a>(request) -> Plaid::Types::SandboxBankTransferFireWebhookResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use the `/sandbox/bank_transfer/fire_webhook` endpoint to manually trigger a Bank Transfers webhook in the Sandbox environment.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.sandbox.fire_bank_transfer_webhook(webhook: "webhook")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**webhook:** `String` — The URL to which the webhook should be sent.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Sandbox::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.sandbox.<a href="/lib/plaid/sandbox/client.rb">fire_income_webhook</a>(request) -> Plaid::Types::SandboxIncomeFireWebhookResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use the `/sandbox/income/fire_webhook` endpoint to manually trigger a Payroll or Document Income webhook in the Sandbox environment.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.sandbox.fire_income_webhook(
  item_id: "item_id",
  webhook: "webhook",
  webhook_code: "INCOME_VERIFICATION"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**item_id:** `String` — The Item ID associated with the verification.
    
</dd>
</dl>

<dl>
<dd>

**user_id:** `String` — The user identifier to include in the test webhook. For `USER_INCOME_VERIFICATION` and `USER_INCOME_VERIFICATION_RISK_SIGNALS`, use the `user_id` returned by `/user/create`, which begins with `usr_`. For `INCOME_VERIFICATION` and `INCOME_VERIFICATION_RISK_SIGNALS`, use the legacy webhook `user_id` associated with the user token.
    
</dd>
</dl>

<dl>
<dd>

**webhook:** `String` — The URL to which the webhook should be sent.
    
</dd>
</dl>

<dl>
<dd>

**verification_status:** `Plaid::Sandbox::Types::SandboxIncomeFireWebhookRequestVerificationStatus` 

Required when `webhook_code` is `INCOME_VERIFICATION` or `USER_INCOME_VERIFICATION`.

`VERIFICATION_STATUS_PROCESSING_COMPLETE`: The income verification status processing has completed. If the user uploaded multiple documents, this webhook will fire when all documents have finished processing. Call the `/income/verification/paystubs/get` endpoint and check the document metadata to see which documents were successfully parsed.

`VERIFICATION_STATUS_PROCESSING_FAILED`: A failure occurred when attempting to process the verification documentation.

`VERIFICATION_STATUS_DOCUMENT_REJECTED`: The documentation was rejected.
    
</dd>
</dl>

<dl>
<dd>

**webhook_code:** `Plaid::Types::SandboxIncomeWebhookFireRequestWebhookCode` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Sandbox::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.sandbox.<a href="/lib/plaid/sandbox/client.rb">fire_bank_income_webhook</a>(request) -> Plaid::Types::SandboxBankIncomeFireWebhookResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use the `/sandbox/bank_income/fire_webhook` endpoint to manually trigger a Bank Income webhook in the Sandbox environment.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.sandbox.fire_bank_income_webhook(
  webhook_code: "BANK_INCOME_REFRESH_UPDATE",
  webhook_fields: {
    user_id: "user_id"
  }
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**webhook_override:** `String` — The URL to which the webhook should be sent. If provided, this will override the URL set in the dashboard.
    
</dd>
</dl>

<dl>
<dd>

**webhook_code:** `Plaid::Types::SandboxBankIncomeWebhookFireRequestWebhookCode` 
    
</dd>
</dl>

<dl>
<dd>

**webhook_fields:** `Plaid::Types::SandboxBankIncomeWebhookFireRequestWebhookFields` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Sandbox::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.sandbox.<a href="/lib/plaid/sandbox/client.rb">update_cra_cashflow_updates</a>(request) -> Plaid::Types::SandboxCraCashflowUpdatesUpdateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use the `/sandbox/cra/cashflow_updates/update` endpoint to manually trigger an update for the legacy Cash Flow Updates product in the Sandbox environment. To simulate a report generation for a CRA Servicing subscription, use `/sandbox/cra/servicing/simulate`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.sandbox.update_cra_cashflow_updates
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**user_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**webhook_codes:** `Internal::Types::Array[Plaid::Types::CashFlowUpdatesEventWebhookCodes]` — Webhook codes corresponding to the Cash Flow Updates events to be simulated.
    
</dd>
</dl>

<dl>
<dd>

**user_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Sandbox::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.sandbox.<a href="/lib/plaid/sandbox/client.rb">simulate_cra_servicing</a>(request) -> Plaid::Types::SandboxCraServicingSimulateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use the `/sandbox/cra/servicing/simulate` endpoint to synchronously seed a CRA Servicing report in the Sandbox environment and return a `report_id` that can be fetched via `/cra/check_report/base_report/get` or `/cra/check_report/income_insights/get`. This endpoint also fires a `CRA_REPORT_UPDATED` webhook, mirroring the notification a live subscription would emit.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.sandbox.simulate_cra_servicing(subscription_id: "subscription_id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**subscription_id:** `String` — The Servicing subscription to simulate an update for. Upon calling this endpoint, Plaid will simulate a report creation for all products referenced by this subscription ID.
    
</dd>
</dl>

<dl>
<dd>

**user_id:** `String` — The user to simulate an update for, in place of a `subscription_id`.
    
</dd>
</dl>

<dl>
<dd>

**options:** `Plaid::Types::SandboxCraServicingSimulateRequestOptions` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Sandbox::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.sandbox.<a href="/lib/plaid/sandbox/client.rb">select_oauth_accounts</a>(request) -> Internal::Types::Hash[String, Object]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Save the selected accounts when connecting to the Platypus OAuth institution
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.sandbox.select_oauth_accounts(
  oauth_state_id: "oauth_state_id",
  accounts: ["accounts"]
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**oauth_state_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**accounts:** `Internal::Types::Array[String]` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Sandbox::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## CashflowReport
<details><summary><code>client.cashflow_report.<a href="/lib/plaid/cashflow_report/client.rb">refresh</a>(request) -> Plaid::Types::CashflowReportRefreshResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

`/cashflow_report/refresh` is an endpoint that initiates an on-demand extraction to fetch the newest transactions for an Item (given an `item_id`). The Item must already have Cashflow Report added as a product in order to call `/cashflow_report/refresh`.

After calling `/cashflow_report/refresh`, Plaid will fire a webhook `CASHFLOW_REPORT_READY` alerting clients that new transactions data can then be ingested via `/cashflow_report/get` or the webhook will contain an error code informing there was an error in refreshing transactions data.

Note that the `/cashflow_report/refresh` endpoint is not supported for Capital One (`ins_128026`) non-depository accounts and will result in a `PRODUCTS_NOT_SUPPORTED` error if called on an Item that contains only non-depository accounts from that institution.

As this endpoint triggers a synchronous request for fresh data, latency may be higher than for other Plaid endpoints (typically less than 10 seconds, but up to 30 seconds or more). If you encounter errors, you may find it necessary to adjust your timeout period for requests.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.cashflow_report.refresh(
  access_token: "access_token",
  days_requested: 1
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**access_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**days_requested:** `Integer` — Number of days to retrieve transactions data for (1 to 730)
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::CashflowReport::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.cashflow_report.<a href="/lib/plaid/cashflow_report/client.rb">get</a>(request) -> Plaid::Types::CashflowReportGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/cashflow_report/get` endpoint retrieves transactions data associated with an Item. Transactions data is standardized across financial institutions.
Transactions are returned in reverse-chronological order, and the sequence of transaction ordering is stable and will not shift. Transactions are not immutable and can also be removed altogether by the institution; a removed transaction will no longer appear in `/cashflow_report/get`.  For more details, see [Pending and posted transactions](https://plaid.com/docs/transactions/transactions-data/#pending-and-posted-transactions).
Due to the potentially large number of transactions associated with an Item, results are paginated. Manipulate the `count` and `cursor` parameters in conjunction with the `has_more` response body field to fetch all available transactions.
Note that data isn't likely to be immediately available to `/cashflow_report/get`. Plaid will begin to prepare transactions data upon Item link, if Link was initialized with `cashflow_report`, or if it wasn't, upon the first call to `/cashflow_report/refresh`. To be alerted when transaction data is ready to be fetched, listen for the `CASHFLOW_REPORT_READY` webhook.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.cashflow_report.get(
  access_token: "access_token",
  days_requested: 1
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**access_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**days_requested:** `Integer` — Number of days to retrieve transactions data for (1 to 730)
    
</dd>
</dl>

<dl>
<dd>

**count:** `Integer` — Number of transactions to fetch per call
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` — The cursor value represents the last update requested. Pass in the empty string "" in the first call.
    
</dd>
</dl>

<dl>
<dd>

**options:** `Plaid::Types::CashflowReportGetRequestOptions` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::CashflowReport::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.cashflow_report.<a href="/lib/plaid/cashflow_report/client.rb">get_transactions</a>(request) -> Plaid::Types::CashflowReportTransactionsGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/cashflow_report/transactions/get` endpoint retrieves transactions data associated with an Item. Transactions data is standardized across financial institutions.
Transactions are returned in reverse-chronological order, and the sequence of transaction ordering is stable and will not shift. Transactions are not immutable and can also be removed altogether by the institution; a removed transaction will no longer appear in `/cashflow_report/transactions/get`.  For more details, see [Pending and posted transactions](https://plaid.com/docs/transactions/transactions-data/#pending-and-posted-transactions).
Due to the potentially large number of transactions associated with an Item, results are paginated. Manipulate the `count` and `cursor` parameters in conjunction with the `has_more` response body field to fetch all available transactions.
Note that data isn't likely to be immediately available to `/cashflow_report/transactions/get`. Plaid will begin to prepare transactions data upon Item link, if Link was initialized with `cashflow_report`, or if it wasn't, upon the first call to `/cashflow_report/refresh`. To be alerted when transaction data is ready to be fetched, listen for the `CASHFLOW_REPORT_READY` webhook.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.cashflow_report.get_transactions(access_token: "access_token")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**access_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**count:** `Integer` — Number of transactions to fetch per call
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` — The cursor value represents the last update requested. Pass in the empty string "" in the first call.
    
</dd>
</dl>

<dl>
<dd>

**options:** `Plaid::Types::CashflowReportTransactionsGetRequestOptions` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::CashflowReport::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.cashflow_report.<a href="/lib/plaid/cashflow_report/client.rb">get_insights</a>(request) -> Plaid::Types::CashflowReportInsightsGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/cashflow_report/insights/get` endpoint retrieves insights data associated with an Item. Insights are only calculated on credit and depository accounts.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.cashflow_report.get_insights(access_token: "access_token")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**access_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::CashflowReport::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## User
<details><summary><code>client.user.<a href="/lib/plaid/user/client.rb">refresh_transactions</a>(request) -> Plaid::Types::UserTransactionsRefreshResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

`/user/transactions/refresh` is an optional endpoint that initiates an on-demand extraction to fetch the newest transactions for a User using the Transactions bundle.
This bundle refreshes only the Transactions product data.
This endpoint is for clients who use the Transactions Insights bundle and want to proactively update all linked Items under a user.
The refresh may succeed or fail on a per-Item basis. Use the `results` array in the response to understand the outcome for each Item.

This endpoint is distinct from `/transactions/refresh`, which triggers a refresh for a single Item. Use `/user/transactions/refresh` to target all Items for a user instead.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.user.refresh_transactions(user_id: "usr_8c3ZbDBYjaqUXZ")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**user_id:** `String` — A Plaid-generated ID that identifies the end user.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::User::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.user.<a href="/lib/plaid/user/client.rb">refresh_financial_data</a>(request) -> Plaid::Types::UserFinancialDataRefreshResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

`/user/financial_data/refresh` is an optional endpoint that initiates an on-demand extraction to fetch the newest transactions for a User using the Financial Insights bundle.
This bundle refreshes the Transactions and Investments product data.
This endpoint is for clients who use the Financial Insights bundle and want to proactively update all linked Items under a user.
The refresh may succeed or fail on a per-Item basis. Use the `results` array in the response to understand the outcome for each Item.

This endpoint is distinct from `/transactions/refresh`, which triggers a refresh for a single Item. Use `/user/financial_data/refresh` to target all Items for a user instead.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.user.refresh_financial_data(user_id: "usr_8c3ZbDBYjaqUXZ")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**user_id:** `String` — A Plaid-generated ID that identifies the end user.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::User::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.user.<a href="/lib/plaid/user/client.rb">create</a>(request) -> Plaid::Types::UserCreateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

For Plaid products and flows that use the user object, `/user/create` provides you a single token to access all data associated with the user. You must call this endpoint before calling `/link/token/create` if you are using any of the following: Plaid Check, Income Verification, Multi-Item Link, or Plaid Protect (Identity). If you are using Plaid Protect Link session scoring, you do not need to call `/user/create` first; Plaid will resolve or create the user when `user.client_user_id` is provided in `/link/token/create`.
For customers who began using this endpoint on or after December 10, 2025, this endpoint takes a `client_user_id` and an `identity` object and will return a `user_id`. For customers who began using it before that date, the endpoint takes a `client_user_id` and a `consumer_report_user_identity` object and will return a `user_token` and `user_id`. For more details, see [New User APIs](https://plaid.com/docs/api/users/user-apis).
In order to create a Plaid Check Consumer Report for a user, or to use Payment Initiation, Variable Recurring Payments, or Virtual Accounts, the `identity` (new) or `consumer_report_user_identity` (legacy) object must be present. If it is not provided during the `/user/create` call, it can be added later by calling `/user/update`.


When using Payment Initiation, Variable Recurring Payments, or Virtual Accounts, the `identity` object must contain a `name` and either an email address or a phone number.


In order to generate a Plaid Check Consumer Report, the following `identity` fields, at minimum, are required and must be non-empty: `name`, `date_of_birth`, `emails`, `phone_numbers`, and `addresses` (with at least one email, phone number, and address designated as `primary`). Plaid Check Consumer Reports can only be created for US-based users; the user's address country must be `US`. If creating a report for sharing with a GSE such as Fannie or Freddie, the user's full SSN must be provided via the `id_numbers` field. Providing at least a partial SSN is also strongly recommended for all use cases, since it improves the accuracy of matching user records during compliance processes such as file disclosure, dispute, or security freeze requests.


When using Plaid Protect, it is highly recommended that you provide an `identity` object to better identify and block fraud across your Link sessions.


Plaid will normalize identity fields before storing them and utilize the same identity across different user-based products.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.user.create(client_user_id: "client_user_id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**plaid_new_user_api_enabled:** `Internal::Types::Boolean` — The HTTP header used in API requests to determine which set of User APIs to invoke: the legacy CRA version or the new User API version.
    
</dd>
</dl>

<dl>
<dd>

**client_user_id:** `String` — A unique ID representing the end user. Maximum of 128 characters. Typically this will be a user ID number from your application. Personally identifiable information, such as an email address or phone number, should not be used in the `client_user_id`.
    
</dd>
</dl>

<dl>
<dd>

**identity:** `Plaid::Types::ClientUserIdentity` 
    
</dd>
</dl>

<dl>
<dd>

**end_customer:** `String` — A unique ID representing a CRA reseller's end customer. Maximum of 128 characters.
    
</dd>
</dl>

<dl>
<dd>

**consumer_report_user_identity:** `Plaid::Types::ConsumerReportUserIdentity` 
    
</dd>
</dl>

<dl>
<dd>

**with_upgraded_user:** `Internal::Types::Boolean` — If your integration with the User API predates December 10, 2025, set this field to `true` to opt into the [New User APIs](https://plaid.com/docs/api/users/user-apis/). When enabled, you can use the `identity` field instead of `consumer_report_user_identity`.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::User::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.user.<a href="/lib/plaid/user/client.rb">get</a>(request) -> Plaid::Types::UserGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get user details using a `user_id`. This endpoint only supports users that were created on the new user API flow, without a `user_token`. For more details, see [New User APIs](https://plaid.com/docs/api/users/user-apis).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.user.get(user_id: "user_id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**plaid_new_user_api_enabled:** `Internal::Types::Boolean` — The HTTP header used in API requests to determine which set of User APIs to invoke: the legacy CRA version or the new User API version.
    
</dd>
</dl>

<dl>
<dd>

**user_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::User::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.user.<a href="/lib/plaid/user/client.rb">remove_identity</a>(request) -> Plaid::Types::UserIdentityRemoveResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

This endpoint allows customers to explicitly purge identity/PII data provided to Plaid for a given user. This is not exposed to customers by default, as it is meant for special scenarios or requests, but Plaid is obligated to enable customers to delete PII provided to us.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.user.remove_identity(user_id: "user_id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**plaid_new_user_api_enabled:** `Internal::Types::Boolean` — The HTTP header used in API requests to determine which set of User APIs to invoke: the legacy CRA version or the new User API version.
    
</dd>
</dl>

<dl>
<dd>

**user_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::User::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.user.<a href="/lib/plaid/user/client.rb">update</a>(request) -> Plaid::Types::UserUpdateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

This endpoint updates user information for an existing `user_id` or `user_token`. If an existing `user_id` or `user_token` is missing fields required for a given use case (e.g. creating a Consumer Report) use `/user/update` to add values for those fields.

Identity updates use merge semantics: provided fields overwrite existing ones; omitted fields remain unchanged.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.user.update
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**plaid_new_user_api_enabled:** `Internal::Types::Boolean` — The HTTP header used in API requests to determine which set of User APIs to invoke: the legacy CRA version or the new User API version.
    
</dd>
</dl>

<dl>
<dd>

**user_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**identity:** `Plaid::Types::ClientUserIdentity` 
    
</dd>
</dl>

<dl>
<dd>

**user_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**consumer_report_user_identity:** `Plaid::Types::ConsumerReportUserIdentity` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::User::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.user.<a href="/lib/plaid/user/client.rb">remove</a>(request) -> Plaid::Types::UserRemoveResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

`/user/remove` deletes a `user_id` or `user_token` and associated information, including any Items associated with the user.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.user.remove
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**plaid_new_user_api_enabled:** `Internal::Types::Boolean` — The HTTP header used in API requests to determine which set of User APIs to invoke: the legacy CRA version or the new User API version.
    
</dd>
</dl>

<dl>
<dd>

**user_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**user_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::User::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.user.<a href="/lib/plaid/user/client.rb">terminate_products</a>(request) -> Plaid::Types::UserProductsTerminateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Terminates Financial Management, Plaid Protect, and Servicing products associated with a `user_id`. Use this endpoint when offboarding a user or ending their subscriptions. Item access tokens are not required.

For Financial Management products, including Transactions, Liabilities, and Investments, this endpoint removes each associated Item that contains one of these products. Removal makes the Item inaccessible, initiates deletion of its product data, and terminates its per-Item subscription billing. The entire Item is removed, including access to any other products on that Item. To connect the accounts again, the user must complete Link to create a new Item.

If the user has at least one associated Item and every associated Item contains a Financial Management product, this endpoint also removes the associated Plaid user. The removed `user_id` can no longer be used to access the user.

For Plaid Protect, this endpoint terminates Protect products. For Servicing, it cancels the subscription and preserves CRA Items and historical data for future report requests.

To learn how terminating products affects billing, see [Billing](https://plaid.com/docs/account/billing/#subscription-fee).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.user.terminate_products(
  user_id: "usr_8c3ZbDBYjaqUXZ",
  reason_code: "CONSUMER_ACCOUNT_CLOSED",
  reason_note: "User closed account with client."
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**user_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**reason_code:** `Plaid::Types::ProductsTerminateReasonCode` 
    
</dd>
</dl>

<dl>
<dd>

**reason_note:** `String` — Additional context or details about the reason for terminating user-based products. Personally identifiable information, such as an email address or phone number, should not be included in the `reason_note`.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::User::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.user.<a href="/lib/plaid/user/client.rb">get_transfer_limits</a>(request) -> Plaid::Types::UserTransferLimitsGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve the user's current Guaranteed ACH per-transaction limit and configured daily, weekly, and monthly ceilings. Amounts are returned as decimal strings in dollars with two decimal places and an ISO currency code. Access to this endpoint must be enabled for your client.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.user.get_transfer_limits(user_id: "user_id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**user_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::User::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.user.<a href="/lib/plaid/user/client.rb">get_items</a>(request) -> Plaid::Types::UserItemsGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns Items associated with a `user_id`, along with their corresponding statuses. Plaid associates an Item with a User when it has been successfully connected within a Link session initialized with that `user_id`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.user.get_items
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**user_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**user_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::User::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.user.<a href="/lib/plaid/user/client.rb">associate_items</a>(request) -> Plaid::Types::UserItemsAssociateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Associates Items with a `user_id`. If an Item is already associated with a different `user_id`, calling this endpoint will disassociate it from that User and reassociate it with the target User instead. A single request can associate up to 100 Items.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.user.associate_items(
  user_id: "user_id",
  item_ids: ["item_ids"]
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**user_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**item_ids:** `Internal::Types::Array[String]` — An array of `item_id`s to be associated with the `user_id`.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::User::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.user.<a href="/lib/plaid/user/client.rb">remove_items</a>(request) -> Plaid::Types::UserItemsRemoveResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Removes specific Items associated with a user. It is equivalent to calling `/item/remove` on each Item individually, but supports use cases (such as Plaid Check) where access tokens are not available. All specified Items must belong to the user or the entire operation fails. Similar to `/item/remove`, this deletes Item product data and terminates billing on the Item's products. Once removed, Items cannot be reconnected without going through Link again.
This endpoint is not intended to remove all data for a user, as it will only remove Items and no other data for the user. If the user has any user-based recurring subscription products (Financial Management, Plaid Protect, or CRA Servicing) and is deleting their account with your product, also call `/user/products/terminate` to end those subscriptions; per-Item billing is already terminated by this endpoint. For a user initiated data deletion request, see the [Consumer Service Center](https://plaid.com/check/consumer-service-center/) to revoke access to data.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.user.remove_items(item_ids: ["item_ids"])
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**user_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**user_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**item_ids:** `Internal::Types::Array[String]` — An array of `item_id`s to be deleted. All Items for removal must be currently associated with the provided `user_id` or `user_token`. Otherwise, the entire operation will error and no Items will be deleted.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::User::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.user.<a href="/lib/plaid/user/client.rb">create_third_party_token</a>(request) -> Plaid::Types::UserThirdPartyTokenCreateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

This endpoint is used to create a third-party user token. This token can be shared with and used by a specified third-party client to access data associated with the user through supported endpoints.

Ensure you store the `third_party_user_token` along with the `user_token` and `third_party_client_id`, as it is not possible to retrieve a previously created `third_party_user_token`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.user.create_third_party_token(third_party_client_id: "third_party_client_id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**user_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**third_party_client_id:** `String` — The Plaid API `client_id` of the third-party client the token will be shared with. The token will only be valid for the specified client.
    
</dd>
</dl>

<dl>
<dd>

**expiration_time:** `String` — The expiration date and time for the third-party user token in [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format (`YYYY-MM-DDThh:mm:ssZ`). The expiration is restricted to a maximum of 24 hours from the token's creation time. If not provided, the token will automatically expire after 24 hours.
    
</dd>
</dl>

<dl>
<dd>

**user_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::User::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.user.<a href="/lib/plaid/user/client.rb">remove_third_party_token</a>(request) -> Plaid::Types::UserThirdPartyTokenRemoveResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

This endpoint is used to delete a third-party user token. Once removed, the token can no longer be used to access data associated with the user.

Any subsequent calls to retrieve information using the same third-party user token will result in an error stating the third-party user token does not exist.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.user.remove_third_party_token(third_party_user_token: "third_party_user_token")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**third_party_user_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::User::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Institutions
<details><summary><code>client.institutions.<a href="/lib/plaid/institutions/client.rb">get</a>(request) -> Plaid::Internal::OffsetItemIterator</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a JSON response containing details on all financial institutions currently supported by Plaid. Because Plaid supports thousands of institutions, results are paginated.

If there is no overlap between an institution's enabled products and a client's enabled products, then the institution will be filtered out from the response. As a result, the number of institutions returned may not match the count specified in the call.

Returns a `Plaid::Internal::OffsetItemIterator` that yields each `Plaid::Types::Institution` in the `institutions` field of every page, requesting pages as they are needed. Call `pages` on it to get each page as a `Plaid::Types::InstitutionsGetResponse`, including its other fields.

No request is sent by this call. The first page is requested when you start iterating (or call `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.institutions.get(
  count: 1,
  offset: 1,
  country_codes: ["US"]
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**count:** `Integer` — The total number of Institutions to return.
    
</dd>
</dl>

<dl>
<dd>

**offset:** `Integer` — The number of Institutions to skip.
    
</dd>
</dl>

<dl>
<dd>

**country_codes:** `Internal::Types::Array[Plaid::Types::CountryCode]` 

Specify which country or countries to include institutions from, using the ISO-3166-1 alpha-2 country code standard.

In API versions 2019-05-29 and earlier, the `country_codes` parameter is an optional parameter within the `options` object and will default to `[US]` if it is not supplied.
    
</dd>
</dl>

<dl>
<dd>

**options:** `Plaid::Types::InstitutionsGetRequestOptions` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Institutions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.institutions.<a href="/lib/plaid/institutions/client.rb">search</a>(request) -> Plaid::Types::InstitutionsSearchResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a JSON response containing details for institutions that match the query parameters, up to a maximum of ten institutions per query. Institutions that Plaid does not support for new connections are not included in search results, but can still be retrieved by ID with `/institutions/get_by_id`.

Versioning note: API versions 2019-05-29 and earlier allow use of the `public_key` parameter instead of the `client_id` and `secret` parameters to authenticate to this endpoint. The `public_key` parameter has since been deprecated; all customers are encouraged to use `client_id` and `secret` instead.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.institutions.search(
  query: "query",
  country_codes: ["US"]
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**query:** `String` — The search query. Institutions with names matching the query are returned
    
</dd>
</dl>

<dl>
<dd>

**products:** `Internal::Types::Array[Plaid::Types::Products]` — Filter the Institutions based on whether they support all products listed in `products`. Provide `null` to get institutions regardless of supported products. Note that when `auth` is specified as a product, if you are enabled for Instant Match or Automated Micro-deposits, institutions that support those products will be returned even if `auth` is not present in their product array. To search for Transfer support, use `auth`; to search for Signal Transaction Scores support, use `balance`.
    
</dd>
</dl>

<dl>
<dd>

**country_codes:** `Internal::Types::Array[Plaid::Types::CountryCode]` — Specify which country or countries to include institutions from, using the ISO-3166-1 alpha-2 country code standard. In API versions 2019-05-29 and earlier, the `country_codes` parameter is an optional parameter within the `options` object and will default to `[US]` if it is not supplied.
    
</dd>
</dl>

<dl>
<dd>

**options:** `Plaid::Types::InstitutionsSearchRequestOptions` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Institutions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.institutions.<a href="/lib/plaid/institutions/client.rb">get_by_id</a>(request) -> Plaid::Types::InstitutionsGetByIDResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a JSON response containing details on a specified financial institution.

Institutions that Plaid does not support for new connections are still returned by this endpoint, so that an `institution_id` stored on an existing Item can still be looked up. These institutions are not returned by `/institutions/get` or `/institutions/search`, and attempting to create a new Item for one of them returns an `INSTITUTION_NO_LONGER_SUPPORTED` error. Use `connection_availability` to tell the two cases apart.

Versioning note: API versions 2019-05-29 and earlier allow use of the `public_key` parameter instead of the `client_id` and `secret` to authenticate to this endpoint. The `public_key` has been deprecated; all customers are encouraged to use `client_id` and `secret` instead.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.institutions.get_by_id(
  institution_id: "institution_id",
  country_codes: ["US"]
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**institution_id:** `String` — The ID of the institution to get details about
    
</dd>
</dl>

<dl>
<dd>

**country_codes:** `Internal::Types::Array[Plaid::Types::CountryCode]` — Specify which country or countries to include institutions from, using the ISO-3166-1 alpha-2 country code standard. In API versions 2019-05-29 and earlier, the `country_codes` parameter is an optional parameter within the `options` object and will default to `[US]` if it is not supplied.
    
</dd>
</dl>

<dl>
<dd>

**options:** `Plaid::Types::InstitutionsGetByIDRequestOptions` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Institutions::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Accounts
<details><summary><code>client.accounts.<a href="/lib/plaid/accounts/client.rb">get</a>(request) -> Plaid::Types::AccountsGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/accounts/get` endpoint can be used to retrieve a list of accounts associated with any linked Item. Plaid will only return active bank accounts -- that is, accounts that are not closed and are capable of carrying a balance.
To return new accounts that were created after the user linked their Item, you can listen for the [`NEW_ACCOUNTS_AVAILABLE`](https://plaid.com/docs/api/items/#new_accounts_available) webhook and then use Link's [update mode](https://plaid.com/docs/link/update-mode/) to request that the user share this new account with you.

`/accounts/get` is free to use and retrieves cached information, rather than extracting fresh information from the institution. The balance returned will reflect the balance at the time of the last successful Item update. If the Item is enabled for a regularly updating product, such as Transactions, Investments, or Liabilities, the balance will typically update about once a day, as long as the Item is healthy. If the Item is enabled only for products that do not frequently update, such as Auth or Identity, balance data may be much older.

For real-time balance information, use the paid endpoints `/accounts/balance/get` or `/signal/evaluate` instead.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.accounts.get(
  access_token: "string",
  options: {
    account_ids: ["string"]
  }
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**access_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**options:** `Plaid::Types::AccountsGetRequestOptions` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Accounts::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.accounts.<a href="/lib/plaid/accounts/client.rb">get_balance</a>(request) -> Plaid::Types::AccountsGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/accounts/balance/get` endpoint returns the real-time balance for each of an Item's accounts. While other endpoints, such as `/accounts/get`, return a balance object,  `/accounts/balance/get` forces the available and current balance fields to be refreshed rather than cached. This endpoint can be used for existing Items that were added via any of Plaid's other products. This endpoint can be used as long as Link has been initialized with any other product; `balance` itself is not a product that can be used to initialize Link. As this endpoint triggers a synchronous request for fresh data, latency may be higher than for other Plaid endpoints (typically less than 10 seconds, but occasionally up to 30 seconds or more); if you encounter errors, you may find it necessary to adjust your timeout period when making requests.

Note: If you are getting real-time balance for the purpose of assessing the return risk of a proposed ACH transaction, it is recommended to use `/signal/evaluate` instead of `/accounts/balance/get`. `/signal/evaluate` returns the same real-time balance information and also provides access to Signal Rules, which provides no-code transaction business logic configuration, backtesting and recommendations for tuning your transaction acceptance logic, and the ability to easily switch between Balance and Signal Transaction Scores as needed for ultra-low-latency, ML-powered risk assessments. For more details, see the [Balance documentation](https://plaid.com/docs/balance/#balance-integration-options).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.accounts.get_balance(
  access_token: "string",
  options: {
    account_ids: ["string"]
  }
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**access_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**options:** `Plaid::Types::AccountsBalanceGetRequestOptions` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Accounts::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Categories
<details><summary><code>client.categories.<a href="/lib/plaid/categories/client.rb">get</a>(request) -> Plaid::Types::CategoriesGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Send a request to the `/categories/get` endpoint to get detailed information on legacy categories returned by Plaid. This endpoint does not require authentication.

All implementations are recommended to [use the newer `personal_finance_category` taxonomy](https://plaid.com/docs/transactions/pfc-migration/) instead of the legacy `category` taxonomy supported by this endpoint.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.categories.get(request: {
  key: "value"
})
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Internal::Types::Hash[String, Object]` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Categories::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Identity
<details><summary><code>client.identity.<a href="/lib/plaid/identity/client.rb">get</a>(request) -> Plaid::Types::IdentityGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/identity/get` endpoint allows you to retrieve various account holder information on file with the financial institution, including names, emails, phone numbers, and addresses. Only name data is guaranteed to be returned; other fields will be empty arrays if not provided by the institution.

Note: In API versions 2018-05-22 and earlier, the `owners` object is not returned, and instead identity information is returned in the top level `identity` object. For more details, see [Plaid API versioning](https://plaid.com/docs/api/versioning/#version-2019-05-29).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.identity.get(access_token: "access_token")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**access_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**options:** `Plaid::Types::IdentityGetRequestOptions` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Identity::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.identity.<a href="/lib/plaid/identity/client.rb">get_document_uploads</a>(request) -> Plaid::Types::IdentityDocumentsUploadsGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use `/identity/documents/uploads/get` to retrieve identity details when using [Identity Document Upload](https://plaid.com/docs/identity/identity-document-upload/).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.identity.get_document_uploads(access_token: "access_token")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**access_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**options:** `Plaid::Types::IdentityDocumentsUploadsGetRequestOptions` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Identity::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.identity.<a href="/lib/plaid/identity/client.rb">match</a>(request) -> Plaid::Types::IdentityMatchResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/identity/match` endpoint generates a match score, which indicates how well the provided identity data matches the identity information on file with the account holder's financial institution.

Fields within the `balances` object will always be null when retrieved by `/identity/match`. Instead, use the free `/accounts/get` endpoint to request balance cached data, or `/accounts/balance/get` or `/signal/evaluate` for real-time data.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.identity.match(access_token: "access_token")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**access_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**user:** `Plaid::Types::IdentityMatchUser` 
    
</dd>
</dl>

<dl>
<dd>

**options:** `Plaid::Types::IdentityMatchRequestOptions` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Identity::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.identity.<a href="/lib/plaid/identity/client.rb">list_matches</a>(request) -> Plaid::Internal::CursorItemIterator</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a chronological history of Link-originated Identity Match attempts for a client, ordered by creation time with the oldest attempt first.

This endpoint requires separate enablement in addition to access to Identity Match. To request endpoint access, contact your account manager or [submit a product access support ticket](https://dashboard.plaid.com/support/new/product-and-development/product-troubleshooting/request-product-access).

Results are retained for up to one year. Attempts marked as deleted are omitted.

Returns a `Plaid::Internal::CursorItemIterator` that yields each `Plaid::Types::IdentityMatchListAttempt` in the `identity_match_attempts` field of every page, requesting pages as they are needed. Call `pages` on it to get each page as a `Plaid::Types::IdentityMatchListResponse`, including its other fields.

No request is sent by this call. The first page is requested when you start iterating (or call `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.identity.list_matches(
  start_time: "2024-01-15T09:30:00Z",
  end_time: "2024-01-15T09:30:00Z"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**start_time:** `String` — Inclusive start of the query window in RFC 3339 format. On the first request, this cannot be earlier than one calendar year before the current time.
    
</dd>
</dl>

<dl>
<dd>

**end_time:** `String` — Inclusive end of the query window in RFC 3339 format. Must be on or after `start_time`.
    
</dd>
</dl>

<dl>
<dd>

**count:** `Integer` — Maximum number of attempts to return in one page.
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` — Opaque pagination cursor. Omit on the first request. For subsequent requests, set this field to the `next_cursor` from the previous response and use the same `start_time` and `end_time`. You may change `count` between pages.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Identity::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.identity.<a href="/lib/plaid/identity/client.rb">refresh</a>(request) -> Plaid::Types::IdentityRefreshResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

`/identity/refresh` is an optional endpoint for users of the Identity product. It initiates an on-demand extraction to fetch the most up to date Identity information from the Financial Institution. This on-demand extraction takes place in addition to the periodic extractions that automatically occur for any Identity-enabled Item. If changes to Identity are discovered after calling `/identity/refresh`, Plaid will fire a webhook [`DEFAULT_UPDATE`](https://plaid.com/docs/api/products/identity/#default_update).

As this endpoint triggers a synchronous request for fresh data, latency may be higher than for other Plaid endpoints (typically less than 10 seconds, but occasionally up to 30 seconds or more); if you encounter errors, you may find it necessary to adjust your timeout period when making requests.

`/identity/refresh` is offered as an add-on to Identity and has a separate [fee model](https://plaid.com/docs/account/billing/#per-request-flat-fee). To request access to this endpoint, submit a [product access request](https://dashboard.plaid.com/team/products) or contact your Plaid account manager.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.identity.refresh(access_token: "access_token")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**access_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Identity::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## DashboardUser
<details><summary><code>client.dashboard_user.<a href="/lib/plaid/dashboard_user/client.rb">get</a>(request) -> Plaid::Types::DashboardUserGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/dashboard_user/get` endpoint provides details (such as email address) about a specific Dashboard user based on the `dashboard_user_id` field, which is returned in the `audit_trail` object of certain Monitor and Beacon endpoints. This can be used to identify the specific reviewer who performed a Dashboard action.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.dashboard_user.get(dashboard_user_id: "54350110fedcbaf01234ffee")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**dashboard_user_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::DashboardUser::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.dashboard_user.<a href="/lib/plaid/dashboard_user/client.rb">list</a>(request) -> Plaid::Internal::CursorItemIterator</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/dashboard_user/list` endpoint provides details (such as email address) about all Dashboard users associated with your account. This can be used to audit or track the list of reviewers for Monitor, Beacon, and Identity Verification products.

Returns a `Plaid::Internal::CursorItemIterator` that yields each `Plaid::Types::DashboardUser` in the `dashboard_users` field of every page, requesting pages as they are needed. Call `pages` on it to get each page as a `Plaid::Types::DashboardUserListResponse`, including its other fields.

No request is sent by this call. The first page is requested when you start iterating (or call `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.dashboard_user.list
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**cursor:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::DashboardUser::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## WatchlistScreeningEntity
<details><summary><code>client.watchlist_screening_entity.<a href="/lib/plaid/watchlist_screening_entity/client.rb">create</a>(request) -> Plaid::Types::WatchlistScreeningEntityCreateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a new entity watchlist screening to check your customer against watchlists defined in the associated entity watchlist program. If your associated program has ongoing screening enabled, this is the profile information that will be used to monitor your customer over time.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.watchlist_screening_entity.create(search_terms: {
  entity_watchlist_program_id: "entprg_2eRPsDnL66rZ7H",
  legal_name: "Al-Qaida"
})
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**search_terms:** `Plaid::Types::EntityWatchlistSearchTerms` 
    
</dd>
</dl>

<dl>
<dd>

**client_user_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::WatchlistScreeningEntity::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.watchlist_screening_entity.<a href="/lib/plaid/watchlist_screening_entity/client.rb">get</a>(request) -> Plaid::Types::WatchlistScreeningEntityGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve an entity watchlist screening.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.watchlist_screening_entity.get(entity_watchlist_screening_id: "entscr_52xR9LKo77r1Np")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**entity_watchlist_screening_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::WatchlistScreeningEntity::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.watchlist_screening_entity.<a href="/lib/plaid/watchlist_screening_entity/client.rb">list_history</a>(request) -> Plaid::Internal::CursorItemIterator</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

List all changes to the entity watchlist screening in reverse-chronological order. If the watchlist screening has not been edited, no history will be returned.

Returns a `Plaid::Internal::CursorItemIterator` that yields each `Plaid::Types::EntityWatchlistScreening` in the `entity_watchlist_screenings` field of every page, requesting pages as they are needed. Call `pages` on it to get each page as a `Plaid::Types::WatchlistScreeningEntityHistoryListResponse`, including its other fields.

No request is sent by this call. The first page is requested when you start iterating (or call `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.watchlist_screening_entity.list_history(entity_watchlist_screening_id: "entscr_52xR9LKo77r1Np")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**entity_watchlist_screening_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::WatchlistScreeningEntity::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.watchlist_screening_entity.<a href="/lib/plaid/watchlist_screening_entity/client.rb">list_hits</a>(request) -> Plaid::Internal::CursorItemIterator</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

List all hits for the entity watchlist screening.

Returns a `Plaid::Internal::CursorItemIterator` that yields each `Plaid::Types::EntityWatchlistScreeningHit` in the `entity_watchlist_screening_hits` field of every page, requesting pages as they are needed. Call `pages` on it to get each page as a `Plaid::Types::WatchlistScreeningEntityHitListResponse`, including its other fields.

No request is sent by this call. The first page is requested when you start iterating (or call `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.watchlist_screening_entity.list_hits(entity_watchlist_screening_id: "entscr_52xR9LKo77r1Np")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**entity_watchlist_screening_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::WatchlistScreeningEntity::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.watchlist_screening_entity.<a href="/lib/plaid/watchlist_screening_entity/client.rb">list</a>(request) -> Plaid::Internal::CursorItemIterator</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

List all entity screenings.

Returns a `Plaid::Internal::CursorItemIterator` that yields each `Plaid::Types::EntityWatchlistScreening` in the `entity_watchlist_screenings` field of every page, requesting pages as they are needed. Call `pages` on it to get each page as a `Plaid::Types::WatchlistScreeningEntityListResponse`, including its other fields.

No request is sent by this call. The first page is requested when you start iterating (or call `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.watchlist_screening_entity.list(entity_watchlist_program_id: "entprg_2eRPsDnL66rZ7H")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**entity_watchlist_program_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**client_user_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**status:** `Plaid::Types::WatchlistScreeningStatus` 
    
</dd>
</dl>

<dl>
<dd>

**assignee:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::WatchlistScreeningEntity::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.watchlist_screening_entity.<a href="/lib/plaid/watchlist_screening_entity/client.rb">get_program</a>(request) -> Plaid::Types::WatchlistScreeningEntityProgramGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get an entity watchlist screening program
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.watchlist_screening_entity.get_program(entity_watchlist_program_id: "entprg_2eRPsDnL66rZ7H")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**entity_watchlist_program_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::WatchlistScreeningEntity::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.watchlist_screening_entity.<a href="/lib/plaid/watchlist_screening_entity/client.rb">list_programs</a>(request) -> Plaid::Internal::CursorItemIterator</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

List all entity watchlist screening programs

Returns a `Plaid::Internal::CursorItemIterator` that yields each `Plaid::Types::EntityWatchlistProgram` in the `entity_watchlist_programs` field of every page, requesting pages as they are needed. Call `pages` on it to get each page as a `Plaid::Types::WatchlistScreeningEntityProgramListResponse`, including its other fields.

No request is sent by this call. The first page is requested when you start iterating (or call `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.watchlist_screening_entity.list_programs
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**cursor:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::WatchlistScreeningEntity::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.watchlist_screening_entity.<a href="/lib/plaid/watchlist_screening_entity/client.rb">create_review</a>(request) -> Plaid::Types::WatchlistScreeningEntityReviewCreateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a review for an entity watchlist screening. Reviews are compliance reports created by users in your organization regarding the relevance of potential hits found by Plaid.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.watchlist_screening_entity.create_review(
  confirmed_hits: ["enthit_52xR9LKo77r1Np"],
  dismissed_hits: ["enthit_52xR9LKo77r1Np"],
  entity_watchlist_screening_id: "entscr_52xR9LKo77r1Np"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**confirmed_hits:** `Internal::Types::Array[String]` — Hits to mark as a true positive after thorough manual review. These hits will never recur or be updated once confirmed. In most cases, confirmed hits indicate that the customer should be rejected.
    
</dd>
</dl>

<dl>
<dd>

**dismissed_hits:** `Internal::Types::Array[String]` — Hits to mark as a false positive after thorough manual review. These hits will never recur or be updated once dismissed.
    
</dd>
</dl>

<dl>
<dd>

**comment:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**entity_watchlist_screening_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::WatchlistScreeningEntity::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.watchlist_screening_entity.<a href="/lib/plaid/watchlist_screening_entity/client.rb">list_reviews</a>(request) -> Plaid::Internal::CursorItemIterator</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

List all reviews for a particular entity watchlist screening. Reviews are compliance reports created by users in your organization regarding the relevance of potential hits found by Plaid.

Returns a `Plaid::Internal::CursorItemIterator` that yields each `Plaid::Types::EntityWatchlistScreeningReview` in the `entity_watchlist_screening_reviews` field of every page, requesting pages as they are needed. Call `pages` on it to get each page as a `Plaid::Types::WatchlistScreeningEntityReviewListResponse`, including its other fields.

No request is sent by this call. The first page is requested when you start iterating (or call `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.watchlist_screening_entity.list_reviews(entity_watchlist_screening_id: "entscr_52xR9LKo77r1Np")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**entity_watchlist_screening_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::WatchlistScreeningEntity::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.watchlist_screening_entity.<a href="/lib/plaid/watchlist_screening_entity/client.rb">update</a>(request) -> Plaid::Types::WatchlistScreeningEntityUpdateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update an entity watchlist screening.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.watchlist_screening_entity.update(entity_watchlist_screening_id: "entscr_52xR9LKo77r1Np")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**entity_watchlist_screening_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**search_terms:** `Plaid::Types::UpdateEntityScreeningRequestSearchTerms` 
    
</dd>
</dl>

<dl>
<dd>

**assignee:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**status:** `Plaid::Types::WatchlistScreeningStatus` 
    
</dd>
</dl>

<dl>
<dd>

**client_user_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**reset_fields:** `Internal::Types::Array[Plaid::Types::WatchlistScreeningEntityUpdateRequestResettableField]` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::WatchlistScreeningEntity::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## WatchlistScreeningIndividual
<details><summary><code>client.watchlist_screening_individual.<a href="/lib/plaid/watchlist_screening_individual/client.rb">create</a>(request) -> Plaid::Types::WatchlistScreeningIndividualCreateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a new Watchlist Screening to check your customer against watchlists defined in the associated Watchlist Program. If your associated program has ongoing screening enabled, this is the profile information that will be used to monitor your customer over time.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.watchlist_screening_individual.create(search_terms: {
  watchlist_program_id: "prg_2eRPsDnL66rZ7H",
  legal_name: "Aleksey Potemkin"
})
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**search_terms:** `Plaid::Types::WatchlistScreeningRequestSearchTerms` 
    
</dd>
</dl>

<dl>
<dd>

**client_user_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::WatchlistScreeningIndividual::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.watchlist_screening_individual.<a href="/lib/plaid/watchlist_screening_individual/client.rb">get</a>(request) -> Plaid::Types::WatchlistScreeningIndividualGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve a previously created individual watchlist screening
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.watchlist_screening_individual.get(watchlist_screening_id: "scr_52xR9LKo77r1Np")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**watchlist_screening_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::WatchlistScreeningIndividual::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.watchlist_screening_individual.<a href="/lib/plaid/watchlist_screening_individual/client.rb">list_history</a>(request) -> Plaid::Internal::CursorItemIterator</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

List all changes to the individual watchlist screening in reverse-chronological order. If the watchlist screening has not been edited, no history will be returned.

Returns a `Plaid::Internal::CursorItemIterator` that yields each `Plaid::Types::WatchlistScreeningIndividual` in the `watchlist_screenings` field of every page, requesting pages as they are needed. Call `pages` on it to get each page as a `Plaid::Types::WatchlistScreeningIndividualHistoryListResponse`, including its other fields.

No request is sent by this call. The first page is requested when you start iterating (or call `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.watchlist_screening_individual.list_history(watchlist_screening_id: "scr_52xR9LKo77r1Np")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**watchlist_screening_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::WatchlistScreeningIndividual::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.watchlist_screening_individual.<a href="/lib/plaid/watchlist_screening_individual/client.rb">list_hits</a>(request) -> Plaid::Internal::CursorItemIterator</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

List all hits found by Plaid for a particular individual watchlist screening.

Returns a `Plaid::Internal::CursorItemIterator` that yields each `Plaid::Types::WatchlistScreeningHit` in the `watchlist_screening_hits` field of every page, requesting pages as they are needed. Call `pages` on it to get each page as a `Plaid::Types::WatchlistScreeningIndividualHitListResponse`, including its other fields.

No request is sent by this call. The first page is requested when you start iterating (or call `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.watchlist_screening_individual.list_hits(watchlist_screening_id: "scr_52xR9LKo77r1Np")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**watchlist_screening_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::WatchlistScreeningIndividual::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.watchlist_screening_individual.<a href="/lib/plaid/watchlist_screening_individual/client.rb">list</a>(request) -> Plaid::Internal::CursorItemIterator</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

List previously created watchlist screenings for individuals

Returns a `Plaid::Internal::CursorItemIterator` that yields each `Plaid::Types::WatchlistScreeningIndividual` in the `watchlist_screenings` field of every page, requesting pages as they are needed. Call `pages` on it to get each page as a `Plaid::Types::WatchlistScreeningIndividualListResponse`, including its other fields.

No request is sent by this call. The first page is requested when you start iterating (or call `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.watchlist_screening_individual.list(watchlist_program_id: "prg_2eRPsDnL66rZ7H")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**watchlist_program_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**client_user_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**status:** `Plaid::Types::WatchlistScreeningStatus` 
    
</dd>
</dl>

<dl>
<dd>

**assignee:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::WatchlistScreeningIndividual::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.watchlist_screening_individual.<a href="/lib/plaid/watchlist_screening_individual/client.rb">get_program</a>(request) -> Plaid::Types::WatchlistScreeningIndividualProgramGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get an individual watchlist screening program
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.watchlist_screening_individual.get_program(watchlist_program_id: "prg_2eRPsDnL66rZ7H")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**watchlist_program_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::WatchlistScreeningIndividual::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.watchlist_screening_individual.<a href="/lib/plaid/watchlist_screening_individual/client.rb">list_programs</a>(request) -> Plaid::Internal::CursorItemIterator</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

List all individual watchlist screening programs

Returns a `Plaid::Internal::CursorItemIterator` that yields each `Plaid::Types::IndividualWatchlistProgram` in the `watchlist_programs` field of every page, requesting pages as they are needed. Call `pages` on it to get each page as a `Plaid::Types::WatchlistScreeningIndividualProgramListResponse`, including its other fields.

No request is sent by this call. The first page is requested when you start iterating (or call `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.watchlist_screening_individual.list_programs
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**cursor:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::WatchlistScreeningIndividual::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.watchlist_screening_individual.<a href="/lib/plaid/watchlist_screening_individual/client.rb">create_review</a>(request) -> Plaid::Types::WatchlistScreeningIndividualReviewCreateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a review for the individual watchlist screening. Reviews are compliance reports created by users in your organization regarding the relevance of potential hits found by Plaid.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.watchlist_screening_individual.create_review(
  confirmed_hits: ["scrhit_52xR9LKo77r1Np"],
  dismissed_hits: ["scrhit_52xR9LKo77r1Np"],
  watchlist_screening_id: "scr_52xR9LKo77r1Np"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**confirmed_hits:** `Internal::Types::Array[String]` — Hits to mark as a true positive after thorough manual review. These hits will never recur or be updated once confirmed. In most cases, confirmed hits indicate that the customer should be rejected.
    
</dd>
</dl>

<dl>
<dd>

**dismissed_hits:** `Internal::Types::Array[String]` — Hits to mark as a false positive after thorough manual review. These hits will never recur or be updated once dismissed.
    
</dd>
</dl>

<dl>
<dd>

**comment:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**watchlist_screening_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::WatchlistScreeningIndividual::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.watchlist_screening_individual.<a href="/lib/plaid/watchlist_screening_individual/client.rb">list_reviews</a>(request) -> Plaid::Internal::CursorItemIterator</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

List all reviews for the individual watchlist screening.

Returns a `Plaid::Internal::CursorItemIterator` that yields each `Plaid::Types::WatchlistScreeningReview` in the `watchlist_screening_reviews` field of every page, requesting pages as they are needed. Call `pages` on it to get each page as a `Plaid::Types::WatchlistScreeningIndividualReviewListResponse`, including its other fields.

No request is sent by this call. The first page is requested when you start iterating (or call `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.watchlist_screening_individual.list_reviews(watchlist_screening_id: "scr_52xR9LKo77r1Np")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**watchlist_screening_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::WatchlistScreeningIndividual::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.watchlist_screening_individual.<a href="/lib/plaid/watchlist_screening_individual/client.rb">update</a>(request) -> Plaid::Types::WatchlistScreeningIndividualUpdateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update a specific individual watchlist screening. This endpoint can be used to add additional customer information, correct outdated information, add a reference id, assign the individual to a reviewer, and update which program it is associated with. Please note that you may not update `search_terms` and `status` at the same time since editing `search_terms` may trigger an automatic `status` change.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.watchlist_screening_individual.update(watchlist_screening_id: "scr_52xR9LKo77r1Np")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**watchlist_screening_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**search_terms:** `Plaid::Types::UpdateIndividualScreeningRequestSearchTerms` 
    
</dd>
</dl>

<dl>
<dd>

**assignee:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**status:** `Plaid::Types::WatchlistScreeningStatus` 
    
</dd>
</dl>

<dl>
<dd>

**client_user_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**reset_fields:** `Internal::Types::Array[Plaid::Types::WatchlistScreeningIndividualUpdateRequestResettableField]` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::WatchlistScreeningIndividual::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## BeaconAccountRisk
<details><summary><code>client.beacon_account_risk.<a href="/lib/plaid/beacon_account_risk/client.rb">evaluate</a>(request) -> Plaid::Types::BeaconAccountRiskEvaluateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use `/beacon/account_risk/v1/evaluate` to get risk insights for a linked account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.beacon_account_risk.evaluate
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**access_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**options:** `Plaid::Types::BeaconAccountRiskEvaluateRequestOptions` 
    
</dd>
</dl>

<dl>
<dd>

**client_user_id:** `String` — A unique ID that identifies the end user in your system. This ID is used to correlate requests by a user with multiple evaluations and/or multiple linked accounts. Personally identifiable information, such as an email address or phone number, should not be used in the `client_user_id`.
    
</dd>
</dl>

<dl>
<dd>

**client_evaluation_id:** `String` — Unique identifier of what you are looking to evaluate (account add, information change, etc.) to allow us to tie the activity to the decisions and possible fraud outcome sent via our feedback endpoints. You can use your internal request ID or similar.
    
</dd>
</dl>

<dl>
<dd>

**evaluation_reason:** `Plaid::Types::BeaconAccountRiskEvaluateEvaluationReason` 
    
</dd>
</dl>

<dl>
<dd>

**device:** `Plaid::Types::SignalDevice` 
    
</dd>
</dl>

<dl>
<dd>

**evaluate_time:** `String` — The time the event for evaluation has occurred. Populate this field for backfilling data. If you don't populate this field, we'll use the timestamp at the time of receipt. Use ISO 8601 format (YYYY-MM-DDTHH:mm:ssZ).
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::BeaconAccountRisk::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## BeaconUser
<details><summary><code>client.beacon_user.<a href="/lib/plaid/beacon_user/client.rb">create</a>(request) -> Plaid::Types::BeaconUserCreateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create and scan a Beacon User against your Beacon Program, according to your program's settings.

When you submit a new user to `/beacon/user/create`, several checks are performed immediately:

  - The user's PII (provided within the `user` object) is searched against all other users within the Beacon Program you specified. If a match is found that violates your program's "Duplicate Information Filtering" settings, the user will be returned with a status of `pending_review`.

  - The user's PII is also searched against all fraud reports created by your organization across all of your Beacon Programs. If the user's data matches a fraud report that your team created, the user will be returned with a status of `rejected`.

  - Finally, the user's PII is searched against all fraud reports shared with the Beacon Network by other companies. If a matching fraud report is found, the user will be returned with a `pending_review` status if your program has enabled automatic flagging based on network fraud.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.beacon_user.create(
  program_id: "becprg_11111111111111",
  client_user_id: "your-db-id-3b24110",
  user: {
    name: {
      given_name: "Leslie",
      family_name: "Knope"
    }
  }
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**program_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**client_user_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**user:** `Plaid::Types::BeaconUserRequestData` 
    
</dd>
</dl>

<dl>
<dd>

**access_tokens:** `Internal::Types::Array[String]` 

Send this array of access tokens to link accounts to the Beacon User and have them evaluated for Account Insights.
A maximum of 50 accounts total can be added to a single Beacon User.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::BeaconUser::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.beacon_user.<a href="/lib/plaid/beacon_user/client.rb">get</a>(request) -> Plaid::Types::BeaconUserGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Fetch a Beacon User.

The Beacon User is returned with all of their associated information and a `status` based on the Beacon Network duplicate record and fraud checks.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.beacon_user.get(beacon_user_id: "becusr_42cF1MNo42r9Xj")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**beacon_user_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::BeaconUser::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.beacon_user.<a href="/lib/plaid/beacon_user/client.rb">review</a>(request) -> Plaid::Types::BeaconUserGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update the status of a Beacon User.

When updating a Beacon User's status via this endpoint, Plaid validates that the status change is consistent with the related state for this Beacon User. Specifically, we will check:

1. Whether there are any associated Beacon Reports connected to the Beacon User, and
2. Whether there are any confirmed Beacon Report Syndications connected to the Beacon User.

When updating a Beacon User's status to `rejected`, we enforce that either a Beacon Report has been created for the Beacon User or a Beacon Report Syndication has been confirmed.
When updating a Beacon User's status to `cleared`, we enforce that there are no active Beacon Reports or confirmed Beacon Report Syndications associated with the user. If you previously created a Beacon Report for this user, you must delete it before updating the Beacon User's status to `cleared`.
There are no restrictions on updating a Beacon User's status to `pending_review`.

If these conditions are not met, the request will be rejected with an error explaining the issue.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.beacon_user.review(
  beacon_user_id: "becusr_42cF1MNo42r9Xj",
  status: "rejected"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**beacon_user_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**status:** `Plaid::Types::BeaconUserStatus` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::BeaconUser::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.beacon_user.<a href="/lib/plaid/beacon_user/client.rb">update</a>(request) -> Plaid::Types::BeaconUserUpdateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update the identity data for a Beacon User in your Beacon Program or add new accounts to the Beacon User.

Similar to `/beacon/user/create`, several checks are performed immediately when you submit an identity data change to `/beacon/user/update`:

  - The user's updated PII is searched against all other users within the Beacon Program you specified. If a match is found that violates your program's "Duplicate Information Filtering" settings, the user will be returned with a status of `pending_review`.

  - The user's updated PII is also searched against all fraud reports created by your organization across all of your Beacon Programs. If the user's data matches a fraud report that your team created, the user will be returned with a status of `rejected`.

  - Finally, the user's PII is searched against all fraud reports shared with the Beacon Network by other companies. If a matching fraud report is found, the user will be returned with a `pending_review` status if your program has enabled automatic flagging based on network fraud.

Plaid maintains a version history for each Beacon User, so the Beacon User's identity data before and after the update is retained as separate versions.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.beacon_user.update(beacon_user_id: "becusr_42cF1MNo42r9Xj")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**beacon_user_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**user:** `Plaid::Types::BeaconUserUpdateRequestData` 
    
</dd>
</dl>

<dl>
<dd>

**access_tokens:** `Internal::Types::Array[String]` 

Send this array of access tokens to add accounts to this user for evaluation.
This will add accounts to this Beacon User. If left null only existing accounts will be returned in response.
A maximum of 50 accounts total can be added to a Beacon User.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::BeaconUser::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.beacon_user.<a href="/lib/plaid/beacon_user/client.rb">list_history</a>(request) -> Plaid::Internal::CursorItemIterator</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

List all changes to the Beacon User in reverse-chronological order.

Returns a `Plaid::Internal::CursorItemIterator` that yields each `Plaid::Types::BeaconUser` in the `beacon_users` field of every page, requesting pages as they are needed. Call `pages` on it to get each page as a `Plaid::Types::BeaconUserHistoryListResponse`, including its other fields.

No request is sent by this call. The first page is requested when you start iterating (or call `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.beacon_user.list_history(beacon_user_id: "becusr_42cF1MNo42r9Xj")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**beacon_user_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::BeaconUser::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.beacon_user.<a href="/lib/plaid/beacon_user/client.rb">get_account_insights</a>(request) -> Plaid::Types::BeaconUserAccountInsightsGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get Account Insights for all Accounts linked to this Beacon User. The insights for each account are computed based on the information that was last retrieved from the financial institution.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.beacon_user.get_account_insights(
  beacon_user_id: "becusr_42cF1MNo42r9Xj",
  access_token: "access_token"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**beacon_user_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**access_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::BeaconUser::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## BeaconReport
<details><summary><code>client.beacon_report.<a href="/lib/plaid/beacon_report/client.rb">create</a>(request) -> Plaid::Types::BeaconReportCreateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a fraud report for a given Beacon User.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.beacon_report.create(
  beacon_user_id: "becusr_42cF1MNo42r9Xj",
  type: "first_party",
  fraud_date: "1990-05-29"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**beacon_user_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**type:** `Plaid::Types::BeaconReportCreateType` 
    
</dd>
</dl>

<dl>
<dd>

**fraud_date:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**fraud_amount:** `Plaid::Types::FraudAmount` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::BeaconReport::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.beacon_report.<a href="/lib/plaid/beacon_report/client.rb">list</a>(request) -> Plaid::Internal::CursorItemIterator</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use the `/beacon/report/list` endpoint to view all Beacon Reports you created for a specific Beacon User. The reports returned by this endpoint are exclusively reports you created for a specific user. A Beacon User can only have one active report at a time, but a new report can be created if a previous report has been deleted. The results from this endpoint are paginated; the `next_cursor` field will be populated if there is another page of results that can be retrieved. To fetch the next page, pass the `next_cursor` value as the `cursor` parameter in the next request.

Returns a `Plaid::Internal::CursorItemIterator` that yields each `Plaid::Types::BeaconReport` in the `beacon_reports` field of every page, requesting pages as they are needed. Call `pages` on it to get each page as a `Plaid::Types::BeaconReportListResponse`, including its other fields.

No request is sent by this call. The first page is requested when you start iterating (or call `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.beacon_report.list(beacon_user_id: "becusr_42cF1MNo42r9Xj")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**beacon_user_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::BeaconReport::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.beacon_report.<a href="/lib/plaid/beacon_report/client.rb">get</a>(request) -> Plaid::Types::BeaconReportGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a Beacon Report for a given Beacon Report ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.beacon_report.get(beacon_report_id: "becrpt_11111111111111")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**beacon_report_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::BeaconReport::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## BeaconDuplicate
<details><summary><code>client.beacon_duplicate.<a href="/lib/plaid/beacon_duplicate/client.rb">get</a>(request) -> Plaid::Types::BeaconDuplicateGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a Beacon Duplicate for a given Beacon Duplicate id.

A Beacon Duplicate represents a pair of similar Beacon Users within your organization.

Two Beacon User revisions are returned for each Duplicate record in either the `beacon_user1` or `beacon_user2` response fields.

The `analysis` field in the response indicates which fields matched between `beacon_user1` and `beacon_user2`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.beacon_duplicate.get(beacon_duplicate_id: "becdup_11111111111111")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**beacon_duplicate_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::BeaconDuplicate::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Protect
<details><summary><code>client.protect.<a href="/lib/plaid/protect/client.rb">get_user_insights</a>(request) -> Plaid::Types::ProtectUserInsightsGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this endpoint to get basic information about a user as it relates to their fraud profile with Protect.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.protect.get_user_insights
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**user_id:** `String` — The Plaid User ID. Either `user_id` or `client_user_id` must be provided.
    
</dd>
</dl>

<dl>
<dd>

**client_user_id:** `String` — A unique ID representing the end user. Either `user_id` or `client_user_id` must be provided.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Protect::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.protect.<a href="/lib/plaid/protect/client.rb">create_report</a>(request) -> Plaid::Types::ProtectReportCreateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this endpoint to create a Protect report to document fraud incidents, investigation outcomes, or other risk events. This endpoint allows you to report various types of incidents including account takeovers, identity fraud, unauthorized transactions, and other security events. The reported data helps improve fraud detection models and provides valuable feedback to enhance the overall security of the Plaid network.

Reports can be created for confirmed incidents that have been fully investigated, or for suspected incidents that require further review. You can associate reports with specific users, sessions, or transactions to provide comprehensive context about the incident. Each report must include `user_id`, `client_user_id`, or an `incident_event` with at least one supported identifier: `link_session_id`, `idv_session_id`, `protect_event_id`, `signal_client_transaction_id`, or `access_token`. Context fields such as `internal_reference`, `time`, `amount`, and `bank_account` do not satisfy this identifier requirement.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.protect.create_report(
  report_confidence: "CONFIRMED",
  report_type: "USER_ACCOUNT_TAKEOVER",
  report_source: "INTERNAL_REVIEW"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**user_id:** `String` — The Plaid User ID associated with the report. This or `client_user_id` can be provided, not both.
    
</dd>
</dl>

<dl>
<dd>

**client_user_id:** `String` — A unique ID representing the end user. Maximum of 128 characters. Typically this will be a user ID number from your application. Personally identifiable information, such as an email address or phone number, should not be used in the `client_user_id`. This or `user_id` can be provided, not both. If a Plaid User does not already exist for this `client_user_id` within your client account, one will be created.
    
</dd>
</dl>

<dl>
<dd>

**incident_event:** `Plaid::Types::ProtectIncidentEvent` 
    
</dd>
</dl>

<dl>
<dd>

**report_confidence:** `Plaid::Types::ProtectReportConfidence` 
    
</dd>
</dl>

<dl>
<dd>

**report_type:** `Plaid::Types::ProtectReportType` 
    
</dd>
</dl>

<dl>
<dd>

**report_source:** `Plaid::Types::ProtectReportSource` 
    
</dd>
</dl>

<dl>
<dd>

**bank_account:** `Plaid::Types::ProtectBankAccount` 
    
</dd>
</dl>

<dl>
<dd>

**ach_return_code:** `String` — Must be a valid ACH return code (e.g. `R01`), required if `report_type` is `ACH_RETURN`.
    
</dd>
</dl>

<dl>
<dd>

**notes:** `String` — Additional context or details about the report.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Protect::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.protect.<a href="/lib/plaid/protect/client.rb">create_cash_advance_decision</a>(request) -> Plaid::Types::ProtectCashAdvanceDecisionCreateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this endpoint to record a cash-advance decision as feedback. A decision is a determination of whether to approve a user's requested advance and on what terms.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.protect.create_cash_advance_decision(
  user: {},
  decision_time: "2024-01-15T09:30:00Z",
  decision: "APPROVED"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**user:** `Plaid::Types::ProtectUser` 
    
</dd>
</dl>

<dl>
<dd>

**client_advance_id:** `String` — Your unique identifier for a cash-advance. Required when `is_taken` is `true`. This should be the same identifier provided when recording a repayment.
    
</dd>
</dl>

<dl>
<dd>

**advance_type:** `Plaid::Types::CashAdvanceType` 
    
</dd>
</dl>

<dl>
<dd>

**previous_advance_count:** `Integer` — The number of cash-advances a user has previously taken.
    
</dd>
</dl>

<dl>
<dd>

**decision_time:** `String` — The time the decision was made, in ISO 8601 / RFC 3339 format (`YYYY-MM-DDTHH:mm:ssZ`).
    
</dd>
</dl>

<dl>
<dd>

**decision:** `Plaid::Types::CashAdvanceDecisionOutcome` 
    
</dd>
</dl>

<dl>
<dd>

**is_taken:** `Internal::Types::Boolean` — Whether the end user took the cash-advance. Required when `decision` is APPROVED. When `true`, `client_advance_id` and `cash_advance` are required.
    
</dd>
</dl>

<dl>
<dd>

**cash_advance:** `Plaid::Types::CashAdvanceInfo` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Protect::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.protect.<a href="/lib/plaid/protect/client.rb">create_cash_advance_repayment</a>(request) -> Plaid::Types::ProtectCashAdvanceRepaymentCreateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use this endpoint to record a cash-advance repayment as feedback. A repayment is a record paying back all or some of a previously-taken cash-advance.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.protect.create_cash_advance_repayment(
  user: {},
  client_advance_id: "client_advance_id",
  status: "REPAID",
  repayment: {
    amount_due: {
      value: 1.1
    },
    due_date: "2023-01-15"
  }
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**user:** `Plaid::Types::ProtectUser` 
    
</dd>
</dl>

<dl>
<dd>

**client_advance_id:** `String` — The client's unique identifier for the cash-advance.
    
</dd>
</dl>

<dl>
<dd>

**status:** `Plaid::Types::CashAdvanceRepaymentStatus` 
    
</dd>
</dl>

<dl>
<dd>

**repayment_time:** `String` — The time the repayment occurred. Required when `status` is `REPAID` or `PARTIAL_PAYMENT`. In ISO 8601 / RFC 3339 format (`YYYY-MM-DDTHH:mm:ssZ`).
    
</dd>
</dl>

<dl>
<dd>

**repayment:** `Plaid::Types::CashAdvanceRepayment` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Protect::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.protect.<a href="/lib/plaid/protect/client.rb">upload_cash_advance_feedback</a>(request) -> Plaid::Types::ProtectCashAdvanceFeedbackUploadResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Upload a CSV file of cash advance decision or repayment feedback. Each row is equivalent to one call to `/protect/cash_advance/decision/create` or `/protect/cash_advance/repayment/create`. Send the request as `multipart/form-data` with `client_id` and `secret` in the `PLAID-CLIENT-ID` and `PLAID-SECRET` headers. The file is accepted for asynchronous processing; the response contains a `request_id` and an `upload_id` that identifies the upload.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.protect.upload_cash_advance_feedback(
  feedback_type: "DECISION",
  file: "file"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**feedback_type:** `Plaid::Types::CashAdvanceFeedbackType` 
    
</dd>
</dl>

<dl>
<dd>

**file:** `String` — A CSV file of feedback rows. Maximum 20 MB.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Protect::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.protect.<a href="/lib/plaid/protect/client.rb">compute</a>(request) -> Plaid::Types::ProtectComputeResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Compute a Protect Trust Index score for a user. The model selected determines what is scored and what additional fields the response contains. For example, `ti-link-session-3-<client>` scores a completed Link session for fraud risk; `cash-advance-ongoing-<client>-1.0` scores repayment risk for a cash advance, additionally populating per-amount-bucket subscores. Cash-advance models require that the user have a Plaid Item with Transactions enabled, or an Assets Report, before scoring.

The endpoint returns HTTP 400 with `error_type` = `INVALID_REQUEST` and `error_code` = `FAILED_PRECONDITION` when a required precondition is not met: for link-session models, when the Link session has not completed; for cash-advance models, when the user has not successfully linked any Item. For device-session models, the endpoint may return retryable `error_code` = `SESSION_NOT_READY` until the Protect SDK has delivered device data for the session.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.protect.compute(
  model: "model",
  user: {}
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**model:** `String` — The name of the Trust Index model to use for scoring. Examples: `ti-link-session-3` or `ti-link-session-3.0` (link-session fraud), `ti-identity-2.0` (identity fraud), and `cash-advance-ongoing-<client>-1.0` (cash advances). Cash-advance models are client-scoped; use the model name issued for your client. The model specified may require certain fields within `model_inputs`; for example, `ti-link-session-2` requires the `link` field. Cash-advance models do not use `model_inputs`.
    
</dd>
</dl>

<dl>
<dd>

**user:** `Plaid::Types::ProtectUser` 
    
</dd>
</dl>

<dl>
<dd>

**model_inputs:** `Plaid::Types::ProtectModelInputs` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Protect::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.protect.<a href="/lib/plaid/protect/client.rb">send_event</a>(request) -> Plaid::Types::ProtectEventSendResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Send a new event to enrich user data and optionally get a Trust Index score for the event.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.protect.send_event(event: nil)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**timestamp:** `String` — Timestamp of the event. Might be the current moment or a time in the past. In [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format, e.g. `"2017-09-14T14:42:19.350Z"`
    
</dd>
</dl>

<dl>
<dd>

**event:** `Plaid::Types::ProtectEvent` 
    
</dd>
</dl>

<dl>
<dd>

**device_session_id:** `String` — Device Session ID should be provided for any event correlated with a frontend user session started via the Protect SDK.
    
</dd>
</dl>

<dl>
<dd>

**request_trust_index:** `Internal::Types::Boolean` — Whether this event should be scored with Trust Index. The default is false.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Protect::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.protect.<a href="/lib/plaid/protect/client.rb">get_event</a>(request) -> Plaid::Types::ProtectEventGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get information about a user event including Trust Index score and fraud attributes.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.protect.get_event(event_id: "event_id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**event_id:** `String` — The event ID to retrieve information for.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Protect::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## BusinessVerification
<details><summary><code>client.business_verification.<a href="/lib/plaid/business_verification/client.rb">get</a>(request) -> Plaid::Types::BusinessVerificationGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve the current state of a specific business verification.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.business_verification.get(business_verification_id: "busver_52xR9LKo77r1Np")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**business_verification_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::BusinessVerification::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.business_verification.<a href="/lib/plaid/business_verification/client.rb">create</a>(request) -> Plaid::Types::BusinessVerificationCreateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a new business verification to check a business's identity and risk profile.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.business_verification.create(
  client_user_id: "your-db-id-3b24110",
  business: {
    name: "Acme Corporation",
    address: {
      street: "123 Main St.",
      city: "Pawnee",
      country: "US"
    }
  }
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**client_user_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**business:** `Plaid::Types::BusinessVerificationCreateRequestBusiness` 
    
</dd>
</dl>

<dl>
<dd>

**options:** `Plaid::Types::BusinessVerificationCreateRequestOptions` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::BusinessVerification::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Processor
<details><summary><code>client.processor.<a href="/lib/plaid/processor/client.rb">get_auth</a>(request) -> Plaid::Types::ProcessorAuthGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/processor/auth/get` endpoint returns the bank account and bank identification number (such as the routing number, for US accounts), for a checking, savings, or cash management account that''s associated with a given `processor_token`. The endpoint also returns high-level account data and balances when available.

Versioning note: API versions 2019-05-29 and earlier use a different schema for the `numbers` object returned by this endpoint. For details, see [Plaid API versioning](https://plaid.com/docs/api/versioning/#version-2020-09-14).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.processor.get_auth(processor_token: "processor_token")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**processor_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Processor::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.processor.<a href="/lib/plaid/processor/client.rb">get_account</a>(request) -> Plaid::Types::ProcessorAccountGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

This endpoint returns the account associated with a given processor token.

This endpoint retrieves cached information, rather than extracting fresh information from the institution. As a result, the account balance returned may not be up-to-date; for real-time balance information, use `/processor/balance/get` instead. Note that some information is nullable.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.processor.get_account(processor_token: "processor_token")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**processor_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Processor::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.processor.<a href="/lib/plaid/processor/client.rb">get_investment_holdings</a>(request) -> Plaid::Types::ProcessorInvestmentsHoldingsGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

This endpoint returns the stock position data of the account associated with a given processor token.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.processor.get_investment_holdings(processor_token: "processor_token")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**processor_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Processor::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.processor.<a href="/lib/plaid/processor/client.rb">get_investment_auth</a>(request) -> Plaid::Types::ProcessorInvestmentsAuthGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/processor/investments/auth/get` endpoint allows you to retrieve information about the account
authorized by a processor token, including account numbers, account owners, holdings, and data provenance information.

To receive Investments Auth webhooks for a processor token, set its webhook URL via the [`/processor/token/webhook/update`](https://plaid.com/docs/api/processor-partners/#processortokenwebhookupdate) endpoint.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.processor.get_investment_auth(processor_token: "processor_token")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**processor_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Processor::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.processor.<a href="/lib/plaid/processor/client.rb">get_investment_transactions</a>(request) -> Plaid::Internal::OffsetItemIterator</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/processor/investments/transactions/get` endpoint allows developers to retrieve up to 24 months of user-authorized transaction data for the investment account associated with the processor token.

Transactions are returned in reverse-chronological order, and the sequence of transaction ordering is stable and will not shift.

Due to the potentially large number of investment transactions associated with the account, results are paginated. Manipulate the count and offset parameters in conjunction with the `total_investment_transactions` response body field to fetch all available investment transactions.

Note that Investments does not have a webhook to indicate when initial transaction data has loaded (unless you use the `async_update` option). Instead, if transactions data is not ready when `/processor/investments/transactions/get` is first called, Plaid will wait for the data. For this reason, calling `/processor/investments/transactions/get` immediately after Link may take up to one to two minutes to return.

Data returned by the asynchronous investments extraction flow (when `async_update` is set to true) may not be immediately available to `/processor/investments/transactions/get`. To be alerted when the data is ready to be fetched, listen for the `HISTORICAL_UPDATE` webhook. If no investments history is ready when `/processor/investments/transactions/get` is called, it will return a `PRODUCT_NOT_READY` error.

To receive Investments Transactions webhooks for a processor token, set its webhook URL via the [`/processor/token/webhook/update`](https://plaid.com/docs/api/processor-partners/#processortokenwebhookupdate) endpoint.

Returns a `Plaid::Internal::OffsetItemIterator` that yields each `Plaid::Types::InvestmentTransaction` in the `investment_transactions` field of every page, requesting pages as they are needed. Call `pages` on it to get each page as a `Plaid::Types::ProcessorInvestmentsTransactionsGetResponse`, including its other fields.

No request is sent by this call. The first page is requested when you start iterating (or call `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.processor.get_investment_transactions(
  processor_token: "processor_token",
  start_date: "2023-01-15",
  end_date: "2023-01-15"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**options:** `Plaid::Types::InvestmentsTransactionsGetRequestOptions` 
    
</dd>
</dl>

<dl>
<dd>

**processor_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**start_date:** `String` — The earliest date for which data should be returned. Dates should be formatted as YYYY-MM-DD. Plaid returns all investment transaction history stored for the Item (up to 2 years prior to the initial linking of the Item).
    
</dd>
</dl>

<dl>
<dd>

**end_date:** `String` — The latest date for which data should be returned. Dates should be formatted as YYYY-MM-DD.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Processor::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.processor.<a href="/lib/plaid/processor/client.rb">get_transactions</a>(request) -> Plaid::Internal::OffsetItemIterator</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/processor/transactions/get` endpoint allows developers to receive user-authorized transaction data for credit, depository, and loan-type accounts (coverage may be limited). Transaction data is standardized across financial institutions, and in many cases transactions are linked to a clean name, entity type, location, and category. Similarly, account data is standardized and returned with a clean name, number, balance, and other meta information where available.

Transactions are returned in reverse-chronological order, and the sequence of transaction ordering is stable and will not shift.  Transactions are not immutable and can also be removed altogether by the institution; a removed transaction will no longer appear in `/processor/transactions/get`.  For more details, see [Pending and posted transactions](https://plaid.com/docs/transactions/transactions-data/#pending-and-posted-transactions).

Due to the potentially large number of transactions associated with a processor token, results are paginated. Manipulate the `count` and `offset` parameters in conjunction with the `total_transactions` response body field to fetch all available transactions.

Data returned by `/processor/transactions/get` will be the data available for the processor token as of the most recent successful check for new transactions. Plaid typically checks for new data multiple times a day, but these checks may occur less frequently, such as once a day, depending on the institution. To force Plaid to check for new transactions, you can use the `/processor/transactions/refresh` endpoint.

Note that data may not be immediately available to `/processor/transactions/get`. Plaid will begin to prepare transactions data upon Item link, if Link was initialized with `transactions`, or upon the first call to `/processor/transactions/get`, if it wasn't. If no transaction history is ready when `/processor/transactions/get` is called, it will return a `PRODUCT_NOT_READY` error.

To receive Transactions webhooks for a processor token, set its webhook URL via the [`/processor/token/webhook/update`](https://plaid.com/docs/api/processor-partners/#processortokenwebhookupdate) endpoint.

Returns a `Plaid::Internal::OffsetItemIterator` that yields each `Plaid::Types::Transaction` in the `transactions` field of every page, requesting pages as they are needed. Call `pages` on it to get each page as a `Plaid::Types::ProcessorTransactionsGetResponse`, including its other fields.

No request is sent by this call. The first page is requested when you start iterating (or call `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.processor.get_transactions(
  processor_token: "processor_token",
  start_date: "2023-01-15",
  end_date: "2023-01-15"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**options:** `Plaid::Types::ProcessorTransactionsGetRequestOptions` 
    
</dd>
</dl>

<dl>
<dd>

**processor_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**start_date:** `String` — The earliest date for which data should be returned. Dates should be formatted as YYYY-MM-DD. Plaid returns all transaction history stored for the Item (up to 2 years prior to the initial linking of the Item).
    
</dd>
</dl>

<dl>
<dd>

**end_date:** `String` — The latest date for which data should be returned. Dates should be formatted as YYYY-MM-DD.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Processor::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.processor.<a href="/lib/plaid/processor/client.rb">sync_transactions</a>(request) -> Plaid::Types::ProcessorTransactionsSyncResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>


The `/processor/transactions/sync` endpoint retrieves transactions associated with an Item and can fetch updates using a cursor to track which updates have already been seen.

For important instructions on integrating with `/processor/transactions/sync`, see the [Transactions integration overview](https://plaid.com/docs/transactions/#integration-overview). If you are migrating from an existing integration using `/processor/transactions/get`, see the [Transactions Sync migration guide](https://plaid.com/docs/transactions/sync-migration/).

This endpoint supports `credit`, `depository`, and `loan`-type accounts. For `investments` accounts, use `/processor/investments/transactions/get` instead.

When retrieving paginated updates, track both the `next_cursor` from the latest response and the original cursor from the first call in which `has_more` was `true`; if a call to `/processor/transactions/sync` fails when retrieving a paginated update (e.g. due to the [`TRANSACTIONS_SYNC_MUTATION_DURING_PAGINATION`](https://plaid.com/docs/errors/transactions/#transactions_sync_mutation_during_pagination) error), the entire pagination request loop must be restarted beginning with the cursor for the first page of the update, rather than retrying only the single request that failed.

If transactions data is not yet available for the Item, which can happen if the Item was not initialized with transactions during the `/link/token/create` call or if `/processor/transactions/sync` was called within a few seconds of Item creation, `/processor/transactions/sync` will return empty transactions arrays.

Plaid typically checks for new transactions data between one and four times per day, depending on the institution. To find out when transactions were last updated for an Item, use the [Item Debugger](https://plaid.com/docs/account/activity/#troubleshooting-with-item-debugger) or call `/item/get`; the `item.status.transactions.last_successful_update` field will show the timestamp of the most recent successful update. To force Plaid to check for new transactions, use the `/processor/transactions/refresh` endpoint.

To be alerted when new transactions are available, listen for the [`SYNC_UPDATES_AVAILABLE`](https://plaid.com/docs/api/products/transactions/#sync_updates_available) webhook.

To receive Transactions webhooks for a processor token, set its webhook URL via the [`/processor/token/webhook/update`](https://plaid.com/docs/api/processor-partners/#processortokenwebhookupdate) endpoint.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.processor.sync_transactions(processor_token: "processor_token")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**processor_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` 

The cursor value represents the last update requested. Providing it will cause the response to only return changes after this update.
If omitted, the entire history of updates will be returned, starting with the first-added transactions on the Item.
Note: The upper-bound length of this cursor is 256 characters of base64.
    
</dd>
</dl>

<dl>
<dd>

**count:** `Integer` — The number of transaction updates to fetch.
    
</dd>
</dl>

<dl>
<dd>

**options:** `Plaid::Types::TransactionsSyncRequestOptions` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Processor::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.processor.<a href="/lib/plaid/processor/client.rb">refresh_transactions</a>(request) -> Plaid::Types::ProcessorTransactionsRefreshResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

`/processor/transactions/refresh` is an optional endpoint for users of the Transactions product. It initiates an on-demand extraction to fetch the newest transactions for a processor token. This on-demand extraction takes place in addition to the periodic extractions that automatically occur one or more times per day for any Transactions-enabled processor token. If changes to transactions are discovered after calling `/processor/transactions/refresh`, Plaid will fire a webhook: for `/processor/transactions/sync` users, [`SYNC_UPDATES_AVAILABLE`](https://plaid.com/docs/api/products/transactions/#sync_updates_available) will be fired if there are any transactions updated, added, or removed. For users of both `/processor/transactions/sync` and `/processor/transactions/get`, [`TRANSACTIONS_REMOVED`](https://plaid.com/docs/api/products/transactions/#transactions_removed) will be fired if any removed transactions are detected, and [`DEFAULT_UPDATE`](https://plaid.com/docs/api/products/transactions/#default_update) will be fired if any new transactions are detected. New transactions can be fetched by calling `/processor/transactions/get` or `/processor/transactions/sync`. Note that the `/processor/transactions/refresh` endpoint is not supported for Capital One (`ins_128026`) non-depository accounts and will result in a `PRODUCTS_NOT_SUPPORTED` error if called on an Item that contains only non-depository accounts from that institution.

As this endpoint triggers a synchronous request for fresh data, latency may be higher than for other Plaid endpoints (typically less than 10 seconds, but occasionally up to 30 seconds or more); if you encounter errors, you may find it necessary to adjust your timeout period when making requests.

`/processor/transactions/refresh` is offered as an add-on to Transactions and has a separate [fee model](https://plaid.com/docs/account/billing/#per-request-flat-fee). To request access to this endpoint, submit a [product access request](https://dashboard.plaid.com/team/products) or contact your Plaid account manager.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.processor.refresh_transactions(processor_token: "processor_token")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**processor_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Processor::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.processor.<a href="/lib/plaid/processor/client.rb">get_recurring_transactions</a>(request) -> Plaid::Types::ProcessorTransactionsRecurringGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/processor/transactions/recurring/get` endpoint allows developers to receive a summary of the recurring outflow and inflow streams (expenses and deposits) from a user's checking, savings or credit card accounts. Additionally, Plaid provides key insights about each recurring stream including the category, merchant, last amount, and more. Developers can use these insights to build tools and experiences that help their users better manage cash flow, monitor subscriptions, reduce spend, and stay on track with bill payments.

This endpoint is offered as an add-on to Transactions. To request access to this endpoint, submit a [product access request](https://dashboard.plaid.com/team/products) or contact your Plaid account manager.

This endpoint can only be called on a processor token that has already been initialized with Transactions (either during Link, by specifying it in `/link/token/create`; or after Link, by calling `/processor/transactions/get` or `/processor/transactions/sync`). Once all historical transactions have been fetched, call `/processor/transactions/recurring/get` to receive the Recurring Transactions streams and subscribe to the [`RECURRING_TRANSACTIONS_UPDATE`](https://plaid.com/docs/api/products/transactions/#recurring_transactions_update) webhook. To know when historical transactions have been fetched, if you are using `/processor/transactions/sync` listen for the [`SYNC_UPDATES_AVAILABLE`](https://plaid.com/docs/api/products/transactions/#SyncUpdatesAvailableWebhook-historical-update-complete) webhook and check that the `historical_update_complete` field in the payload is `true`. If using `/processor/transactions/get`, listen for the [`HISTORICAL_UPDATE`](https://plaid.com/docs/api/products/transactions/#historical_update) webhook.

After the initial call, you can call the `/processor/transactions/recurring/get` endpoint at any point in the future to retrieve the latest summary of recurring streams. Listen to the [`RECURRING_TRANSACTIONS_UPDATE`](https://plaid.com/docs/api/products/transactions/#recurring_transactions_update) webhook to be notified when new updates are available.

To receive Transactions webhooks for a processor token, set its webhook URL via the [`/processor/token/webhook/update`](https://plaid.com/docs/api/processor-partners/#processortokenwebhookupdate) endpoint.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.processor.get_recurring_transactions(processor_token: "processor_token")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**processor_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**options:** `Plaid::Types::TransactionsRecurringGetRequestOptions` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Processor::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.processor.<a href="/lib/plaid/processor/client.rb">create_bank_transfer</a>(request) -> Plaid::Types::ProcessorBankTransferCreateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use the `/processor/bank_transfer/create` endpoint to initiate a new bank transfer as a processor
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.processor.create_bank_transfer(
  idempotency_key: "idempotency_key",
  processor_token: "processor_token",
  type: "debit",
  network: "ach",
  amount: "amount",
  iso_currency_code: "iso_currency_code",
  description: "description",
  user: {
    legal_name: "legal_name"
  }
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**idempotency_key:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**processor_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**type:** `Plaid::Types::BankTransferType` 
    
</dd>
</dl>

<dl>
<dd>

**network:** `Plaid::Types::BankTransferNetwork` 
    
</dd>
</dl>

<dl>
<dd>

**amount:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**iso_currency_code:** `String` — The currency of the transfer amount - should be set to "USD".
    
</dd>
</dl>

<dl>
<dd>

**description:** `String` — The transfer description. Maximum of 10 characters.
    
</dd>
</dl>

<dl>
<dd>

**ach_class:** `Plaid::Types::AchClass` 
    
</dd>
</dl>

<dl>
<dd>

**user:** `Plaid::Types::BankTransferUser` 
    
</dd>
</dl>

<dl>
<dd>

**custom_tag:** `String` — An arbitrary string provided by the client for storage with the bank transfer. May be up to 100 characters.
    
</dd>
</dl>

<dl>
<dd>

**metadata:** `Internal::Types::Hash[String, String]` 
    
</dd>
</dl>

<dl>
<dd>

**origination_account_id:** `String` — Plaid's unique identifier for the origination account for this transfer. If you have more than one origination account, this value must be specified.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Processor::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.processor.<a href="/lib/plaid/processor/client.rb">get_liabilities</a>(request) -> Plaid::Types::ProcessorLiabilitiesGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/processor/liabilities/get` endpoint returns various details about a loan or credit account. Liabilities data is available primarily for US financial institutions, with some limited coverage of Canadian institutions. Currently supported account types are account type `credit` with account subtype `credit card` or `paypal`, and account type `loan` with account subtype `student` or `mortgage`.

The types of information returned by Liabilities can include balances and due dates, loan terms, and account details such as original loan amount and guarantor. Data is refreshed approximately once per day; the latest data can be retrieved by calling `/processor/liabilities/get`.

Note: This request may take some time to complete if `liabilities` was not specified as an initial product when creating the processor token. This is because Plaid must communicate directly with the institution to retrieve the additional data.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.processor.get_liabilities(processor_token: "processor_token")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**processor_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Processor::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.processor.<a href="/lib/plaid/processor/client.rb">get_identity</a>(request) -> Plaid::Types::ProcessorIdentityGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/processor/identity/get` endpoint allows you to retrieve various account holder information on file with the financial institution, including names, emails, phone numbers, and addresses.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.processor.get_identity(processor_token: "processor_token")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**processor_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Processor::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.processor.<a href="/lib/plaid/processor/client.rb">match_identity</a>(request) -> Plaid::Types::ProcessorIdentityMatchResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/processor/identity/match` endpoint generates a match score, which indicates how well the provided identity data matches the identity information on file with the account holder's financial institution.

Fields within the `balances` object will always be null when retrieved by `/processor/identity/match`. Instead, use the `/processor/balance/get` endpoint to retrieve balance data.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.processor.match_identity(processor_token: "processor_token")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**processor_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**user:** `Plaid::Types::IdentityMatchUser` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Processor::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.processor.<a href="/lib/plaid/processor/client.rb">get_balance</a>(request) -> Plaid::Types::ProcessorBalanceGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/processor/balance/get` endpoint returns the real-time balance for the account associated with the processor token. While other endpoints may return a balance object, only `/processor/balance/get` forces the available and current balance fields to be refreshed rather than cached. 
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.processor.get_balance(processor_token: "processor_token")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**processor_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**options:** `Plaid::Types::ProcessorBalanceGetRequestOptions` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Processor::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.processor.<a href="/lib/plaid/processor/client.rb">create_token</a>(request) -> Plaid::Types::ProcessorTokenCreateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Used to create a token suitable for sending to one of Plaid's partners to enable integrations. To create a Stripe bank account token (`btok_...`), use `/processor/stripe/bank_account_token/create`. If using multiple processors, multiple different processor tokens can be created for a single access token. Once created, a processor token for a given Item can be modified by calling `/processor/token/permissions/set`. To revoke the processor's access, the entire Item must be deleted by calling `/item/remove`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.processor.create_token(
  access_token: "access_token",
  account_id: "account_id",
  processor: "dwolla"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**access_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**account_id:** `String` — The `account_id` value obtained from the `onSuccess` callback in Link
    
</dd>
</dl>

<dl>
<dd>

**processor:** `Plaid::Processor::Types::ProcessorTokenCreateRequestProcessor` — The processor you are integrating with.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Processor::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.processor.<a href="/lib/plaid/processor/client.rb">set_token_permissions</a>(request) -> Plaid::Types::ProcessorTokenPermissionsSetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Used to control a processor's access to products on the given processor token. By default, a processor will have access to all available products on the corresponding item. To restrict access to a particular set of products, call this endpoint with the desired products. To restore access to all available products, call this endpoint with an empty list. This endpoint can be called multiple times as your needs and your processor's needs change.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.processor.set_token_permissions(
  processor_token: "processor_token",
  products: ["assets"]
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**processor_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**products:** `Internal::Types::Array[Plaid::Types::Products]` — A list of products the processor token should have access to. An empty list will grant access to all products.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Processor::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.processor.<a href="/lib/plaid/processor/client.rb">get_token_permissions</a>(request) -> Plaid::Types::ProcessorTokenPermissionsGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Used to get a processor token's product permissions. The `products` field will be an empty list if the processor can access all available products.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.processor.get_token_permissions(processor_token: "processor_token")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**processor_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Processor::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.processor.<a href="/lib/plaid/processor/client.rb">update_token_webhook</a>(request) -> Plaid::Types::ProcessorTokenWebhookUpdateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

This endpoint allows you, the processor, to update the webhook URL associated with a processor token. This request triggers a `WEBHOOK_UPDATE_ACKNOWLEDGED` webhook to the newly specified webhook URL.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.processor.update_token_webhook(
  processor_token: "processor_token",
  webhook: nil
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**processor_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**webhook:** `String` — The new webhook URL to associate with the processor token. To remove a webhook from a processor token, set to `null`.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Processor::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.processor.<a href="/lib/plaid/processor/client.rb">create_stripe_bank_account_token</a>(request) -> Plaid::Types::ProcessorStripeBankAccountTokenCreateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>


Used to create a token suitable for sending to Stripe to enable Plaid-Stripe integrations. For a detailed guide on integrating Stripe, see [Add Stripe to your app](https://plaid.com/docs/auth/partnerships/stripe/).

Note that the Stripe bank account token is a one-time use token. To store bank account information for later use, you can use a Stripe customer object and create an associated bank account from the token, or you can use a Stripe Custom account and create an associated external bank account from the token. This bank account information should work indefinitely, unless the user's bank account information changes or they revoke Plaid's permissions to access their account. Stripe bank account information cannot be modified once the bank account token has been created. If you ever need to change the bank account details used by Stripe for a specific customer, have the user go through Link again and create a new bank account token from the new `access_token`.

To revoke a bank account token, the entire underlying access token must be revoked using `/item/remove`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.processor.create_stripe_bank_account_token(
  access_token: "access_token",
  account_id: "account_id"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**access_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**account_id:** `String` — The `account_id` value obtained from the `onSuccess` callback in Link
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Processor::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.processor.<a href="/lib/plaid/processor/client.rb">create_apex_processor_token</a>(request) -> Plaid::Types::ProcessorTokenCreateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Used to create a token suitable for sending to Apex to enable Plaid-Apex integrations.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.processor.create_apex_processor_token(
  access_token: "access_token",
  account_id: "account_id"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**access_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**account_id:** `String` — The `account_id` value obtained from the `onSuccess` callback in Link
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Processor::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## WebhookEvents
<details><summary><code>client.webhook_events.<a href="/lib/plaid/webhook_events/client.rb">list</a>(request) -> Plaid::Types::BetaWebhookEventsListResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

`/beta/webhook_events/list` returns the webhooks Plaid sent to your account in the last 7 days, including webhooks that weren't delivered. Use it to recover webhooks your endpoint missed. Events are returned oldest first.

`TRANSACTIONS` webhooks are not included. To recover Transactions updates, use [`/transactions/sync`](https://plaid.com/docs/api/products/transactions/#transactionssync).

To page through events, omit `cursor` on your first request, then pass the previous response's `next_cursor` on each later request. Store `next_cursor` even when `has_more` is `false`, so your next poll returns only newer events.

Filters are optional. An event matches a filter if it matches any of the filter's values, and must match every filter you provide.

Events older than 7 days are not retained. If your cursor or `start_time` is older than that, the request fails with `WEBHOOK_EVENTS_CURSOR_EXPIRED` or `WEBHOOK_EVENTS_START_TIME_OUT_OF_RANGE`.

This endpoint is in beta and may change in backwards-incompatible ways. Send feedback to building@plaid.com.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.webhook_events.list(count: 100)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**cursor:** `String` — The `next_cursor` from a previous `/beta/webhook_events/list` response. Omit on your first request. If provided, `start_time` is ignored.
    
</dd>
</dl>

<dl>
<dd>

**start_time:** `String` — Return events sent at or after this time, in ISO 8601 format. Must be within the last 7 days. Ignored if `cursor` is provided. If you omit both `cursor` and `start_time`, results start with the oldest retained event.
    
</dd>
</dl>

<dl>
<dd>

**count:** `Integer` — The maximum number of webhook events to return. Fewer events may be returned even when more are available; use `has_more` to determine whether to request another page.
    
</dd>
</dl>

<dl>
<dd>

**webhook_types:** `Internal::Types::Array[String]` — Return only events with these webhook types, for example `ITEM`. Case-sensitive.
    
</dd>
</dl>

<dl>
<dd>

**webhook_codes:** `Internal::Types::Array[String]` — Return only events with these webhook codes, for example `ERROR`. Case-sensitive.
    
</dd>
</dl>

<dl>
<dd>

**item_ids:** `Internal::Types::Array[String]` — Return only events for these Items.
    
</dd>
</dl>

<dl>
<dd>

**delivery_statuses:** `Internal::Types::Array[Plaid::Types::WebhookEventDeliveryStatus]` — Return only events with these delivery statuses.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::WebhookEvents::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Webhook
<details><summary><code>client.webhook.<a href="/lib/plaid/webhook/client.rb">get_verification_key</a>(request) -> Plaid::Types::WebhookVerificationKeyGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Plaid signs all outgoing webhooks and provides JSON Web Tokens (JWTs) so that you can verify the authenticity of any incoming webhooks to your application. A message signature is included in the `Plaid-Verification` header.

The `/webhook_verification_key/get` endpoint provides a JSON Web Key (JWK) that can be used to verify a JWT.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.webhook.get_verification_key(key_id: "key_id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**key_id:** `String` — The key ID ( `kid` ) from the JWT header.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Webhook::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Liabilities
<details><summary><code>client.liabilities.<a href="/lib/plaid/liabilities/client.rb">get</a>(request) -> Plaid::Types::LiabilitiesGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/liabilities/get` endpoint returns various details about an Item with loan or credit accounts. Liabilities data is available primarily for US financial institutions, with some limited coverage of Canadian institutions. Supported account types are account type `credit` with account subtype `credit card` or `paypal`; and account type `loan` with account subtype `auto`, `commercial`, `commercial line of credit`, `consumer`, `home equity`, `home equity loan`, `line of credit`, `loan`, `mortgage`, or `student`. To limit accounts listed in Link to types and subtypes supported by Liabilities, you can use the `account_filters` parameter when [creating a Link token](https://plaid.com/docs/api/link/#linktokencreate).

To receive the expanded loan subtype values, use plaid-go 10.1.0 or later, plaid-java 44.0.0 or later, plaid-python 8.3.0 or later, or plaid-ruby 14.4.0 or later. Earlier client library versions may receive `loan` instead of `home equity loan` and `line of credit` instead of `commercial line of credit`.

The types of information returned by Liabilities can include balances and due dates, loan terms, and account details such as original loan amount and guarantor. Data is refreshed approximately once per day; the latest data can be retrieved by calling `/liabilities/get`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.liabilities.get(access_token: "access_token")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**access_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**options:** `Plaid::Types::LiabilitiesGetRequestOptions` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Liabilities::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## PaymentInitiation
<details><summary><code>client.payment_initiation.<a href="/lib/plaid/payment_initiation/client.rb">create_recipient</a>(request) -> Plaid::Types::PaymentInitiationRecipientCreateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a payment recipient for payment initiation.  The recipient must be in Europe, within a country that is a member of the Single Euro Payments Area (SEPA) or a non-Eurozone country [supported](https://support.plaid.com/hc/en-us/articles/27895826947735-What-Plaid-products-are-supported-in-each-country-and-region) by Plaid. For a standing order (recurring) payment, the recipient must be in the UK.

It is recommended to use `bacs` in the UK and `iban` in EU.

The endpoint is idempotent: if a developer has already made a request with the same payment details, Plaid will return the same `recipient_id`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.payment_initiation.create_recipient(name: "name")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**name:** `String` — The name of the recipient. We recommend using strings of length 18 or less and avoid special characters to ensure compatibility with all institutions.
    
</dd>
</dl>

<dl>
<dd>

**iban:** `String` — The International Bank Account Number (IBAN) for the recipient. If Bacs data is not provided, an IBAN is required.
    
</dd>
</dl>

<dl>
<dd>

**bacs:** `Plaid::Types::RecipientBacsNullable` 
    
</dd>
</dl>

<dl>
<dd>

**address:** `Plaid::Types::PaymentInitiationAddress` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::PaymentInitiation::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.payment_initiation.<a href="/lib/plaid/payment_initiation/client.rb">reverse_payment</a>(request) -> Plaid::Types::PaymentInitiationPaymentReverseResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Reverse a settled payment from a Plaid virtual account.

The original payment must be in a settled state to be refunded.
To refund partially, specify the amount as part of the request.
If the amount is not specified, the refund amount will be equal to all
of the remaining payment amount that has not been refunded yet.

The refund will go back to the source account that initiated the payment.
The original payment must have been initiated to a Plaid virtual account
so that this account can be used to initiate the refund.

Providing counterparty information such as date of birth and address increases
the likelihood of refund being successful without human intervention.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.payment_initiation.reverse_payment(
  payment_id: "payment_id",
  idempotency_key: "idempotency_key",
  reference: "reference"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**payment_id:** `String` — The ID of the payment to reverse
    
</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**reference:** `String` — A reference for the refund. This must be a string of 6 to 18 characters containing only letters, numbers, and spaces.
    
</dd>
</dl>

<dl>
<dd>

**amount:** `Plaid::Types::PaymentAmountToRefund` 
    
</dd>
</dl>

<dl>
<dd>

**counterparty_date_of_birth:** `String` — The counterparty's birthdate, in [ISO 8601](https://wikipedia.org/wiki/ISO_8601) (YYYY-MM-DD) format.
    
</dd>
</dl>

<dl>
<dd>

**counterparty_address:** `Plaid::Types::PaymentInitiationAddress` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::PaymentInitiation::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.payment_initiation.<a href="/lib/plaid/payment_initiation/client.rb">get_recipient</a>(request) -> Plaid::Types::PaymentInitiationRecipientGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get details about a payment recipient you have previously created.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.payment_initiation.get_recipient(recipient_id: "recipient_id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**recipient_id:** `String` — The ID of the recipient
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::PaymentInitiation::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.payment_initiation.<a href="/lib/plaid/payment_initiation/client.rb">list_recipients</a>(request) -> Plaid::Internal::CursorItemIterator</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/payment_initiation/recipient/list` endpoint lists the payment recipients that you have previously created.

Returns a `Plaid::Internal::CursorItemIterator` that yields each `Plaid::Types::PaymentInitiationRecipient` in the `recipients` field of every page, requesting pages as they are needed. Call `pages` on it to get each page as a `Plaid::Types::PaymentInitiationRecipientListResponse`, including its other fields.

No request is sent by this call. The first page is requested when you start iterating (or call `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.payment_initiation.list_recipients
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**count:** `Integer` — The maximum number of recipients to return. If `count` is not specified, a maximum of 100 recipients will be returned, beginning with the recipient at the cursor (if specified).
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` — A value representing the latest recipient to be included in the response. Set this from `next_cursor` received from the previous `/payment_initiation/recipient/list` request. If provided, the response will only contain that recipient and recipients created before it. If omitted, the response will contain recipients starting from the most recent, and in descending order by the `created_at` time.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::PaymentInitiation::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.payment_initiation.<a href="/lib/plaid/payment_initiation/client.rb">create_payment</a>(request) -> Plaid::Types::PaymentInitiationPaymentCreateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

After creating a payment recipient, you can use the `/payment_initiation/payment/create` endpoint to create a payment to that recipient.  Payments can be one-time or standing order (recurring) and can be denominated in EUR, GBP, or another chosen [currency](https://plaid.com/docs/api/products/payment-initiation/#payment_initiation-payment-create-request-amount-currency).  If making domestic GBP-denominated payments, your recipient must have been created with Bacs numbers. In general, EUR-denominated payments will be sent via SEPA Credit Transfer, GBP-denominated payments will be sent via the Faster Payments network and for non-Eurozone markets typically via the local payment scheme, but the payment network used will be determined by the institution. Payments sent via Faster Payments will typically arrive immediately, while payments sent via SEPA Credit Transfer or other local payment schemes will typically arrive in one business day.

Standing orders (recurring payments) must be denominated in GBP and can only be sent to recipients in the UK. Once created, standing order payments cannot be modified or canceled via the API. An end user can cancel or modify a standing order directly on their banking application or website, or by contacting the bank. Standing orders will follow the payment rules of the underlying rails (Faster Payments in UK). Payments can be sent Monday to Friday, excluding bank holidays. If the pre-arranged date falls on a weekend or bank holiday, the payment is made on the next working day. It is not possible to guarantee the exact time the payment will reach the recipient's account, although at least 90% of standing order payments are sent by 6am.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.payment_initiation.create_payment(
  recipient_id: "recipient_id",
  reference: "reference",
  amount: {
    currency: "GBP",
    value: 1.1
  }
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**recipient_id:** `String` — The ID of the recipient the payment is for.
    
</dd>
</dl>

<dl>
<dd>

**user_id:** `String` — The `user_id` of the end user the payment is initiated for, as returned by [`/user/create`](https://plaid.com/docs/api/users/#usercreate). The user must have a `name` and either an email address or a phone number. Required for new integrations.
    
</dd>
</dl>

<dl>
<dd>

**reference:** `String` 

A reference for the payment. This must be a string of at most 18 characters containing only letters, numbers, and spaces (since not all institutions support them).
In order to track settlement via Payment Confirmation, each payment must have a unique reference. If the reference provided through the API is not unique, Plaid will adjust it.
Some institutions may limit the reference to less than 18 characters. If necessary, Plaid will adjust the reference by truncating it to fit the institution's requirements.
Both the originally provided and automatically adjusted references (if any) can be found in the `reference` and `adjusted_reference` fields, respectively.
    
</dd>
</dl>

<dl>
<dd>

**amount:** `Plaid::Types::PaymentAmount` 
    
</dd>
</dl>

<dl>
<dd>

**schedule:** `Plaid::Types::ExternalPaymentScheduleRequest` 
    
</dd>
</dl>

<dl>
<dd>

**options:** `Plaid::Types::ExternalPaymentOptions` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::PaymentInitiation::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.payment_initiation.<a href="/lib/plaid/payment_initiation/client.rb">create_payment_token</a>(request) -> Plaid::Types::PaymentInitiationPaymentTokenCreateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/payment_initiation/payment/token/create` endpoint has been deprecated. New Plaid customers will be unable to use this endpoint, and existing customers are encouraged to migrate to the newer, `link_token`-based flow. The recommended flow is to provide the `payment_id` to `/link/token/create`, which returns a `link_token` used to initialize Link.

The `/payment_initiation/payment/token/create` endpoint is used to create a `payment_token`, which can then be used in Link initialization to enter a payment initiation flow. You can only use a `payment_token` once. If this attempt fails, the end user aborts the flow, or the token expires, you will need to create a new payment token. Creating a new payment token does not require end user input.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.payment_initiation.create_payment_token(payment_id: "payment_id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**payment_id:** `String` — The `payment_id` returned from `/payment_initiation/payment/create`.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::PaymentInitiation::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.payment_initiation.<a href="/lib/plaid/payment_initiation/client.rb">create_consent</a>(request) -> Plaid::Types::PaymentInitiationConsentCreateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/payment_initiation/consent/create` endpoint is used to create a payment consent, which can be used to initiate payments on behalf of the user. Payment consents are created with `UNAUTHORISED` status by default and must be authorised by the user before payments can be initiated.

Consents can be limited in time and scope, and have constraints that describe limitations for payments.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.payment_initiation.create_consent(
  recipient_id: "recipient_id",
  reference: "reference",
  constraints: {
    max_payment_amount: {
      currency: "GBP",
      value: 1.1
    },
    periodic_amounts: [{
      amount: {
        currency: "GBP",
        value: 1.1
      },
      interval: "DAY",
      alignment: "CALENDAR"
    }]
  }
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**recipient_id:** `String` — The ID of the recipient the payment consent is for. The created consent can be used to transfer funds to this recipient only.
    
</dd>
</dl>

<dl>
<dd>

**user_id:** `String` — The `user_id` of the end user the payment consent is for, as returned by [`/user/create`](https://plaid.com/docs/api/users/#usercreate). The user must have a `name` and either an email address or a phone number. Payments created from this consent inherit this `user_id`. Required for new integrations.
    
</dd>
</dl>

<dl>
<dd>

**reference:** `String` — A reference for the payment consent. This must be a string of at most 18 characters containing only letters, numbers, and spaces.
    
</dd>
</dl>

<dl>
<dd>

**scopes:** `Internal::Types::Array[Plaid::Types::PaymentInitiationConsentScope]` — An array of payment consent scopes.
    
</dd>
</dl>

<dl>
<dd>

**type:** `Plaid::Types::PaymentInitiationConsentType` 
    
</dd>
</dl>

<dl>
<dd>

**constraints:** `Plaid::Types::PaymentInitiationConsentConstraints` 
    
</dd>
</dl>

<dl>
<dd>

**options:** `Plaid::Types::ExternalPaymentInitiationConsentOptions` 
    
</dd>
</dl>

<dl>
<dd>

**payer_details:** `Plaid::Types::PaymentInitiationConsentPayerDetails` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::PaymentInitiation::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.payment_initiation.<a href="/lib/plaid/payment_initiation/client.rb">get_consent</a>(request) -> Plaid::Types::PaymentInitiationConsentGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/payment_initiation/consent/get` endpoint can be used to check the status of a payment consent, as well as to receive basic information such as recipient and constraints.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.payment_initiation.get_consent(consent_id: "consent_id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**consent_id:** `String` — The `consent_id` returned from `/payment_initiation/consent/create`.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::PaymentInitiation::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.payment_initiation.<a href="/lib/plaid/payment_initiation/client.rb">revoke_consent</a>(request) -> Plaid::Types::PaymentInitiationConsentRevokeResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/payment_initiation/consent/revoke` endpoint can be used to revoke the payment consent. Once the consent is revoked, it is not possible to initiate payments using it.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.payment_initiation.revoke_consent(consent_id: "consent_id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**consent_id:** `String` — The consent ID.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::PaymentInitiation::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.payment_initiation.<a href="/lib/plaid/payment_initiation/client.rb">execute_consent_payment</a>(request) -> Plaid::Types::PaymentInitiationConsentPaymentExecuteResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/payment_initiation/consent/payment/execute` endpoint can be used to execute payments using payment consent.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.payment_initiation.execute_consent_payment(
  consent_id: "consent_id",
  amount: {
    currency: "GBP",
    value: 1.1
  },
  idempotency_key: "idempotency_key"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**consent_id:** `String` — The consent ID.
    
</dd>
</dl>

<dl>
<dd>

**amount:** `Plaid::Types::PaymentAmount` 
    
</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**reference:** `String` 

A reference for the payment. This must be a string of at most 18 characters containing only letters, numbers, and spaces (since not all institutions support them).
If not provided, Plaid will automatically fall back to the reference from consent. In order to track settlement via Payment Confirmation, each payment must have a unique reference. If the reference provided through the API is not unique, Plaid will adjust it.
Some institutions may limit the reference to less than 18 characters. If necessary, Plaid will adjust the reference by truncating it to fit the institution's requirements.
Both the originally provided and automatically adjusted references (if any) can be found in the `reference` and `adjusted_reference` fields, respectively.
    
</dd>
</dl>

<dl>
<dd>

**scope:** `Plaid::PaymentInitiation::Types::PaymentInitiationConsentPaymentExecuteRequestScope` 

Deprecated, payments will be executed within the type of the consent.

A scope of the payment. Must be one of the scopes mentioned in the consent.
Optional if the appropriate consent has only one scope defined, required otherwise.
    
</dd>
</dl>

<dl>
<dd>

**processing_mode:** `Plaid::Types::PaymentInitiationConsentProcessingMode` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::PaymentInitiation::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.payment_initiation.<a href="/lib/plaid/payment_initiation/client.rb">get_payment</a>(request) -> Plaid::Types::PaymentInitiationPaymentGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/payment_initiation/payment/get` endpoint can be used to check the status of a payment, as well as to receive basic information such as recipient and payment amount. In the case of standing orders, the `/payment_initiation/payment/get` endpoint will provide information about the status of the overall standing order itself; the API cannot be used to retrieve payment status for individual payments within a standing order.

Polling for status updates in Production is highly discouraged. Repeatedly calling `/payment_initiation/payment/get` to check a payment's status is unreliable and may trigger API rate limits. Only the `PAYMENT_STATUS_UPDATE` webhook should be used to receive real-time status updates in Production.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.payment_initiation.get_payment(payment_id: "payment_id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**payment_id:** `String` — The `payment_id` returned from `/payment_initiation/payment/create`.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::PaymentInitiation::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.payment_initiation.<a href="/lib/plaid/payment_initiation/client.rb">list_payments</a>(request) -> Plaid::Internal::CursorItemIterator</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/payment_initiation/payment/list` endpoint can be used to retrieve all created payments. By default, the 10 most recent payments are returned. You can request more payments and paginate through the results using the optional `count` and `cursor` parameters.

Returns a `Plaid::Internal::CursorItemIterator` that yields each `Plaid::Types::PaymentInitiationPayment` in the `payments` field of every page, requesting pages as they are needed. Call `pages` on it to get each page as a `Plaid::Types::PaymentInitiationPaymentListResponse`, including its other fields.

No request is sent by this call. The first page is requested when you start iterating (or call `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.payment_initiation.list_payments
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**count:** `Integer` — The maximum number of payments to return. If `count` is not specified, a maximum of 10 payments will be returned, beginning with the most recent payment before the cursor (if specified).
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` — A string in RFC 3339 format (i.e. "2019-12-06T22:35:49Z"). Only payments created before the cursor will be returned.
    
</dd>
</dl>

<dl>
<dd>

**consent_id:** `String` — The consent ID. If specified, only payments, executed using this consent, will be returned.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::PaymentInitiation::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Investments
<details><summary><code>client.investments.<a href="/lib/plaid/investments/client.rb">get_holdings</a>(request) -> Plaid::Types::InvestmentsHoldingsGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/investments/holdings/get` endpoint allows developers to receive user-authorized stock position data for `investment`-type accounts.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.investments.get_holdings(access_token: "access_token")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**access_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**options:** `Plaid::Types::InvestmentHoldingsGetRequestOptions` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Investments::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.investments.<a href="/lib/plaid/investments/client.rb">get_transactions</a>(request) -> Plaid::Internal::OffsetItemIterator</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/investments/transactions/get` endpoint allows developers to retrieve up to 24 months of user-authorized transaction data for investment accounts.

Transactions are returned in reverse-chronological order, and the sequence of transaction ordering is stable and will not shift.

Due to the potentially large number of investment transactions associated with an Item, results are paginated. Manipulate the count and offset parameters in conjunction with the `total_investment_transactions` response body field to fetch all available investment transactions.

Note that Investments does not have a webhook to indicate when initial transaction data has loaded (unless you use the `async_update` option). Instead, if transactions data is not ready when `/investments/transactions/get` is first called, Plaid will wait for the data. For this reason, calling `/investments/transactions/get` immediately after Link may take up to one to two minutes to return.

Data returned by the asynchronous investments extraction flow (when `async_update` is set to true) may not be immediately available to `/investments/transactions/get`. To be alerted when the data is ready to be fetched, listen for the `HISTORICAL_UPDATE` webhook. If no investments history is ready when `/investments/transactions/get` is called, it will return a `PRODUCT_NOT_READY` error.

Returns a `Plaid::Internal::OffsetItemIterator` that yields each `Plaid::Types::InvestmentTransaction` in the `investment_transactions` field of every page, requesting pages as they are needed. Call `pages` on it to get each page as a `Plaid::Types::InvestmentsTransactionsGetResponse`, including its other fields.

No request is sent by this call. The first page is requested when you start iterating (or call `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.investments.get_transactions(
  access_token: "access_token",
  start_date: "2023-01-15",
  end_date: "2023-01-15"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**access_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**start_date:** `String` — The earliest date for which to fetch transaction history. Dates should be formatted as YYYY-MM-DD. Plaid returns all investment transaction history stored for the Item (up to 2 years prior to the initial linking of the Item).
    
</dd>
</dl>

<dl>
<dd>

**end_date:** `String` — The most recent date for which to fetch transaction history. Dates should be formatted as YYYY-MM-DD.
    
</dd>
</dl>

<dl>
<dd>

**options:** `Plaid::Types::InvestmentsTransactionsGetRequestOptions` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Investments::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.investments.<a href="/lib/plaid/investments/client.rb">refresh</a>(request) -> Plaid::Types::InvestmentsRefreshResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

`/investments/refresh` is an optional endpoint for users of the Investments product. It initiates an on-demand extraction to fetch the newest investment holdings and transactions for an Item. This on-demand extraction takes place in addition to the periodic extractions that automatically occur one or more times per day for any Investments-enabled Item. If changes to investments are discovered after calling `/investments/refresh`, Plaid will fire webhooks: [`HOLDINGS: DEFAULT_UPDATE`](https://plaid.com/docs/api/products/investments/#holdings-default_update) if any new holdings are detected, and [`INVESTMENTS_TRANSACTIONS: DEFAULT_UPDATE`](https://plaid.com/docs/api/products/investments/#investments_transactions-default_update) if any new investment transactions are detected. This webhook will typically not fire in the Sandbox environment, due to the lack of dynamic investment transactions and holdings data. To test this webhook in Sandbox, call `/sandbox/item/fire_webhook`. Updated holdings and investment transactions can be fetched by calling `/investments/holdings/get` and `/investments/transactions/get`. Note that the `/investments/refresh` endpoint is not supported by all institutions. If called on an Item from an institution that does not support this functionality, it will return a `PRODUCTS_NOT_SUPPORTED` error.

As this endpoint triggers a synchronous request for fresh data, latency may be higher than for other Plaid endpoints (typically less than 10 seconds, but occasionally up to 30 seconds or more); if you encounter errors, you may find it necessary to adjust your timeout period when making requests.

`/investments/refresh` is offered as an add-on to Investments and has a separate [fee model](https://plaid.com/docs/account/billing/#per-request-flat-fee). To request access to this endpoint, submit a [product access request](https://dashboard.plaid.com/team/products) or contact your Plaid account manager.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.investments.refresh(access_token: "access_token")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**access_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Investments::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.investments.<a href="/lib/plaid/investments/client.rb">get_auth</a>(request) -> Plaid::Types::InvestmentsAuthGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/investments/auth/get` endpoint allows developers to receive user-authorized data to facilitate the transfer of holdings
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.investments.get_auth(access_token: "access_token")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**access_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**options:** `Plaid::Types::InvestmentsAuthGetRequestOptions` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Investments::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Link
<details><summary><code>client.link.<a href="/lib/plaid/link/client.rb">create_token</a>(request) -> Plaid::Types::LinkTokenCreateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/link/token/create` endpoint creates a `link_token`, which is required as a parameter when initializing Link. Once Link has been initialized, it returns a `public_token`. For most Plaid products, the `public_token` is saved and exchanged for an `access_token` via `/item/public_token/exchange` as part of the main Link flow. For more details, see the [Link flow overview](https://plaid.com/docs/link/#link-flow-overview).

A `link_token` generated by `/link/token/create` is also used to initialize other Link flows, such as the [update mode](https://plaid.com/docs/link/update-mode) flow for tokens with expired credentials, or the Identity Verification flow.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.link.create_token(
  client_name: "client_name",
  language: "language",
  country_codes: ["US"]
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**client_name:** `String` — The name of your application, as it should be displayed in Link. Maximum length of 30 characters. If a value longer than 30 characters is provided, Link will display "This Application" instead.
    
</dd>
</dl>

<dl>
<dd>

**language:** `String` 

The language that Link should be displayed in. When initializing with Identity Verification, this field is not used; for more details, see [Identity Verification supported languages](https://plaid.com/docs/identity-verification/#supported-languages).

Supported languages are:
- Danish (`'da'`)
- Dutch (`'nl'`)
- English (`'en'`)
- Estonian (`'et'`)
- French (`'fr'`)
- German (`'de'`)
- Haitian Creole (`'ht'`)
- Hindi (`'hi'`)
- Italian (`'it'`)
- Latvian (`'lv'`)
- Lithuanian (`'lt'`)
- Norwegian Bokmål (`'nb'`)
- Polish (`'pl'`)
- Portuguese (`'pt'`)
- Romanian (`'ro'`)
- Spanish (`'es'`)
- Swedish (`'sv'`)
- Vietnamese (`'vi'`)

When using a Link customization, the language configured here must match the setting in the customization, or the customization will not be applied.
    
</dd>
</dl>

<dl>
<dd>

**country_codes:** `Internal::Types::Array[Plaid::Types::CountryCode]` 

Specify an array of Plaid-supported country codes using the ISO-3166-1 alpha-2 country code standard. Institutions from all listed countries will be shown. For a complete mapping of supported products by country, see [What Plaid products are supported in each country and region?](https://support.plaid.com/hc/en-us/articles/27895826947735-What-Plaid-products-are-supported-in-each-country-and-region). For access to additional countries beyond what you have been approved for, [contact sales](https://plaid.com/contact/), your account manager, or support.

If using Identity Verification, `country_codes` should be set to the country where your company is based, not the country where your user is located. For all other products, `country_codes` represents the location of your user's financial institution.

If Link is launched with multiple country codes, every product you specify, in any product array, must be enabled for your account in all of the listed countries; otherwise, the request fails with an `INVALID_PRODUCT` error. While all countries are enabled by default in Sandbox, in Production only the countries you have requested access for are shown. To request access to additional countries, [file a product access Support ticket](https://dashboard.plaid.com/support/new/product-and-development/product-troubleshooting/request-product-access) via the Plaid dashboard.

If using a Link customization, make sure the country codes in the customization match those specified in `country_codes`, or the customization may not be applied.

If using the Auth features Instant Match, Instant Micro-deposits, Same-Day Micro-deposits, or Automated Micro-deposits, `country_codes` must be set to `['US']`. If using Database Auth, `country_codes` must be set to `['US']` or `['CA']`.
    
</dd>
</dl>

<dl>
<dd>

**user:** `Plaid::Types::LinkTokenCreateRequestUser` 
    
</dd>
</dl>

<dl>
<dd>

**user_id:** `String` — A `user_id` generated using `/user/create`. Required for integrations that began using Plaid Protect, Multi-Item Link, or Plaid Check Consumer Report after December 10, 2025. Required for new integrations that use Payment Initiation, Variable Recurring Payments, or Virtual Accounts. For more details, see [New User APIs](https://plaid.com/docs/api/users/user-apis). One of either the `user_id` or the `user` field is required.
    
</dd>
</dl>

<dl>
<dd>

**products:** `Internal::Types::Array[Plaid::Types::Products]` 

List of Plaid product(s) that the linked Item must support. If launching Link in update mode, should be omitted (unless you are using update mode to add a credit product, such as Assets, Statements, Income, or Plaid Check Consumer Report, to an existing Item); at least one `product` is required otherwise.

To maximize the number of institutions and accounts available, initialize Link with the minimal product set required for your use case, as the products specified will limit which institutions and account types will be available to your users in Link. Only institutions that support *all* requested products can be selected; if a user attempts to select an institution that does not support a listed product, a "Connectivity not supported" error message will appear in Link. For each specified product, the Item connected by the user must contain at least one compatible account. For details on compatible product / account type combinations, see [the account type/product support matrix](https://plaid.com/docs/api/accounts/#account-type--product-support-matrix).

To add products without limiting the institution list or account types, use the [`optional_products`](https://plaid.com/docs/api/link/#link-token-create-request-optional-products) or  [`required_if_supported_products`](https://plaid.com/docs/api/link/#link-token-create-request-required-if-supported-products) fields. Products can also be added to an Item by calling the product endpoint after obtaining an access token; this may require the product to be listed in the [`additional_consented_products`](https://plaid.com/docs/api/link/#link-token-create-request-additional-consented-products) array. For details, see [Choosing when to initialize products](https://plaid.com/docs/link/initializing-products/).

`balance` is *not* a valid value, the Balance product does not require explicit initialization and will automatically be initialized when any other product is initialized.

Note that, unless you have opted to disable Instant Match support, institutions that support Instant Match will also be shown in Link if `auth` is specified as a product, even though these institutions do not contain `auth` in their product array.

In Production, you will be billed for each product that you specify when initializing Link. Note that a product cannot be removed from an Item once the Item has been initialized with that product. To stop billing on an Item for subscription-based products, such as Liabilities, Investments, and Transactions, remove the Item via `/item/remove`.
    
</dd>
</dl>

<dl>
<dd>

**required_if_supported_products:** `Internal::Types::Array[Plaid::Types::Products]` 

List of Plaid product(s) you wish to use only if the institution and account(s) selected by the user support the product. Institutions that do not support these products will still be shown in Link. The products will only be extracted and billed if the user selects an institution and account type that supports them.

There should be no overlap between this array and the `products`, `optional_products`, or `additional_consented_products` arrays. The `products` array must have at least one product.

For more details on using this feature, see [Required if Supported Products](https://plaid.com/docs/link/initializing-products/#required-if-supported-products).
    
</dd>
</dl>

<dl>
<dd>

**optional_products:** `Internal::Types::Array[Plaid::Types::Products]` 

List of Plaid product(s) that will enhance the consumer's use case, but that your app can function without. Plaid will attempt to fetch data for these products on a best-effort basis, and failure to support these products will not affect Item creation.

There should be no overlap between this array and the `products`, `required_if_supported_products`, or `additional_consented_products` arrays. The `products` array must have at least one product.

For more details on using this feature, see [Optional Products](https://plaid.com/docs/link/initializing-products/#optional-products).
    
</dd>
</dl>

<dl>
<dd>

**additional_consented_products:** `Internal::Types::Array[Plaid::Types::Products]` 

List of additional Plaid product(s) you wish to collect consent for to support your use case. These products will not be billed until you start using them by calling the relevant endpoints.

`balance` is *not* a valid value, the Balance product does not require explicit initialization and will automatically have consent collected.

Institutions that do not support these products will still be shown in Link.

There should be no overlap between this array and the `products`, `required_if_supported_products`, or `optional_products` arrays.

If you include `signal` in `additional_consented_products`, you will need to call [`/signal/prepare`](https://plaid.com/docs/api/products/signal/#signalprepare) before calling `/signal/evaluate` for the first time on an Item in order to get the most accurate results. For more details, see [`/signal/prepare`](https://plaid.com/docs/api/products/signal/#signalprepare).
    
</dd>
</dl>

<dl>
<dd>

**webhook:** `String` — The destination URL to which any webhooks should be sent. Note that webhooks for Payment Initiation (e-wallet transactions only), Transfer, Bank Transfer (including Auth micro-deposit notification webhooks), Monitor, and Identity Verification are configured via the Dashboard instead. In update mode, this field will not have an effect; to update the webhook receiver endpoint for an existing Item, use `/item/webhook/update` instead.
    
</dd>
</dl>

<dl>
<dd>

**access_token:** `String` — The `access_token` associated with the Item to update or reference, used when updating, modifying, or accessing an existing `access_token`. Used when launching Link in update mode, when completing the Same-Day Micro-deposit (manual) flow, or (optionally) when initializing Link for a returning user as part of the Transfer UI flow.
    
</dd>
</dl>

<dl>
<dd>

**access_tokens:** `Internal::Types::Array[String]` — A list of access tokens associated with the items to update in Link update mode for the Assets product. Using this instead of the `access_token` field allows the updating of multiple items at once. This feature is in closed beta, please contact your account manager for more info.
    
</dd>
</dl>

<dl>
<dd>

**link_customization_name:** `String` — The name of the Link customization from the Plaid Dashboard to be applied to Link. If not specified, the `default` customization will be used. When using a Link customization, the language in the customization must match the language selected via the `language` parameter, and the countries in the customization should match the country codes selected via `country_codes`.
    
</dd>
</dl>

<dl>
<dd>

**appearance_mode:** `Plaid::Types::LinkTokenCreateRequestAppearanceMode` 
    
</dd>
</dl>

<dl>
<dd>

**redirect_uri:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**android_package_name:** `String` — The name of your app's Android package. Required if using the `link_token` to initialize Link on Android. Any package name specified here must also be added to the Allowed Android package names setting on the [developer dashboard](https://dashboard.plaid.com/team/api). When creating a `link_token` for initializing Link on other platforms, `android_package_name` must be left blank and `redirect_uri` should be used instead.
    
</dd>
</dl>

<dl>
<dd>

**institution_data:** `Plaid::Types::LinkTokenCreateInstitutionData` 
    
</dd>
</dl>

<dl>
<dd>

**card_switch:** `Plaid::Types::LinkTokenCreateCardSwitch` 
    
</dd>
</dl>

<dl>
<dd>

**account_filters:** `Plaid::Types::LinkTokenAccountFilters` 
    
</dd>
</dl>

<dl>
<dd>

**eu_config:** `Plaid::Types::LinkTokenEuConfig` 
    
</dd>
</dl>

<dl>
<dd>

**institution_id:** `String` — Used for certain legacy use cases
    
</dd>
</dl>

<dl>
<dd>

**payment_configuration:** `Plaid::Types::LinkTokenCreateRequestPaymentConfiguration` 
    
</dd>
</dl>

<dl>
<dd>

**payment_initiation:** `Plaid::Types::LinkTokenCreateRequestPaymentInitiation` 
    
</dd>
</dl>

<dl>
<dd>

**employment:** `Plaid::Types::LinkTokenCreateRequestEmployment` 
    
</dd>
</dl>

<dl>
<dd>

**income_verification:** `Plaid::Types::LinkTokenCreateRequestIncomeVerification` 
    
</dd>
</dl>

<dl>
<dd>

**base_report:** `Plaid::Types::LinkTokenCreateRequestBaseReport` 
    
</dd>
</dl>

<dl>
<dd>

**credit_partner_insights:** `Plaid::Types::LinkTokenCreateRequestCreditPartnerInsights` 
    
</dd>
</dl>

<dl>
<dd>

**cra_options:** `Plaid::Types::LinkTokenCreateRequestCraOptions` 
    
</dd>
</dl>

<dl>
<dd>

**cra_report_parameter:** `Plaid::Types::LinkTokenCreateRequestCraReportParameter` 
    
</dd>
</dl>

<dl>
<dd>

**consumer_report_permissible_purpose:** `Plaid::Types::ConsumerReportPermissiblePurpose` 
    
</dd>
</dl>

<dl>
<dd>

**auth:** `Plaid::Types::LinkTokenCreateRequestAuth` 
    
</dd>
</dl>

<dl>
<dd>

**transfer:** `Plaid::Types::LinkTokenCreateRequestTransfer` 
    
</dd>
</dl>

<dl>
<dd>

**update:** `Plaid::Types::LinkTokenCreateRequestUpdate` 
    
</dd>
</dl>

<dl>
<dd>

**identity_verification:** `Plaid::Types::LinkTokenCreateRequestIdentityVerification` 
    
</dd>
</dl>

<dl>
<dd>

**statements:** `Plaid::Types::LinkTokenCreateRequestStatements` 
    
</dd>
</dl>

<dl>
<dd>

**third_party_user_token:** `String` — A third party user token associated with the current user.
    
</dd>
</dl>

<dl>
<dd>

**investments:** `Plaid::Types::LinkTokenInvestments` 
    
</dd>
</dl>

<dl>
<dd>

**investments_auth:** `Plaid::Types::LinkTokenInvestmentsAuth` 
    
</dd>
</dl>

<dl>
<dd>

**hosted_link:** `Plaid::Types::LinkTokenCreateHostedLink` 
    
</dd>
</dl>

<dl>
<dd>

**transactions:** `Plaid::Types::LinkTokenTransactions` 
    
</dd>
</dl>

<dl>
<dd>

**cashflow_report:** `Plaid::Types::LinkTokenCashflowReport` 
    
</dd>
</dl>

<dl>
<dd>

**cra_enabled:** `Internal::Types::Boolean` — If `true`, request a CRA connection. Defaults to `false`.
    
</dd>
</dl>

<dl>
<dd>

**identity:** `Plaid::Types::LinkTokenCreateIdentity` 
    
</dd>
</dl>

<dl>
<dd>

**financekit_supported:** `Internal::Types::Boolean` — If `true`, indicates that client supports linking FinanceKit / AppleCard items. Defaults to `false`.
    
</dd>
</dl>

<dl>
<dd>

**enable_multi_item_link:** `Internal::Types::Boolean` — If `true`, enable linking multiple items in the same Link session. Defaults to `false`.
    
</dd>
</dl>

<dl>
<dd>

**user_token:** `String` — A user token generated using `/user/create`. Any Item created during the Link session will be associated with the user. Integrations that began using Plaid Protect, Multi-Item Link, or Plaid Check Consumer Report before December 10, 2025 use this field instead of the `user_id`.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Link::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.link.<a href="/lib/plaid/link/client.rb">get_token</a>(request) -> Plaid::Types::LinkTokenGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/link/token/get` endpoint gets information about a Link session, including all callbacks fired during the session along with their metadata, including the public token. This endpoint is used with Link flows that don't provide a public token via frontend callbacks, such as the [Hosted Link flow](https://plaid.com/docs/link/hosted-link/) and the [Multi-Item Link flow](https://plaid.com/docs/link/multi-item-link/). It also can be useful for debugging purposes.

By default, this endpoint will only return complete event data for Hosted Link sessions. To use `/link/token/get` to retrieve event data for non-Hosted-Link sessions, contact your account manager to request that your account be enabled for Link events. If you do not have an account manager, you can submit this request via a support ticket. Enablement for Link events will also cause you to receive additional webhooks related to Link events, such as the `SESSION_FINISHED` and `EVENTS` webhook.

When called with a delegated OAuth access token, this endpoint returns a reduced view of the session for the delegate. Only `link_token`, `created_at`, `expiration`, and each session's `link_session_id`, `started_at`, `finished_at`, and `results.item_add_results[].public_token` are populated; `public_token` holds the delegate's own `delegated-public-` token, never the customer's public token. All other fields are withheld and carry no information about the session: arrays such as `metadata.initial_products` and `item_add_results[].accounts` are empty, fields such as `metadata.webhook` and `item_add_results[].institution` are `null`, and `user_id`, `events`, `on_success`, `on_exit`, and `exit` are omitted. A delegated public token can be retrieved for 30 minutes after it is created. Item adds whose delegated public token is no longer available are omitted from `item_add_results`, and if none remain the request fails with `INVALID_LINK_TOKEN`; start a new Link session to continue.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.link.get_token(link_token: "link_token")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**link_token:** `String` — A `link_token` from a previous invocation of `/link/token/create`
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Link::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.link.<a href="/lib/plaid/link/client.rb">exchange_oauth_correlation_id</a>(request) -> Plaid::Types::LinkOAuthCorrelationIDExchangeResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Exchange an OAuth `link_correlation_id` for the corresponding `link_token`. The `link_correlation_id` is only available for `payment_initiation` products and is provided to the client via the OAuth `redirect_uri` as a query parameter.
The `link_correlation_id` is ephemeral and expires in a brief period, after which it can no longer be exchanged for the `link_token`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.link.exchange_oauth_correlation_id(link_correlation_id: "link_correlation_id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**link_correlation_id:** `String` — A `link_correlation_id` from a received OAuth redirect URI callback
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Link::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Session
<details><summary><code>client.session.<a href="/lib/plaid/session/client.rb">create_token</a>(request) -> Plaid::Types::SessionTokenCreateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

`/session/token/create` is used to create a Link token for Layer. The returned Link token is used as a parameter when initializing the Link SDK. For more details, see the [Link flow overview](https://plaid.com/docs/link/#link-flow-overview).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.session.create_token(template_id: "template_id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**template_id:** `String` — The id of a template defined in Plaid Dashboard
    
</dd>
</dl>

<dl>
<dd>

**user:** `Plaid::Types::SessionTokenCreateRequestUser` 
    
</dd>
</dl>

<dl>
<dd>

**redirect_uri:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**android_package_name:** `String` — The name of your app's Android package. Required if using the session token to initialize Layer on Android. Any package name specified here must also be added to the Allowed Android package names setting on the [developer dashboard](https://dashboard.plaid.com/team/api). When creating a session token for initializing Layer on other platforms, `android_package_name` must be left blank and `redirect_uri` should be used instead.
    
</dd>
</dl>

<dl>
<dd>

**webhook:** `String` — The destination URL to which any webhooks should be sent. If you use the same webhook listener for all Sandbox or all Production activity, set this value in the Layer template editor in the Dashboard instead. Only provide a value in this field if you need to use multiple webhook URLs per environment (an uncommon use case). If provided, a value in this field will take priority over webhook values set in the Layer template editor.
    
</dd>
</dl>

<dl>
<dd>

**user_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Session::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Transfer
<details><summary><code>client.transfer.<a href="/lib/plaid/transfer/client.rb">get</a>(request) -> Plaid::Types::TransferGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/transfer/get` endpoint fetches information about the transfer corresponding to the given `transfer_id` or `authorization_id`. One of `transfer_id` or `authorization_id` must be populated but not both.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.transfer.get
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**transfer_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**authorization_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**originator_client_id:** `String` — The Plaid client ID of the transfer originator. Should only be present if `client_id` is a third-party sender (TPS).
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Transfer::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.transfer.<a href="/lib/plaid/transfer/client.rb">create</a>(request) -> Plaid::Types::TransferCreateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use the `/transfer/create` endpoint to initiate a new transfer. This endpoint is retryable and idempotent; if a transfer with the provided `authorization_id` has already been created, it will return the transfer details without creating a new transfer. A transfer may still be created if a 500 error is returned; to detect this scenario, use [Transfer events](https://plaid.com/docs/transfer/reconciling-transfers/).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.transfer.create(
  access_token: "access_token",
  account_id: "account_id",
  authorization_id: "authorization_id",
  description: "description"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**idempotency_key:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**access_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**account_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**authorization_id:** `String` — Plaid's unique identifier for a transfer authorization. This parameter also serves the purpose of acting as an idempotency identifier.
    
</dd>
</dl>

<dl>
<dd>

**type:** `Plaid::Types::TransferType` 
    
</dd>
</dl>

<dl>
<dd>

**network:** `Plaid::Types::TransferNetwork` 
    
</dd>
</dl>

<dl>
<dd>

**amount:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**description:** `String` 

The transfer description, maximum of 15 characters. Should represent why the money is moving, not your company name. For recommendations on setting the `description` field to avoid ACH returns, see [Description field recommendations](https://www.plaid.com/docs/transfer/creating-transfers/#description-field-recommendations).

If reprocessing a returned transfer, the `description` field must be `"Retry 1"` or `"Retry 2"`. You may retry a transfer up to 2 times, within 180 days of creating the original transfer. Only transfers that were returned with code `R01` or `R09` may be retried.
    
</dd>
</dl>

<dl>
<dd>

**ach_class:** `Plaid::Types::AchClass` 
    
</dd>
</dl>

<dl>
<dd>

**user:** `Plaid::Types::TransferUserInRequestDeprecated` 
    
</dd>
</dl>

<dl>
<dd>

**metadata:** `Internal::Types::Hash[String, String]` 
    
</dd>
</dl>

<dl>
<dd>

**origination_account_id:** `String` — Plaid's unique identifier for the origination account for this transfer. If you have more than one origination account, this value must be specified. Otherwise, this field should be left blank.
    
</dd>
</dl>

<dl>
<dd>

**iso_currency_code:** `String` — The currency of the transfer amount. The default value is "USD".
    
</dd>
</dl>

<dl>
<dd>

**test_clock_id:** `String` — Plaid's unique identifier for a test clock. This field may only be used when using `sandbox` environment. If provided, the `transfer` is created at the `virtual_time` on the provided `test_clock`.
    
</dd>
</dl>

<dl>
<dd>

**facilitator_fee:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Transfer::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.transfer.<a href="/lib/plaid/transfer/client.rb">list</a>(request) -> Plaid::Internal::OffsetItemIterator</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use the `/transfer/list` endpoint to see a list of all your transfers and their statuses. Results are paginated; use the `count` and `offset` query parameters to retrieve the desired transfers.

Returns a `Plaid::Internal::OffsetItemIterator` that yields each `Plaid::Types::Transfer` in the `transfers` field of every page, requesting pages as they are needed. Call `pages` on it to get each page as a `Plaid::Types::TransferListResponse`, including its other fields.

No request is sent by this call. The first page is requested when you start iterating (or call `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.transfer.list
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**start_date:** `String` — The start `created` datetime of transfers to list. This should be in RFC 3339 format (i.e. `2019-12-06T22:35:49Z`)
    
</dd>
</dl>

<dl>
<dd>

**end_date:** `String` — The end `created` datetime of transfers to list. This should be in RFC 3339 format (i.e. `2019-12-06T22:35:49Z`)
    
</dd>
</dl>

<dl>
<dd>

**count:** `Integer` — The maximum number of transfers to return.
    
</dd>
</dl>

<dl>
<dd>

**offset:** `Integer` — The number of transfers to skip before returning results.
    
</dd>
</dl>

<dl>
<dd>

**origination_account_id:** `String` — Filter transfers to only those originated through the specified origination account.
    
</dd>
</dl>

<dl>
<dd>

**originator_client_id:** `String` — Filter transfers to only those with the specified originator client.
    
</dd>
</dl>

<dl>
<dd>

**funding_account_id:** `String` — Filter transfers to only those with the specified `funding_account_id`.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Transfer::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.transfer.<a href="/lib/plaid/transfer/client.rb">cancel</a>(request) -> Plaid::Types::TransferCancelResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use the `/transfer/cancel` endpoint to cancel a transfer.  A transfer is eligible for cancellation if the `cancellable` property returned by `/transfer/get` is `true`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.transfer.cancel(transfer_id: "transfer_id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**transfer_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**originator_client_id:** `String` — The Plaid client ID of the transfer originator. Should only be present if `client_id` is a third-party sender (TPS).
    
</dd>
</dl>

<dl>
<dd>

**reason_code:** `Plaid::Types::ReasonCode` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Transfer::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.transfer.<a href="/lib/plaid/transfer/client.rb">migrate_account</a>(request) -> Plaid::Types::TransferMigrateAccountResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

As an alternative to adding Items via Link, you can also use the `/transfer/migrate_account` endpoint to migrate previously-verified account and routing numbers to Plaid Items. This endpoint is also required when adding an Item for use with wire transfers; if you intend to create wire transfers on this account, you must provide `wire_routing_number`. Note that Items created in this way are not compatible with endpoints for other products, such as `/accounts/balance/get`, and can only be used with Transfer endpoints.  If you require access to other endpoints, create the Item through Link instead.  Access to `/transfer/migrate_account` is not enabled by default; to obtain access, contact your Plaid account manager or [support](https://dashboard.plaid.com/support).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.transfer.migrate_account(
  account_number: "account_number",
  routing_number: "routing_number",
  account_type: "account_type"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**account_number:** `String` — The user's account number.
    
</dd>
</dl>

<dl>
<dd>

**routing_number:** `String` — The user's routing number.
    
</dd>
</dl>

<dl>
<dd>

**wire_routing_number:** `String` — The user's wire transfer routing number. This is the ABA number; for some institutions, this may differ from the ACH number used in `routing_number`. This field must be set for the created item to be eligible for wire transfers.
    
</dd>
</dl>

<dl>
<dd>

**account_type:** `String` — The type of the bank account (`checking` or `savings`).
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Transfer::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.transfer.<a href="/lib/plaid/transfer/client.rb">recover_return</a>(request) -> Plaid::Types::TransferReturnRecoverResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use the `/transfer/return/recover` endpoint to notify Plaid that you have recovered some or all of the loss on a returned guaranteed transfer.

Recovery can be reported in full or in parts; the sum of recovered amounts across calls cannot exceed the guaranteed amount of the original transfer.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.transfer.recover_return(
  transfer_id: "transfer_id",
  amount: "amount",
  idempotency_key: "idempotency_key"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**transfer_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**amount:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Transfer::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## BankTransfer
<details><summary><code>client.bank_transfer.<a href="/lib/plaid/bank_transfer/client.rb">get</a>(request) -> Plaid::Types::BankTransferGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/bank_transfer/get` fetches information about the bank transfer corresponding to the given `bank_transfer_id`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.bank_transfer.get(bank_transfer_id: "bank_transfer_id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**bank_transfer_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::BankTransfer::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.bank_transfer.<a href="/lib/plaid/bank_transfer/client.rb">create</a>(request) -> Plaid::Types::BankTransferCreateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use the `/bank_transfer/create` endpoint to initiate a new bank transfer.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.bank_transfer.create(
  idempotency_key: "idempotency_key",
  access_token: "access_token",
  account_id: "account_id",
  type: "debit",
  network: "ach",
  amount: "amount",
  iso_currency_code: "iso_currency_code",
  description: "description",
  user: {
    legal_name: "legal_name"
  }
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**idempotency_key:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**access_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**account_id:** `String` — The Plaid `account_id` for the account that will be debited or credited.
    
</dd>
</dl>

<dl>
<dd>

**type:** `Plaid::Types::BankTransferType` 
    
</dd>
</dl>

<dl>
<dd>

**network:** `Plaid::Types::BankTransferNetwork` 
    
</dd>
</dl>

<dl>
<dd>

**amount:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**iso_currency_code:** `String` — The currency of the transfer amount - should be set to "USD".
    
</dd>
</dl>

<dl>
<dd>

**description:** `String` — The transfer description. Maximum of 10 characters.
    
</dd>
</dl>

<dl>
<dd>

**ach_class:** `Plaid::Types::AchClass` 
    
</dd>
</dl>

<dl>
<dd>

**user:** `Plaid::Types::BankTransferUser` 
    
</dd>
</dl>

<dl>
<dd>

**custom_tag:** `String` — An arbitrary string provided by the client for storage with the bank transfer. May be up to 100 characters.
    
</dd>
</dl>

<dl>
<dd>

**metadata:** `Internal::Types::Hash[String, String]` 
    
</dd>
</dl>

<dl>
<dd>

**origination_account_id:** `String` — Plaid's unique identifier for the origination account for this transfer. If you have more than one origination account, this value must be specified. Otherwise, this field should be left blank.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::BankTransfer::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.bank_transfer.<a href="/lib/plaid/bank_transfer/client.rb">list</a>(request) -> Plaid::Internal::OffsetItemIterator</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use the `/bank_transfer/list` endpoint to see a list of all your bank transfers and their statuses. Results are paginated; use the `count` and `offset` query parameters to retrieve the desired bank transfers.

Returns a `Plaid::Internal::OffsetItemIterator` that yields each `Plaid::Types::BankTransfer` in the `bank_transfers` field of every page, requesting pages as they are needed. Call `pages` on it to get each page as a `Plaid::Types::BankTransferListResponse`, including its other fields.

No request is sent by this call. The first page is requested when you start iterating (or call `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.bank_transfer.list
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**start_date:** `String` — The start datetime of bank transfers to list. This should be in RFC 3339 format (i.e. `2019-12-06T22:35:49Z`)
    
</dd>
</dl>

<dl>
<dd>

**end_date:** `String` — The end datetime of bank transfers to list. This should be in RFC 3339 format (i.e. `2019-12-06T22:35:49Z`)
    
</dd>
</dl>

<dl>
<dd>

**count:** `Integer` — The maximum number of bank transfers to return.
    
</dd>
</dl>

<dl>
<dd>

**offset:** `Integer` — The number of bank transfers to skip before returning results.
    
</dd>
</dl>

<dl>
<dd>

**origination_account_id:** `String` — Filter bank transfers to only those originated through the specified origination account.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `Plaid::Types::BankTransferDirection` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::BankTransfer::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.bank_transfer.<a href="/lib/plaid/bank_transfer/client.rb">cancel</a>(request) -> Plaid::Types::BankTransferCancelResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use the `/bank_transfer/cancel` endpoint to cancel a bank transfer.  A transfer is eligible for cancelation if the `cancellable` property returned by `/bank_transfer/get` is `true`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.bank_transfer.cancel(bank_transfer_id: "bank_transfer_id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**bank_transfer_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::BankTransfer::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.bank_transfer.<a href="/lib/plaid/bank_transfer/client.rb">migrate_account</a>(request) -> Plaid::Types::BankTransferMigrateAccountResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

As an alternative to adding Items via Link, you can also use the `/bank_transfer/migrate_account` endpoint to migrate known account and routing numbers to Plaid Items.  Note that Items created in this way are not compatible with endpoints for other products, such as `/accounts/balance/get`, and can only be used with Bank Transfer endpoints.  If you require access to other endpoints, create the Item through Link instead.  Access to `/bank_transfer/migrate_account` is not enabled by default; to obtain access, contact your Plaid account manager.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.bank_transfer.migrate_account(
  account_number: "account_number",
  routing_number: "routing_number",
  account_type: "account_type"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**account_number:** `String` — The user's account number.
    
</dd>
</dl>

<dl>
<dd>

**routing_number:** `String` — The user's routing number.
    
</dd>
</dl>

<dl>
<dd>

**wire_routing_number:** `String` — The user's wire transfer routing number. This is the ABA number; for some institutions, this may differ from the ACH number used in `routing_number`.
    
</dd>
</dl>

<dl>
<dd>

**account_type:** `String` — The type of the bank account (`checking` or `savings`).
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::BankTransfer::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Employers
<details><summary><code>client.employers.<a href="/lib/plaid/employers/client.rb">search</a>(request) -> Plaid::Types::EmployersSearchResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

`/employers/search` allows you the ability to search Plaid's database of known employers, for use with Deposit Switch. You can use this endpoint to look up a user's employer in order to confirm that they are supported. Users with non-supported employers can then be routed out of the Deposit Switch flow.

The data in the employer database is currently limited. As the Deposit Switch and Income products progress through their respective beta periods, more employers are being regularly added. Because the employer database is frequently updated, we recommend that you do not cache or store data from this endpoint for more than a day.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.employers.search(
  query: "query",
  products: ["products"]
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**query:** `String` — The employer name to be searched for.
    
</dd>
</dl>

<dl>
<dd>

**products:** `Internal::Types::Array[String]` — The Plaid products the returned employers should support. Currently, this field must be set to `"deposit_switch"`.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Employers::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## IncomeVerification
<details><summary><code>client.income_verification.<a href="/lib/plaid/income_verification/client.rb">create</a>(request) -> Plaid::Types::IncomeVerificationCreateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

`/income/verification/create` begins the income verification process by returning an `income_verification_id`. You can then provide the `income_verification_id` to `/link/token/create` under the `income_verification` parameter in order to create a Link instance that will prompt the user to go through the income verification flow. Plaid will fire an `INCOME` webhook once the user completes the Payroll Income flow, or when the uploaded documents in the Document Income flow have finished processing. 
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.income_verification.create(webhook: "webhook")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**webhook:** `String` — The URL endpoint to which Plaid should send webhooks related to the progress of the income verification process.
    
</dd>
</dl>

<dl>
<dd>

**precheck_id:** `String` — The ID of a precheck created with `/income/verification/precheck`. Will be used to improve conversion of the income verification flow.
    
</dd>
</dl>

<dl>
<dd>

**options:** `Plaid::Types::IncomeVerificationCreateRequestOptions` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::IncomeVerification::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.income_verification.<a href="/lib/plaid/income_verification/client.rb">get_paystubs</a>(request) -> Plaid::Types::IncomeVerificationPaystubsGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

`/income/verification/paystubs/get` returns the information collected from the paystubs that were used to verify an end user's income. It can be called once the status of the verification has been set to `VERIFICATION_STATUS_PROCESSING_COMPLETE`, as reported by the `INCOME: verification_status` webhook. Attempting to call the endpoint before verification has been completed will result in an error.

This endpoint has been deprecated; new integrations should use `/credit/payroll_income/get` instead.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.income_verification.get_paystubs
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**income_verification_id:** `String` — The ID of the verification for which to get paystub information.
    
</dd>
</dl>

<dl>
<dd>

**access_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::IncomeVerification::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.income_verification.<a href="/lib/plaid/income_verification/client.rb">download_documents</a>(request) -> String</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

`/income/verification/documents/download` provides the ability to download the source documents associated with the verification.

If Document Income was used, the documents will be those the user provided in Link. For Payroll Income, the most recent files available for download from the payroll provider will be available from this endpoint.

The response to `/income/verification/documents/download` is a ZIP file in binary data. If a `document_id` is passed, a single document will be contained in this file.
If not, the response will contain all documents associated with the verification.

The `request_id` is returned in the `Plaid-Request-ID` header.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.income_verification.download_documents
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**income_verification_id:** `String` — The ID of the verification.
    
</dd>
</dl>

<dl>
<dd>

**access_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**document_id:** `String` — The document ID to download. If passed, a single document will be returned in the resulting zip file, rather than all document
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::IncomeVerification::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.income_verification.<a href="/lib/plaid/income_verification/client.rb">get_taxforms</a>(request) -> Plaid::Types::IncomeVerificationTaxformsGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

`/income/verification/taxforms/get` returns the information collected from forms that were used to verify an end user''s income. It can be called once the status of the verification has been set to `VERIFICATION_STATUS_PROCESSING_COMPLETE`, as reported by the `INCOME: verification_status` webhook. Attempting to call the endpoint before verification has been completed will result in an error.

This endpoint has been deprecated; new integrations should use `/credit/payroll_income/get` instead.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.income_verification.get_taxforms
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**income_verification_id:** `String` — The ID of the verification.
    
</dd>
</dl>

<dl>
<dd>

**access_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::IncomeVerification::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.income_verification.<a href="/lib/plaid/income_verification/client.rb">precheck</a>(request) -> Plaid::Types::IncomeVerificationPrecheckResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

`/income/verification/precheck` is an optional endpoint that can be called before initializing a Link session for income verification. It evaluates whether a given user is supportable by digital income verification and returns a `precheck_id` that can be provided to `/link/token/create`. If the user is eligible for digital verification, providing the `precheck_id` in this way will generate a Link UI optimized for the end user and their specific employer. If the user cannot be confirmed as eligible, the `precheck_id` can still be provided to `/link/token/create` and the user can still use the income verification flow, but they may be required to manually upload a paystub to verify their income.

While all request fields are optional, providing either `employer` or `transactions_access_tokens` data will increase the chance of receiving a useful result.

This endpoint has been deprecated; new integrations should use `/credit/payroll_income/precheck` instead.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.income_verification.precheck
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**user:** `Plaid::Types::IncomeVerificationPrecheckUser` 
    
</dd>
</dl>

<dl>
<dd>

**employer:** `Plaid::Types::IncomeVerificationPrecheckEmployer` 
    
</dd>
</dl>

<dl>
<dd>

**payroll_institution:** `Plaid::Types::IncomeVerificationPrecheckPayrollInstitution` 
    
</dd>
</dl>

<dl>
<dd>

**transactions_access_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**transactions_access_tokens:** `Internal::Types::Array[String]` — An array of access tokens corresponding to Items belonging to the user whose eligibility is being checked. Note that if the Items specified here are not already initialized with `transactions`, providing them in this field will cause these Items to be initialized with (and billed for) the Transactions product.
    
</dd>
</dl>

<dl>
<dd>

**us_military_info:** `Plaid::Types::IncomeVerificationPrecheckMilitaryInfo` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::IncomeVerification::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## EmploymentVerification
<details><summary><code>client.employment_verification.<a href="/lib/plaid/employment_verification/client.rb">get</a>(request) -> Plaid::Types::EmploymentVerificationGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

`/employment/verification/get` returns a list of employments through a user payroll that was verified by an end user.

This endpoint has been deprecated; new integrations should use `/credit/employment/get` instead.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.employment_verification.get(access_token: "access_token")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**access_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::EmploymentVerification::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Signal
<details><summary><code>client.signal.<a href="/lib/plaid/signal/client.rb">evaluate</a>(request) -> Plaid::Types::SignalEvaluateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use `/signal/evaluate` to evaluate a planned ACH transaction to get a return risk assessment and additional risk signals.

Before using `/signal/evaluate`, you must first [create a ruleset](https://plaid.com/docs/signal/signal-rules/) in the Dashboard under [**Signal->Rules**](https://dashboard.plaid.com/signal/risk-profiles).

`/signal/evaluate` can be used with either Signal Transaction Scores or the Balance product. Which product is used will be determined by the `ruleset_key` that you provide. For more details, see [Signal Rules](https://plaid.com/docs/signal/signal-rules/).

Note: This request may have higher latency when using a Balance-only ruleset. This is because Plaid must communicate directly with the institution to request data. Balance-only rulesets may have latency of up to 30 seconds or more; if you encounter errors, you may find it necessary to adjust your timeout period when making requests.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.signal.evaluate(
  access_token: "access_token",
  account_id: "account_id",
  client_transaction_id: "client_transaction_id",
  amount: 1.1
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**access_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**account_id:** `String` 

The Plaid `account_id` of the account that is the funding source for the proposed transaction. The `account_id` is returned in the `/accounts/get` endpoint as well as the [`onSuccess`](https://plaid.com/docs/link/ios/#link-ios-onsuccess-linkSuccess-metadata-accounts-id) callback metadata.

This will return an [`INVALID_ACCOUNT_ID`](https://plaid.com/docs/errors/invalid-input/#invalid_account_id) error if the account has been removed at the bank or if the `account_id` is no longer valid.
    
</dd>
</dl>

<dl>
<dd>

**client_transaction_id:** `String` — The unique ID that you would like to use to refer to this evaluation attempt - for example, a payment attempt ID. You will use this later to debug this evaluation, and/or report an ACH return, etc. The max length for this field is 36 characters. The `client_transaction_id` also functions as an idempotency key; calling `/signal/evaluate` with a previously used `client_transaction_id` will return the results of the previous evaluation rather than triggering a fresh evaluation.
    
</dd>
</dl>

<dl>
<dd>

**amount:** `Float` — The transaction amount, in USD (e.g. `102.05`)
    
</dd>
</dl>

<dl>
<dd>

**user_present:** `Internal::Types::Boolean` — `true` if the end user is present while initiating the ACH transfer and the endpoint is being called; `false` otherwise (for example, when the ACH transfer is scheduled and the end user is not present, or you call this endpoint after the ACH transfer but before submitting the Nacha file for ACH processing). When using a Balance-only ruleset, this field is ignored. This field is not currently used as part of Signal Transaction Score evaluations, but may be used in the future.
    
</dd>
</dl>

<dl>
<dd>

**client_user_id:** `String` — A unique ID that identifies the end user in your system. This ID is used to correlate requests by a user with multiple Items. Personally identifiable information, such as an email address or phone number, should not be used in the `client_user_id`.
    
</dd>
</dl>

<dl>
<dd>

**is_recurring:** `Internal::Types::Boolean` — Use `true` if the ACH transaction is a part of recurring schedule (for example, a monthly repayment); `false` otherwise. When using a Balance-only ruleset, this field is ignored.
    
</dd>
</dl>

<dl>
<dd>

**default_payment_method:** `String` 

The default ACH payment method to complete the transaction. When using a Balance-only ruleset, this field is ignored.

`SAME_DAY_ACH`: Same Day ACH by Nacha. The debit transaction is processed and settled on the same day.

`STANDARD_ACH`: Standard ACH by Nacha.

`MULTIPLE_PAYMENT_METHODS`: If there is no default debit rail or there are multiple payment methods.

Possible values:  `SAME_DAY_ACH`, `STANDARD_ACH`, `MULTIPLE_PAYMENT_METHODS`
    
</dd>
</dl>

<dl>
<dd>

**user:** `Plaid::Types::SignalUser` 
    
</dd>
</dl>

<dl>
<dd>

**device:** `Plaid::Types::SignalDevice` 
    
</dd>
</dl>

<dl>
<dd>

**risk_profile_key:** `String` — Specifying `risk_profile_key` is deprecated. Please provide `ruleset` instead.
    
</dd>
</dl>

<dl>
<dd>

**ruleset_key:** `String` — The key of the ruleset to use for evaluating this transaction. You can create a ruleset using the Plaid Dashboard, under [Signal->Rules](https://dashboard.plaid.com/signal/risk-profiles). If not provided, for all new customers as of October 15, 2025, the `default` ruleset will be used. For existing Signal Transaction Scores customers as of October 15, 2025, by default, no ruleset will be used if the `ruleset_key` is not provided. For more information, or to opt out of using rulesets, see [Signal Rules](https://plaid.com/docs/signal/signal-rules/).
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Signal::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.signal.<a href="/lib/plaid/signal/client.rb">schedule</a>(request) -> Plaid::Types::SignalScheduleResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use `/signal/schedule` to schedule a planned ACH transaction.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.signal.schedule(
  access_token: "access_token",
  account_id: "account_id",
  client_transaction_id: "client_transaction_id",
  amount: 1.1
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**access_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**account_id:** `String` 

The Plaid `account_id` of the account that is the funding source for the proposed transaction. The `account_id` is returned in the `/accounts/get` endpoint as well as the [`onSuccess`](https://plaid.com/docs/link/ios/#link-ios-onsuccess-linkSuccess-metadata-accounts-id) callback metadata.

This will return an [`INVALID_ACCOUNT_ID`](https://plaid.com/docs/errors/invalid-input/#invalid_account_id) error if the account has been removed at the bank or if the `account_id` is no longer valid.
    
</dd>
</dl>

<dl>
<dd>

**client_transaction_id:** `String` — The unique ID that you would like to use to refer to this transaction. For your convenience mapping your internal data, you could use your internal ID/identifier for this transaction. The max length for this field is 36 characters.
    
</dd>
</dl>

<dl>
<dd>

**amount:** `Float` — The transaction amount, in USD (e.g. `102.05`)
    
</dd>
</dl>

<dl>
<dd>

**default_payment_method:** `Plaid::Types::SignalScheduleDefaultPaymentMethod` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Signal::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.signal.<a href="/lib/plaid/signal/client.rb">report_decision</a>(request) -> Plaid::Types::SignalDecisionReportResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

After you call `/signal/evaluate`, Plaid will normally infer the outcome from your Signal Rules. However, if you are not using Signal Rules, if the Signal Rules outcome was `REVIEW`, or if you take a different action than the one determined by the Signal Rules, you will need to call `/signal/decision/report`. This helps improve Signal Transaction Score accuracy for your account and is necessary for proper functioning of the rule performance and rule tuning capabilities in the Dashboard. If your effective decision changes after calling `/signal/decision/report` (for example, you indicated that you accepted a transaction, but later on, your payment processor rejected it, so it was never initiated), call `/signal/decision/report` again for the transaction to correct Plaid's records.

If you are using Plaid Transfer as your payment processor, you also do not need to call `/signal/decision/report`, as Plaid can infer outcomes from your Transfer activity.

If using a Balance-only ruleset, this endpoint will not impact scores (Balance does not use scores), but is necessary to view accurate transaction outcomes and tune rule logic in the Dashboard.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.signal.report_decision(
  client_transaction_id: "client_transaction_id",
  initiated: true
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**client_transaction_id:** `String` — Must be the same as the `client_transaction_id` supplied when calling `/signal/evaluate`
    
</dd>
</dl>

<dl>
<dd>

**initiated:** `Internal::Types::Boolean` 

`true` if the ACH transaction was initiated, `false` otherwise.

This field must be returned as a boolean. If formatted incorrectly, this will result in an [`INVALID_FIELD`](https://plaid.com/docs/errors/invalid-request/#invalid_field) error.
    
</dd>
</dl>

<dl>
<dd>

**days_funds_on_hold:** `Integer` 

The actual number of days (hold time) since the ACH debit transaction that you wait before making funds available to your customers. The holding time could affect the ACH return rate.

For example, use 0 if you make funds available to your customers instantly or the same day following the debit transaction, or 1 if you make funds available the next day following the debit initialization.
    
</dd>
</dl>

<dl>
<dd>

**decision_outcome:** `Plaid::Types::SignalDecisionOutcome` 
    
</dd>
</dl>

<dl>
<dd>

**payment_method:** `Plaid::Types::SignalPaymentMethod` 
    
</dd>
</dl>

<dl>
<dd>

**amount_instantly_available:** `Float` — The amount (in USD) made available to your customers instantly following the debit transaction. It could be a partial amount of the requested transaction (example: 102.05).
    
</dd>
</dl>

<dl>
<dd>

**submitted_at:** `String` — The date the ACH debit was submitted to the bank for processing (in ISO 8601 format: `YYYY-MM-DDTHH:mm:ssZ`). This field should correspond to the attempt initiated after the `/signal/schedule` call.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Signal::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.signal.<a href="/lib/plaid/signal/client.rb">report_return</a>(request) -> Plaid::Types::SignalReturnReportResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Call the `/signal/return/report` endpoint to report a returned transaction that was previously sent to the `/signal/evaluate` endpoint. Your feedback will be used by the model to incorporate the latest risk trends into your scores and tune rule logic. If using a Balance-only ruleset, this endpoint will not impact scores (as Balance does not use scores), but is necessary to view accurate transaction outcomes and tune rule logic in the Dashboard.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.signal.report_return(
  client_transaction_id: "client_transaction_id",
  return_code: "return_code"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**client_transaction_id:** `String` — Must be the same as the `client_transaction_id` supplied when calling `/signal/evaluate`.
    
</dd>
</dl>

<dl>
<dd>

**return_code:** `String` 

Must be a valid ACH return code (e.g. "R01")

If formatted incorrectly, this will result in an [`INVALID_FIELD`](https://plaid.com/docs/errors/invalid-request/#invalid_field) error.
    
</dd>
</dl>

<dl>
<dd>

**returned_at:** `String` — Date and time when you receive the returns from your payment processors, in ISO 8601 format (`YYYY-MM-DDTHH:mm:ssZ`).
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Signal::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.signal.<a href="/lib/plaid/signal/client.rb">prepare</a>(request) -> Plaid::Types::SignalPrepareResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

When an Item is not initialized with `signal`, call `/signal/prepare` to opt-in that Item to the data collection process used to develop a Signal Transaction Score. This should be done on Items where `signal` was added in the `additional_consented_products` array but not in the `products`, `optional_products`, or `required_if_supported_products` array. If `/signal/prepare` is skipped on an Item that is not initialized with `signal`, the initial call to `/signal/evaluate` on that Item will be less accurate, because Plaid will have access to less data for computing the Signal Transaction Score.

If your integration is purely Balance-only, this endpoint will have no effect, as Balance-only rulesets do not calculate a Signal Transaction Score.

If run on an Item that is already initialized with `signal`, this endpoint will return a 200 response and will not modify the Item.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.signal.prepare(access_token: "access_token")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**access_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Signal::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Wallet
<details><summary><code>client.wallet.<a href="/lib/plaid/wallet/client.rb">create</a>(request) -> Plaid::Types::WalletCreateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create an e-wallet. The response is the newly created e-wallet object.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.wallet.create(iso_currency_code: "GBP")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**iso_currency_code:** `Plaid::Types::WalletIsoCurrencyCode` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Wallet::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.wallet.<a href="/lib/plaid/wallet/client.rb">get</a>(request) -> Plaid::Types::WalletGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Fetch an e-wallet. The response includes the current balance.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.wallet.get(wallet_id: "wallet_id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**wallet_id:** `String` — The ID of the e-wallet
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Wallet::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.wallet.<a href="/lib/plaid/wallet/client.rb">list</a>(request) -> Plaid::Internal::CursorItemIterator</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

This endpoint lists all e-wallets in descending order of creation.

Returns a `Plaid::Internal::CursorItemIterator` that yields each `Plaid::Types::Wallet` in the `wallets` field of every page, requesting pages as they are needed. Call `pages` on it to get each page as a `Plaid::Types::WalletListResponse`, including its other fields.

No request is sent by this call. The first page is requested when you start iterating (or call `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.wallet.list
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**iso_currency_code:** `Plaid::Types::WalletIsoCurrencyCode` 
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` — A base64 value representing the latest e-wallet that has already been requested. Set this to `next_cursor` received from the previous `/wallet/list` request. If provided, the response will only contain e-wallets created before that e-wallet. If omitted, the response will contain e-wallets starting from the most recent, and in descending order.
    
</dd>
</dl>

<dl>
<dd>

**count:** `Integer` — The number of e-wallets to fetch
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Wallet::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.wallet.<a href="/lib/plaid/wallet/client.rb">execute_transaction</a>(request) -> Plaid::Types::WalletTransactionExecuteResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Execute a transaction using the specified e-wallet.
Specify the e-wallet to debit from, the counterparty to credit to, the idempotency key to prevent duplicate transactions, the amount and reference for the transaction.
Transactions will settle in seconds to several days, depending on the underlying payment rail.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.wallet.execute_transaction(
  idempotency_key: "idempotency_key",
  wallet_id: "wallet_id",
  counterparty: {
    name: "name",
    numbers: {}
  },
  amount: {
    iso_currency_code: "GBP",
    value: 1.1
  },
  reference: "reference"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**idempotency_key:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**wallet_id:** `String` — The ID of the e-wallet to debit from
    
</dd>
</dl>

<dl>
<dd>

**counterparty:** `Plaid::Types::WalletTransactionCounterparty` 
    
</dd>
</dl>

<dl>
<dd>

**amount:** `Plaid::Types::WalletTransactionAmount` 
    
</dd>
</dl>

<dl>
<dd>

**user_id:** `String` — The `user_id` of the end user the transaction is for, as returned by [`/user/create`](https://plaid.com/docs/api/users/#usercreate). The user must have a `name` and either an email address or a phone number. Required for new integrations.
    
</dd>
</dl>

<dl>
<dd>

**reference:** `String` 

A reference for the transaction. This must be a string of 6 to 18 characters containing only letters, numbers, and spaces.
Ensure that the `reference` field is unique for each transaction.
    
</dd>
</dl>

<dl>
<dd>

**originating_fund_source:** `Plaid::Types::OriginatingFundSource` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Wallet::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.wallet.<a href="/lib/plaid/wallet/client.rb">get_transaction</a>(request) -> Plaid::Types::WalletTransactionGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Fetch a specific e-wallet transaction
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.wallet.get_transaction(transaction_id: "transaction_id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**transaction_id:** `String` — The ID of the transaction to fetch
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Wallet::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.wallet.<a href="/lib/plaid/wallet/client.rb">list_transactions</a>(request) -> Plaid::Internal::CursorItemIterator</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

This endpoint lists the latest transactions of the specified e-wallet. Transactions are returned in descending order by the `created_at` time.

Returns a `Plaid::Internal::CursorItemIterator` that yields each `Plaid::Types::WalletTransaction` in the `transactions` field of every page, requesting pages as they are needed. Call `pages` on it to get each page as a `Plaid::Types::WalletTransactionListResponse`, including its other fields.

No request is sent by this call. The first page is requested when you start iterating (or call `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.wallet.list_transactions(wallet_id: "wallet_id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**wallet_id:** `String` — The ID of the e-wallet to fetch transactions from
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` — A value representing the latest transaction to be included in the response. Set this from `next_cursor` received in the previous `/wallet/transaction/list` request. If provided, the response will only contain that transaction and transactions created before it. If omitted, the response will contain transactions starting from the most recent, and in descending order by the `created_at` time.
    
</dd>
</dl>

<dl>
<dd>

**count:** `Integer` — The number of transactions to fetch
    
</dd>
</dl>

<dl>
<dd>

**options:** `Plaid::Types::WalletTransactionListRequestOptions` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Wallet::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## EwaReport
<details><summary><code>client.ewa_report.<a href="/lib/plaid/ewa_report/client.rb">get</a>(request) -> Plaid::Types::BetaEwaReportV1GetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/beta/ewa_report/v1/get` endpoint provides an Earned Wage Access (EWA) score that quantifies the delinquency risk associated with a given item. The score is derived from a combination of cashflow patterns and network-based behavioral features.

The response returns a list of EWA scores, where each score corresponds to a potential advance amount range. These scores estimate the likelihood of repayment for advances within that range.

Score range: 1-99

Interpretation: Higher scores indicate a greater likelihood of repayment.

This endpoint enables clients to assess repayment risk and make data-driven decisions when determining eligibility or limits for earned wage advances.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.ewa_report.get(access_token: "access-sandbox-71e02f71-0960-4a27-abd2-5631e04f2175")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**access_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::EwaReport::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## CashAdvance
<details><summary><code>client.cash_advance.<a href="/lib/plaid/cash_advance/client.rb">get_income_insights</a>(request) -> Plaid::Types::BetaCashAdvanceIncomeInsightsV1GetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/beta/cash_advance/income_insights/v1/get` endpoint returns a user's top income streams across all of the user's active Items, ranked by historical net monthly income and capped at three, along with the next payment date and amount of the highest-ranked stream.

Only USD income streams are returned. If some, but not all, of the user's Items could not be evaluated, the response is based on the remaining Items.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.cash_advance.get_income_insights(user_id: "usr_9nSp2KuZ2x4JDw")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**user_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::CashAdvance::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Issues
<details><summary><code>client.issues.<a href="/lib/plaid/issues/client.rb">get_v1</a>(request) -> Plaid::Types::BetaIssuesV1GetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve the latest public details for a specific institution issue.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.issues.get_v1(issue_id: "issue_id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**issue_id:** `String` — The KI- or INC-prefixed identifier of the issue to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Issues::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.issues.<a href="/lib/plaid/issues/client.rb">list_v1</a>(request) -> Plaid::Types::BetaIssuesV1ListResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve high-severity issues for an institution.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.issues.list_v1(institution_id: "institution_id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**institution_id:** `String` — The identifier of the institution whose issues should be returned.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Issues::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.issues.<a href="/lib/plaid/issues/client.rb">match_v1</a>(request) -> Plaid::Types::BetaIssuesV1MatchResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Match a Plaid identifier to institution issues that affect it.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.issues.match_v1(
  identifier_type: "ITEM_ID",
  identifier: "identifier"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**identifier_type:** `Plaid::Types::BetaIssuesV1MatchIdentifierType` 
    
</dd>
</dl>

<dl>
<dd>

**identifier:** `String` — The Item, request, Link session, or Account identifier to match.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Issues::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.issues.<a href="/lib/plaid/issues/client.rb">subscribe_v1</a>(request) -> Plaid::Types::BetaIssuesV1SubscribeResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Subscribe a webhook URL to resolution notifications for an institution issue. A client has a single subscription per issue, so subscribing again for the same issue overwrites the previously registered webhook URL.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.issues.subscribe_v1(
  issue_id: "issue_id",
  webhook: "webhook"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**issue_id:** `String` — The KI- or INC-prefixed identifier of the issue to subscribe to.
    
</dd>
</dl>

<dl>
<dd>

**webhook:** `String` — The URL that will receive issue resolution webhooks.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Issues::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.issues.<a href="/lib/plaid/issues/client.rb">unsubscribe_v1</a>(request) -> Plaid::Types::BetaIssuesV1UnsubscribeResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Remove the client's subscription to resolution notifications for an institution issue. This removes the client's single subscription for that issue, identified by the issue alone.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.issues.unsubscribe_v1(issue_id: "issue_id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**issue_id:** `String` — The customer-visible KI- or INC-prefixed identifier of the issue to unsubscribe from.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Issues::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.issues.<a href="/lib/plaid/issues/client.rb">search</a>(request) -> Plaid::Types::IssuesSearchResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Search for an issue associated with one of the following identifiers:  `item_id`, `link_session_id` or Link session `request_id`. This endpoint returns a list containing at most one issue. If no issues are associated with the provided identifier, `issues` is omitted. At least one of the identifiers must be provided to perform the search.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.issues.search
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**item_id:** `String` — A unique identifier for the Plaid Item.
    
</dd>
</dl>

<dl>
<dd>

**link_session_id:** `String` — A unique identifier for the Link session.
    
</dd>
</dl>

<dl>
<dd>

**link_session_request_id:** `String` — The `request_id` for the Link session that might have had an institution connection issue.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Issues::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.issues.<a href="/lib/plaid/issues/client.rb">get</a>(request) -> Plaid::Types::IssuesGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve detailed information about a specific `Issue`. This endpoint returns a single `Issue` object.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.issues.get(issue_id: "issue_id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**issue_id:** `String` — The unique identifier of the issue to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Issues::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.issues.<a href="/lib/plaid/issues/client.rb">subscribe</a>(request) -> Plaid::Types::IssuesSubscribeResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Allows a user to subscribe to updates on a specific `Issue` using a POST method. Subscribers will receive webhook notifications when the issue status changes, particularly when resolved.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.issues.subscribe(
  issue_id: "issue_id",
  webhook: "webhook"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**issue_id:** `String` — The unique identifier of the issue to subscribe to.
    
</dd>
</dl>

<dl>
<dd>

**webhook:** `String` — The webhook URL where notifications should be sent when the issue status changes.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Issues::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## PaymentProfile
<details><summary><code>client.payment_profile.<a href="/lib/plaid/payment_profile/client.rb">create</a>(request) -> Plaid::Types::PaymentProfileCreateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use `/payment_profile/create` endpoint to create a new payment profile.
To initiate the account linking experience, call `/link/token/create` and provide the `payment_profile_token` in the `transfer.payment_profile_token` field.
You can then use the `payment_profile_token` when creating transfers using `/transfer/authorization/create` and `/transfer/create`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.payment_profile.create
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request_options:** `Plaid::PaymentProfile::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.payment_profile.<a href="/lib/plaid/payment_profile/client.rb">get</a>(request) -> Plaid::Types::PaymentProfileGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use `/payment_profile/get` endpoint to get the status of a given Payment Profile.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.payment_profile.get(payment_profile_token: "payment_profile_token")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**payment_profile_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::PaymentProfile::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.payment_profile.<a href="/lib/plaid/payment_profile/client.rb">remove</a>(request) -> Plaid::Types::PaymentProfileRemoveResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use the `/payment_profile/remove` endpoint to remove a given Payment Profile. Once it's removed, it can no longer be used to create transfers.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.payment_profile.remove(payment_profile_token: "payment_profile_token")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**payment_profile_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::PaymentProfile::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Partner
<details><summary><code>client.partner.<a href="/lib/plaid/partner/client.rb">create_customer</a>(request) -> Plaid::Types::PartnerCustomerCreateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/partner/customer/create` endpoint is used by reseller partners to create end customers. To create end customers, it should be called in the Production environment only, even when creating Sandbox API keys. If called in the Sandbox environment, it will return a sample response, but no customer will be created and the API keys will not be valid.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.partner.create_customer(
  company_name: "Plaid",
  is_diligence_attested: true,
  products: %w[auth identity],
  create_link_customization: true,
  legal_entity_name: "Plaid",
  website: "plaid.com",
  application_name: "Plaid",
  technical_contact: {
    given_name: "Alice",
    family_name: "Smith",
    email: "alice.smith@example.com"
  },
  billing_contact: {
    given_name: "Bob",
    family_name: "Jones",
    email: "bob.jones@example.com"
  },
  customer_support_info: {
    email: "support@example.com",
    phone_number: "1234567890",
    contact_url: "example.com/contact",
    link_update_url: "example.com/update"
  },
  address: {
    city: "New York",
    street: "123 Main St",
    region: "NY",
    postal_code: "12345",
    country_code: "US"
  },
  is_bank_addendum_completed: true,
  redirect_uris: %w[http://localhost/oauth.html https://www.example.com/oauth.html]
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**company_name:** `String` — The company name of the end customer being created. This will be used to display the end customer in the Plaid Dashboard. It will not be shown to end users.
    
</dd>
</dl>

<dl>
<dd>

**is_diligence_attested:** `Internal::Types::Boolean` — Denotes whether or not the partner has completed attestation of diligence for the end customer to be created.
    
</dd>
</dl>

<dl>
<dd>

**products:** `Internal::Types::Array[Plaid::Types::Products]` — The products to be enabled for the end customer. If empty or `null`, this field will default to the products enabled for the reseller at the time this endpoint is called.
    
</dd>
</dl>

<dl>
<dd>

**create_link_customization:** `Internal::Types::Boolean` 

If `true`, the end customer's default Link customization will be set to match the partner's. You can always change the end customer's Link customization in the Plaid Dashboard. See the [Link Customization docs](https://plaid.com/docs/link/customization/) for more information. If you require the ability to programmatically create end customers using multiple different Link customization profiles, contact your Plaid account manager for assistance.

Important: Data Transparency Messaging (DTM) use cases will not be copied to the end customer's Link customization unless the **Publish changes** button is clicked after the use cases are applied. Link will not work in Production unless the end customer's DTM use cases are configured. For more details, see [Data Transparency Messaging](https://plaid.com/docs/link/data-transparency-messaging-migration-guide/).
    
</dd>
</dl>

<dl>
<dd>

**logo:** `String` — Base64-encoded representation of the end customer's logo. Must be a PNG of size 1024x1024 under 4MB. The logo will be shared with financial institutions and shown to the end user during Link flows. A logo is required if `create_link_customization` is `true`. If `create_link_customization` is `false` and the logo is omitted, the partner's logo will be used if one exists, otherwise a stock logo will be used.
    
</dd>
</dl>

<dl>
<dd>

**legal_entity_name:** `String` — The end customer's legal name. This will be shared with financial institutions as part of the OAuth registration process. It will not be shown to end users.
    
</dd>
</dl>

<dl>
<dd>

**website:** `String` — The end customer's website.
    
</dd>
</dl>

<dl>
<dd>

**application_name:** `String` — The name of the end customer's application. This will be shown to end users when they go through the Plaid Link flow. The application name must be unique and cannot match the name of another application already registered with Plaid.
    
</dd>
</dl>

<dl>
<dd>

**technical_contact:** `Plaid::Types::PartnerEndCustomerTechnicalContact` 
    
</dd>
</dl>

<dl>
<dd>

**billing_contact:** `Plaid::Types::PartnerEndCustomerBillingContact` 
    
</dd>
</dl>

<dl>
<dd>

**customer_support_info:** `Plaid::Types::PartnerEndCustomerCustomerSupportInfo` 
    
</dd>
</dl>

<dl>
<dd>

**address:** `Plaid::Types::PartnerEndCustomerAddress` 
    
</dd>
</dl>

<dl>
<dd>

**is_bank_addendum_completed:** `Internal::Types::Boolean` — Denotes whether the partner has forwarded the Plaid bank addendum to the end customer.
    
</dd>
</dl>

<dl>
<dd>

**assets_under_management:** `Plaid::Types::PartnerEndCustomerAssetsUnderManagement` 
    
</dd>
</dl>

<dl>
<dd>

**redirect_uris:** `Internal::Types::Array[String]` — A list of URIs indicating the destination(s) where a user can be forwarded after completing the Link flow; used to support OAuth authentication flows when launching Link in the browser or another app. URIs should not contain any query parameters. When used in Production, URIs must use https. To modify redirect URIs for an end customer after creating them, go to the end customer's [API page](https://dashboard.plaid.com/team/api) in the Dashboard.
    
</dd>
</dl>

<dl>
<dd>

**registration_number:** `String` — The unique identifier assigned to a financial institution by regulatory authorities, if applicable. For banks, this is the FDIC Certificate Number. For credit unions, this is the Credit Union Charter Number.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Partner::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.partner.<a href="/lib/plaid/partner/client.rb">get_customer</a>(request) -> Plaid::Types::PartnerCustomerGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/partner/customer/get` endpoint is used by reseller partners to retrieve data about a single end customer.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.partner.get_customer(end_customer_client_id: "7f57eb3d2a9j6480121fx361")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**end_customer_client_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Partner::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.partner.<a href="/lib/plaid/partner/client.rb">enable_customer</a>(request) -> Plaid::Types::PartnerCustomerEnableResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/partner/customer/enable` endpoint is used by reseller partners to enable an end customer in the full Production environment.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.partner.enable_customer(end_customer_client_id: "7f57eb3d2a9j6480121fx361")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**end_customer_client_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Partner::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.partner.<a href="/lib/plaid/partner/client.rb">remove_customer</a>(request) -> Plaid::Types::PartnerCustomerRemoveResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/partner/customer/remove` endpoint is used by reseller partners to remove an end customer. Removing an end customer will remove it from view in the Plaid Dashboard and deactivate its API keys. This endpoint can only be used to remove an end customer that has not yet been enabled in full Production.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.partner.remove_customer(end_customer_client_id: "7f57eb3d2a9j6480121fx361")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**end_customer_client_id:** `String` — The `client_id` of the end customer to be removed.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Partner::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.partner.<a href="/lib/plaid/partner/client.rb">get_customer_oauth_institutions</a>(request) -> Plaid::Types::PartnerCustomerOAuthInstitutionsGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/partner/customer/oauth_institutions/get` endpoint is used by reseller partners to retrieve OAuth-institution registration information about a single end customer. To learn how to set up a webhook to listen to status update events, visit the [reseller documentation](https://plaid.com/docs/account/resellers/#enabling-end-customers).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.partner.get_customer_oauth_institutions(end_customer_client_id: "7f57eb3d2a9j6480121fx361")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**end_customer_client_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Partner::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.partner.<a href="/lib/plaid/partner/client.rb">create_customer_v1</a>(request) -> Plaid::Types::BetaPartnerCustomerV1CreateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/beta/partner/customer/v1/create` endpoint creates a new end customer record. You can provide as much information as you have available. If any required information is missing for the products you intend to use, it will be listed in the `requirements_due` field of the response.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.partner.create_customer_v1(
  company_name: "Plaid",
  products: %w[auth identity],
  create_link_customization: true,
  legal_entity_name: "Plaid",
  website: "plaid.com",
  application_name: "Plaid",
  technical_contact: {
    given_name: "Alice",
    family_name: "Smith",
    email: "alice.smith@example.com"
  },
  billing_contact: {
    given_name: "Bob",
    family_name: "Jones",
    email: "bob.jones@example.com"
  },
  customer_support_info: {
    email: "support@example.com",
    phone_number: "1234567890",
    contact_url: "example.com/contact",
    link_update_url: "example.com/update"
  },
  address: {
    city: "New York",
    street: "123 Main St",
    region: "NY",
    postal_code: "12345",
    country_code: "US"
  },
  redirect_uris: %w[http://localhost/oauth.html https://www.example.com/oauth.html]
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**company_name:** `String` — The company name of the end customer being created. This will be used to display the end customer in the Plaid Dashboard. It will not be shown to end users.
    
</dd>
</dl>

<dl>
<dd>

**is_diligence_attested:** `Internal::Types::Boolean` — Denotes whether or not the partner has completed attestation of diligence for the end customer to be created.
    
</dd>
</dl>

<dl>
<dd>

**products:** `Internal::Types::Array[Plaid::Types::Products]` — The products to be enabled for the end customer. If empty or `null`, this field will default to the products enabled for the reseller at the time this endpoint is called.
    
</dd>
</dl>

<dl>
<dd>

**create_link_customization:** `Internal::Types::Boolean` 

If `true`, the end customer's default Link customization will be set to match the partner's. You can always change the end customer's Link customization in the Plaid Dashboard. See the [Link Customization docs](https://plaid.com/docs/link/customization/) for more information. If you require the ability to programmatically create end customers using multiple different Link customization profiles, contact your Plaid account manager for assistance.

Important: Data Transparency Messaging (DTM) use cases will not be copied to the end customer's Link customization unless the **Publish changes** button is clicked after the use cases are applied. Link will not work in Production unless the end customer's DTM use cases are configured. For more details, see [Data Transparency Messaging](https://plaid.com/docs/link/data-transparency-messaging-migration-guide/).
    
</dd>
</dl>

<dl>
<dd>

**logo:** `String` — Base64-encoded representation of the end customer's logo. Must be a PNG of size 1024x1024 under 4MB. The logo will be shared with financial institutions and shown to the end user during Link flows. A logo is required if `create_link_customization` is `true`. If `create_link_customization` is `false` and the logo is omitted, the partner's logo will be used if one exists, otherwise a stock logo will be used.
    
</dd>
</dl>

<dl>
<dd>

**legal_entity_name:** `String` — The end customer's legal name. This will be shared with financial institutions as part of the OAuth registration process. It will not be shown to end users.
    
</dd>
</dl>

<dl>
<dd>

**website:** `String` — The end customer's website.
    
</dd>
</dl>

<dl>
<dd>

**application_name:** `String` — The name of the end customer's application. This will be shown to end users when they go through the Plaid Link flow. The application name must be unique and cannot match the name of another application already registered with Plaid.
    
</dd>
</dl>

<dl>
<dd>

**technical_contact:** `Plaid::Types::PartnerEndCustomerTechnicalContact` 
    
</dd>
</dl>

<dl>
<dd>

**billing_contact:** `Plaid::Types::PartnerEndCustomerBillingContact` 
    
</dd>
</dl>

<dl>
<dd>

**customer_support_info:** `Plaid::Types::PartnerEndCustomerCustomerSupportInfo` 
    
</dd>
</dl>

<dl>
<dd>

**address:** `Plaid::Types::PartnerEndCustomerAddress` 
    
</dd>
</dl>

<dl>
<dd>

**redirect_uris:** `Internal::Types::Array[String]` — A list of URIs indicating the destination(s) where a user can be forwarded after completing the Link flow; used to support OAuth authentication flows when launching Link in the browser or another app. URIs should not contain any query parameters. When used in Production, URIs must use https. To modify redirect URIs for an end customer after creating them, go to the end customer's [API page](https://dashboard.plaid.com/team/api) in the Dashboard.
    
</dd>
</dl>

<dl>
<dd>

**bank_addendum_acceptance:** `Plaid::Types::PartnerEndCustomerBankAddendumAcceptance` 
    
</dd>
</dl>

<dl>
<dd>

**questionnaires:** `Plaid::Types::PartnerEndCustomerQuestionnaires` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Partner::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.partner.<a href="/lib/plaid/partner/client.rb">get_customer_v1</a>(request) -> Plaid::Types::BetaPartnerCustomerV1GetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/beta/partner/customer/v1/get` endpoint is used by reseller partners to retrieve data about a single end customer.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.partner.get_customer_v1(end_customer_client_id: "634758733ebb4f00134b85ea")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**end_customer_client_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Partner::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.partner.<a href="/lib/plaid/partner/client.rb">update_customer_v1</a>(request) -> Plaid::Types::BetaPartnerCustomerV1UpdateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/beta/partner/customer/v1/update` endpoint updates an existing end customer record.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.partner.update_customer_v1(
  end_customer_client_id: "634758733ebb4f00134b85ea",
  bank_addendum_acceptance: {
    customer_accepted: true,
    customer_ip_address: "127.0.0.1",
    customer_agreement_timestamp: "2025-01-01T01:00:00Z"
  },
  questionnaires: {
    cra: {
      purposes: {
        WRITTEN_INSTRUCTION: {
          use_cases: %w[CREDIT_UNDERWRITING TENANT_SCREENING]
        }
      },
      is_third_party_involved: true,
      is_technical_service_provider_involved: true
    }
  }
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**end_customer_client_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**legal_entity_name:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**redirect_uris:** `Internal::Types::Array[String]` 
    
</dd>
</dl>

<dl>
<dd>

**bank_addendum_acceptance:** `Plaid::Types::PartnerEndCustomerBankAddendumAcceptance` 
    
</dd>
</dl>

<dl>
<dd>

**questionnaires:** `Plaid::Types::PartnerEndCustomerQuestionnaires` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Partner::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.partner.<a href="/lib/plaid/partner/client.rb">enable_customer_v1</a>(request) -> Plaid::Types::BetaPartnerCustomerV1EnableResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/beta/partner/customer/v1/enable` endpoint is used by reseller partners to enable an end customer in the full Production environment.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.partner.enable_customer_v1(
  end_customer_client_id: "634758733ebb4f00134b85ea",
  products: ["auth"]
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**end_customer_client_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**products:** `Internal::Types::Array[Plaid::Types::Products]` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Partner::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Fdx
<details><summary><code>client.fdx.<a href="/lib/plaid/fdx/client.rb">notifications</a>(request) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

A generic webhook receiver endpoint for FDX Event Notifications
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.fdx.notifications(
  notification_id: "notificationId",
  type: "ACCOUNT_TAKEOVER",
  sent_on: "2021-07-15T14:46:41Z",
  category: "SECURITY",
  notification_payload: {}
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**notification_id:** `String` — Id of notification
    
</dd>
</dl>

<dl>
<dd>

**type:** `Plaid::Types::FdxNotificationType` 
    
</dd>
</dl>

<dl>
<dd>

**subtype:** `String` — An optional initiator-defined event subtype code or description if the event type needs to be further categorized or described.
    
</dd>
</dl>

<dl>
<dd>

**sent_on:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**category:** `Plaid::Types::FdxNotificationCategory` 
    
</dd>
</dl>

<dl>
<dd>

**severity:** `Plaid::Types::FdxNotificationSeverity` 
    
</dd>
</dl>

<dl>
<dd>

**priority:** `Plaid::Types::FdxNotificationPriority` 
    
</dd>
</dl>

<dl>
<dd>

**publisher:** `Plaid::Types::FdxParty` 
    
</dd>
</dl>

<dl>
<dd>

**subscriber:** `Plaid::Types::FdxParty` 
    
</dd>
</dl>

<dl>
<dd>

**notification_payload:** `Plaid::Types::FdxNotificationPayload` 
    
</dd>
</dl>

<dl>
<dd>

**url:** `Plaid::Types::FdxHateoasLink` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Fdx::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.fdx.<a href="/lib/plaid/fdx/client.rb">get_recipients</a>() -> Plaid::Types::GetRecipientsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns metadata for every recipient (application) your customers have connected to via Plaid's App Directory.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.fdx.get_recipients
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request_options:** `Plaid::Fdx::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.fdx.<a href="/lib/plaid/fdx/client.rb">get_consents</a>() -> Plaid::Types::GetConsentsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns zero or more consent grants associated with the given data provider customer, optionally filtered by status.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.fdx.get_consents(customer_id: "customerId")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**customer_id:** `String` — Data provider customer identifier whose consent grants to return.
    
</dd>
</dl>

<dl>
<dd>

**status:** `Plaid::Types::FdxConsentGrantStatus` — Optional filter restricting results to a single consent grant status. One of `ACTIVE`, `REVOKED`, `EXPIRED`.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Fdx::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.fdx.<a href="/lib/plaid/fdx/client.rb">get_consent_revocation</a>(consent_id:) -> Plaid::Types::FdxConsentRevocations</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns the revocation history of a consent grant.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.fdx.get_consent_revocation(consent_id: "consentId")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**consent_id:** `String` — Unique identifier of the consent grant.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Fdx::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.fdx.<a href="/lib/plaid/fdx/client.rb">revoke_consent</a>(consent_id:, request) -> </code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Revokes a consent grant, ending the data recipient's ongoing access to the customer's data.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.fdx.revoke_consent(
  consent_id: "consentId",
  initiator: "DATA_ACCESS_PLATFORM",
  reason: "BUSINESS_RULE"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**consent_id:** `String` — Unique identifier of the consent grant.
    
</dd>
</dl>

<dl>
<dd>

**initiator:** `Plaid::Types::FdxPartyType` 
    
</dd>
</dl>

<dl>
<dd>

**reason:** `Plaid::Types::FdxUpdateReason` 
    
</dd>
</dl>

<dl>
<dd>

**other_reason:** `String` — Additional information or description of an `OTHER` reason
    
</dd>
</dl>

<dl>
<dd>

**updated_time:** `String` — When the revocation was effected on the initiator's side
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Fdx::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.fdx.<a href="/lib/plaid/fdx/client.rb">get_consent</a>(consent_id:) -> Plaid::Types::FdxConsentGrant</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a consent grant by its identifier.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.fdx.get_consent(consent_id: "consentId")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**consent_id:** `String` — Unique identifier of the consent grant.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Fdx::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.fdx.<a href="/lib/plaid/fdx/client.rb">get_recipient</a>(recipient_id:) -> Plaid::Types::GetRecipientResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns metadata for a single recipient (application), identified by `recipientId`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.fdx.get_recipient(recipient_id: "recipientId")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**recipient_id:** `String` — The recipient's (application's) identifier (a UUID), as returned by `/fdx/recipients`.
    
</dd>
</dl>

<dl>
<dd>

**oauth_state_id:** `String` — Optional. If this lookup happens during an active OAuth flow, pass the value of the OAuth `state` parameter to help Plaid correlate this request in logs.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Fdx::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## BankTransfer Event
<details><summary><code>client.bank_transfer.event.<a href="/lib/plaid/bank_transfer/event/client.rb">list</a>(request) -> Plaid::Internal::OffsetItemIterator</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use the `/bank_transfer/event/list` endpoint to get a list of Plaid-initiated ACH or bank transfer events based on specified filter criteria. When using Auth with micro-deposit verification enabled, this endpoint can be used to fetch status updates on ACH micro-deposits. For more details, see [micro-deposit events](https://plaid.com/docs/auth/coverage/microdeposit-events/).

Returns a `Plaid::Internal::OffsetItemIterator` that yields each `Plaid::Types::BankTransferEvent` in the `bank_transfer_events` field of every page, requesting pages as they are needed. Call `pages` on it to get each page as a `Plaid::Types::BankTransferEventListResponse`, including its other fields.

No request is sent by this call. The first page is requested when you start iterating (or call `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.bank_transfer.event.list
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**start_date:** `String` — The start datetime of bank transfers to list. This should be in RFC 3339 format (i.e. `2019-12-06T22:35:49Z`)
    
</dd>
</dl>

<dl>
<dd>

**end_date:** `String` — The end datetime of bank transfers to list. This should be in RFC 3339 format (i.e. `2019-12-06T22:35:49Z`)
    
</dd>
</dl>

<dl>
<dd>

**bank_transfer_id:** `String` — Plaid's unique identifier for a bank transfer.
    
</dd>
</dl>

<dl>
<dd>

**account_id:** `String` — The account ID to get events for all transactions to/from an account.
    
</dd>
</dl>

<dl>
<dd>

**bank_transfer_type:** `Plaid::Types::BankTransferEventListBankTransferType` 
    
</dd>
</dl>

<dl>
<dd>

**event_types:** `Internal::Types::Array[Plaid::Types::BankTransferEventType]` — Filter events by event type.
    
</dd>
</dl>

<dl>
<dd>

**count:** `Integer` — The maximum number of bank transfer events to return. If the number of events matching the above parameters is greater than `count`, the most recent events will be returned.
    
</dd>
</dl>

<dl>
<dd>

**offset:** `Integer` — The offset into the list of bank transfer events. When `count`=25 and `offset`=0, the first 25 events will be returned. When `count`=25 and `offset`=25, the next 25 bank transfer events will be returned.
    
</dd>
</dl>

<dl>
<dd>

**origination_account_id:** `String` — The origination account ID to get events for transfers from a specific origination account.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `Plaid::Types::BankTransferEventListDirection` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::BankTransfer::Event::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.bank_transfer.event.<a href="/lib/plaid/bank_transfer/event/client.rb">sync</a>(request) -> Plaid::Types::BankTransferEventSyncResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

`/bank_transfer/event/sync` allows you to request up to the next 25 Plaid-initiated bank transfer events that happened after a specific `event_id`. When using Auth with micro-deposit verification enabled, this endpoint can be used to fetch status updates on ACH micro-deposits. For more details, see [micro-deposit events](https://plaid.com/docs/auth/coverage/microdeposit-events/).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.bank_transfer.event.sync(after_id: 1)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**after_id:** `Integer` — The latest (largest) `event_id` fetched via the sync endpoint, or 0 initially.
    
</dd>
</dl>

<dl>
<dd>

**count:** `Integer` — The maximum number of bank transfer events to return.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::BankTransfer::Event::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## BankTransfer Sweep
<details><summary><code>client.bank_transfer.sweep.<a href="/lib/plaid/bank_transfer/sweep/client.rb">get</a>(request) -> Plaid::Types::BankTransferSweepGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/bank_transfer/sweep/get` endpoint fetches information about the sweep corresponding to the given `sweep_id`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.bank_transfer.sweep.get(sweep_id: "sweep_id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**sweep_id:** `String` — Identifier of the sweep.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::BankTransfer::Sweep::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.bank_transfer.sweep.<a href="/lib/plaid/bank_transfer/sweep/client.rb">list</a>(request) -> Plaid::Types::BankTransferSweepListResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/bank_transfer/sweep/list` endpoint fetches information about the sweeps matching the given filters.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.bank_transfer.sweep.list
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**origination_account_id:** `String` — If multiple origination accounts are available, `origination_account_id` must be used to specify the account that the sweeps belong to.
    
</dd>
</dl>

<dl>
<dd>

**start_time:** `String` — The start `created` datetime of sweeps to return (RFC 3339 format).
    
</dd>
</dl>

<dl>
<dd>

**end_time:** `String` — The end `created` datetime of sweeps to return (RFC 3339 format).
    
</dd>
</dl>

<dl>
<dd>

**count:** `Integer` — The maximum number of sweeps to return.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::BankTransfer::Sweep::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## BankTransfer Balance
<details><summary><code>client.bank_transfer.balance.<a href="/lib/plaid/bank_transfer/balance/client.rb">get</a>(request) -> Plaid::Types::BankTransferBalanceGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use the `/bank_transfer/balance/get` endpoint to see the available balance in your bank transfer account. Debit transfers increase this balance once their status is posted. Credit transfers decrease this balance when they are created.

The transactable balance shows the amount in your account that you are able to use for transfers, and is essentially your available balance minus your minimum balance.

Note that this endpoint can only be used with FBO accounts, when using Bank Transfers in the Full Service configuration. It cannot be used on your own account when using Bank Transfers in the BTS Platform configuration.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.bank_transfer.balance.get
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**origination_account_id:** `String` — If multiple origination accounts are available, `origination_account_id` must be used to specify the account for which balance will be returned.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::BankTransfer::Balance::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## BeaconReport Syndication
<details><summary><code>client.beacon_report.syndication.<a href="/lib/plaid/beacon_report/syndication/client.rb">list</a>(request) -> Plaid::Internal::CursorItemIterator</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use the `/beacon/report_syndication/list` endpoint to view all Beacon Reports that have been syndicated to a specific Beacon User. This endpoint returns Beacon Report Syndications which are references to Beacon Reports created either by you, or another Beacon customer, that matched the specified Beacon User. A Beacon User can have multiple active Beacon Report Syndications at once. The results from this endpoint are paginated; the `next_cursor` field will be populated if there is another page of results that can be retrieved. To fetch the next page, pass the `next_cursor` value as the `cursor` parameter in the next request.

Returns a `Plaid::Internal::CursorItemIterator` that yields each `Plaid::Types::BeaconReportSyndication` in the `beacon_report_syndications` field of every page, requesting pages as they are needed. Call `pages` on it to get each page as a `Plaid::Types::BeaconReportSyndicationListResponse`, including its other fields.

No request is sent by this call. The first page is requested when you start iterating (or call `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.beacon_report.syndication.list(beacon_user_id: "becusr_42cF1MNo42r9Xj")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**beacon_user_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::BeaconReport::Syndication::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.beacon_report.syndication.<a href="/lib/plaid/beacon_report/syndication/client.rb">get</a>(request) -> Plaid::Types::BeaconReportSyndicationGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a Beacon Report Syndication for a given Beacon Report Syndication id.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.beacon_report.syndication.get(beacon_report_syndication_id: "becrsn_11111111111111")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**beacon_report_syndication_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::BeaconReport::Syndication::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Credit Profile
<details><summary><code>client.credit.profile.<a href="/lib/plaid/credit/profile/client.rb">get_report</a>(request) -> Plaid::Types::CraCreditProfileReportGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

`/cra/credit_profile/report/get` retrieves a credit profile report for a user.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.credit.profile.get_report(
  user_id: "user_id",
  consumer_report_permissible_purpose: "ACCOUNT_REVIEW_CREDIT",
  client_report_id: "client_report_id",
  report_type: "QUALIFY",
  inquiry_type: "SOFT_INQUIRY",
  version: "v1"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**user_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**consumer_report_permissible_purpose:** `Plaid::Types::ConsumerReportPermissiblePurpose` 
    
</dd>
</dl>

<dl>
<dd>

**client_report_id:** `String` — Client-generated identifier, which can be used by lenders to track loan applications.
    
</dd>
</dl>

<dl>
<dd>

**report_type:** `Plaid::Types::CraCreditProfileReportType` 
    
</dd>
</dl>

<dl>
<dd>

**inquiry_type:** `Plaid::Types::CraCreditProfileInquiryType` 
    
</dd>
</dl>

<dl>
<dd>

**version:** `Plaid::Types::CraCreditProfileReportVersion` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Credit::Profile::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Identity Verification
<details><summary><code>client.identity.verification.<a href="/lib/plaid/identity/verification/client.rb">create</a>(request) -> Plaid::Types::IdentityVerificationCreateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a new Identity Verification for the user specified by the `client_user_id` and/or `user_id` field. At least one of these two fields must be provided. The requirements and behavior of the verification are determined by the `template_id` provided. If `user_id` is provided, there must be an associated user; otherwise, an error will be returned.


If you don't know whether an active Identity Verification exists for a given `client_user_id` and/or `user_id`, you can specify `"is_idempotent": true` in the request body. With idempotency enabled, a new Identity Verification will only be created if one does not already exist for the associated `client_user_id` and/or `user_id`, and `template_id`. If an Identity Verification is found, it will be returned unmodified with a `200 OK` HTTP status code.


If `user_id` is not provided, you can also use this endpoint to supply information you already have collected about the user; if any of these fields are specified, the screens prompting the user to enter them will be skipped during the Link flow. If `user_id` is provided, user information can not be included in the request body. Please use the `/user/update` endpoint to update user data instead.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.identity.verification.create(
  is_shareable: true,
  template_id: "idvtmp_4FrXJvfQU3zGUR",
  gave_consent: true
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**client_user_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**user_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**is_shareable:** `Internal::Types::Boolean` — A flag specifying whether you would like Plaid to expose a shareable URL for the verification being created.
    
</dd>
</dl>

<dl>
<dd>

**template_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**language:** `Plaid::Types::IdentityVerificationLanguage` 
    
</dd>
</dl>

<dl>
<dd>

**gave_consent:** `Internal::Types::Boolean` 
    
</dd>
</dl>

<dl>
<dd>

**user:** `Plaid::Types::IdentityVerificationCreateRequestUser` 
    
</dd>
</dl>

<dl>
<dd>

**is_idempotent:** `Internal::Types::Boolean` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Identity::Verification::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.identity.verification.<a href="/lib/plaid/identity/verification/client.rb">get</a>(request) -> Plaid::Types::IdentityVerificationGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve a previously created Identity Verification.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.identity.verification.get(identity_verification_id: "idv_52xR9LKo77r1Np")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**identity_verification_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Identity::Verification::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.identity.verification.<a href="/lib/plaid/identity/verification/client.rb">list</a>(request) -> Plaid::Internal::CursorItemIterator</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Filter and list Identity Verifications created by your account

Returns a `Plaid::Internal::CursorItemIterator` that yields each `Plaid::Types::IdentityVerification` in the `identity_verifications` field of every page, requesting pages as they are needed. Call `pages` on it to get each page as a `Plaid::Types::IdentityVerificationListResponse`, including its other fields.

No request is sent by this call. The first page is requested when you start iterating (or call `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.identity.verification.list(template_id: "idvtmp_4FrXJvfQU3zGUR")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**template_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**client_user_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**user_id:** `String` — A unique user identifier, created by calling `/user/create`. Either a `user_id` or the `client_user_id` must be provided. The `user_id` may only be used instead of the `client_user_id` if you were not a pre-existing user of `/user/create` as of December 10, 2025, or if you have since [migrated to the new User APIs](https://plaid.com/docs/api/users/migrate-to-new-user-apis); for more details, see [New User APIs](https://plaid.com/docs/api/users/user-apis). If both this field and the `client_user_id` are present in the request, the `user_id` must have been created from the provided `client_user_id`.
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Identity::Verification::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.identity.verification.<a href="/lib/plaid/identity/verification/client.rb">retry_</a>(request) -> Plaid::Types::IdentityVerificationRetryResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Allow a customer to retry their Identity Verification
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.identity.verification.retry_(
  client_user_id: "your-db-id-3b24110",
  template_id: "idvtmp_4FrXJvfQU3zGUR",
  strategy: "reset"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**client_user_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**template_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**strategy:** `Plaid::Types::Strategy` 
    
</dd>
</dl>

<dl>
<dd>

**user:** `Plaid::Types::IdentityVerificationRequestUser` 
    
</dd>
</dl>

<dl>
<dd>

**steps:** `Plaid::Types::IdentityVerificationRetryRequestStepsObject` 
    
</dd>
</dl>

<dl>
<dd>

**is_shareable:** `Internal::Types::Boolean` — A flag specifying whether you would like Plaid to expose a shareable URL for the verification being retried. If a value for this flag is not specified, the `is_shareable` setting from the original verification attempt will be used.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Identity::Verification::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.identity.verification.<a href="/lib/plaid/identity/verification/client.rb">create_autofill</a>(request) -> Plaid::Types::IdentityVerificationAutofillCreateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Try to autofill an Identity Verification based on the provided phone number, date of birth and country of residence.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.identity.verification.create_autofill(identity_verification_id: "flwses_42cF1MNo42r9Xj")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**identity_verification_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Identity::Verification::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Partner Insights
<details><summary><code>client.partner.insights.<a href="/lib/plaid/partner/insights/client.rb">get</a>(request) -> Plaid::Types::CraPartnerInsightsGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

`/cra/partner_insights/get` returns cash flow insights for a specified user.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.partner.insights.get(user_token: "user_token")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**user_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**user_tier:** `Plaid::Types::CraUserTier` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Partner::Insights::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Processor Signal
<details><summary><code>client.processor.signal.<a href="/lib/plaid/processor/signal/client.rb">evaluate</a>(request) -> Plaid::Types::ProcessorSignalEvaluateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use `/processor/signal/evaluate` to evaluate a planned ACH transaction to get a return risk assessment and additional risk signals.

`/processor/signal/evaluate` uses Rulesets that are configured on the end customer's Dashboard and can be used with either the Signal Transaction Scores product or the Balance product. Which product is used will be determined by the `ruleset_key` that you provide. Note that only customer-configured rulesets work with this endpoint; as a processor partner, you cannot create or configure your own rulesets. For more details, see [Signal Rules](https://plaid.com/docs/signal/signal-rules/).

Note: This request may have higher latency if Signal Transaction Scores is being added to an existing Item for the first time, or when using a Balance-only ruleset. This is because Plaid must communicate directly with the institution to request data.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.processor.signal.evaluate(
  processor_token: "processor_token",
  client_transaction_id: "client_transaction_id",
  amount: 1.1
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**processor_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**client_transaction_id:** `String` — The unique ID that you would like to use to refer to this transaction. For your convenience mapping your internal data, you could use your internal ID/identifier for this transaction. The max length for this field is 36 characters.
    
</dd>
</dl>

<dl>
<dd>

**amount:** `Float` — The transaction amount, in USD (e.g. `102.05`)
    
</dd>
</dl>

<dl>
<dd>

**user_present:** `Internal::Types::Boolean` — `true` if the end user is present while initiating the ACH transfer and the endpoint is being called; `false` otherwise (for example, when the ACH transfer is scheduled and the end user is not present, or you call this endpoint after the ACH transfer but before submitting the Nacha file for ACH processing).
    
</dd>
</dl>

<dl>
<dd>

**client_user_id:** `String` — A unique ID that identifies the end user in your system. This ID is used to correlate requests by a user with multiple Items. Personally identifiable information, such as an email address or phone number, should not be used in the `client_user_id`.
    
</dd>
</dl>

<dl>
<dd>

**is_recurring:** `Internal::Types::Boolean` — **true** if the ACH transaction is a recurring transaction; **false** otherwise.
    
</dd>
</dl>

<dl>
<dd>

**default_payment_method:** `String` 

The default ACH payment method to complete the transaction.

`SAME_DAY_ACH`: Same Day ACH by Nacha. The debit transaction is processed and settled on the same day.

`STANDARD_ACH`: Standard ACH by Nacha.

`MULTIPLE_PAYMENT_METHODS`: If there is no default debit rail or there are multiple payment methods.

Possible values:  `SAME_DAY_ACH`, `STANDARD_ACH`, `MULTIPLE_PAYMENT_METHODS`
    
</dd>
</dl>

<dl>
<dd>

**user:** `Plaid::Types::SignalUser` 
    
</dd>
</dl>

<dl>
<dd>

**device:** `Plaid::Types::SignalDevice` 
    
</dd>
</dl>

<dl>
<dd>

**ruleset_key:** `String` — The key of the ruleset to use for this transaction. You can configure a ruleset using the Plaid Dashboard, under [Signal->Rules](https://dashboard.plaid.com/signal/risk-profiles). If not provided, for customers who began using Signal Transaction Scores before October 15, 2025, by default, no ruleset will be used; for customers who began using Signal Transaction Scores after that date, or for Balance customers, the `default` ruleset will be used. For more details, or to opt out of using a ruleset, see [Signal Rules](https://plaid.com/docs/signal/signal-rules/).
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Processor::Signal::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.processor.signal.<a href="/lib/plaid/processor/signal/client.rb">report_decision</a>(request) -> Plaid::Types::ProcessorSignalDecisionReportResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

After you call `/processor/signal/evaluate`, Plaid will normally infer the outcome from your Signal Rules. However, if you are not using Signal Rules, if the Signal Rules outcome was `REVIEW`, or if you take a different action than the one determined by the Signal Rules, you will need to call `/processor/signal/decision/report`. This helps improve Signal Transaction Score accuracy for your account and is necessary for proper functioning of the rule performance and rule tuning capabilities in the Dashboard. If your effective decision changes after calling `/processor/signal/decision/report` (for example, you indicated that you accepted a transaction, but later on, your payment processor rejected it, so it was never initiated), call `/processor/signal/decision/report` again for the transaction to correct Plaid's records.

If you are using Plaid Transfer as your payment processor, you also do not need to call `/processor/signal/decision/report`, as Plaid can infer outcomes from your Transfer activity.

If using a Balance-only ruleset, this endpoint will not impact scores (Balance does not use scores), but is necessary to view accurate transaction outcomes and tune rule logic in the Dashboard.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.processor.signal.report_decision(
  processor_token: "processor_token",
  client_transaction_id: "client_transaction_id",
  initiated: true
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**processor_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**client_transaction_id:** `String` — Must be the same as the `client_transaction_id` supplied when calling `/processor/signal/evaluate`
    
</dd>
</dl>

<dl>
<dd>

**initiated:** `Internal::Types::Boolean` 

`true` if the ACH transaction was initiated, `false` otherwise.

This field must be returned as a boolean. If formatted incorrectly, this will result in an [`INVALID_FIELD`](https://plaid.com/docs/errors/invalid-request/#invalid_field) error.
    
</dd>
</dl>

<dl>
<dd>

**days_funds_on_hold:** `Integer` 

The actual number of days (hold time) since the ACH debit transaction that you wait before making funds available to your customers. The holding time could affect the ACH return rate.

For example, use 0 if you make funds available to your customers instantly or the same day following the debit transaction, or 1 if you make funds available the next day following the debit initialization.
    
</dd>
</dl>

<dl>
<dd>

**decision_outcome:** `Plaid::Types::SignalDecisionOutcome` 
    
</dd>
</dl>

<dl>
<dd>

**payment_method:** `Plaid::Types::SignalPaymentMethod` 
    
</dd>
</dl>

<dl>
<dd>

**amount_instantly_available:** `Float` — The amount (in USD) made available to your customers instantly following the debit transaction. It could be a partial amount of the requested transaction (example: 102.05).
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Processor::Signal::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.processor.signal.<a href="/lib/plaid/processor/signal/client.rb">report_return</a>(request) -> Plaid::Types::ProcessorSignalReturnReportResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Call the `/processor/signal/return/report` endpoint to report a returned transaction that was previously sent to the `/processor/signal/evaluate` endpoint. Your feedback will be used by the model to incorporate the latest risk trend in your portfolio.

If you are using the [Plaid Transfer product](https://plaid.com/docs/transfer) to create transfers, it is not necessary to use this endpoint, as Plaid already knows whether the transfer was returned.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.processor.signal.report_return(
  processor_token: "processor_token",
  client_transaction_id: "client_transaction_id",
  return_code: "return_code"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**processor_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**client_transaction_id:** `String` — Must be the same as the `client_transaction_id` supplied when calling `/processor/signal/evaluate`
    
</dd>
</dl>

<dl>
<dd>

**return_code:** `String` 

Must be a valid ACH return code (e.g. "R01")

If formatted incorrectly, this will result in an [`INVALID_FIELD`](https://plaid.com/docs/errors/invalid-request/#invalid_field) error.
    
</dd>
</dl>

<dl>
<dd>

**returned_at:** `String` — Date and time when you receive the returns from your payment processors, in ISO 8601 format (`YYYY-MM-DDTHH:mm:ssZ`).
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Processor::Signal::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.processor.signal.<a href="/lib/plaid/processor/signal/client.rb">prepare</a>(request) -> Plaid::Types::ProcessorSignalPrepareResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

When a processor token is not initialized with `signal`, call `/processor/signal/prepare` to opt-in that processor token to the data collection process, which will improve the accuracy of the Signal Transaction Score.

If this endpoint is called with a processor token that is already initialized with `signal`, it will return a 200 response and will not modify the processor token.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.processor.signal.prepare(processor_token: "processor_token")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**processor_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Processor::Signal::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Servicing Subscription
<details><summary><code>client.servicing.subscription.<a href="/lib/plaid/servicing/subscription/client.rb">create</a>(request) -> Plaid::Types::CraServicingSubscriptionCreateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

`/cra/servicing/subscription/create` subscribes a user to CRA report-update webhooks for a given scope.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.servicing.subscription.create(
  user_id: "user_id",
  scope: "PLAID_NETWORK",
  products: []
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**user_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**scope:** `Plaid::Types::CraReportScope` 
    
</dd>
</dl>

<dl>
<dd>

**cadence:** `Plaid::Types::CraSubscriptionCadence` 
    
</dd>
</dl>

<dl>
<dd>

**webhook:** `String` — The URL to which the webhook should be sent. If provided, this will override the URL set in the dashboard.
    
</dd>
</dl>

<dl>
<dd>

**products:** `Internal::Types::Array[Plaid::Types::CraSubscriptionProductConfig]` — The products included in this subscription.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Servicing::Subscription::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.servicing.subscription.<a href="/lib/plaid/servicing/subscription/client.rb">delete</a>(request) -> Plaid::Types::CraServicingSubscriptionDeleteResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

`/cra/servicing/subscription/delete` removes the CRA servicing subscription identified by `subscription_id`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.servicing.subscription.delete(subscription_id: "subscription_id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**subscription_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Servicing::Subscription::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.servicing.subscription.<a href="/lib/plaid/servicing/subscription/client.rb">get</a>(request) -> Plaid::Types::CraServicingSubscriptionGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

`/cra/servicing/subscription/get` returns the CRA servicing subscription identified by `subscription_id`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.servicing.subscription.get(subscription_id: "subscription_id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**subscription_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Servicing::Subscription::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.servicing.subscription.<a href="/lib/plaid/servicing/subscription/client.rb">list</a>(request) -> Plaid::Types::CraServicingSubscriptionListResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

`/cra/servicing/subscription/list` returns all CRA servicing subscriptions for a user, across scopes.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.servicing.subscription.list(user_id: "user_id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**user_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Servicing::Subscription::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.servicing.subscription.<a href="/lib/plaid/servicing/subscription/client.rb">update</a>(request) -> Plaid::Types::CraServicingSubscriptionUpdateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

`/cra/servicing/subscription/update` modifies an existing CRA servicing subscription. Fields left blank are unchanged; provided fields overwrite the current value. Use `reset_fields` to clear fields.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.servicing.subscription.update(subscription_id: "subscription_id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**subscription_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**webhook:** `String` — The URL to which the webhook should be sent. If provided, this will override the URL set in the dashboard.
    
</dd>
</dl>

<dl>
<dd>

**products:** `Internal::Types::Array[Plaid::Types::CraSubscriptionProductConfig]` — The products included in this subscription. If provided, this replaces the subscription's entire product list.
    
</dd>
</dl>

<dl>
<dd>

**reset_fields:** `Internal::Types::Array[Plaid::Types::CraServicingSubscriptionUpdateRequestResettableField]` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Servicing::Subscription::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Transfer Recurring
<details><summary><code>client.transfer.recurring.<a href="/lib/plaid/transfer/recurring/client.rb">get</a>(request) -> Plaid::Types::TransferRecurringGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/transfer/recurring/get` fetches information about the recurring transfer corresponding to the given `recurring_transfer_id`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.transfer.recurring.get(recurring_transfer_id: "recurring_transfer_id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**recurring_transfer_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Transfer::Recurring::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.transfer.recurring.<a href="/lib/plaid/transfer/recurring/client.rb">create</a>(request) -> Plaid::Types::TransferRecurringCreateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use the `/transfer/recurring/create` endpoint to initiate a new recurring transfer. This capability is not currently supported for Transfer UI or Transfer for Platforms (beta) customers.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.transfer.recurring.create(
  access_token: "access_token",
  idempotency_key: "idempotency_key",
  account_id: "account_id",
  type: "debit",
  network: "ach",
  amount: "amount",
  description: "description",
  schedule: {
    interval_unit: "week",
    interval_count: 1,
    interval_execution_day: 1,
    start_date: "2023-01-15"
  },
  user: {
    legal_name: "legal_name"
  }
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**access_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**account_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**funding_account_id:** `String` — Specify the account used to fund the transfer. Customers can find a list of `funding_account_id`s in the Accounts page of your Plaid Dashboard, under the "Account ID" column. If this field is left blank, it will default to the default `funding_account_id` specified during onboarding.
    
</dd>
</dl>

<dl>
<dd>

**type:** `Plaid::Types::TransferType` 
    
</dd>
</dl>

<dl>
<dd>

**network:** `Plaid::Types::TransferRecurringNetwork` 
    
</dd>
</dl>

<dl>
<dd>

**ach_class:** `Plaid::Types::AchClass` 
    
</dd>
</dl>

<dl>
<dd>

**amount:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**user_present:** `Internal::Types::Boolean` — If the end user is initiating the specific transfer themselves via an interactive UI, this should be `true`; for automatic recurring payments where the end user is not actually initiating each individual transfer, it should be `false`.
    
</dd>
</dl>

<dl>
<dd>

**iso_currency_code:** `String` — The currency of the transfer amount. The default value is "USD".
    
</dd>
</dl>

<dl>
<dd>

**description:** `String` — The description of the recurring transfer.
    
</dd>
</dl>

<dl>
<dd>

**test_clock_id:** `String` — Plaid's unique identifier for a test clock. This field may only be used when using the `sandbox` environment. If provided, the created `recurring_transfer` is associated with the `test_clock`. New originations are automatically generated when the associated `test_clock` advances. For more details, see [Simulating recurring transfers](https://plaid.com/docs/transfer/sandbox/#simulating-recurring-transfers).
    
</dd>
</dl>

<dl>
<dd>

**schedule:** `Plaid::Types::TransferRecurringSchedule` 
    
</dd>
</dl>

<dl>
<dd>

**user:** `Plaid::Types::TransferUserInRequest` 
    
</dd>
</dl>

<dl>
<dd>

**device:** `Plaid::Types::TransferDevice` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Transfer::Recurring::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.transfer.recurring.<a href="/lib/plaid/transfer/recurring/client.rb">list</a>(request) -> Plaid::Internal::OffsetItemIterator</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use the `/transfer/recurring/list` endpoint to see a list of all your recurring transfers and their statuses. Results are paginated; use the `count` and `offset` query parameters to retrieve the desired recurring transfers.

Returns a `Plaid::Internal::OffsetItemIterator` that yields each `Plaid::Types::RecurringTransfer` in the `recurring_transfers` field of every page, requesting pages as they are needed. Call `pages` on it to get each page as a `Plaid::Types::TransferRecurringListResponse`, including its other fields.

No request is sent by this call. The first page is requested when you start iterating (or call `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.transfer.recurring.list
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**start_time:** `String` — The start `created` datetime of recurring transfers to list. This should be in RFC 3339 format (i.e. `2019-12-06T22:35:49Z`)
    
</dd>
</dl>

<dl>
<dd>

**end_time:** `String` — The end `created` datetime of recurring transfers to list. This should be in RFC 3339 format (i.e. `2019-12-06T22:35:49Z`)
    
</dd>
</dl>

<dl>
<dd>

**count:** `Integer` — The maximum number of recurring transfers to return.
    
</dd>
</dl>

<dl>
<dd>

**offset:** `Integer` — The number of recurring transfers to skip before returning results.
    
</dd>
</dl>

<dl>
<dd>

**funding_account_id:** `String` — Filter recurring transfers to only those with the specified `funding_account_id`.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Transfer::Recurring::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.transfer.recurring.<a href="/lib/plaid/transfer/recurring/client.rb">cancel</a>(request) -> Plaid::Types::TransferRecurringCancelResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use the `/transfer/recurring/cancel` endpoint to cancel a recurring transfer.  A scheduled transfer that hasn't been submitted to the bank will be cancelled.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.transfer.recurring.cancel(recurring_transfer_id: "recurring_transfer_id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**recurring_transfer_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Transfer::Recurring::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Transfer Authorization
<details><summary><code>client.transfer.authorization.<a href="/lib/plaid/transfer/authorization/client.rb">create</a>(request) -> Plaid::Types::TransferAuthorizationCreateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use the `/transfer/authorization/create` endpoint to authorize a transfer. This endpoint must be called prior to calling `/transfer/create`. The transfer authorization will expire if not used after one hour. (You can contact your account manager to change the default authorization lifetime.)

There are four possible outcomes to calling this endpoint:

  - If the `authorization.decision` in the response is `declined`, the proposed transfer has failed the risk check and you cannot proceed with the transfer.

  - If the `authorization.decision` is `user_action_required`, additional user input is needed, usually to fix a broken bank connection, before Plaid can properly assess the risk. You need to launch Link in update mode to complete the required user action. When calling `/link/token/create` to get a new Link token, instead of providing `access_token` in the request, you should set [`transfer.authorization_id`](https://plaid.com/docs/api/link/#link-token-create-request-transfer-authorization-id) as the `authorization.id`. After the Link flow is completed, you may re-attempt the authorization.

  - If the `authorization.decision` is `approved`, and the `authorization.decision_rationale.code` is `null`, the transfer has passed the risk check and you can proceed to call `/transfer/create`.

  - If the `authorization.decision` is `approved` and the `authorization.decision_rationale.code` is non-`null`, the risk check could not be run: you may proceed with the transfer, but should perform your own risk evaluation. For more details, see the response schema.

In Plaid's Sandbox environment the decisions will be returned as follows:

  - To approve a transfer with `null` rationale code, make an authorization request with an `amount` less than the available balance in the account.

  - To approve a transfer with the rationale code `MANUALLY_VERIFIED_ITEM`, create an Item in Link through the [Same-Day Micro-deposits flow](https://plaid.com/docs/auth/coverage/testing/#testing-same-day-micro-deposits).

  - To get an authorization decision of `user_action_required`, [reset the login for an Item](https://plaid.com/docs/sandbox/#item_login_required).

  - To decline a transfer with the rationale code `NSF`, the available balance on the account must be less than the authorization `amount`. See [Create Sandbox test data](https://plaid.com/docs/sandbox/user-custom/) for details on how to customize data in Sandbox.

  - To decline a transfer with the rationale code `RISK`, the available balance on the account must be exactly $0. See [Create Sandbox test data](https://plaid.com/docs/sandbox/user-custom/) for details on how to customize data in Sandbox.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.transfer.authorization.create(
  access_token: "access_token",
  account_id: "account_id",
  type: "debit",
  network: "ach",
  amount: "amount",
  user: {
    legal_name: "legal_name"
  }
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**access_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**account_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**funding_account_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**ledger_id:** `String` — Specify which ledger balance should be used to fund the transfer. You can find a list of `ledger_id`s in the Accounts page of your Plaid Dashboard. If this field is left blank, this will default to the id of the default ledger balance.
    
</dd>
</dl>

<dl>
<dd>

**payment_profile_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**type:** `Plaid::Types::TransferType` 
    
</dd>
</dl>

<dl>
<dd>

**network:** `Plaid::Types::TransferNetwork` 
    
</dd>
</dl>

<dl>
<dd>

**amount:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**ach_class:** `Plaid::Types::AchClass` 
    
</dd>
</dl>

<dl>
<dd>

**wire_details:** `Plaid::Types::TransferWireDetails` 
    
</dd>
</dl>

<dl>
<dd>

**user:** `Plaid::Types::TransferAuthorizationUserInRequest` 
    
</dd>
</dl>

<dl>
<dd>

**user_id:** `String` — The Plaid-generated user ID returned by `/user/create` for the end user associated with this transfer's Item. This identifier is separate from the account-holder details in `user`. Omit or set to `null` if unavailable; otherwise, provide a non-empty string. This field does not currently affect authorization decisions.
    
</dd>
</dl>

<dl>
<dd>

**device:** `Plaid::Types::TransferAuthorizationDevice` 
    
</dd>
</dl>

<dl>
<dd>

**origination_account_id:** `String` — Plaid's unique identifier for the origination account for this authorization. If not specified, the default account will be used.
    
</dd>
</dl>

<dl>
<dd>

**iso_currency_code:** `String` — The currency of the transfer amount. The default value is "USD".
    
</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**user_present:** `Internal::Types::Boolean` — If the end user is initiating the specific transfer themselves via an interactive UI, this should be `true`; for automatic recurring payments where the end user is not actually initiating each individual transfer, it should be `false`. This field is not currently used and is present to support planned future functionality.
    
</dd>
</dl>

<dl>
<dd>

**with_guarantee:** `Internal::Types::Boolean` — If set to `false`, Plaid will not offer a `guarantee_decision` for this request (Guarantee customers only). This field is deprecated in favor of `guarantee`.
    
</dd>
</dl>

<dl>
<dd>

**request_guarantee:** `Internal::Types::Boolean` — Indicates whether the transfer should be evaluated for guarantee coverage. When set to `true`, Plaid assesses the transfer for guarantee coverage and returns a decision in the authorization response. When omitted or set to `false`, the authorization is evaluated without guarantee coverage.
    
</dd>
</dl>

<dl>
<dd>

**beacon_session_id:** `String` — The unique identifier returned by Plaid's [beacon](https://plaid.com/docs/transfer/guarantee/#using-a-beacon) when it is run on your webpage.
    
</dd>
</dl>

<dl>
<dd>

**originator_client_id:** `String` — The Plaid client ID that is the originator of this transfer. Only needed if creating transfers on behalf of another client as a [Platform customer](https://plaid.com/docs/transfer/application/#originators-vs-platforms).
    
</dd>
</dl>

<dl>
<dd>

**credit_funds_source:** `Plaid::Types::TransferCreditFundsSource` 
    
</dd>
</dl>

<dl>
<dd>

**test_clock_id:** `String` — Plaid's unique identifier for a test clock. This field may only be used when using `sandbox` environment. If provided, the `authorization` is created at the `virtual_time` on the provided test clock.
    
</dd>
</dl>

<dl>
<dd>

**ruleset_key:** `String` — The key of the Ruleset for the transaction. If not provided, Signal will use the `default` ruleset.
    
</dd>
</dl>

<dl>
<dd>

**custom_attributes:** `Internal::Types::Hash[String, String]` 
    
</dd>
</dl>

<dl>
<dd>

**user_attributes:** `Plaid::Types::TransferAuthorizationUserAttributes` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Transfer::Authorization::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.transfer.authorization.<a href="/lib/plaid/transfer/authorization/client.rb">cancel</a>(request) -> Plaid::Types::TransferAuthorizationCancelResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use the `/transfer/authorization/cancel` endpoint to cancel a transfer authorization. A transfer authorization is eligible for cancellation if it has not yet been used to create a transfer.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.transfer.authorization.cancel(authorization_id: "authorization_id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**authorization_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Transfer::Authorization::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Transfer Balance
<details><summary><code>client.transfer.balance.<a href="/lib/plaid/transfer/balance/client.rb">get</a>(request) -> Plaid::Types::TransferBalanceGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

(Deprecated) Use the `/transfer/ledger/get` endpoint to view a balance held with Plaid.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.transfer.balance.get
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**originator_client_id:** `String` — Client ID of the end customer.
    
</dd>
</dl>

<dl>
<dd>

**type:** `Plaid::Types::TransferBalanceType` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Transfer::Balance::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Transfer Capabilities
<details><summary><code>client.transfer.capabilities.<a href="/lib/plaid/transfer/capabilities/client.rb">get</a>(request) -> Plaid::Types::TransferCapabilitiesGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use the `/transfer/capabilities/get` endpoint to determine the RTP eligibility information of an account to be used with Transfer. This endpoint works on all Transfer-capable Items, including those created by `/transfer/migrate_account`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.transfer.capabilities.get(
  access_token: "access_token",
  account_id: "account_id"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**access_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**account_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**payment_profile_token:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Transfer::Capabilities::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Transfer Configuration
<details><summary><code>client.transfer.configuration.<a href="/lib/plaid/transfer/configuration/client.rb">get</a>(request) -> Plaid::Types::TransferConfigurationGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use the `/transfer/configuration/get` endpoint to view your transfer product configurations.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.transfer.configuration.get
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**originator_client_id:** `String` — The Plaid client ID of the transfer originator. Should only be present if `client_id` is a [Platform customer](https://plaid.com/docs/transfer/application/#originators-vs-platforms).
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Transfer::Configuration::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Transfer Ledger
<details><summary><code>client.transfer.ledger.<a href="/lib/plaid/transfer/ledger/client.rb">get</a>(request) -> Plaid::Types::TransferLedgerGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use the `/transfer/ledger/get` endpoint to view a balance on the ledger held with Plaid.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.transfer.ledger.get
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**ledger_id:** `String` — Specify which ledger balance to get. Customers can find a list of `ledger_id`s in the Accounts page of your Plaid Dashboard. If this field is left blank, this will default to the id of the default ledger balance.
    
</dd>
</dl>

<dl>
<dd>

**originator_client_id:** `String` — Client ID of the end customer.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Transfer::Ledger::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.transfer.ledger.<a href="/lib/plaid/transfer/ledger/client.rb">distribute</a>(request) -> Plaid::Types::TransferLedgerDistributeResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use the `/transfer/ledger/distribute` endpoint to move available balance between ledgers, if you have multiple. If you're a platform, you can move funds between one of your ledgers and one of your customer's ledgers.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.transfer.ledger.distribute(
  from_ledger_id: "from_ledger_id",
  to_ledger_id: "to_ledger_id",
  amount: "amount",
  idempotency_key: "idempotency_key"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**from_ledger_id:** `String` — The Ledger to pull money from.
    
</dd>
</dl>

<dl>
<dd>

**to_ledger_id:** `String` — The Ledger to credit money to.
    
</dd>
</dl>

<dl>
<dd>

**amount:** `String` — The amount to move (decimal string with two digits of precision e.g. "10.00"). Amount must be positive.
    
</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**description:** `String` — An optional description for the ledger distribute operation.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Transfer::Ledger::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.transfer.ledger.<a href="/lib/plaid/transfer/ledger/client.rb">deposit</a>(request) -> Plaid::Types::TransferLedgerDepositResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use the `/transfer/ledger/deposit` endpoint to deposit funds into Plaid Ledger.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.transfer.ledger.deposit(
  amount: "amount",
  idempotency_key: "idempotency_key",
  network: "ach"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**originator_client_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**funding_account_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**ledger_id:** `String` — Specify which ledger balance to deposit to. Customers can find a list of `ledger_id`s in the Accounts page of your Plaid Dashboard. If this field is left blank, this will default to the id of the default ledger balance.
    
</dd>
</dl>

<dl>
<dd>

**amount:** `String` — A positive amount of how much will be deposited into ledger (decimal string with two digits of precision e.g. "5.50").
    
</dd>
</dl>

<dl>
<dd>

**description:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**network:** `Plaid::Types::TransferAchNetwork` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Transfer::Ledger::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.transfer.ledger.<a href="/lib/plaid/transfer/ledger/client.rb">withdraw</a>(request) -> Plaid::Types::TransferLedgerWithdrawResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use the `/transfer/ledger/withdraw` endpoint to withdraw funds from a Plaid Ledger balance.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.transfer.ledger.withdraw(
  amount: "amount",
  idempotency_key: "idempotency_key",
  network: "ach"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**originator_client_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**funding_account_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**ledger_id:** `String` — Specify which ledger balance to withdraw from. Customers can find a list of `ledger_id`s in the Accounts page of your Plaid Dashboard. If this field is left blank, this will default to the id of the default ledger balance.
    
</dd>
</dl>

<dl>
<dd>

**amount:** `String` — A positive amount of how much will be withdrawn from the ledger balance (decimal string with two digits of precision e.g. "5.50").
    
</dd>
</dl>

<dl>
<dd>

**description:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**network:** `Plaid::Types::TransferNetwork` 

The network or rails used for the withdrawal: `ach` for Standard ACH or `same-day-ach` for Same Day ACH. The limit for a single Standard ACH withdrawal is $10,000,000, and the limit for a single Same Day ACH withdrawal is $1,000,000; withdrawals above the limit for their network will fail.

The Same Day ACH cutoff is 3:00 PM Eastern Time and the Standard ACH cutoff is 8:30 PM Eastern Time. If a `same-day-ach` withdrawal is submitted on a banking day after the Same Day ACH cutoff and before the Standard ACH cutoff, it may be downgraded to Standard ACH. Withdrawals submitted after the Standard ACH cutoff, or on a weekend or bank holiday, stay Same Day ACH and are submitted in the first Same Day ACH window of the next banking day. See [ACH processing windows](https://plaid.com/docs/transfer/creating-transfers/#ach-processing-windows).
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Transfer::Ledger::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.transfer.ledger.<a href="/lib/plaid/transfer/ledger/client.rb">list_events</a>(request) -> Plaid::Internal::OffsetItemIterator</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use the `/transfer/ledger/event/list` endpoint to get a list of ledger events for a specific ledger based on specified filter criteria.

Returns a `Plaid::Internal::OffsetItemIterator` that yields each `Plaid::Types::TransferLedgerEvent` in the `ledger_events` field of every page, requesting pages as they are needed. Call `pages` on it to get each page as a `Plaid::Types::TransferLedgerEventListResponse`, including its other fields.

No request is sent by this call. The first page is requested when you start iterating (or call `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.transfer.ledger.list_events
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**originator_client_id:** `String` — Filter transfer events to only those with the specified originator client. (This field is specifically for resellers. Caller's client ID will be used if this field is not specified.)
    
</dd>
</dl>

<dl>
<dd>

**start_date:** `String` — The start created datetime of transfers to list. This should be in RFC 3339 format (i.e. 2019-12-06T22:35:49Z)
    
</dd>
</dl>

<dl>
<dd>

**end_date:** `String` — The end created datetime of transfers to list. This should be in RFC 3339 format (i.e. 2019-12-06T22:35:49Z)
    
</dd>
</dl>

<dl>
<dd>

**ledger_id:** `String` — Plaid's unique identifier for a Plaid Ledger Balance.
    
</dd>
</dl>

<dl>
<dd>

**ledger_event_id:** `String` — Plaid's unique identifier for the ledger event.
    
</dd>
</dl>

<dl>
<dd>

**source_type:** `Plaid::Types::LedgerEventSourceType` 
    
</dd>
</dl>

<dl>
<dd>

**source_id:** `String` — Plaid's unique identifier for a transfer, sweep, or refund.
    
</dd>
</dl>

<dl>
<dd>

**count:** `Integer` — The maximum number of transfer events to return. If the number of events matching the above parameters is greater than `count`, the most recent events will be returned.
    
</dd>
</dl>

<dl>
<dd>

**offset:** `Integer` — The offset into the list of transfer events. When `count`=25 and `offset`=0, the first 25 events will be returned. When `count`=25 and `offset`=25, the next 25 events will be returned.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Transfer::Ledger::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Transfer Originator
<details><summary><code>client.transfer.originator.<a href="/lib/plaid/transfer/originator/client.rb">update_funding_account</a>(request) -> Plaid::Types::TransferOriginatorFundingAccountUpdateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use the `/transfer/originator/funding_account/update` endpoint to update the funding account associated with the originator.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.transfer.originator.update_funding_account(
  originator_client_id: "originator_client_id",
  funding_account: {
    access_token: "access_token",
    account_id: "account_id"
  }
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**originator_client_id:** `String` — The Plaid client ID of the transfer originator.
    
</dd>
</dl>

<dl>
<dd>

**funding_account:** `Plaid::Types::TransferFundingAccount` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Transfer::Originator::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.transfer.originator.<a href="/lib/plaid/transfer/originator/client.rb">create_funding_account</a>(request) -> Plaid::Types::TransferOriginatorFundingAccountCreateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use the `/transfer/originator/funding_account/create` endpoint to create a new funding account for the originator.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.transfer.originator.create_funding_account(
  originator_client_id: "originator_client_id",
  funding_account: {
    access_token: "access_token",
    account_id: "account_id"
  }
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**originator_client_id:** `String` — The Plaid client ID of the transfer originator.
    
</dd>
</dl>

<dl>
<dd>

**funding_account:** `Plaid::Types::TransferFundingAccountWithDisplayName` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Transfer::Originator::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.transfer.originator.<a href="/lib/plaid/transfer/originator/client.rb">create</a>(request) -> Plaid::Types::TransferOriginatorCreateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use the `/transfer/originator/create` endpoint to create a new originator and return an `originator_client_id`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.transfer.originator.create(company_name: "company_name")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**company_name:** `String` — The company name of the end customer being created. This will be displayed in public-facing surfaces, e.g. Plaid Dashboard.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Transfer::Originator::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.transfer.originator.<a href="/lib/plaid/transfer/originator/client.rb">get</a>(request) -> Plaid::Types::TransferOriginatorGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/transfer/originator/get` endpoint gets status updates for an originator's onboarding process. This information is also available via the Transfer page on the Plaid dashboard.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.transfer.originator.get(originator_client_id: "originator_client_id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**originator_client_id:** `String` — Client ID of the end customer (i.e. the originator).
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Transfer::Originator::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.transfer.originator.<a href="/lib/plaid/transfer/originator/client.rb">list</a>(request) -> Plaid::Internal::OffsetItemIterator</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/transfer/originator/list` endpoint gets status updates for all of your originators' onboarding. This information is also available via the Plaid dashboard.

Returns a `Plaid::Internal::OffsetItemIterator` that yields each `Plaid::Types::Originator` in the `originators` field of every page, requesting pages as they are needed. Call `pages` on it to get each page as a `Plaid::Types::TransferOriginatorListResponse`, including its other fields.

No request is sent by this call. The first page is requested when you start iterating (or call `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.transfer.originator.list
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**count:** `Integer` — The maximum number of originators to return.
    
</dd>
</dl>

<dl>
<dd>

**offset:** `Integer` — The number of originators to skip before returning results.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Transfer::Originator::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Transfer Metrics
<details><summary><code>client.transfer.metrics.<a href="/lib/plaid/transfer/metrics/client.rb">get</a>(request) -> Plaid::Types::TransferMetricsGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use the `/transfer/metrics/get` endpoint to view your transfer product usage metrics.

In the Sandbox environment, this endpoint returns static placeholder values rather than metrics computed from your Sandbox transfer activity.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.transfer.metrics.get
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**originator_client_id:** `String` — The Plaid client ID of the transfer originator. Should only be present if `client_id` is a [Platform customer](https://plaid.com/docs/transfer/application/#originators-vs-platforms).
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Transfer::Metrics::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Transfer Event
<details><summary><code>client.transfer.event.<a href="/lib/plaid/transfer/event/client.rb">list</a>(request) -> Plaid::Internal::OffsetItemIterator</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use the `/transfer/event/list` endpoint to get a list of transfer events based on specified filter criteria.

Returns a `Plaid::Internal::OffsetItemIterator` that yields each `Plaid::Types::TransferEvent` in the `transfer_events` field of every page, requesting pages as they are needed. Call `pages` on it to get each page as a `Plaid::Types::TransferEventListResponse`, including its other fields.

No request is sent by this call. The first page is requested when you start iterating (or call `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.transfer.event.list
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**start_date:** `String` — The start `created` datetime of transfers to list. This should be in RFC 3339 format (i.e. `2019-12-06T22:35:49Z`)
    
</dd>
</dl>

<dl>
<dd>

**end_date:** `String` — The end `created` datetime of transfers to list. This should be in RFC 3339 format (i.e. `2019-12-06T22:35:49Z`)
    
</dd>
</dl>

<dl>
<dd>

**transfer_id:** `String` — Plaid's unique identifier for a transfer.
    
</dd>
</dl>

<dl>
<dd>

**account_id:** `String` — The account ID to get events for all transactions to/from an account.
    
</dd>
</dl>

<dl>
<dd>

**transfer_type:** `Plaid::Types::TransferEventListTransferType` 
    
</dd>
</dl>

<dl>
<dd>

**event_types:** `Internal::Types::Array[Plaid::Types::TransferEventType]` — Filter events by event type.
    
</dd>
</dl>

<dl>
<dd>

**sweep_id:** `String` — Plaid's unique identifier for a sweep.
    
</dd>
</dl>

<dl>
<dd>

**count:** `Integer` — The maximum number of transfer events to return. If the number of events matching the above parameters is greater than `count`, the most recent events will be returned.
    
</dd>
</dl>

<dl>
<dd>

**offset:** `Integer` — The offset into the list of transfer events. When `count`=25 and `offset`=0, the first 25 events will be returned. When `count`=25 and `offset`=25, the next 25 events will be returned.
    
</dd>
</dl>

<dl>
<dd>

**origination_account_id:** `String` — The origination account ID to get events for transfers from a specific origination account.
    
</dd>
</dl>

<dl>
<dd>

**originator_client_id:** `String` — Filter transfer events to only those with the specified originator client.
    
</dd>
</dl>

<dl>
<dd>

**funding_account_id:** `String` — Filter transfer events to only those with the specified `funding_account_id`.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Transfer::Event::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.transfer.event.<a href="/lib/plaid/transfer/event/client.rb">sync</a>(request) -> Plaid::Types::TransferEventSyncResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

`/transfer/event/sync` allows you to request up to the next 500 transfer events that happened after a specific `event_id`. Use the `/transfer/event/sync` endpoint to guarantee you have seen all transfer events.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.transfer.event.sync(after_id: 1)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**after_id:** `Integer` — The latest (largest) `event_id` fetched via the sync endpoint, or 0 initially.
    
</dd>
</dl>

<dl>
<dd>

**count:** `Integer` — The maximum number of transfer events to return.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Transfer::Event::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Transfer Sweep
<details><summary><code>client.transfer.sweep.<a href="/lib/plaid/transfer/sweep/client.rb">get</a>(request) -> Plaid::Types::TransferSweepGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/transfer/sweep/get` endpoint fetches a sweep corresponding to the given `sweep_id`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.transfer.sweep.get(sweep_id: "sweep_id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**sweep_id:** `String` — Plaid's unique identifier for the sweep (UUID) or a shortened form consisting of the first 8 characters of the identifier (8-digit hexadecimal string).
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Transfer::Sweep::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.transfer.sweep.<a href="/lib/plaid/transfer/sweep/client.rb">list</a>(request) -> Plaid::Internal::OffsetItemIterator</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/transfer/sweep/list` endpoint fetches sweeps matching the given filters.

Returns a `Plaid::Internal::OffsetItemIterator` that yields each `Plaid::Types::TransferSweep` in the `sweeps` field of every page, requesting pages as they are needed. Call `pages` on it to get each page as a `Plaid::Types::TransferSweepListResponse`, including its other fields.

No request is sent by this call. The first page is requested when you start iterating (or call `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.transfer.sweep.list
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**start_date:** `String` — The start `created` datetime of sweeps to return (RFC 3339 format).
    
</dd>
</dl>

<dl>
<dd>

**end_date:** `String` — The end `created` datetime of sweeps to return (RFC 3339 format).
    
</dd>
</dl>

<dl>
<dd>

**count:** `Integer` — The maximum number of sweeps to return.
    
</dd>
</dl>

<dl>
<dd>

**offset:** `Integer` — The number of sweeps to skip before returning results.
    
</dd>
</dl>

<dl>
<dd>

**amount:** `String` — Filter sweeps to only those with the specified amount.
    
</dd>
</dl>

<dl>
<dd>

**status:** `Plaid::Types::SweepStatus` 
    
</dd>
</dl>

<dl>
<dd>

**originator_client_id:** `String` — Filter sweeps to only those with the specified originator client.
    
</dd>
</dl>

<dl>
<dd>

**funding_account_id:** `String` — Filter sweeps to only those with the specified `funding_account_id`.
    
</dd>
</dl>

<dl>
<dd>

**transfer_id:** `String` — Filter sweeps to only those with the included `transfer_id`.
    
</dd>
</dl>

<dl>
<dd>

**trigger:** `Plaid::Types::SweepTrigger` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Transfer::Sweep::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Transfer Intent
<details><summary><code>client.transfer.intent.<a href="/lib/plaid/transfer/intent/client.rb">create</a>(request) -> Plaid::Types::TransferIntentCreateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use the `/transfer/intent/create` endpoint to generate a transfer intent object and invoke the Transfer UI.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.transfer.intent.create(
  mode: "PAYMENT",
  amount: "amount",
  description: "description",
  user: {
    legal_name: "legal_name"
  }
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**account_id:** `String` — The Plaid `account_id` corresponding to the end-user account that will be debited or credited.
    
</dd>
</dl>

<dl>
<dd>

**funding_account_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**mode:** `Plaid::Types::TransferIntentCreateMode` 
    
</dd>
</dl>

<dl>
<dd>

**network:** `Plaid::Types::TransferIntentCreateNetwork` 
    
</dd>
</dl>

<dl>
<dd>

**amount:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**description:** `String` — A description for the underlying transfer. Maximum of 15 characters.
    
</dd>
</dl>

<dl>
<dd>

**ach_class:** `Plaid::Types::AchClass` 
    
</dd>
</dl>

<dl>
<dd>

**origination_account_id:** `String` — Plaid's unique identifier for the origination account for the intent. If not provided, the default account will be used.
    
</dd>
</dl>

<dl>
<dd>

**user:** `Plaid::Types::TransferUserInRequest` 
    
</dd>
</dl>

<dl>
<dd>

**metadata:** `Internal::Types::Hash[String, String]` 
    
</dd>
</dl>

<dl>
<dd>

**iso_currency_code:** `String` — The currency of the transfer amount, e.g. "USD"
    
</dd>
</dl>

<dl>
<dd>

**require_guarantee:** `Internal::Types::Boolean` — When `true`, the transfer requires a `GUARANTEED` decision by Plaid to proceed (Guarantee customers only).
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Transfer::Intent::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.transfer.intent.<a href="/lib/plaid/transfer/intent/client.rb">get</a>(request) -> Plaid::Types::TransferIntentGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use the `/transfer/intent/get` endpoint to retrieve more information about a transfer intent.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.transfer.intent.get(transfer_intent_id: "transfer_intent_id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**transfer_intent_id:** `String` — Plaid's unique identifier for a transfer intent object.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Transfer::Intent::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Transfer Repayment
<details><summary><code>client.transfer.repayment.<a href="/lib/plaid/transfer/repayment/client.rb">list</a>(request) -> Plaid::Internal::OffsetItemIterator</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/transfer/repayment/list` endpoint fetches repayments matching the given filters. Repayments are returned in reverse-chronological order (most recent first) starting at the given `start_date`.

Returns a `Plaid::Internal::OffsetItemIterator` that yields each `Plaid::Types::TransferRepayment` in the `repayments` field of every page, requesting pages as they are needed. Call `pages` on it to get each page as a `Plaid::Types::TransferRepaymentListResponse`, including its other fields.

No request is sent by this call. The first page is requested when you start iterating (or call `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.transfer.repayment.list(
  start_date: "2022-01-10T12:34:56Z",
  count: 1
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**start_date:** `String` — The start `created` datetime of repayments to return (RFC 3339 format).
    
</dd>
</dl>

<dl>
<dd>

**end_date:** `String` — The end `created` datetime of repayments to return (RFC 3339 format).
    
</dd>
</dl>

<dl>
<dd>

**count:** `Integer` — The maximum number of repayments to return.
    
</dd>
</dl>

<dl>
<dd>

**offset:** `Integer` — The number of repayments to skip before returning results.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Transfer::Repayment::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.transfer.repayment.<a href="/lib/plaid/transfer/repayment/client.rb">list_returns</a>(request) -> Plaid::Internal::OffsetItemIterator</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/transfer/repayment/return/list` endpoint retrieves the set of returns that were batched together into the specified repayment. The sum of amounts of returns retrieved by this request equals the amount of the repayment.

Returns a `Plaid::Internal::OffsetItemIterator` that yields each `Plaid::Types::TransferRepaymentReturn` in the `repayment_returns` field of every page, requesting pages as they are needed. Call `pages` on it to get each page as a `Plaid::Types::TransferRepaymentReturnListResponse`, including its other fields.

No request is sent by this call. The first page is requested when you start iterating (or call `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.transfer.repayment.list_returns(
  repayment_id: "d4bfce70-2470-4298-ae87-5e9b3e18bfaf",
  count: 1
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**repayment_id:** `String` — Identifier of the repayment to query.
    
</dd>
</dl>

<dl>
<dd>

**count:** `Integer` — The maximum number of repayments to return.
    
</dd>
</dl>

<dl>
<dd>

**offset:** `Integer` — The number of repayments to skip before returning results.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Transfer::Repayment::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Transfer Platform
<details><summary><code>client.transfer.platform.<a href="/lib/plaid/transfer/platform/client.rb">submit_requirement</a>(request) -> Plaid::Types::TransferPlatformRequirementSubmitResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use the `/transfer/platform/requirement/submit` endpoint to submit additional onboarding information that is needed by Plaid to approve or decline the originator. See [Requirement type schema documentation](https://docs.google.com/document/d/1NEQkTD0sVK50iAQi6xHigrexDUxZ4QxXqSEfV_FFTiU/) for a list of requirement types and possible values.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.transfer.platform.submit_requirement(
  originator_client_id: "originator_client_id",
  requirement_submissions: [{
    requirement_type: "requirement_type",
    value: "value"
  }]
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**originator_client_id:** `String` — The client ID of the originator
    
</dd>
</dl>

<dl>
<dd>

**requirement_submissions:** `Internal::Types::Array[Plaid::Types::TransferPlatformRequirementSubmission]` — Use the `/transfer/platform/requirement/submit` endpoint to submit a list of requirement submissions that all relate to the originator. Must contain between 1 and 50 requirement submissions. See [Requirement type schema documentation](https://docs.google.com/document/d/1NEQkTD0sVK50iAQi6xHigrexDUxZ4QxXqSEfV_FFTiU/) for a list of requirements and possible values.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Transfer::Platform::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.transfer.platform.<a href="/lib/plaid/transfer/platform/client.rb">create_originator</a>(request) -> Plaid::Types::TransferPlatformOriginatorCreateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use the `/transfer/platform/originator/create` endpoint to submit information about the originator you are onboarding, including the originator's agreement to the required legal terms.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.transfer.platform.create_originator(
  originator_client_id: "originator_client_id",
  tos_acceptance_metadata: {
    agreement_accepted: true,
    originator_ip_address: "originator_ip_address",
    agreement_accepted_at: "2024-01-15T09:30:00Z"
  },
  originator_reviewed_at: "2024-01-15T09:30:00Z"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**originator_client_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**tos_acceptance_metadata:** `Plaid::Types::TransferPlatformTosAcceptanceMetadata` 
    
</dd>
</dl>

<dl>
<dd>

**originator_reviewed_at:** `String` — ISO8601 timestamp indicating the most recent time the platform collected onboarding data from the originator
    
</dd>
</dl>

<dl>
<dd>

**webhook:** `String` — The webhook URL to which a `PLATFORM_ONBOARDING_UPDATE` webhook should be sent.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Transfer::Platform::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.transfer.platform.<a href="/lib/plaid/transfer/platform/client.rb">create_person</a>(request) -> Plaid::Types::TransferPlatformPersonCreateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use the `/transfer/platform/person/create` endpoint to create a person associated with an originator (e.g. beneficial owner or control person) and optionally submit personal identification information for them.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.transfer.platform.create_person(originator_client_id: "originator_client_id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**originator_client_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**name:** `Plaid::Types::TransferPlatformPersonName` 
    
</dd>
</dl>

<dl>
<dd>

**email_address:** `String` — A valid email address. Must not have leading or trailing spaces.
    
</dd>
</dl>

<dl>
<dd>

**phone_number:** `String` — A valid phone number in E.164 format. Phone number input may be validated against valid number ranges; number strings that do not match a real-world phone numbering scheme may cause the request to fail, even in the Sandbox test environment.
    
</dd>
</dl>

<dl>
<dd>

**address:** `Plaid::Types::TransferPlatformPersonAddress` 
    
</dd>
</dl>

<dl>
<dd>

**id_number:** `Plaid::Types::TransferPlatformPersonIDNumber` 
    
</dd>
</dl>

<dl>
<dd>

**date_of_birth:** `String` — The date of birth of the person. Formatted as YYYY-MM-DD.
    
</dd>
</dl>

<dl>
<dd>

**relationship_to_originator:** `String` — The relationship between this person and the originator they are related to.
    
</dd>
</dl>

<dl>
<dd>

**ownership_percentage:** `Integer` — The percentage of ownership this person has in the onboarding business. Only applicable to beneficial owners with 25% or more ownership.
    
</dd>
</dl>

<dl>
<dd>

**title:** `String` — The title of the person at the business. Only applicable to control persons - for example, "CEO", "President", "Owner", etc.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Transfer::Platform::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Transfer Questionnaire
<details><summary><code>client.transfer.questionnaire.<a href="/lib/plaid/transfer/questionnaire/client.rb">create</a>(request) -> Plaid::Types::TransferQuestionnaireCreateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/transfer/questionnaire/create` endpoint generates a Plaid-hosted onboarding UI URL. Redirect the originator to this URL to provide their due diligence information and agree to Plaid's terms for ACH money movement.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.transfer.questionnaire.create(
  originator_client_id: "originator_client_id",
  redirect_uri: "redirect_uri"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**originator_client_id:** `String` — Client ID of the end customer.
    
</dd>
</dl>

<dl>
<dd>

**redirect_uri:** `String` — URL the end customer will be redirected to after completing questions in Plaid-hosted onboarding flow.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Transfer::Questionnaire::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Transfer Diligence
<details><summary><code>client.transfer.diligence.<a href="/lib/plaid/transfer/diligence/client.rb">submit</a>(request) -> Plaid::Types::TransferDiligenceSubmitResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use the `/transfer/diligence/submit` endpoint to submit transfer diligence on behalf of the originator (i.e., the end customer).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.transfer.diligence.submit(
  originator_client_id: "originator_client_id",
  originator_diligence: {
    dba: "dba",
    tax_id: "tax_id",
    address: {
      city: "city",
      street: "street",
      region: "region",
      postal_code: "postal_code",
      country_code: "country_code"
    },
    website: "website",
    naics_code: "naics_code",
    funding_account: {
      access_token: "access_token",
      account_id: "account_id"
    }
  }
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**originator_client_id:** `String` — Client ID of the originator whose diligence that you want to submit.
    
</dd>
</dl>

<dl>
<dd>

**originator_diligence:** `Plaid::Types::TransferOriginatorDiligence` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Transfer::Diligence::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.transfer.diligence.<a href="/lib/plaid/transfer/diligence/client.rb">upload_document</a>(request) -> Plaid::Types::TransferDiligenceDocumentUploadResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Third-party sender customers can use the `/transfer/diligence/document/upload` endpoint to upload a document on behalf of their end customer (i.e. originator) to Plaid. You'll need to send a request of type `multipart/form-data`.
You must provide the `client_id` in the `PLAID-CLIENT-ID` header and `secret` in the `PLAID-SECRET` header.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.transfer.diligence.upload_document(
  originator_client_id: "originator_client_id",
  file: "/path/to/your/file",
  purpose: "DUE_DILIGENCE"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request_options:** `Plaid::Transfer::Diligence::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Transfer Refund
<details><summary><code>client.transfer.refund.<a href="/lib/plaid/transfer/refund/client.rb">create</a>(request) -> Plaid::Types::TransferRefundCreateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use the `/transfer/refund/create` endpoint to create a refund for a transfer. A transfer can be refunded if the transfer was initiated in the past 180 days.

Refunds come out of the available balance of the ledger used for the original debit transfer. If there are not enough funds in the available balance to cover the refund amount, the refund will be rejected. Plaid does not impose a hold time before a refund can be created; you do not need to wait for the original transfer to settle.

A refund can still be issued even if the Item's `access_token` is no longer valid (e.g. if the user revoked OAuth consent or the Item was deleted via `/item/remove`), as long as the account and routing number pair used to make the original transaction is still valid. A refund cannot be issued if the Item has an [invalidated TAN](https://plaid.com/docs/auth/#tokenized-account-numbers), which can occur at Chase or PNC.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.transfer.refund.create(
  transfer_id: "transfer_id",
  amount: "amount",
  idempotency_key: "idempotency_key"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**transfer_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**amount:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Transfer::Refund::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.transfer.refund.<a href="/lib/plaid/transfer/refund/client.rb">get</a>(request) -> Plaid::Types::TransferRefundGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The `/transfer/refund/get` endpoint fetches information about the refund corresponding to the given `refund_id`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.transfer.refund.get(refund_id: "refund_id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**refund_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Transfer::Refund::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.transfer.refund.<a href="/lib/plaid/transfer/refund/client.rb">cancel</a>(request) -> Plaid::Types::TransferRefundCancelResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Use the `/transfer/refund/cancel` endpoint to cancel a refund.  A refund is eligible for cancellation if it has not yet been submitted to the payment network.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.transfer.refund.cancel(refund_id: "refund_id")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**refund_id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::Transfer::Refund::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## User Account
<details><summary><code>client.user.account.<a href="/lib/plaid/user/account/client.rb">get_session</a>(request) -> Plaid::Types::UserAccountSessionGetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

This endpoint returns user permissioned account data, including identity and Item access tokens, for use with [Plaid Layer](https://plaid.com/docs/layer). Note that end users are permitted to edit the prefilled identity data in the Link flow before sharing it with you; you should treat any identity data returned by this endpoint as user-submitted, unverified data. For a verification layer, you can add [Identity Verification](https://plaid.com/docs/identity-verification/) to your flow, or check the submitted identity data against bank account data from linked accounts using [Identity Match](https://plaid.com/docs/identity/#identity-match).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.user.account.get_session(public_token: "public_token")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**public_token:** `String` — The public token generated by the end user Layer session.
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::User::Account::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.user.account.<a href="/lib/plaid/user/account/client.rb">send_session_event</a>(request) -> Plaid::Types::UserAccountSessionEventSendResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

This endpoint allows sending client-specific events related to Layer sessions for analytics and tracking purposes.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.user.account.send_session_event(
  link_session_id: "link_session_id",
  event: {
    name: "name",
    timestamp: "2024-01-15T09:30:00Z"
  }
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**cohort_id:** `String` — Optional cohort identifier for the user session.
    
</dd>
</dl>

<dl>
<dd>

**link_session_id:** `String` — The Link session identifier.
    
</dd>
</dl>

<dl>
<dd>

**event:** `Plaid::Types::UserAccountSessionEvent` 
    
</dd>
</dl>

<dl>
<dd>

**request_options:** `Plaid::User::Account::RequestOptions` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

