set define off
set verify off
set feedback off
WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
begin wwv_flow.g_import_in_progress := true; end;
/
 
--       AAAA       PPPPP   EEEEEE  XX      XX
--      AA  AA      PP  PP  EE       XX    XX
--     AA    AA     PP  PP  EE        XX  XX
--    AAAAAAAAAA    PPPPP   EEEE       XXXX
--   AA        AA   PP      EE        XX  XX
--  AA          AA  PP      EE       XX    XX
--  AA          AA  PP      EEEEEE  XX      XX
begin
select value into wwv_flow_api.g_nls_numeric_chars from nls_session_parameters where parameter='NLS_NUMERIC_CHARACTERS';
execute immediate 'alter session set nls_numeric_characters=''.,''';
end;
/
prompt  WORKSPACE 2750512285486632
--
-- Workspace, User Group, User, and Team Development Export:
--   Date and Time:   12:46 Friday December 6, 2013
--   Exported By:     ADMIN
--   Export Type:     Workspace Export
--   Version:         4.2.2.00.11
--   Instance ID:     61827718709461
--
-- Import:
--   Using Instance Administration / Manage Workspaces
--   or
--   Using SQL*Plus as the Oracle user APEX_040200
 
begin
    wwv_flow_api.set_security_group_id(p_security_group_id=>2750512285486632);
end;
/
----------------
-- W O R K S P A C E
-- Creating a workspace will not create database schemas or objects.
-- This API creates only the meta data for this APEX workspace
prompt  Creating workspace AFW_INTERNAL...
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
end;
/
begin
wwv_flow_fnd_user_api.create_company (
  p_id => 2750628920486636
 ,p_provisioning_company_id => 2750512285486632
 ,p_short_name => 'AFW_INTERNAL'
 ,p_display_name => 'AFW_INTERNAL'
 ,p_first_schema_provisioned => 'AFW_040215'
 ,p_company_schemas => 'AFW_040215'
 ,p_ws_schema => 'AFW_040215'
 ,p_expire_fnd_user_accounts => 'Y'
 ,p_fnd_user_max_login_failures => 15
 ,p_account_status => 'ASSIGNED'
 ,p_allow_plsql_editing => 'Y'
 ,p_allow_app_building_yn => 'Y'
 ,p_allow_sql_workshop_yn => 'Y'
 ,p_allow_websheet_dev_yn => 'Y'
 ,p_allow_team_development_yn => 'Y'
 ,p_allow_to_be_purged_yn => 'Y'
 ,p_allow_restful_services_yn => 'Y'
 ,p_source_identifier => 'AFW'
 ,p_path_prefix => 'AFW_INTERNAL'
 ,p_workspace_image => wwv_flow_api.g_varchar2_table
);
end;
/
----------------
-- G R O U P S
--
prompt  Creating Groups...
----------------
-- U S E R S
-- User repository for use with APEX cookie-based authentication.
--
prompt  Creating Users...
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id      => '2750404558486632',
  p_user_name    => 'ADMIN',
  p_first_name   => '',
  p_last_name    => '',
  p_description  => '',
  p_email_address=> 'support@sie-solutions.ca',
  p_web_password => 'F17F25F7505771F15B0E440EFC815001',
  p_web_password_format => 'HEX_ENCODED_DIGEST_V2',
  p_group_ids                    => '',
  p_developer_privs              => 'ADMIN:CREATE:DATA_LOADER:EDIT:HELP:MONITOR:SQL',
  p_default_schema               => 'AFW_040215',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('201312061242','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'Y',
  p_first_password_use_occurred  => 'N',
  p_allow_app_building_yn        => 'Y',
  p_allow_sql_workshop_yn        => 'Y',
  p_allow_websheet_dev_yn        => 'Y',
  p_allow_team_development_yn    => 'Y',
  p_allow_access_to_schemas      => '');
