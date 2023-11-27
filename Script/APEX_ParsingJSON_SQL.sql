with comp_data as (
    select e.ticker,
           e.name           
    from HCM_NN_JSON j, json_table(
        document,
        '$.data[*]'
        columns(
            ticker    varchar2(10)  path '$.results.ticker',
            name      varchar2(50)  path '$.results.name' ) ) e
)
select e.ticker,
       e.name       
  from comp_data e