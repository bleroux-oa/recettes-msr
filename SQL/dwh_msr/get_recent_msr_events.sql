-- Tests arrivés en DWH depuis le 4/03 14h UTC :
SELECT
lkp_lma_test,
updated_at,
sys_dat_updated
FROM
  `rni-sknow-gbl-ww-pd.sknow_bqdset_dwh_msr_eu_pd.tbl_dim_test`
WHERE
  sys_dat_end is NULL
  AND sys_flg_active
  AND sys_app_origin LIKE "MSR_%"
  AND sys_dat_updated >= TIMESTAMP('2025-03-04 14:00:00', 'UTC')
ORDER BY sys_dat_updated DESC