end;
/
----------------
--Application Builder Preferences
--
----------------
--Click Count Logs
--
----------------
--csv data loading
--
----------------
--mail
--
----------------
--mail log
--
----------------
--app models
--
----------------
--password history
--
begin
  wwv_flow_api.create_password_history (
    p_id => 2750706041486637,
    p_user_id => 2750404558486632,
    p_password => 'E28A4064483C79E82721BB69CC3F6B11');
end;
/
----------------
--preferences
--
----------------
--service mods
--
----------------
--query builder
--
----------------
--sql scripts
--
----------------
--sql commands
--
----------------
--user access log
--
prompt Check Compatibility...
begin
-- This date identifies the minimum version required to import this file.
wwv_flow_team_api.check_version(p_version_yyyy_mm_dd=>'2010.05.13');
end;
/
 
begin wwv_flow.g_import_in_progress := true; wwv_flow.g_user := USER; end; 
/
 
--
prompt ...news
--
begin
null;
end;
/
--
prompt ...links
--
begin
null;
end;
/
--
prompt ...bugs
--
begin
null;
end;
/
--
prompt ...events
--
begin
null;
end;
/
--
prompt ...features
--
begin
null;
end;
/
--
prompt ...tasks
--
begin
null;
end;
/
--
prompt ...feedback
--
begin
null;
end;
/
--
prompt ...task defaults
--
begin
null;
end;
/
 
prompt ...RESTful Services
 
 
begin
 
wwv_flow_api.remove_restful_service (
  p_id => 2751010929486684 + wwv_flow_api.g_id_offset
 ,p_name => 'oracle.example.hr'
  );
 
null;
 
end;
/

prompt  ...restful service
--
--application/restful_services/oracle_example_hr
 
begin
 
wwv_flow_api.create_restful_module (
  p_id => 2751010929486684 + wwv_flow_api.g_id_offset
 ,p_name => 'oracle.example.hr'
 ,p_uri_prefix => 'hr/'
 ,p_parsing_schema => 'AFW_040215'
 ,p_items_per_page => 10
 ,p_status => 'PUBLISHED'
  );
 
wwv_flow_api.create_restful_template (
  p_id => 2752413048486690 + wwv_flow_api.g_id_offset
 ,p_module_id => 2751010929486684 + wwv_flow_api.g_id_offset
 ,p_uri_template => 'empinfo/'
 ,p_priority => 0
 ,p_etag_type => 'HASH'
  );
 
wwv_flow_api.create_restful_handler (
  p_id => 2752516948486690 + wwv_flow_api.g_id_offset
 ,p_template_id => 2752413048486690 + wwv_flow_api.g_id_offset
 ,p_source_type => 'QUERY'
 ,p_format => 'CSV'
 ,p_method => 'GET'
 ,p_require_https => 'NO'
 ,p_source => 
'select * from emp'
  );
 
wwv_flow_api.create_restful_template (
  p_id => 2751128590486687 + wwv_flow_api.g_id_offset
 ,p_module_id => 2751010929486684 + wwv_flow_api.g_id_offset
 ,p_uri_template => 'employees/'
 ,p_priority => 0
 ,p_etag_type => 'HASH'
  );
 
wwv_flow_api.create_restful_handler (
  p_id => 2751229960486688 + wwv_flow_api.g_id_offset
 ,p_template_id => 2751128590486687 + wwv_flow_api.g_id_offset
 ,p_source_type => 'QUERY'
 ,p_format => 'DEFAULT'
 ,p_method => 'GET'
 ,p_items_per_page => 7
 ,p_require_https => 'NO'
 ,p_source => 
'select empno "$uri", empno, ename'||unistr('\000a')||
'  from ('||unistr('\000a')||
'       select emp.*'||unistr('\000a')||
'            , row_number() over (order by empno) rn'||unistr('\000a')||
'         from emp'||unistr('\000a')||
'       ) tmp'||unistr('\000a')||
' where rn between :row_offset and :row_count '
  );
 
wwv_flow_api.create_restful_template (
  p_id => 2751321687486688 + wwv_flow_api.g_id_offset
 ,p_module_id => 2751010929486684 + wwv_flow_api.g_id_offset
 ,p_uri_template => 'employees/{id}'
 ,p_priority => 0
 ,p_etag_type => 'HASH'
  );
 
