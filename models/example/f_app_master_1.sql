{{ config(materialized='table') }}


select
 *
from "AIRBYTE_DATABASE"."AIRBYTE_SCHEMA"."F_APP_MASTER"

