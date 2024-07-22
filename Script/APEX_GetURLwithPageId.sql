declare
    v_url varchar2(500);
    v_cgi_env varchar2(500);
begin
    v_url := apex_page.get_url(
            p_application => 101,
            p_page   => 54
        );
    
    -- v_cgi_env := OWA_UTIL.get_cgi_env('X-Original-URL');    

    dbms_output.put_line(v_url);
    dbms_output.put_line(APEX_UTIL.HOST_URL());

    dbms_output.put_line(APEX_UTIL.HOST_URL() || v_url);
end;