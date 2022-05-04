
with campaigns as (
    select
        *
    from
        {{ ref('stg_google_ads_campaigns_tmp') }}
),

ad_reports as (
    select
        campaign_id,
        coalesce(sum(conversions)) as conversions,
         coalesce(sum(view_through_conversions)) as view_through_conversions,
         coalesce(sum(conversions_value)) as conversions_value,
         coalesce(sum(interactions)) as interactions
    from
        {{ ref('stg_google_ads_ad_group_report_tmp') }}
    group by 1
),

campaign_history as (
    select
        campaigns.*,
        ad_reports.conversions,
        ad_reports.view_through_conversions,
        ad_reports.conversions_value,
        ad_reports.interactions
    from campaigns
    left join ad_reports on campaigns.campaign_id = ad_reports.campaign_id
)

select * from campaign_history