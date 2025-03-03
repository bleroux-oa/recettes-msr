-- Inspection au sein de la table sample

SELECT 
{version}
id_lma_sample, 
lkp_key_lma_sample,
id_msr_sample,
ak_key_msr_sample

FROM `rni-sknow-gbl-ww-pd.sknow_bqdset_dwh_msr_eu_pd.tbl_dim_sample`
WHERE sys_dat_end IS NULL
AND sys_flg_active
AND sys_app_origin LIKE 'MSR_%'
AND source_code LIKE "ANALYSE_AULNAY"
GROUP BY id_lma_sample,
lkp_key_lma_sample,
id_msr_sample,
ak_key_msr_sample

ORDER BY id_lma_sample DESC
