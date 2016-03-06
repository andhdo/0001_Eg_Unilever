alter table category_data add mean_UL_gross_margin double;


update category_data
set mean_UL_gross_margin = (select avg(financial_data.gross_margin) 
from (financial_data join brands) 
where ((brands.is_UL = 1) and (financial_data.brand_id = brands.brand_id)
and (financial_data.year = category_data.year) 
and (brands.cat_id = category_data.cat_id)));

commit