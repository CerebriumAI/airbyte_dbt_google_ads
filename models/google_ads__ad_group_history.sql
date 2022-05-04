with ad_group_ad_report as (
    select *
    from {{ ref('stg_google_ads_ad_group_report_tmp') }}
),

select * from ad_group_ad_report