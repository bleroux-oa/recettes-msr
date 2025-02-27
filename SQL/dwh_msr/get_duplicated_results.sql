SELECT
  {version}
  r.lkp_lma_results,
  COUNT(DISTINCT r.ak_key_msr_result) AS nb_msr_res
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
  AND s.source_code LIKE "ANALYSE_AULNAY"
  AND r.sys_flg_active
GROUP BY
  {version}
  r.lkp_lma_results
HAVING
  nb_msr_res > 1
ORDER BY
  nb_msr_res desc