wwv_flow_api.create_restful_handler (
  p_id => 2751415005486688 + wwv_flow_api.g_id_offset
 ,p_template_id => 2751321687486688 + wwv_flow_api.g_id_offset
 ,p_source_type => 'QUERY_1_ROW'
 ,p_format => 'DEFAULT'
 ,p_method => 'GET'
 ,p_require_https => 'NO'
 ,p_source => 
'select * from emp'||unistr('\000a')||
' where empno = :id'
  );
 
wwv_flow_api.create_restful_param (
  p_id => 2751523453486690 + wwv_flow_api.g_id_offset
 ,p_handler_id => 2751415005486688 + wwv_flow_api.g_id_offset
 ,p_name => 'ID'
 ,p_bind_variable_name => 'ID'
 ,p_source_type => 'HEADER'
 ,p_access_method => 'IN'
 ,p_param_type => 'STRING'
  );
 
wwv_flow_api.create_restful_template (
  p_id => 2751605657486690 + wwv_flow_api.g_id_offset
 ,p_module_id => 2751010929486684 + wwv_flow_api.g_id_offset
 ,p_uri_template => 'employeesfeed/'
 ,p_priority => 0
 ,p_etag_type => 'HASH'
  );
 
wwv_flow_api.create_restful_handler (
  p_id => 2751722423486690 + wwv_flow_api.g_id_offset
 ,p_template_id => 2751605657486690 + wwv_flow_api.g_id_offset
 ,p_source_type => 'FEED'
 ,p_format => 'DEFAULT'
 ,p_method => 'GET'
 ,p_items_per_page => 25
 ,p_require_https => 'NO'
 ,p_source => 
'select empno, ename from emp order by deptno, ename'
  );
 
wwv_flow_api.create_restful_template (
  p_id => 2751824678486690 + wwv_flow_api.g_id_offset
 ,p_module_id => 2751010929486684 + wwv_flow_api.g_id_offset
 ,p_uri_template => 'employeesfeed/{id}'
 ,p_priority => 0
 ,p_etag_type => 'HASH'
  );
 
wwv_flow_api.create_restful_handler (
  p_id => 2751931145486690 + wwv_flow_api.g_id_offset
 ,p_template_id => 2751824678486690 + wwv_flow_api.g_id_offset
 ,p_source_type => 'QUERY'
 ,p_format => 'CSV'
 ,p_method => 'GET'
 ,p_require_https => 'NO'
 ,p_source => 
'select * from emp where empno = :id'
  );
 
wwv_flow_api.create_restful_template (
  p_id => 2752004028486690 + wwv_flow_api.g_id_offset
 ,p_module_id => 2751010929486684 + wwv_flow_api.g_id_offset
 ,p_uri_template => 'empsec/{empname}'
 ,p_priority => 0
 ,p_etag_type => 'HASH'
  );
 
wwv_flow_api.create_restful_handler (
  p_id => 2752120909486690 + wwv_flow_api.g_id_offset
 ,p_template_id => 2752004028486690 + wwv_flow_api.g_id_offset
 ,p_source_type => 'QUERY'
 ,p_format => 'DEFAULT'
 ,p_method => 'GET'
 ,p_require_https => 'NO'
 ,p_source => 
'select empno, ename, deptno, job from emp '||unistr('\000a')||
'	where ((select job from emp where ename = :empname) IN (''PRESIDENT'', ''MANAGER'')) '||unistr('\000a')||
'    OR  '||unistr('\000a')||
'    (deptno = (select deptno from emp where ename = :empname)) '||unistr('\000a')||
'order by deptno, ename'||unistr('\000a')||
''
  );
 
wwv_flow_api.create_restful_template (
  p_id => 2752210720486690 + wwv_flow_api.g_id_offset
 ,p_module_id => 2751010929486684 + wwv_flow_api.g_id_offset
 ,p_uri_template => 'empsecformat/{empname}'
 ,p_priority => 0
 ,p_etag_type => 'HASH'
  );
 
