alter table category_market_data add mean_UL_gross_margin double;


update category_market_data
set mean_UL_gross_margin = (select avg(brand_market_data.gross_margin) 
from (brand_market_data join brands) 
where ((brands.is_UL = 1) and (brand_market_data.brand_id = brands.brand_id)
and (brand_market_data.year = category_market_data.year) 
and (brands.cat_id = category_market_data.cat_id)));

commit