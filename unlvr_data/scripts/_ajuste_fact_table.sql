
      
		select t1.brand_id, t1.year
		  from financial_data t1
		  left join media_data t2
			on t1.brand_id = t2.brand_id
		   and t1.year = t2.year
		  left join tracking_data t3
            on t1.brand_id = t3.brand_id
		   and t1.year = t3.year
           
		 union all
         
		select t1.brand_id, t1.year
		  from media_data t2
		 left join financial_data t1
			on t2.brand_id = t1.brand_id
		   and t2.year = t1.year
		 left join tracking_data t3
            on t2.brand_id = t3.brand_id
		   and t2.year = t3.year
		 where t1.brand_id is null
           and t1.year  is null

         union all

		select t1.brand_id, t1.year
		  from tracking_data t3
		  left join financial_data t1
			on t3.brand_id = t1.brand_id
		   and t3.year = t1.year
		  left join media_data t2 
            on t3.brand_id = t1.brand_id 
		   and t3.year = t1.year
		 where t1.brand_id is null
           and t1.year is null 
           and t2.brand_id is null
		   and t2.year is null 
         
         
         
         

-- -------------------------------------------------------- 

select financial_data.brand_id, financial_data.year
  from financial_data
where exists (
select media_data.brand_id, media_data.year
  from media_data
 where financial_data.brand_id = media_data.brand_id
   and financial_data.year = media_data.year
);
 
 
select financial_data.brand_id, financial_data.year
  from financial_data
where exists (
select tracking_data.brand_id, tracking_data.year
  from tracking_data
 where financial_data.brand_id = tracking_data.brand_id
   and financial_data.year = tracking_data.year
)



 
select tracking_data.brand_id, financial_data.year
  from tracking_data
where exists (
select media_data.brand_id, media_data.year
  from media_data
 where media_data.brand_id = tracking_data.brand_id
   and media_data.year = tracking_data.year         