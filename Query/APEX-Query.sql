select * from apex_mail_log order by last_updated_on desc
select * from apex_mail_queue;

BEGIN
                APEX_MAIL.SEND (
                    P_FROM      => nanda.nasution@optima-data.com, 
                    P_TO        => nanda.nasution@optima-data.com,  
                    P_CC        => '',
                    P_BODY      => 'Email Testing',
                    -- P_BODY_HTML => TO_CHAR(TMP_EMAIL_BODY),
                    P_SUBJ      => 'Reminder Update Date Religion' );
                APEX_MAIL.PUSH_QUEUE;
END;

-- Notif
select * from XODI_NOTIF;
select * from HR_GB_CUSTOMMENU_V where tag = 150;
select * from HR_GB_CUSTOMMENU where tag = 150;

--/* Query LoV to Get Menu Name as displayValue and PageId as returnValue
--* Because there can be different method of navigation
--* so for getting the page id need to be customized
--* in this case of custom navigation, get the page id from custom table
--*/

SELECT
   SYS_CONNECT_BY_PATH(name, ' -> ') "displayValue",
   tag "returnValue",
   name "pageName",
   active "pageStatus",
   pid,
   id "customId"
FROM
   hr_gb_custommenu START WITH id in (
      select
         id
      from
         HR_GB_CUSTOMMENU
      where 1=1
         and pid is null
   ) CONNECT BY PRIOR id = pid
ORDER BY
   "customId",
   pid;
   

select * from TABLE(XODI_NOTIF_PKG.notif_detail);
select * from TABLE(XODI_NOTIF_PKG.notif_header);


    select XODI_NOTIF_PKG.get_lov_menuname()
    -- into v_qry
    from dual;

select 
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
            ,(SELECT SYS_CONNECT_BY_PATH(x.name, ' -> ') "displayValue", x.tag "returnValue" FROM hr_gb_custommenu x START WITH x.id in ( select x1.id from HR_GB_CUSTOMMENU x1 where 1=1 and x1.pid is null ) CONNECT BY PRIOR x.id = x.pid ORDER BY "returnValue") b
        where 1=1
            and a.MENU_NAME = b."returnValue"

SELECT SYS_CONNECT_BY_PATH(x.name, ' -> ') "displayValue", x.tag "returnValue" FROM hr_gb_custommenu x START WITH x.id in ( select x1.id from HR_GB_CUSTOMMENU x1 where 1=1 and x1.pid is null ) CONNECT BY PRIOR x.id = x.pid

