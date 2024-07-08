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