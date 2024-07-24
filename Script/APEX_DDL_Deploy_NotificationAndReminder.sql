  CREATE TABLE "XODI_NOTIF" 
   (	"NOTIF_ID" VARCHAR2(30 CHAR) NOT NULL ENABLE, 
	"DESCR" VARCHAR2(255 CHAR), 
	"EFF_STATUS" VARCHAR2(1 CHAR), 
	"MENU_NAME" VARCHAR2(100 CHAR), 
	"PASS_KEY_FLAG" VARCHAR2(1 CHAR), 
	"VIEW_NAME" VARCHAR2(30 CHAR), 
	"MSG_TEXT" VARCHAR2(2000 CHAR), 
	"CREATED_DATE" TIMESTAMP (6), 
	"CREATED_BY" VARCHAR2(100), 
	"LAST_UPDATED_DATE" TIMESTAMP (6), 
	"LAST_UPDATED_BY" VARCHAR2(100), 
	 CONSTRAINT "XODI_NOTIF_TBL_PK" PRIMARY KEY ("NOTIF_ID")
  USING INDEX  ENABLE
   ) ;

   COMMENT ON TABLE "XODI_NOTIF"  IS 'Notification Configuration';

  CREATE OR REPLACE EDITIONABLE TRIGGER "XODI_NOTIF_T" 
before 
insert or update or delete on "XODI_NOTIF" 
for each row 
BEGIN 
    IF INSERTING 
    THEN 
        IF :NEW.CREATED_BY IS NULL 
        THEN 
            :NEW.CREATED_BY := v('APP_USER'); 
            :NEW.CREATED_DATE := SYSDATE; 
            :NEW.LAST_UPDATED_BY := v('APP_USER'); 
            :NEW.LAST_UPDATED_DATE := SYSDATE; 
        END IF; 
    END IF; 
    IF UPDATING THEN 
      :NEW.LAST_UPDATED_BY := v('APP_USER'); 
      :NEW.LAST_UPDATED_DATE := SYSDATE; 
    END IF; 
END;
/
ALTER TRIGGER "XODI_NOTIF_T" ENABLE;

  CREATE TABLE "XODI_NOTIF_PARAM" 
   (	"NOTIF_ID" VARCHAR2(30 CHAR) NOT NULL ENABLE, 
	"PARAM_NAME" VARCHAR2(30 CHAR) NOT NULL ENABLE, 
	"FIELD_NAME" VARCHAR2(30 CHAR), 
	"CREATED_DATE" TIMESTAMP (6), 
	"CREATED_BY" VARCHAR2(100), 
	"LAST_UPDATED_DATE" TIMESTAMP (6), 
	"LAST_UPDATED_BY" VARCHAR2(100), 
	 CONSTRAINT "XODI_NOTIF_PARAM_TBL_PK" PRIMARY KEY ("NOTIF_ID", "PARAM_NAME")
  USING INDEX  ENABLE
   ) ;

   COMMENT ON TABLE "XODI_NOTIF_PARAM"  IS 'Notification Configuration Parameter';

  CREATE OR REPLACE EDITIONABLE TRIGGER "XODI_NOTIF_PARAM_T" 
before 
insert or update or delete on "XODI_NOTIF_PARAM" 
for each row 
BEGIN 
    IF INSERTING 
    THEN 
        IF :NEW.CREATED_BY IS NULL 
        THEN 
            :NEW.CREATED_BY := v('APP_USER'); 
            :NEW.CREATED_DATE := SYSDATE; 
            :NEW.LAST_UPDATED_BY := v('APP_USER'); 
            :NEW.LAST_UPDATED_DATE := SYSDATE; 
        END IF; 
    END IF; 
    IF UPDATING THEN 
      :NEW.LAST_UPDATED_BY := v('APP_USER'); 
      :NEW.LAST_UPDATED_DATE := SYSDATE; 
    END IF; 
