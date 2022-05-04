select
    "segments.date" as date,
    "ad_group.id" as ad_group_id,
    "ad_group.name" as ad_group_name,
    "ad_group.status" as status
from
    {{ var('ad_groups') }}