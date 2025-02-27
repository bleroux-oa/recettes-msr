SELECT
  {version}
  s.lkp_key_lma_sample,
  COUNT(DISTINCT s.ak_key_msr_sample) AS nb_msr_sample
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
  s.lkp_key_lma_sample
HAVING
  nb_msr_sample > 1
ORDER BY
  nb_msr_sample desc