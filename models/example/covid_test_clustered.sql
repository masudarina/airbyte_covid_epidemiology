{{ config(
   schema="covid_data",
   tags=["top-level"],
   partition_by={
       "field": "date",
       "data_type": "date"
   },
   cluster_by=["key"]
) }}

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
from "AIRBYTE_DATABASE"."AIRBYTE_SCHEMA"."0610_csvdatacovid_epidemiology"
