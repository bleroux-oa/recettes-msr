SELECT DISTINCT
 ak_key_msr_sample as id ,
sample_type, 
lkp_key_lma_sample as external_id,
sample_code, lkp_cod_rwm_batch as fabrication_code,
batch_code_number, batch_code_supplier,
sample_ec_code,
sample_smiles_code,
created_at, updated_at

FROM `rni-sknow-gbl-ww-np.sknow_bqdset_dwh_msr_v2_eu_np.tbl_dim_sample`
WHERE sys_app_origin = "MSR_CPC"
AND sys_flg_active AND sys_dat_end is null
AND source_code = "SOURCE_ECHA"