spool afwins2_modl.log;

@@tab.sql;
@@seq.sql;
@@view.sql;
@@util.sql;
@@pkg.sql;
@@trg.sql;
@@index.sql;
@@cons_pk.sql;
@@cons_uk.sql;
@@cons_ck.sql;
@@cons_fk.sql;

prompt
prompt ...Compilation de AFW_040200...
prompt

exec DBMS_UTILITY.compile_schema(schema => 'AFW_040200');

--Contient le minimum pour faire fonctionner AFW (AFW_ADMIN + droit)
@@install_admin.sql;

spool off;