END;
/
ALTER TRIGGER "XODI_NOTIF_PARAM_T" ENABLE;

  CREATE TABLE "XODI_REMIND" 
   (	"REMIND_ID" VARCHAR2(30 CHAR) NOT NULL ENABLE, 
	"DESCR" VARCHAR2(100 CHAR), 
	"EFF_STATUS" VARCHAR2(1 CHAR), 
	"PARAMETER" VARCHAR2(30 CHAR), 
	"TABLE_DATA" VARCHAR2(30 CHAR), 
	"LIST_USER" VARCHAR2(30 CHAR), 
	"EMAIL_ADDR" VARCHAR2(100 CHAR), 
	"RUN_TYPE" VARCHAR2(1 CHAR), 
	"DOC_ATTCH" BLOB, 
	"DOC_FILE_NAME" VARCHAR2(50 CHAR), 
	"DOC_MIME_TYPE" VARCHAR2(50 CHAR), 
	"DOC_CHARSET" VARCHAR2(50 CHAR), 
	"SUBJECT_TEXT" VARCHAR2(256 CHAR), 
	"BODY_TEXT" VARCHAR2(2000 CHAR), 
	"FOOTER_TEXT" VARCHAR2(2000 CHAR), 
	"CREATED_DATE" TIMESTAMP (6), 
	"CREATED_BY" VARCHAR2(100), 
	"LAST_UPDATED_DATE" TIMESTAMP (6), 
	"LAST_UPDATED_BY" VARCHAR2(100), 
	 CONSTRAINT "XODI_REMIND_PK" PRIMARY KEY ("REMIND_ID")
  USING INDEX  ENABLE
   ) ;

   COMMENT ON TABLE "XODI_REMIND"  IS 'Reminder Configuration';

  CREATE OR REPLACE EDITIONABLE TRIGGER "XODI_REMIND_T" 
before 
insert or update or delete on "XODI_REMIND" 
for each row 
BEGIN 
    IF INSERTING 
    THEN 
        IF :NEW.CREATED_BY IS NULL 
        THEN 
            :NEW.CREATED_BY := v('APP_USER'); 
            :NEW.CREATED_DATE := SYSDATE; 
            :NEW.LAST_UPDATED_BY := v('APP_USER'); 
            :NEW.LAST_UPDATED_DATE := SYSDATE; 
        END IF; 
    END IF; 
    IF UPDATING THEN 
      :NEW.LAST_UPDATED_BY := v('APP_USER'); 
      :NEW.LAST_UPDATED_DATE := SYSDATE; 
    END IF; 
END;
/
ALTER TRIGGER "XODI_REMIND_T" ENABLE;

  CREATE TABLE "XODI_REMIND_CC" 
   (	"REMIND_ID" VARCHAR2(30 CHAR) NOT NULL ENABLE, 
	"EMAIL_ADDR" VARCHAR2(100 CHAR) NOT NULL ENABLE, 
	"CREATED_DATE" TIMESTAMP (6), 
	"CREATED_BY" VARCHAR2(100 CHAR), 
	"LAST_UPDATED_DATE" TIMESTAMP (6), 
	"LAST_UPDATED_BY" VARCHAR2(100 CHAR), 
	 CONSTRAINT "XODI_REMIND_CC_PK" PRIMARY KEY ("REMIND_ID", "EMAIL_ADDR")
  USING INDEX  ENABLE
   ) ;

   COMMENT ON TABLE "XODI_REMIND_CC"  IS 'Reminder CC';

  CREATE OR REPLACE EDITIONABLE TRIGGER "XODI_REMIND_CC_T" 
before 
insert or update or delete on "XODI_REMIND_CC" 
for each row 
BEGIN 
    IF INSERTING 
    THEN 
        IF :NEW.CREATED_BY IS NULL 
        THEN 
            :NEW.CREATED_BY := v('APP_USER'); 
            :NEW.CREATED_DATE := SYSDATE; 
            :NEW.LAST_UPDATED_BY := v('APP_USER'); 
            :NEW.LAST_UPDATED_DATE := SYSDATE; 
        END IF; 
    END IF; 
    IF UPDATING THEN 
      :NEW.LAST_UPDATED_BY := v('APP_USER'); 
      :NEW.LAST_UPDATED_DATE := SYSDATE; 
    END IF; 