wwv_flow_api.create_restful_handler (
  p_id => 2752328493486690 + wwv_flow_api.g_id_offset
 ,p_template_id => 2752210720486690 + wwv_flow_api.g_id_offset
 ,p_source_type => 'PLSQL'
 ,p_format => 'DEFAULT'
 ,p_method => 'GET'
 ,p_require_https => 'NO'
 ,p_source => 
'DECLARE'||unistr('\000a')||
'  prevdeptno   number;'||unistr('\000a')||
'  deptloc      varchar2(30);'||unistr('\000a')||
'  deptname     varchar2(30);'||unistr('\000a')||
'  CURSOR getemps IS select * from emp '||unistr('\000a')||
'                     where ((select job from emp where ename = :empname)  IN (''PRESIDENT'', ''MANAGER'')) '||unistr('\000a')||
'                        or deptno = (select deptno from emp where ename = :empname) '||unistr('\000a')||
'                     order by deptno, ename;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  sys.htp.htmlopen;'||unistr('\000a')||
'  sys.htp.he'||
'adopen;'||unistr('\000a')||
'  sys.htp.title(''Departments'');'||unistr('\000a')||
'  sys.htp.headclose;'||unistr('\000a')||
'  sys.htp.bodyopen;'||unistr('\000a')||
' '||unistr('\000a')||
'  for emprecs in getemps'||unistr('\000a')||
'  loop'||unistr('\000a')||
''||unistr('\000a')||
'      if emprecs.deptno != prevdeptno or prevdeptno is null then'||unistr('\000a')||
'          select dname, loc into deptname, deptloc '||unistr('\000a')||
'            from dept where deptno = (select deptno from emp where ename = emprecs.ename);'||unistr('\000a')||
'          if prevdeptno is not null then'||unistr('\000a')||
'              sys.htp.print(''</ul>'''||
');'||unistr('\000a')||
'          end if;'||unistr('\000a')||
'          sys.htp.print(''Department '' || deptname || '' located in '' || deptloc || ''<p/>'');'||unistr('\000a')||
'          sys.htp.print(''<ul>'');'||unistr('\000a')||
'      end if;'||unistr('\000a')||
''||unistr('\000a')||
'      sys.htp.print(''<li>'' || emprecs.ename || '', '' || emprecs.job || '', '' || emprecs.sal || ''</li>'');'||unistr('\000a')||
''||unistr('\000a')||
'      prevdeptno := emprecs.deptno;'||unistr('\000a')||
''||unistr('\000a')||
'  end loop;'||unistr('\000a')||
'  sys.htp.print(''</ul>'');'||unistr('\000a')||
'  sys.htp.bodyclose;'||unistr('\000a')||
'  sys.htp.htmlclose;'||unistr('\000a')||
'END;'||unistr('\000a')||
''
  );
 
null;
 
end;
/

-- SET SCHEMA
 
begin
 
   wwv_flow_api.g_id_offset := 0;
   wwv_flow_hint.g_schema   := 'AFW_040215';
   wwv_flow_hint.check_schema_privs;
 
end;
/

 
--------------------------------------------------------------------
prompt  SCHEMA AFW_040215 - User Interface Defaults, Table Defaults
--
-- Import using sqlplus as the Oracle user: APEX_040200
-- Exported 12:46 Friday December 6, 2013 by: ADMIN
--
 
--------------------------------------------------------------------
prompt User Interface Defaults, Attribute Dictionary
--
-- Exported 12:46 Friday December 6, 2013 by: ADMIN
--
-- SHOW EXPORTING WORKSPACE
 
begin
 
   wwv_flow_api.g_id_offset := 0;
   wwv_flow_hint.g_exp_workspace := 'AFW_INTERNAL';
 
end;
/

commit;
begin
execute immediate 'begin sys.dbms_session.set_nls( param => ''NLS_NUMERIC_CHARACTERS'', value => '''''''' || replace(wwv_flow_api.g_nls_numeric_chars,'''''''','''''''''''') || ''''''''); end;';
end;
/
set verify on
set feedback on
set define on
prompt  ...done
