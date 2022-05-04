with click_view as (
    select *
    from {{ ref('stg_google_ads_click_view_tmp') }}
)

select * from click_view