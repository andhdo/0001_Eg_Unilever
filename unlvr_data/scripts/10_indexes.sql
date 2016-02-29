/*
SELECT  DISTINCT INDEX_NAME, TABLE_NAME
FROM INFORMATION_SCHEMA.STATISTICS
WHERE TABLE_SCHEMA = 'tableauconnect';
*/

create index idx_brands_brand_id                 on brands  (brand_id) using BTREE;
create index idx_countries_country_id            on	countries(country_id)  using BTREE;
create index idx_estimated_returns_brand_id_year on estimated_returns(brand_id,year) using BTREE;
create index idx_financial_data_brand_id_year    on financial_data(brand_id,year) using BTREE;
create index idx_media_data_brand_id_year        on media_data(brand_id,year) using BTREE;
create index idx_tracking_data_brand_id_year     on tracking_data(brand_id,year) using BTREE;