WITH
  json AS (
  SELECT
    JSON_EXTRACT(DATA, "$") AS json_blob,
    UPPER(JSON_EXTRACT_SCALAR(attributes, "$.domain")) AS domain,
    publish_time
  FROM
    `rni-sknow-gbl-ww-pd.sknow_bqdset_inp_realtime_eu_pd.tbl_msr_cpc_sample`
  UNION ALL
  SELECT
    JSON_EXTRACT(DATA, "$") AS json_blob,
    UPPER(JSON_EXTRACT_SCALAR(attributes, "$.domain")) AS domain,
    publish_time
  FROM
    `rni-sknow-gbl-ww-pd.sknow_bqdset_inp_realtime_eu_pd.tbl_msr_ti_sample` )
SELECT
  DISTINCT json_blob
FROM
  json
WHERE
  LOWER(JSON_EXTRACT_SCALAR(json_blob, "$.event_type")) ='delete'