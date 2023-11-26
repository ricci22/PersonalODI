declare
    l_clob           clob;
    l_feature_count  pls_integer;
    l_time           timestamp;
begin
    select document into l_clob
      from earthquake_json
     where id = 1;

    l_time := systimestamp;

    apex_json.parse(
        p_source => l_clob );

    dbms_output.put_line( 'Parsing Time: ' || extract( second from ( systimestamp - l_time ) ) );
    l_time := systimestamp;

    l_feature_count := apex_json.get_count( 'features' );
    dbms_output.put_line( 'Array Count: ' || l_feature_count );

    dbms_output.put_line( 'Get Array Count Time: ' || extract( second from ( systimestamp - l_time ) ) );
end;

Parsing Time:         12,293681
Array Count:               9456
Get Array Count Time:  0,000039