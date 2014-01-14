--Script 1 *** execute as / as sysdba
set define off
set verify off
set feedback off
whenever sqlerror exit sql.sqlcode rollback

prompt
prompt ...Doit etre connecte en tant que SYS
prompt

declare
  vnu_exist					number;
  vva_schem_conct 			varchar2(30);
begin
  select username into vva_schem_conct from user_users where rownum = 1; 
  
  select 1 into vnu_exist from dual where vva_schem_conct = 'SYS';
end;
/

prompt
prompt ...AFW_040215 doit exister
prompt

declare
  kva_schem_afw_exist		varchar2(30) default 'AFW_040215';
  vnu_exist					number;
begin
  select 1 into vnu_exist from dba_users where username = kva_schem_afw_exist;
end;
/

@@install_wks.sql;
@@install_grant_synonym.sql;

commit;

prompt
prompt ...Installation - partie 1 terminee...
prompt
prompt ...Executer afwins2.sql avec AFW_040215 pour continuer...
prompt