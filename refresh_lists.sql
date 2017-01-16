create or replace procedure refresh_lists
is
   l_nb_of_pages  pls_integer ;
   l_tot_items    pls_integer ;
   l_counter      pls_integer ;

begin

-- 1.
-- get data via http/soap request into XMLType tables
  for list in (select listid 
               from amazon_list
               where refresh_yn = 'Y'
               )
   -- for each list loop
   loop
      get_list_info (list.listid) ;

      SELECT extractvalue(t.response_xml,'//Lists/List/TotalPages'
                                        ,'xmlns="http://webservices.amazon.com/AWSECommerceService/2005-10-05"') 
            ,extractvalue(t.response_xml,'//Lists/List/TotalItems'
                                        ,'xmlns="http://webservices.amazon.com/AWSECommerceService/2005-10-05"') 
      INTO l_nb_of_pages, l_tot_items
      FROM amazon_request t
      WHERE request_type = 'ListInfo' ;

      for l_counter in 1..l_nb_of_pages 
      loop
          get_list_details ( list.listid , l_counter ) ;
      end loop ;
      
      update list_data set listid = list.listid ;

      -- merge record collected from Aamazon Web Service into List_item table
      merge into list_item lit
      using ( select  listid                 
                    , asin                   
                    , itemurl                
                    , artist                 
                    , label                  
                    , title                  
                    , lowest_new_price       
                    , lowest_used_price
                    , amazon_price
                    , received           
              from list_data ) src
       on ( src.listid = lit.listid and lit.asin = src.asin )
       when matched then
       update set lit.item_url = src.itemurl
                 ,lit.received = src.received
       when not matched then
       insert ( ASIN           
              , TITLE          
              , ARTIST         
              , LISTID         
              , ITEM_URL
              , RECEIVED )
       values ( src.asin 
              , src.title 
              , src.artist 
              , src.listid 
              , src.itemurl
              , src.received )
       ;

       -- if price has changed, insert a new row
       begin
         insert into item_price_history
         ( listid
         , ASIN                   
         , PRICE_DATE             
         , NEW_OFFER_PRICE        
         , USED_OFFER_PRICE
         , AMAZON_PRICE )
         select  lid.listid
               , lid.asin                   
               , sysdate
               , lid.lowest_new_price       
               , lid.lowest_used_price
               , lid.amazon_price           
         from list_data lid left join item_price_history iph on ( lid.asin = iph.asin and lid.listid = iph.listid )
         where nvl(lid.lowest_new_price, nvl(iph.new_offer_price,1) ) <> nvl(iph.new_offer_price, nvl(lid.lowest_new_price,1) )
            or nvl(lid.lowest_used_price, nvl(iph.used_offer_price,1) ) <> nvl(iph.used_offer_price, nvl(lid.lowest_used_price,1) )
            or nvl(lid.amazon_price, nvl(iph.amazon_price,1) ) <> nvl(iph.amazon_price, nvl(lid.amazon_price,1) )
         union
         -- following subquery is used when new items are added to the list (or during inital refresh)
         select  lid.listid
               , lid.asin                   
               , sysdate
               , lid.lowest_new_price       
               , lid.lowest_used_price
               , lid.amazon_price           
         from list_data lid left join item_price_history iph 
                                 on ( lid.asin = iph.asin and lid.listid = iph.listid )
         where iph.asin is null ;

       exception
         when dup_val_on_index
         then
             null ;	
       end ;
         
       update amazon_list set last_refresh = sysdate
       where listid = list.listid ;
       
       commit ;
       
   end loop ;

   
-- 2.
-- Log refresh transaction success/failure and audit for each list
   insert into refresh_log values ( sysdate , 'Refresh completed successfully' ) ;
   
   commit ;

end refresh_lists ;
/
sho err

create or replace procedure lists_notification
is

begin

-- for each rule loop
   -- execute rule
   -- for each row in resultset
      -- RSS post record to defined url
   -- end loop
-- end loop
   null ;

end lists_notification ;
/
sho err
