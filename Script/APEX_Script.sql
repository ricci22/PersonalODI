-- SELECT DISTINCT workspace FROM apex_appl_acl_users;

-- SELECT *
--   FROM apex_appl_acl_users
--  WHERE workspace = 'HCM'
--    AND application_id = 210;

BEGIN
    APEX_UTIL.set_workspace ('HCM');
    APEX_ACL.add_user_role (p_application_id   => 210,
                            p_user_name        => 'Your Username',
                            p_role_static_id   => 'ADMINISTRATOR');
    commit;
END;
/