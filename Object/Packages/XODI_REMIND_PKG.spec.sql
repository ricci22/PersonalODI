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