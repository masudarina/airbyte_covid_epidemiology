{{ config(
    cluster_by = ["_AIRBYTE_EMITTED_AT"],
    unique_key = '_AIRBYTE_AB_ID',
    schema = "_AIRBYTE_AIRBYTE_SCHEMA",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to build a hash column based on the values of this record
-- depends_on: {{ ref('0610_csvdatacovid_epidemiology_ab2') }}
select
    {{ dbt_utils.surrogate_key([
        'KEY',
        'DATE',
        'NEW_TESTED',
        'NEW_DECEASED',
        'TOTAL_TESTED',
        'NEW_CONFIRMED',
        'NEW_RECOVERED',
        'TOTAL_DECEASED',
        'TOTAL_CONFIRMED',
        'TOTAL_RECOVERED',
    ]) }} as _AIRBYTE_0610_CSVDATACOVID_EPIDEMIOLOGY_HASHID,
    tmp.*
from {{ ref('0610_csvdatacovid_epidemiology_ab2') }} tmp
-- 0610_csvdatacovid_epidemiology
where 1 = 1

