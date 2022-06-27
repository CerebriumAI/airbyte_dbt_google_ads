select 
    "ad_group.id" as ad_group_id,
    "segments.date" as date,
    "ad_group_criterion.keyword.text" as keyword,
    "ad_group_criterion.keyword.match_type" as match_type,
    round("metrics.cost_micros"::numeric / 1000000, 2) as cost
    "metrics.impressions" as impressions,
    "metrics.ctr" as ctr
from {{ var('keyword_report') }}
