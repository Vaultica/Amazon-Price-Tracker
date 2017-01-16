drop table amazon_list
/

create table amazon_list ( listid       varchar2(50)      not null
                         , list_name    varchar2(50)      not null
                         , refresh_yn   char default  'Y' not null
                         , list_url     varchar2(300)
                         , list_comment varchar2(4000)
                         , last_refresh date ) ;

alter table amazon_list add primary key (listid) ;
                         
drop table list_item
/

create table list_item ( asin      varchar2(50)     not null
                       , listid    varchar2(50)     not null
                       , watch     char(1)          not null
                       , title     varchar2(300)    
                       , artist    varchar2(300)    
                       , item_url  varchar2(500)
                       , received  number(2)
                       , img_url   varchar2(300)
                       ) ;
                       
alter table list_item add primary key (listid, asin) ;

drop table item_price_history
/

create table item_price_history
                       ( listid             varchar2(50)     not null
                       , asin               varchar2(50)     not null
                       , price_date         date             not null
                       , new_offer_price    varchar2(300)    
                       , used_offer_price   varchar2(300)    
                       , amazon_price       varchar2(300)    
                       , sellerid           varchar2(50)     
                       ) ;

alter table item_price_history add primary key (listid, asin, price_date) ;


insert into amazon_list ( listid , list_name , refresh_yn )
values ( 'LZJCH0ZBY3GU' , 'WishList 2005' , 'N' ) ;
insert into amazon_list ( listid , list_name , refresh_yn )
values ( 'T7C19V6W694B' , 'Wish List' , 'Y' ) ;
insert into amazon_list ( listid , list_name , refresh_yn )
values ( '2930ZNS8WGL4H', 'IT Books' , 'Y' ) ;
insert into amazon_list ( listid , list_name , refresh_yn )
values ( '1K1VVAEHEOVTS', 'Misc List' , 'Y' ) ;
insert into amazon_list ( listid , list_name , refresh_yn )
values ( '1IFIYZIPIEI4N', 'Wish List Emmanuel - CDs' , 'Y' ) ;
insert into amazon_list ( listid , list_name , refresh_yn )
values ( '2RSYEHFN4UBL5', 'Wish List Emmanuel - Books' , 'Y' ) ;
insert into amazon_list ( listid , list_name , refresh_yn )
values ( '2I88C3UVEWDZJ', 'Wish List Emmanuel - DVDs' , 'Y' ) ;
insert into amazon_list ( listid , list_name , refresh_yn, list_url )
values ( '1BKD9L8D1SJTU', 'For Sale' , 'Y', 'http://www.amazon.co.uk/gp/registry/wishlist/1BKD9L8D1SJTU/ref=cm_wl_rlist_go/203-3354586-4353513' ) ;
insert into amazon_list ( listid , list_name , refresh_yn , list_url )
values ( '3EGK7CC84DULX' , 'Kids Stuff' , 'Y' , 'http://www.amazon.co.uk/gp/registry/wishlist/3EGK7CC84DULX/ref=cm_wl_rlist_go' ) ;
insert into amazon_list ( listid , list_name , refresh_yn , list_url )
values ( '1IBI3CXVR7KIZ' , 'Books' , 'Y' , 'http://www.amazon.co.uk/gp/registry/wishlist/1IBI3CXVR7KIZ/ref=cm_wl_rlist_go' ) ;

drop table amazon_request
/

create global temporary table amazon_request 
                            ( listid  varchar2(30) 
                            , request_type varchar2(30) 
                            , request_time date
                            , response_xml xmltype
                            , request_page number(4) ) ;

drop table list_data
/

create global temporary table list_data
                            ( listid varchar2(30) 
                            , asin varchar2(30) 
                            , itemURL varchar2(300) 
                            , artist varchar2(300) 
                            , label varchar2(100) 
                            , title varchar2(300) 
                            , lowest_new_price integer
                            , lowest_used_price integer
                            , amazon_price integer
                            , received number(2)
                            , img_url varchar2(300)
                            ) on commit delete rows ;

