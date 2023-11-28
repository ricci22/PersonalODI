with comp_data as (
    select e.symbol
,e.about
,e.sector_name
,e.sub_industry_name
,e.sub_sector_name
,e.website
,e.address
,e.name           
    from HCM_NN_JSON j, json_table(
        document,
        '$.data[*]'
        columns(
            symbol    varchar2(10)  path '$.symbol',
            about    varchar2(254)  path '$.about',
            sector_name    varchar2(50)  path '$.sector_name',
            sub_industry_name    varchar2(50)  path '$.sub_industry_name',
            sub_sector_name    varchar2(254)  path '$.symbol',
            website    varchar2(254)  path '$.website',
            address    varchar2(254)  path '$.address',
            name      varchar2(50)  path '$.name' ) ) e
    where j.name = 'profile'
        and j.id = (
            select max(id) from HCM_NN_JSON where name = j.name)
)
select e.symbol
,e.about
,e.sector_name
,e.sub_industry_name
,e.sub_sector_name
,e.website
,e.address
,e.name     
  from comp_data e


