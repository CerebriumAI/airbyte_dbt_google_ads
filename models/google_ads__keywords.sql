with keywords as (
    select 
        "ad_group.id" as ad_group_id,
        "segments.data" as date,
        "campaign.bidding_strategy" as bidding_strategy,
        "ad_group_criterion.keyword.text" as keyword,
        "ad_group_criterion.keyword.match)type" as match_type
        "metrics.cost_micros" as cost,
        "metrics.impressions" as impressions,
        "metrics.ctr" as ctr,
    from {{ var('keywords') }}
),