SELECT
  {version}
  s.lkp_key_lma_sample,
  COUNT(DISTINCT s.id_msr_sample) AS nb_msr_sample,
  -- s.lkp_key_lma_sample,
  -- r.sample_id as results_sample_id,
  
FROM
  `rni-sknow-gbl-ww-pd.sknow_bqdset_dwh_msr_eu_pd.tbl_dim_sample` s
LEFT JOIN
  `rni-sknow-gbl-ww-pd.sknow_bqdset_dwh_msr_eu_pd.tbl_dim_result` r
ON r.sample_id=s.ak_key_msr_sample
WHERE
  s.sys_dat_end IS NULL
  AND s.sys_flg_active
  AND r.sys_dat_end IS NULL
  AND r.sys_flg_active
  AND s.source_code LIKE "ANALYSE_AULNAY"
  AND s.sys_app_origin = "MSR_CPC"

GROUP BY
  {version}
  s.lkp_key_lma_sample
HAVING nb_msr_sample > 1
ORDER BY
  nb_msr_sample desc

