use tableauconnect;
create or replace view EstimatedBrand_Fv  as
SELECT `estimated_returns`.`brand_id`,
    `estimated_returns`.`year`,
    `estimated_returns`.`to_return`,
    `estimated_returns`.`gp_return`,
    `estimated_returns`.`protected_fraction`,
    `estimated_returns`.`gained_fraction`,
    -- `calculated_params`.`brand_id`,
    -- `calculated_params`.`year`,
    `calculated_params`.`total_cut_through`,
    `calculated_params`.`tv_cut_trough`,
    `calculated_params`.`conviction_growth_factor`,
    `calculated_params`.`decay`,
    `calculated_params`.`conviction_gain`,
    `calculated_params`.`fair_share`,
    `calculated_params`.`conviction_lost`,
    `calculated_params`.`ceiling`,
    `calculated_params`.`competitor_hit`    
FROM `estimated_returns`,
     `calculated_params`
where  estimated_returns.brand_id = calculated_params.brand_id
  and estimated_returns.year = calculated_params.year

