with keywords as (
    select *
    from {{ ref('stg_google_ads_keywords_tmp') }}
)

select * from keywords