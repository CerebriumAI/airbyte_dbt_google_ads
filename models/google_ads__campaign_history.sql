select
    "segments.date" as date,
    "campaign.id" as campaign_id,
    "campaign.name" as campaign_name,
    "campaign.status" as status,
    "campaign.start_date" as start_date,
    "campaign.end_date" as end_date,
    "campaign.network_set__arget_content_network" as content_network_enabled,
    "campaign.network_set__.target_google_search" as google_search_enabled,
    "campaign.network_set__target_search_network" as search_network_enabled,
    "campaign.network_set__artner_search_network" as partner_search_network,
    "metrics.clicks" as clicks,
    "metrics.impressions" as impressions,
    "metrics.video_views" as video_views,
    round("metrics.cost_micros"::numeric / 1000000, 2) as
    cost
from
    {{ var('campaigns') }}