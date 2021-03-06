/*
SELECT  DISTINCT INDEX_NAME, TABLE_NAME
FROM INFORMATION_SCHEMA.STATISTICS
WHERE TABLE_SCHEMA = 'tableauconnect';
*/

create index idx_brands_brand_id                 on brands  (brand_id) using BTREE;
create index idx_countries_country_id            on	countries(country_id)  using BTREE;
create index idx_estimated_returns_brand_id_year on estimated_returns(brand_id,year) using BTREE;
create index idx_financial_data_brand_id_year    on brand_market_data(brand_id,year) using BTREE;
create index idx_media_data_brand_id_year        on brand_media_data(brand_id,year) using BTREE;
create index idx_tracking_data_brand_id_year     on brand_tracking_data(brand_id,year) using BTREE;
create index idx_category_data_year_cat_id       on category_market_data (year, cat_id) algorithm default lock default;
/* Faltan tablas */
create index idx_brands_cat_id  				 on brands (cat_id) algorithm default lock default;

