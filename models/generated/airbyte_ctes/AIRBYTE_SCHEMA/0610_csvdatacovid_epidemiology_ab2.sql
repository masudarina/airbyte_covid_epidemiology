{{ config(
    cluster_by = ["_AIRBYTE_EMITTED_AT"],
    unique_key = '_AIRBYTE_AB_ID',
    schema = "_AIRBYTE_AIRBYTE_SCHEMA",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
-- depends_on: {{ ref('0610_csvdatacovid_epidemiology_ab1') }}
select
    cast(KEY as {{ dbt_utils.type_string() }}) as KEY,
    cast(DATE as {{ dbt_utils.type_string() }}) as DATE,
    cast(NEW_TESTED as {{ dbt_utils.type_float() }}) as NEW_TESTED,
    cast(NEW_DECEASED as {{ dbt_utils.type_float() }}) as NEW_DECEASED,
    cast(TOTAL_TESTED as {{ dbt_utils.type_float() }}) as TOTAL_TESTED,
    cast(NEW_CONFIRMED as {{ dbt_utils.type_float() }}) as NEW_CONFIRMED,
    cast(NEW_RECOVERED as {{ dbt_utils.type_float() }}) as NEW_RECOVERED,
    cast(TOTAL_DECEASED as {{ dbt_utils.type_float() }}) as TOTAL_DECEASED,
    cast(TOTAL_CONFIRMED as {{ dbt_utils.type_float() }}) as TOTAL_CONFIRMED,
    cast(TOTAL_RECOVERED as {{ dbt_utils.type_float() }}) as TOTAL_RECOVERED,
    _AIRBYTE_AB_ID,
    _AIRBYTE_EMITTED_AT,
    {{ current_timestamp() }} as _AIRBYTE_NORMALIZED_AT
from {{ ref('0610_csvdatacovid_epidemiology_ab1') }}
-- 0610_csvdatacovid_epidemiology
where 1 = 1

