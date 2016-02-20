use tableauconnect;
create or replace view RealCategory_Fv as 
SELECT `category_data`.`year`,
    `category_data`.`cat_id`,
    categories.country_id,
    `category_data`.`market_size`,
    `category_data`.`market_share_UL`,
    `category_data`.`growth_2y`,
    `category_data`.`growth_5y`,
    `category_data`.`media_spending_all`,
    `category_data`.`incremental_usage`,
    `category_data`.`conviction_cat`
FROM `category_data`, categories
where category_data.cat_id = categories.cat_id
