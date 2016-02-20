
use tableauconnect;

-- create Fact View Operational Table

create or replace view RealBrand_Fv as 
select brands.brand_id,
    -- `brands`.`name`,
    -- `brands`.`local_name`,
    -- `brands`.`is_UL`,
    -- `brands`.`brand_status`,
    -- `brands`.`cat_id`,
    `categories`.`cat_id`,
    `categories`.`country_id`,
    -- `categories`.`name`,
    -- `categories`.`decay_rate`,
    -- `categories`.`ceiling_L`,
    -- `categories`.`ceiling_C`,
    -- `categories`.`ceiling_S`,
    -- `categories`.`ceiling_O`,
    -- `categories`.`decay_speed`,
    -- `categories`.`competitor_hit_L`,
    -- `categories`.`competitor_hit_C`,
    -- `categories`.`competitor_hit_S`,
    -- `categories`.`competitor_hit_O`,
    -- `categories`.`non_tv_effectiveness`
    -- `financial_data`.`brand_id` financialdata_brand_id,
    `financial_data`.`year`,
    `financial_data`.`turnover`,
    `financial_data`.`gross_margin`,
    -- `media_data`.`brand_id` mediadata_brand_id,
    -- `media_data`.`year`,
    `media_data`.`tv_.`,
    `media_data`.`spending`,
    `media_data`.`grp_cost`,
    `media_data`.`share_of_value`,
    `media_data`.`growth`,
    `media_data`.`how_many`,
    -- `tracking_data`.`brand_id` trackingdata_brand_id,
    -- `tracking_data`.`year`,
    `tracking_data`.`conviction`,
    `tracking_data`.`ai`,
    `tracking_data`.`ai2c`    
  from categories ,	
	   brands	   
  left outer join financial_data 
    on brands.brand_id = financial_data.brand_id
  left outer join media_data 
    on brands.brand_id = media_data.brand_id
  left outer join tracking_data 
    on brands.brand_id = tracking_data.brand_id
 where brands.cat_id = categories.cat_id
   and financial_data.year = media_data.year
   and financial_data.year = tracking_data.year
   and tracking_data.year = media_data.year
   
   
 
       
 
  
  

