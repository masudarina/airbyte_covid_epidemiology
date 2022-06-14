{{ config(
    cluster_by = ["_AIRBYTE_EMITTED_AT"],
    unique_key = '_AIRBYTE_AB_ID',
    schema = "_AIRBYTE_AIRBYTE_SCHEMA",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
-- depends_on: {{ source('AIRBYTE_SCHEMA', '_AIRBYTE_RAW_0610_CSVDATACOVID_EPIDEMIOLOGY') }}
select
    {{ json_extract_scalar('_airbyte_data', ['key'], ['key']) }} as KEY,
    {{ json_extract_scalar('_airbyte_data', ['date'], ['date']) }} as DATE,
    {{ json_extract_scalar('_airbyte_data', ['new_tested'], ['new_tested']) }} as NEW_TESTED,
    {{ json_extract_scalar('_airbyte_data', ['new_deceased'], ['new_deceased']) }} as NEW_DECEASED,
    {{ json_extract_scalar('_airbyte_data', ['total_tested'], ['total_tested']) }} as TOTAL_TESTED,
    {{ json_extract_scalar('_airbyte_data', ['new_confirmed'], ['new_confirmed']) }} as NEW_CONFIRMED,
    {{ json_extract_scalar('_airbyte_data', ['new_recovered'], ['new_recovered']) }} as NEW_RECOVERED,
    {{ json_extract_scalar('_airbyte_data', ['total_deceased'], ['total_deceased']) }} as TOTAL_DECEASED,
    {{ json_extract_scalar('_airbyte_data', ['total_confirmed'], ['total_confirmed']) }} as TOTAL_CONFIRMED,
    {{ json_extract_scalar('_airbyte_data', ['total_recovered'], ['total_recovered']) }} as TOTAL_RECOVERED,
    _AIRBYTE_AB_ID,
    _AIRBYTE_EMITTED_AT,
    {{ current_timestamp() }} as _AIRBYTE_NORMALIZED_AT
from {{ source('AIRBYTE_SCHEMA', '_AIRBYTE_RAW_0610_CSVDATACOVID_EPIDEMIOLOGY') }} as table_alias
-- 0610_csvdatacovid_epidemiology
where 1 = 1