create table refresh_log ( refresh_date date , refresh_comment varchar2(1000) ) ;

create or replace procedure get_list_details ( p_listid in varchar2
                                             , p_page   in number default 1 )
as
  soap_request varchar2(30000);
  soap_respond varchar2(30000);
  http_req utl_http.req;
  http_resp utl_http.resp;
  resp XMLType;
  i integer;
  l_ctx DBMS_XMLStore.ctxType;
  l_rows number;

begin
  soap_request:= '<?xml version = "1.0" encoding = "UTF-8"?>
  <SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
   <SOAP-ENV:Body>
      <m:ListLookup xmlns:m="http://ecs.amazonaws.co.uk/onca/soap?Service=AWSECommerceService">
  <m:IdType xsi:type="m:simpleType">ListId</m:IdType>
  <m:SubscriptionId xsi:type="xsd:string">0R0ZCT4SF4FYXQ2MW2G2</m:SubscriptionId>
  <m:ListType xsi:type="xsd:string">WishList</m:ListType>
  <m:ListId xsi:type="xsd:string">' || p_listid || '</m:ListId>
  <m:ProductPage xsi:type="xsd:string">' || p_page || '</m:ProductPage>
  <m:ResponseGroup xsi:type="xsd:string">ItemIds</m:ResponseGroup>
  <m:ResponseGroup xsi:type="xsd:string">ItemAttributes</m:ResponseGroup>
  <m:ResponseGroup xsi:type="xsd:string">Small</m:ResponseGroup>
  <m:ResponseGroup xsi:type="xsd:string">ListInfo</m:ResponseGroup>
  <m:ResponseGroup xsi:type="xsd:string">Offers</m:ResponseGroup>
  <m:ResponseGroup xsi:type="xsd:string">ListItems</m:ResponseGroup>
  </m:ListLookup>
  </SOAP-ENV:Body>
  </SOAP-ENV:Envelope>
  ';
  utl_http.set_proxy('http://wtd.ime.reuters.com', 'emea.ime.reuters.com');
 
  http_req:= utl_http.begin_request
            ( 'http://ecs.amazonaws.co.uk/onca/soap?Service=AWSECommerceService'
            , 'POST'
            , 'HTTP/1.1'
            );
  utl_http.set_header(http_req, 'Content-Type', 'text/xml'); -- since we are dealing with plain text in XML documents
  utl_http.set_header(http_req, 'Content-Length', length(soap_request));
  utl_http.set_header(http_req, 'SOAPAction', ''); -- required to specify this is a SOAP communication
  utl_http.write_text(http_req, soap_request);

  http_resp:= utl_http.get_response(http_req);

  utl_http.read_text(http_resp, soap_respond);
  utl_http.end_response(http_resp);

  dbms_output.put_line(soap_respond);

  resp:= XMLType.createXML(soap_respond);
  resp:= resp.extract('/SOAP-ENV:Envelope/SOAP-ENV:Body/child::node()'
                   , 'xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/"'
                   );
  insert into amazon_request values ( p_listid , 'ListOffer' , sysdate , resp , p_page ) ;

  l_ctx := DBMS_XMLStore.newContext('LIST_DATA');
    
  l_rows := DBMS_XMLStore.insertXML
                    (l_ctx, 
                     XMLType.transform(resp.extract('/ListLookupResponse/Lists/child::node()'
                                                  , 'xmlns:="http://webservices.amazon.com/AWSECommerceService/2005-10-05"'
                                                   )
                                      ,XMLType.createXML('<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://webservices.amazon.com/AWSECommerceService/2005-10-05">
   <xsl:template match="/Request"/>
   <xsl:template match="/List">
      <ROWSET>
         <xsl:for-each select="//ListItem">
           <ROW>
             <LISTID><xsl:value-of select="ss"/></LISTID>
             <ASIN><xsl:value-of select="Item/ASIN"/></ASIN>
             <ITEMURL><xsl:value-of select="Item/DetailPageURL"/></ITEMURL>
             <RECEIVED><xsl:value-of select="QuantityReceived"/></RECEIVED>
             <ARTIST><xsl:value-of select="Item/ItemAttributes/Artist"/></ARTIST>
             <LABEL><xsl:value-of select="Item/ItemAttributes/Manufacturer"/></LABEL>
             <TITLE><xsl:value-of select="Item/ItemAttributes/Title"/></TITLE>
             <LOWEST_NEW_PRICE><xsl:value-of select="Item/OfferSummary/LowestNewPrice/Amount"/></LOWEST_NEW_PRICE>
             <LOWEST_USED_PRICE><xsl:value-of select="Item/OfferSummary/LowestUsedPrice/Amount"/></LOWEST_USED_PRICE>
             <AMAZON_PRICE><xsl:value-of select="Item/ItemAttributes/ListPrice/Amount"/></AMAZON_PRICE>
           </ROW>
         </xsl:for-each>
      </ROWSET>
   </xsl:template>
 </xsl:stylesheet>'                                     )
                                     )
                  ) ;    
                                
  dbms_xmlstore.closeContext(l_ctx);
  dbms_output.put_line(l_rows || ' rows inserted...');

end get_list_details ;
/
sho err

create or replace procedure get_list_info ( p_listid in varchar2 )
as
  soap_request varchar2(30000);
  soap_respond varchar2(30000);
  http_req utl_http.req;
  http_resp utl_http.resp;
  resp XMLType;
  i integer;
begin
  soap_request:= '<?xml version = "1.0" encoding = "UTF-8"?>
  <SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
   <SOAP-ENV:Body>
      <m:ListLookup xmlns:m="http://ecs.amazonaws.co.uk/onca/soap?Service=AWSECommerceService">
  <m:IdType xsi:type="m:simpleType">ListId</m:IdType>
  <m:SubscriptionId xsi:type="xsd:string">0R0ZCT4SF4FYXQ2MW2G2</m:SubscriptionId>
  <m:ListType xsi:type="xsd:string">WishList</m:ListType>
  <m:ListId xsi:type="xsd:string">' || p_listid || '</m:ListId>
  <m:ResponseGroup xsi:type="xsd:string">ListInfo</m:ResponseGroup>
  </m:ListLookup>
  </SOAP-ENV:Body>
  </SOAP-ENV:Envelope>
  ';
  utl_http.set_proxy('http://wtd.ime.reuters.com', 'emea.ime.reuters.com');
 
  http_req:= utl_http.begin_request
            ( 'http://ecs.amazonaws.co.uk/onca/soap?Service=AWSECommerceService'
            , 'POST'
            , 'HTTP/1.1'
            );
  utl_http.set_header(http_req, 'Content-Type', 'text/xml'); -- since we are dealing with plain text in XML documents
  utl_http.set_header(http_req, 'Content-Length', length(soap_request));
  utl_http.set_header(http_req, 'SOAPAction', ''); -- required to specify this is a SOAP communication
  utl_http.write_text(http_req, soap_request);

  http_resp:= utl_http.get_response(http_req);

  utl_http.read_text(http_resp, soap_respond);
  utl_http.end_response(http_resp);

  dbms_output.put_line(soap_respond);

  resp:= XMLType.createXML(soap_respond);
  resp:= resp.extract('/SOAP-ENV:Envelope/SOAP-ENV:Body/child::node()'
                   , 'xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/"'
                   );
  insert into amazon_request values ( p_listid , 'ListInfo' , sysdate, resp, 1 ) ;

end get_list_info ;
/
sho err


create or replace function get_latest_prices ( p_asin varchar2 ) 
return number
is
  l_min_price number(5) ;
begin

  select  least( min(to_number(nvl(iph.NEW_OFFER_PRICE,999999999))) , min(to_number(nvl(iph.USED_OFFER_PRICE,999999999))) , min(to_number(nvl(iph.AMAZON_PRICE,999999999))) )
  into l_min_price
  from item_price_history iph 
  where iph.ASIN = p_asin
  and iph.PRICE_DATE = ( select max (price_date) from item_price_history where p_asin = asin ) ;
  
  return case when l_min_price = 999999999 
              then null 
         else l_min_price 
         end ; 

end get_latest_prices ;
/
sho err

-- whishList05
exec get_list_info ( 'LZJCH0ZBY3GU' ) ;
exec get_list_details ( 'LZJCH0ZBY3GU', 1 ) ;
exec get_list_details ( 'LZJCH0ZBY3GU', 2 ) ;

-- WhishList
exec get_list_info ( 'T7C19V6W694B' ) ;
exec get_list_details ( 'T7C19V6W694B', 1 ) ;
exec get_list_details ( 'T7C19V6W694B', 2 ) ;
exec get_list_details ( 'T7C19V6W694B', 3 ) ;
exec get_list_details ( 'T7C19V6W694B', 4 ) ;
exec get_list_details ( 'T7C19V6W694B', 5 ) ;
exec get_list_details ( 'T7C19V6W694B', 6 ) ;
exec get_list_details ( 'T7C19V6W694B', 7 ) ;
exec get_list_details ( 'T7C19V6W694B', 8 ) ;
exec get_list_details ( 'T7C19V6W694B', 9 ) ;
exec get_list_details ( 'T7C19V6W694B', 10 ) ;
exec get_list_details ( 'T7C19V6W694B', 11 ) ;
exec get_list_details ( 'T7C19V6W694B', 12 ) ;
exec get_list_details ( 'T7C19V6W694B', 13 ) ;
exec get_list_details ( 'T7C19V6W694B', 14 ) ;
exec get_list_details ( 'T7C19V6W694B', 15 ) ;
exec get_list_details ( 'T7C19V6W694B', 16 ) ;
exec get_list_details ( 'T7C19V6W694B', 17 ) ;
exec get_list_details ( 'T7C19V6W694B', 18 ) ;
exec get_list_details ( 'T7C19V6W694B', 19 ) ;
exec get_list_details ( 'T7C19V6W694B', 20 ) ;
exec get_list_details ( 'T7C19V6W694B', 21 ) ;

-- IT Books
exec get_list_info ( '2930ZNS8WGL4H' ) ;
exec get_list_details ( '2930ZNS8WGL4H', 1 ) ;
exec get_list_details ( '2930ZNS8WGL4H', 2 ) ;
exec get_list_details ( '2930ZNS8WGL4H', 3 ) ;
exec get_list_details ( '2930ZNS8WGL4H', 4 ) ;
exec get_list_details ( '2930ZNS8WGL4H', 5 ) ;


col asin for a15
col title for a15
col artist for a15
col offer_amount for a8

SELECT extractvalue(t.response_xml,'//Lists/List/TotalPages'
                             ,'xmlns="http://webservices.amazon.com/AWSECommerceService/2005-10-05"') as TotalPages
      ,extractvalue(t.response_xml,'//Lists/List/TotalItems'
                             ,'xmlns="http://webservices.amazon.com/AWSECommerceService/2005-10-05"') as TotalItems
      ,t.request_type
      ,t.request_time
      ,t.request_page
      ,t.response_xml
FROM amazon_request t
where request_type = 'ListInfo'


SELECT t.response_xml.extract('//ListItem[2]/Item/ASIN/text()','xmlns="http://webservices.amazon.com/AWSECommerceService/2005-10-05"').getStringVal() as ASIN
      ,t.response_xml.extract('//ListItem[2]/Item/ItemAttributes/Title/text()','xmlns="http://webservices.amazon.com/AWSECommerceService/2005-10-05"').getStringVal() as title
      ,t.response_xml.extract('//ListItem[2]/Item/ItemAttributes/Artist/text()','xmlns="http://webservices.amazon.com/AWSECommerceService/2005-10-05"').getStringVal() as artist
      ,t.response_xml.extract('//ListItem[2]/Item/OfferSummary/LowestNewPrice/Amount/text()','xmlns="http://webservices.amazon.com/AWSECommerceService/2005-10-05"').getStringVal() as offer_amount
      ,t.request_type
      ,t.request_time
      ,t.request_page
FROM amazon_request t
where request_type = 'ListOffer'
/

select XMLType.transform(t.response_xml, XMLType.createXML('<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="/">
    <ROWSET>
      <xsl:for
      <ROW>
        <ASIN>
          <xsl:value-of select="/ListLookupResponse/Lists/List/ListItem/Item/ASIN" />
        </ASIN>
      </ROW>
    </ROWSET>
  </xsl:template>
</xsl:stylesheet>') ) as new_xml
from amazon_request t
where request_type = 'ListOffer'


select * from amazon_request t

where existsNode(t.response_xml, '//errors') = 1

delete from amazon_request t where request_page = 3 
and existsNode(t.response_xml, '//errors') = 1;

SELECT t.response_xml.extract('//ListItem[4]/Item/ASIN/text()','xmlns="http://webservices.amazon.com/AWSECommerceService/2005-10-05"').getStringVal() as ASIN10
      ,t.response_xml.extract('//ListItem[4]/Item/ItemAttributes/Title/text()','xmlns="http://webservices.amazon.com/AWSECommerceService/2005-10-05"').getStringVal() as title
      ,t.response_xml.extract('//ListItem[4]/Item/ItemAttributes/Artist/text()','xmlns="http://webservices.amazon.com/AWSECommerceService/2005-10-05"').getStringVal() as artist
      ,t.response_xml.extract('//ListItem[4]/Item/ItemAttributes/Author/text()','xmlns="http://webservices.amazon.com/AWSECommerceService/2005-10-05"').getStringVal() as author
      ,t.response_xml.extract('//ListItem[4]/Item/OfferSummary/LowestNewPrice/Amount/text()','xmlns="http://webservices.amazon.com/AWSECommerceService/2005-10-05"').getStringVal() as offer_amount
      ,t.request_type
      ,t.request_time
      ,t.request_page
FROM amazon_request t
where request_type = 'ListOffer'

SELECT extractvalue(t.response_xml,'//Lists/List/TotalPages'
                             ,'xmlns="http://webservices.amazon.com/AWSECommerceService/2005-10-05"') as TotalPages
      ,extractvalue(t.response_xml,'//Lists/List/TotalItems'
                             ,'xmlns="http://webservices.amazon.com/AWSECommerceService/2005-10-05"') as TotalItems
      ,t.request_type
      ,t.request_time
      ,t.request_page
      ,t.response_xml
FROM amazon_request t
where request_type = 'ListInfo'

select XMLType.transform(t.RESPONSE_XML.extract('/ListLookupResponse/Lists/child::node()'
                   , 'xmlns:="http://webservices.amazon.com/AWSECommerceService/2005-10-05"'
                   )
                        ,XMLType.createXML('<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://webservices.amazon.com/AWSECommerceService/2005-10-05">
    <xsl:template match="/List">
      <ROWSET>
         <xsl:for-each select="//ListItem/Item">
           <ROW>
             <ASIN><xsl:value-of select="ASIN"/></ASIN>
             <DetailPageURL><xsl:value-of select="DetailPageURL"/></DetailPageURL>
             <Artist><xsl:value-of select="ItemAttributes/Artist"/></Artist>
             <Label><xsl:value-of select="ItemAttributes/Manufacturer"/></Label>
             <Title><xsl:value-of select="ItemAttributes/Title"/></Title>
             <LowestNewPrice><xsl:value-of select="OfferSummary/LowestNewPrice/Amount"/></LowestNewPrice>
             <LowestUsedPrice><xsl:value-of select="OfferSummary/LowestUsedPrice/Amount"/></LowestUsedPrice>
           </ROW>
         </xsl:for-each>
      </ROWSET>
    </xsl:template>
 </xsl:stylesheet>') ) as new_xml
from amazon_request t
where request_type = 'ListOffer' 
