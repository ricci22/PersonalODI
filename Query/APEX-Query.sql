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
