SELECT
  {version}
  r.sample_id,
  COUNT(DISTINCT s.id_msr_sample) AS nb_msr_sample
  -- s.lkp_key_lma_sample,
  -- r.sample_id as results_sample_id,
  
FROM
  `rni-sknow-gbl-ww-pd.sknow_bqdset_dwh_msr_eu_pd.tbl_dim_sample` s
LEFT JOIN
  `rni-sknow-gbl-ww-pd.sknow_bqdset_dwh_msr_eu_pd.tbl_dim_test` t
USING
  (id_msr_sample)
LEFT JOIN
  `rni-sknow-gbl-ww-pd.sknow_bqdset_dwh_msr_eu_pd.tbl_dim_result` r
USING
  (id_msr_test)
WHERE
  s.sys_dat_end IS NULL
  AND s.sys_flg_active
  AND t.sys_dat_end IS NULL
  AND t.sys_flg_active
  AND r.sys_dat_end IS NULL
  AND r.sys_flg_active
  AND s.source_code LIKE "ANALYSE_AULNAY"
  AND s.sys_app_origin = "MSR_CPC"

GROUP BY
  {version}
  r.sample_id
-- HAVING nb_msr_sample > 1
ORDER BY
  nb_msr_sample desc