END;
/
ALTER TRIGGER "XODI_REMIND_CC_T" ENABLE;

  CREATE TABLE "XODI_REMIND_PARAM" 
   (	"REMIND_ID" VARCHAR2(30 CHAR) NOT NULL ENABLE, 
	"PARAM_NAME" VARCHAR2(30 CHAR), 
	"FIELD_NAME" VARCHAR2(30 CHAR), 
	"CREATED_DATE" TIMESTAMP (6), 
	"CREATED_BY" VARCHAR2(100 CHAR), 
	"LAST_UPDATED_DATE" TIMESTAMP (6), 
	"LAST_UPDATED_BY" VARCHAR2(100 CHAR), 
	 CONSTRAINT "XODI_REMIND_PARAM_PK" PRIMARY KEY ("REMIND_ID", "PARAM_NAME")
  USING INDEX  ENABLE
   ) ;

   COMMENT ON TABLE "XODI_REMIND_PARAM"  IS 'Reminder Parameter';

  CREATE OR REPLACE EDITIONABLE TRIGGER "XODI_REMIND_PARAM_T" 
before 
insert or update or delete on "XODI_REMIND_PARAM" 
for each row 
BEGIN 
    IF INSERTING 
    THEN 
        IF :NEW.CREATED_BY IS NULL 
        THEN 
            :NEW.CREATED_BY := v('APP_USER'); 
            :NEW.CREATED_DATE := SYSDATE; 
            :NEW.LAST_UPDATED_BY := v('APP_USER'); 
            :NEW.LAST_UPDATED_DATE := SYSDATE; 
        END IF; 
    END IF; 
    IF UPDATING THEN 
      :NEW.LAST_UPDATED_BY := v('APP_USER'); 
      :NEW.LAST_UPDATED_DATE := SYSDATE; 
    END IF; 
END;
/
ALTER TRIGGER "XODI_REMIND_PARAM_T" ENABLE;

  CREATE TABLE "XODI_REMIND_RUNTIME" 
   (	"REMIND_ID" VARCHAR2(30 CHAR) NOT NULL ENABLE, 
	"RUNTIME" VARCHAR2(11 CHAR), 
	"CREATED_DATE" TIMESTAMP (6), 
	"CREATED_BY" VARCHAR2(100 CHAR), 
	"LAST_UPDATED_DATE" TIMESTAMP (6), 
	"LAST_UPDATED_BY" VARCHAR2(100 CHAR), 
	 CONSTRAINT "XODI_REMIND_RUNTIME_PK" PRIMARY KEY ("REMIND_ID", "RUNTIME")
  USING INDEX  ENABLE
   ) ;

   COMMENT ON TABLE "XODI_REMIND_RUNTIME"  IS 'Reminder Runtime';

  CREATE OR REPLACE EDITIONABLE TRIGGER "XODI_REMIND_RUNTIME_T" 
before 
insert or update or delete on "XODI_REMIND_RUNTIME" 
for each row 
BEGIN 
    IF INSERTING 
    THEN 
        IF :NEW.CREATED_BY IS NULL 
        THEN 
            :NEW.CREATED_BY := v('APP_USER'); 
            :NEW.CREATED_DATE := SYSDATE; 
            :NEW.LAST_UPDATED_BY := v('APP_USER'); 
            :NEW.LAST_UPDATED_DATE := SYSDATE; 
        END IF; 
    END IF; 
    IF UPDATING THEN 
      :NEW.LAST_UPDATED_BY := v('APP_USER'); 
      :NEW.LAST_UPDATED_DATE := SYSDATE; 
    END IF; 
END;
/
ALTER TRIGGER "XODI_REMIND_RUNTIME_T" ENABLE;

