with click_view as (
    select
        "ad_group.id" as ad_group_id,
        "campaign.id" as campaign_id,
        "segments.date" as date,
        "click_view.gclid" as gclid,
        "segments.ad_network_type" as ad_network_type,
        "click_view.keyword_info.text" as keyword
    from {{ var('click_view') }}
)

select * from click_view