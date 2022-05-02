{% set sum_metrics = [
    "clicks",
    "impressions",
    "engagements", 
    "interactions", 
    "conversions",
    "view_through_conversions",
    "cost_micros",
    "conversions_value"
] %}
{% set avg_metrics = [
    "bounce_rate",
    "average_cpc",
    "average_cpm", 
    "average_cost"
] %}

with ad_groups as (
    select
        "segments.date" as date,
        "ad_group.id" as ad_group_id,
        "ad_group.name" as ad_group_name,
        "ad_group.status" as status
    from
        {{ var('ad_groups') }}
),

ad_group_report as (
    select
        "segments.date" as date,
        "ad_group.id" as ad_group_id,
        "campaign.id" as campaign_id,
        {%- for metric in sum_metrics %}
            sum("metrics.{{ metric }}") as {{ metric }},
        {%- endfor %}
        {%- for metric in avg_metrics %}
            avg("metrics.{{ metric }}") as {{ metric }}
            {%- if not loop.last %},{% endif -%}
        {%- endfor %}
    from
        {{ var('ad_group_ad_report')}}
    {{ dbt_utils.group_by(3) }}
),

ad_group_history as (
    select
        date,
        ad_group_id,
        ad_group_name,
        campaign_id,
        status,
        {%- for metric in sum_metrics+avg_metrics %}
            -- {%- if metric != "cost_micros" %}
            -- {{ metric }}
            -- {% else %}
            -- round(cost_micros::numeric / 1000000, 2) as cost
            -- {% endif %}
            {{ metric }}
            {%- if not loop.last %},{% endif -%}
        {%- endfor %}
    from
        ad_group_report
    left join ad_groups using(ad_group_id, date)
)

select * from ad_group_history