create or replace package "XODI_NOTIF_PKG" as
    TYPE data_header IS RECORD(
        NOTIF_ID VARCHAR2(30),
        DESCR VARCHAR2(2000),        
        COUNTER_COL NUMBER,
        VIEW_NAME VARCHAR2(30),
        MENU_NAME VARCHAR2(100),       
        MSG_TEXT VARCHAR2(2000),
        PARENT_ID VARCHAR2(30)
    );
    TYPE dt_hdr_type IS TABLE OF data_header;
    dt_hdr dt_hdr_type := dt_hdr_type();

    TYPE data_param IS RECORD(
        NOTIF_ID VARCHAR2(30),
        PARAM_NAME VARCHAR2(30),
        FIELD_NAME VARCHAR2(30)
    );
    TYPE dt_prm_type IS TABLE OF data_param;
    dt_prm dt_prm_type := dt_prm_type();

    TYPE data_param_array IS RECORD(
        NOTIF_ID VARCHAR2(30),
        PARAM1 VARCHAR2(30),
        FIELDVALUE1 VARCHAR2(256),
        PARAM2 VARCHAR2(30),
        FIELDVALUE2 VARCHAR2(256),
        PARAM3 VARCHAR2(30),
        FIELDVALUE3 VARCHAR2(256),
        PARAM4 VARCHAR2(30),
        FIELDVALUE4 VARCHAR2(256),
        PARAM5 VARCHAR2(30),
        FIELDVALUE5 VARCHAR2(256),
        PARAM6 VARCHAR2(30),
        FIELDVALUE6 VARCHAR2(256),
        PARAM7 VARCHAR2(30),
        FIELDVALUE7 VARCHAR2(256),
        PARAM8 VARCHAR2(30),
        FIELDVALUE8 VARCHAR2(256),
        PARAM9 VARCHAR2(30),
        FIELDVALUE9 VARCHAR2(256),
        PARAM10 VARCHAR2(30),
        FIELDVALUE10 VARCHAR2(256)
    );
    TYPE dt_prm_arr_type IS TABLE OF data_param_array;
    dt_prm_arr dt_prm_arr_type := dt_prm_arr_type();
    
    TYPE param_name_type IS TABLE OF VARCHAR2(30);
    TYPE field_value_type IS TABLE OF VARCHAR2(256);

    param_names param_name_type;
    field_values field_value_type;

    v_count NUMBER := NULL;
    v_counter_dtl NUMBER := NULL;
    v_view_name VARCHAR2(30);
    v_param VARCHAR2(256);
    v_msg_text VARCHAR2(200);
    v_qry VARCHAR2(2000);

    FUNCTION notif_header(p_notif_id VARCHAR2 DEFAULT NULL) RETURN dt_hdr_type PIPELINED;
    FUNCTION notif_detail(p_notif_id VARCHAR2 DEFAULT NULL) RETURN dt_hdr_type PIPELINED;
    FUNCTION get_lov_menuName RETURN CLOB;
end "XODI_NOTIF_PKG";
/

