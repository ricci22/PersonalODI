DECLARE
  l_clob    clob;
  l_buffer         varchar2(32767);
  l_amount         number;
  l_offset         number;    
BEGIN
    apex_web_service.set_request_headers(
        p_name_01        => 'Content-Type',
        p_value_01       => 'application/json',
        p_name_02        => 'X-API-KEY',
        p_value_02       => '312690fb-0d36-5231-9c6b-07c9af4a'

        );

    DBMS_OUTPUT.put_line('l_clob=');

    l_clob := apex_web_service.make_rest_request(        
        p_url => 'https://api.goapi.io/stock/idx/companies',
        p_http_method => 'GET'
    );

    DBMS_OUTPUT.put_line('l_clob=');

    l_amount := 32000;
    l_offset := 1;
    BEGIN
        DBMS_OUTPUT.put_line(TO_CHAR(apex_web_service.g_status_code));
        DBMS_OUTPUT.put_line(l_clob);
    EXCEPTION
        WHEN no_data_found THEN
            NULL;
    END;

END;

