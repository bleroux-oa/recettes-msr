SELECT DISTINCT
-- id_msr_test -- If included, creates massive gap between DWH and MS (due to quasi duplicates)
ak_key_msr_test as id ,
lkp_lma_test as external_id,
lkp_key_msr_sample as tested_sample_id,
measure_objective_type_code,
test_sub_type,
test_name,
test_variation,
test_version,
test_validation_date,
created_at, updated_at,
FROM `rni-sknow-gbl-ww-np.sknow_bqdset_dwh_msr_v2_eu_np.tbl_dim_test`
WHERE sys_app_origin = "MSR_CPC"
AND source_code = "ANALYSE_AULNAY" -- LIMS 
AND sys_flg_active AND sys_dat_end is null
ORDER BY ak_key_msr_test