create or replace package body "XODI_NOTIF_PKG" as
    FUNCTION notif_header(p_notif_id VARCHAR2 DEFAULT NULL) RETURN dt_hdr_type PIPELINED IS
        CURSOR c_notif IS
            SELECT notif_id
                ,descr
                ,view_name
                ,msg_text
                ,menu_name
                FROM XODI_NOTIF           
                WHERE eff_status = 'A'
                    AND notif_id = NVL(p_notif_id, notif_id)
        ;

        BEGIN
            FOR get_notif IN c_notif
            LOOP
                v_count := NULL;
                v_view_name := NULL;

                v_view_name := get_notif.view_name;
                EXECUTE IMMEDIATE 'select count(*) v_count from ' || v_view_name INTO v_count;

                dt_hdr.EXTEND;
                dt_hdr(dt_hdr.LAST).NOTIF_ID := get_notif.notif_id;
                dt_hdr(dt_hdr.LAST).DESCR := get_notif.descr;
                dt_hdr(dt_hdr.LAST).COUNTER_COL := v_count;
                dt_hdr(dt_hdr.LAST).VIEW_NAME := get_notif.view_name;
                dt_hdr(dt_hdr.LAST).MENU_NAME := get_notif.menu_name;
                dt_hdr(dt_hdr.LAST).MSG_TEXT := get_notif.msg_text;
            END LOOP;

            FOR i IN 1..dt_hdr.COUNT
            LOOP
                PIPE ROW(dt_hdr(i));
            END LOOP;            

        RETURN;
    END notif_header;

    FUNCTION notif_detail(p_notif_id VARCHAR2 DEFAULT NULL) RETURN dt_hdr_type PIPELINED IS
        CURSOR c_notif_hdr IS
            SELECT notif_id
                ,descr
                ,counter_col
                ,view_name
                ,msg_text
                ,menu_name
            FROM TABLE(XODI_NOTIF_PKG.notif_header)
                where notif_id = NVL(p_notif_id, notif_id);

        CURSOR c_dt_prm(p_notif_id_cursor VARCHAR2) IS
            SELECT notif_id
                ,param_name
                ,field_name
            FROM XODI_NOTIF_PARAM
            WHERE notif_id = p_notif_id_cursor;

        BEGIN
            v_counter_dtl := 0;

            FOR get_notif_hdr IN c_notif_hdr
            LOOP
                v_counter_dtl := v_counter_dtl + 1;                

                OPEN c_dt_prm(get_notif_hdr.notif_id);
                    FETCH c_dt_prm BULK COLLECT INTO dt_prm;
                CLOSE c_dt_prm;

                v_qry := NULL;
                v_qry := 'SELECT ''' || get_notif_hdr.notif_id || ''' AS NOTIF_ID ';

                -- FOR prm_idx IN 1..dt_prm.COUNT LOOP
                FOR prm_idx IN 1..10 LOOP
                    v_param := NULL;
                    
                    IF prm_idx <= dt_prm.COUNT THEN
                        v_qry := v_qry || ', ''' || dt_prm(prm_idx).param_name || ''' AS PARAM' || to_char(prm_idx) || ', ';
                        v_qry := v_qry || dt_prm(prm_idx).field_name || ' AS FIELDVALUE' || to_char(prm_idx) ;
                    ELSE
                        v_qry := v_qry || ', '''' AS PARAM' || to_char(prm_idx) || ', ';
                        v_qry := v_qry || ' '''' AS FIELDVALUE' || to_char(prm_idx) ;
                    END IF;

                END LOOP;

                v_qry := v_qry || ' FROM ' || get_notif_hdr.view_name; 

                EXECUTE IMMEDIATE v_qry BULK COLLECT INTO dt_prm_arr;               

                FOR i in 1..get_notif_hdr.counter_col
                LOOP

                    -- replace v_msg_text
                    v_msg_text := get_notif_hdr.msg_text;
                    v_msg_text := REPLACE(v_msg_text, dt_prm_arr(i).param1, dt_prm_arr(i).fieldvalue1);
                    v_msg_text := REPLACE(v_msg_text, dt_prm_arr(i).param2, dt_prm_arr(i).fieldvalue2);
                    v_msg_text := REPLACE(v_msg_text, dt_prm_arr(i).param3, dt_prm_arr(i).fieldvalue3);
                    v_msg_text := REPLACE(v_msg_text, dt_prm_arr(i).param4, dt_prm_arr(i).fieldvalue4);
                    v_msg_text := REPLACE(v_msg_text, dt_prm_arr(i).param5, dt_prm_arr(i).fieldvalue5);
                    v_msg_text := REPLACE(v_msg_text, dt_prm_arr(i).param6, dt_prm_arr(i).fieldvalue6);
                    v_msg_text := REPLACE(v_msg_text, dt_prm_arr(i).param7, dt_prm_arr(i).fieldvalue7);
                    v_msg_text := REPLACE(v_msg_text, dt_prm_arr(i).param8, dt_prm_arr(i).fieldvalue8);
                    v_msg_text := REPLACE(v_msg_text, dt_prm_arr(i).param9, dt_prm_arr(i).fieldvalue9);
                    v_msg_text := REPLACE(v_msg_text, dt_prm_arr(i).param10, dt_prm_arr(i).fieldvalue10);        

                    dt_hdr.EXTEND;
                    dt_hdr(dt_hdr.LAST).NOTIF_ID := i;
                    dt_hdr(dt_hdr.LAST).DESCR := v_msg_text;
                    dt_hdr(dt_hdr.LAST).COUNTER_COL := NULL;
                    dt_hdr(dt_hdr.LAST).VIEW_NAME := get_notif_hdr.view_name;
                    dt_hdr(dt_hdr.LAST).PARENT_ID := get_notif_hdr.notif_id;
                    dt_hdr(dt_hdr.LAST).MENU_NAME := get_notif_hdr.menu_name;
                    dt_hdr(dt_hdr.LAST).MSG_TEXT := v_qry;

                END LOOP;
            END LOOP;

            FOR i IN 1..dt_hdr.COUNT
            LOOP
                PIPE ROW(dt_hdr(i));
            END LOOP;            

        RETURN;
    END notif_detail;

    FUNCTION get_lov_menuName RETURN CLOB IS
        --/* Function to return Query LoV 
        --* Create a function that returns a list of values (LoV) for querying menu names,
        --* where the display value corresponds to the menu name, and the return value is the associated PageId.
        --* Since there can be various methods of navigation, we need to customize the retrieval of the PageId,
        --* especially in cases of custom navigation. To achieve this, obtain the PageId from a custom table.
        --*/

        v_qry CLOB;
    BEGIN
        v_qry := 
                'SELECT
                        SYS_CONNECT_BY_PATH(name, '' -> '') "displayValue",
                        tag "returnValue"
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
                        "returnValue",
                        "displayValue"';

        return v_qry;

    END get_lov_menuName;

end "XODI_NOTIF_PKG";
/

create or replace package "XODI_REMIND_PKG" as
    function preview(p_remind_id varchar2) return CLOB;

    type table_data_rec is record(
        col_data varchar2(1000)
    );
    type table_data_rec_type is table of table_data_rec;
    tbl_dt_rec table_data_rec_type := table_data_rec_type();

    TYPE data_param_array IS RECORD(
        notif_id varchar2(30),
        param1 varchar2(30),
        fieldvalue1 varchar2(256),
        param2 varchar2(30),
        fieldvalue2 varchar2(256),
        param3 varchar2(30),
        fieldvalue3 varchar2(256),
        param4 varchar2(30),
        fieldvalue4 varchar2(256),
        param5 varchar2(30),
        fieldvalue5 varchar2(256),
        param6 varchar2(30),
        fieldvalue6 varchar2(256),
        param7 varchar2(30),
        fieldvalue7 varchar2(256),
        param8 varchar2(30),
        fieldvalue8 varchar2(256),
        param9 varchar2(30),
        fieldvalue9 varchar2(256),
        param10 varchar2(30),
        fieldvalue10 varchar2(256)
    );
    TYPE dt_prm_arr_type IS TABLE OF data_param_array;
    dt_prm_arr dt_prm_arr_type := dt_prm_arr_type();

end "XODI_REMIND_PKG";
/

create or replace package body "XODI_REMIND_PKG" as
    function preview(p_remind_id varchar2) return CLOB IS
        cursor c_remind IS
            select
                remind_id,
                descr,
                parameter,
                table_data,
                list_user,
                email_addr,
                run_type,
                subject_text,
                body_text,
                footer_text                
            from XODI_REMIND
            where remind_id = NVL(p_remind_id, remind_id);
        
        cursor c_remind_param(p_remind_id_prm VARCHAR2) IS
            select
                remind_id,
                param_name,
                field_name
            from XODI_REMIND_PARAM
            where remind_id = p_remind_id_prm;

        cursor c_remind_runtime(p_remind_id_rt_prm VARCHAR2) IS
            select 
                remind_id,
                runtime
            from XODI_REMIND_RUNTIME
            where remind_id = p_remind_id_rt_prm;

        cursor c_remind_cc(p_remind_id_cc_prm VARCHAR2) IS
            select
                remind_id,
                email_addr
            from XODI_REMIND_CC
            where remind_id = p_remind_id_cc_prm;

        cursor c_table_data_col(p_table_data_prm VARCHAR2)IS
            select
                column_id,
                data_type,
                column_name
            from user_tab_columns
            where table_name = p_table_data_prm
            order by column_id;

        c_table_data sys_refcursor;

        -- v_content VARCHAR2(5000);
        v_content CLOB;
        v_qry_list_email VARCHAR2(1000);        
        v_to_list_email VARCHAR2(500);  
        v_qry_table_data VARCHAR2(1000);
        v_sel_columns VARCHAR2(500);                                         

        begin
            v_content := NULL;                        

            for get_remind in c_remind loop              
                v_qry_list_email := NULL;

                v_content := v_content || '<p>*************************************************************</p>';                

                -- From
                v_content := v_content || '<p>From : apex@oracle.com</p>';

                -- To
                if length(get_remind.email_addr) > 1 then                    
                    v_content := v_content || '<p>To : ' || get_remind.email_addr || '</p>';
                else
                    v_qry_list_email := 'SELECT LISTAGG(email_addr, '';'') WITHIN GROUP (ORDER BY email_addr) AS email_ad FROM ' || get_remind.list_user;
                    EXECUTE IMMEDIATE v_qry_list_email INTO v_to_list_email;
                    dbms_output.put_line(v_qry_list_email);
                    v_content := v_content || '<p>To : ' || v_to_list_email || '</p>';
                end if;

                -- CC
                -- #TO DO

                -- Subject, Body
                v_content := v_content || '<p>Subject : ' || get_remind.subject_text || '</p>';
                v_content := v_content || '<p>Body : </p>' || get_remind.body_text;
                
                -- Table Data
                if length(get_remind.table_data) > 1 then
                    v_content := v_content || '<table cellspacing="0" style="border-collapse:collapse;font-family:Book Antiqua;border:thin solid;text-align:center;">';
                    
                    -- Table Data Header & select column query for Table Data Detail
                    v_content := v_content || '<tr style="border:thin solid">' || '<th style="padding:4px;background-color:#d7124a;color:white;" width="20px"><b>No</b></th>';                    
                    v_sel_columns := '''<tr style="border:thin solid">''' || '||';
                    v_sel_columns := v_sel_columns || '''<td style="padding:4px;border:thin solid">''' || '||ROWNUM||' || '''</td>''' || '||';
                    for get_table_data_col in c_table_data_col(get_remind.table_data) loop
                        v_content := v_content || '<th style="padding:4px;background-color:#d7124a;color:white;border:thin solid" width="175px"><b>' || get_table_data_col.column_name || '</b></th>';                        
                        v_sel_columns := v_sel_columns || '''<td style="padding:4px;border:thin solid">''' || '||' || get_table_data_col.column_name || '||' || '''</td>''' || '||';                        
                    end loop;
                    v_sel_columns := v_sel_columns || '''</tr>''' || 'AS COL_DATA' ;                   
                    v_content := v_content || '</tr>';

                    -- Table Data Detail
                    v_qry_table_data := 'SELECT ' || v_sel_columns || ' FROM ' || get_remind.table_data ;
                    open c_table_data for v_qry_table_data;
                        fetch c_table_data bulk collect into tbl_dt_rec;
                    close c_table_data; 

                    for idx_tbl_dt in 1..tbl_dt_rec.COUNT loop
                        v_content := v_content || tbl_dt_rec(idx_tbl_dt).col_data;                    
                    end loop;
                                     
                    v_content := v_content || '</table>';
                end if;

                -- Footer
                v_content := v_content || '<br>' || get_remind.footer_text;
                v_content := v_content || '<p>*************************************************************</p>';

                -- Replace Parameter
                if length(get_remind.parameter) > 1 then
                    open c_remind_param(get_remind.remind_id);
                        
                    close c_remind_param;
                end if;

            end loop;

        return v_content;
    end preview;
end "XODI_REMIND_PKG";
/