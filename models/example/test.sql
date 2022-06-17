{{ config(materialized='table') }}


select
 *
from "AIRBYTE_DATABASE"."AIRBYTE_SCHEMA"."____33_"
where SHORT_DESCRIPTION = '0B9BmkDm3z'
