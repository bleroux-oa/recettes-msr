SELECT
  s.ak_key_msr_sample,
  s.lkp_key_lma_sample,
  s.id_msr_sample,
  t.ak_key_msr_test,
  t.lkp_lma_test,
  t.id_msr_test,
  r.ak_key_msr_result,
  r.lkp_lma_results,
  r.id_msr_result
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
  AND s.ak_key_msr_sample IN {samples}
  -- AND r.sample_id IN {samples}