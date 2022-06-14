{{ config (
    materialized="table"
)}}
-- Final base SQL model
-- depends_on: {{ ref('0610_csvdatacovid_epidemiology_ab3') }}
select
    KEY,
    DATE,
    NEW_TESTED,
    NEW_DECEASED,
    TOTAL_TESTED,
    NEW_CONFIRMED,
    NEW_RECOVERED,
    TOTAL_DECEASED,
    TOTAL_CONFIRMED,
    TOTAL_RECOVERED,
    _AIRBYTE_AB_ID,
    _AIRBYTE_EMITTED_AT,
    {{ current_timestamp() }} as _AIRBYTE_NORMALIZED_AT,
    _AIRBYTE_0610_CSVDATACOVID_EPIDEMIOLOGY_HASHID
from {{ ref('0610_csvdatacovid_epidemiology_ab3') }}
-- 0610_csvdatacovid_epidemiology from {{ source('AIRBYTE_SCHEMA', '_AIRBYTE_RAW_0610_CSVDATACOVID_EPIDEMIOLOGY') }}
where 1 = 1

