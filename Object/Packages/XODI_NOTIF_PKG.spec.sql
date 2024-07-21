create or replace package "XODI_NOTIF_PKG" as
    TYPE data_header IS RECORD(
        NOTIF_ID VARCHAR2(30),
        DESCR VARCHAR2(2000),        
        COUNTER_COL NUMBER,
        VIEW_NAME VARCHAR2(30),
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