with ad_group_ad_report as (
    select
        "segments.date" as date,
        "ad_group.id" as ad_group_id,
        "ad_group.name" as ad_group_name,
        "campaign.id" as campaign_id,
        "campaign.name" as campaign_name,
        "ad_group.status" as status,
        "metrics.clicks" as clicks,
        "metrics.impressions" as impressions,
        "metrics.engagements" as engagements,
        "metrics.interactions" as interactions,
        "metrics.conversions" as conversions,
        "metrics.view_through_conversions" as view_through_conversions,
        "metrics.conversions_value" as conversions_value,
        round("metrics.cost_micros"::numeric / 1000000, 2) as cost
    from {{ var('ad_group_ad_report') }}
)

select * from ad_group_ad_report