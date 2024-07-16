select * from apex_mail_log order by last_updated_on desc
select * from apex_mail_queue;

DECLARE
    v_content VARCHAR2(5000);
BEGIN
v_content := v_content || ' <p>Dear, Nanda Nasution</p>' ;
v_content := v_content || ' <br>' ;
v_content := v_content || ' <p>Berikut terlampir list karyawan dengan data religion yang masih kosong</p>' ;
v_content := v_content || ' <br>' ;
v_content := v_content || ' <table cellspacing=''0'' style=''border-collapse:collapse;font-family:Book Antiqua;border:1px solid;text-align:center;''>' ;
v_content := v_content || ' <TR>' ;
v_content := v_content || ' <TH style=''padding:4px;background-color:#d7124a;color:white;'' width=''20px''><B>No</B></TH>' ;
v_content := v_content || ' <TH style=''padding:4px;background-color:#d7124a;color:white;'' width=''175px''><B>EMPLOYEE_ID</B></TH>' ;
v_content := v_content || ' <TH style=''padding:4px;background-color:#d7124a;color:white;'' width=''175px''><B>NAME</B></TH>' ;
v_content := v_content || ' </TR>' ;
v_content := v_content || ' <TR>' ;
v_content := v_content || ' <TD style=''padding:4px;''>1</TD>' ;
v_content := v_content || ' <TD style=''padding:4px;''>1990100033</TD>' ;
v_content := v_content || ' <TD style=''padding:4px;''>Ambarwati</TD>' ;
v_content := v_content || ' </TR>' ;
v_content := v_content || ' <TR>' ;
v_content := v_content || ' <TD style=''padding:4px;''>2</TD>' ;
v_content := v_content || ' <TD style=''padding:4px;''>1997110111</TD>' ;
v_content := v_content || ' <TD style=''padding:4px;''>Yenni</TD>' ;
v_content := v_content || ' </TR>' ;
v_content := v_content || ' </table>' ;
v_content := v_content || ' <br>' ;
v_content := v_content || ' <p>Berikut terlampir list karyawan dengan data religion yang masih kosong</p>' ;
v_content := v_content || ' <br>' ;
v_content := v_content || ' <p>Regards, HCM</p>' ;

                APEX_MAIL.SEND (
                    P_FROM      => 'noreply@optima-data.com', 
                    P_TO        => 'nanda.nasution@optima-data.com',  
                    P_CC        => '',
                    P_BODY      => '',
                    P_BODY_HTML => v_content,
                    P_SUBJ      => 'Reminder Update Date Religion' );
                APEX_MAIL.PUSH_QUEUE;
END;
