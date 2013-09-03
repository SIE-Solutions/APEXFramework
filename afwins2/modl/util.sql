SET DEFINE OFF;

Prompt Procedure ETE;

create or replace procedure "ETE" (pva_1 in varchar2 default sqlerrm,
                                   pva_2 in varchar2 default dbms_utility.format_error_backtrace (),
                                   pcl_clob in clob default null,
                                   pbl_blob in blob default null,
                                   pnu_duree_deps_fil in number default null) is
  pragma autonomous_transaction;
  vts_dernr                               timestamp default sie_03_journ_pkg.gts_dernr;
  vts_actue                               timestamp default systimestamp;
begin
  sie_03_journ_pkg.gnu_fil := sie_03_journ_pkg.gnu_fil + 1;

  if pnu_duree_deps_fil is not null then
    if sie_03_journ_pkg.gta_timst_fil.exists (pnu_duree_deps_fil) then
      vts_dernr := sie_03_journ_pkg.gta_timst_fil (pnu_duree_deps_fil);
    end if;
  end if;

  insert into   sie_03_trace_exect (un, deux, dthr, lb, bb, who_called_me, fil, duree)
       values   (nvl (pva_1, '«NULL»'),
                 nvl (pva_2, '«NULL»'),
                 vts_actue,
                 pcl_clob,
                 pbl_blob,
                 substr (dbms_utility.format_call_stack (),
                         1,
                         4000),
                 sie_03_journ_pkg.gnu_fil,
                 (extract (day from vts_actue - vts_dernr) * 86400 +
                  extract (hour from vts_actue - vts_dernr) * 3600 +
                  extract (minute from vts_actue - vts_dernr) * 60 +
                  round (extract (second from vts_actue - vts_dernr),
                         3)));

  sie_03_journ_pkg.gts_dernr := vts_actue;
  sie_03_journ_pkg.gta_timst_fil (sie_03_journ_pkg.gnu_fil) := vts_actue;

  commit;
end ete;
/

Prompt Procedure ETE_B;

create or replace procedure "ETE_B" (pva_1 in varchar2,
                                     pva_2 in boolean) is
  pragma autonomous_transaction;
  vva_2                                   varchar2 (20);
begin
  if pva_2 then
    vva_2 := 'TRUE';
  elsif not pva_2 then
    vva_2 := 'FALSE';
  end if;

  insert into   sie_03_trace_exect (un, deux, dthr, who_called_me)
       values   (pva_1,
                 vva_2,
                 systimestamp,
                 dbms_utility.format_call_stack ());

  commit;
end ete_b;
/

Prompt Procedure OP;

create or replace procedure "OP" (pva_1 in varchar2 default sqlerrm,
                                  pva_2 in varchar2 default dbms_utility.format_error_backtrace ()) is
  vva_2                                   varchar2 (32767);
begin
  if pva_2 is not null then
    vva_2 := ' -- ' || pva_2;
  end if;

  dbms_output.put_line (pva_1 || vva_2);
end op;
/
