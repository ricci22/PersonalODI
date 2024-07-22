create or replace package body "XODI_NOTIF_PKG" as
    FUNCTION notif_header(p_notif_id VARCHAR2 DEFAULT NULL) RETURN dt_hdr_type PIPELINED IS
        CURSOR c_notif IS
            SELECT notif_id
                ,descr
                ,view_name
                ,msg_text
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