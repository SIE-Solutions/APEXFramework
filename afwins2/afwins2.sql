--exécuter en tant que AFW_040200
set define off
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

@@install_modl.sql;
@@install_metdn.sql;

prompt
prompt ...Installation - partie 2 terminee...
prompt 
