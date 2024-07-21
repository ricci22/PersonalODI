-- query for Region Notification Configuration
declare
    v_qry CLOB;

begin
    v_qry := 
        'select 
           a.NOTIF_ID,
           a.DESCR,
           a.EFF_STATUS,
           b."displayValue" MENU_NAME,
           a.PASS_KEY_FLAG,
           a.VIEW_NAME,
           a.MSG_TEXT,
           a.CREATED_DATE,
           a.CREATED_BY,
           a.LAST_UPDATED_DATE,
           a.LAST_UPDATED_BY
        from XODI_NOTIF a
            ,('|| XODI_NOTIF_PKG.get_lov_menuname() ||') b
        where 1=1
            and a.MENU_NAME = b."returnValue"
        ';

    return v_qry;
end;