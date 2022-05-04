with ad_groups as (
    select *
    from {{ ref('stg_google_ads_ad_groups_tmp') }}
),

ad_group_report as (
    select *
    from {{ ref('stg_google_ads_ad_group_report_tmp') }}
),

ad_group_history as (
    select *
    from ad_group_report
    left join ad_groups using(ad_group_id, date)
)

select * from ad_group_history