--Executer en tant que AFW_040200
set define on
set verify off
set feedback off
whenever sqlerror exit sql.sqlcode rollback

prompt
prompt ...Doit etre connecte en tant que AFW_040200
prompt

declare
  vva_schem_conct 			varchar2(30);
  kva_schem_afw_exist		varchar2(30) default 'AFW_040200';
  vnu_exist					number;
  vnu_afw_exist				pls_integer;
begin
  select username into vva_schem_conct from user_users where rownum = 1; 
  
  select 1 into vnu_afw_exist from dual where vva_schem_conct = kva_schem_afw_exist;
end;
/

acc arg number prompt 'Application ID:   '

--prompt '&arg'

exec sie_11_insta_afw_pkg.insta_afw_aplic_apex(&arg);
commit;

prompt
prompt ...operation successful...
prompt