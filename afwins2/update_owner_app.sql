--Custom
update apex_040200.wwv_flows
   set owner = 'AFW_040215'
 where owner in ('AFW_040200', 'AFW_040101', 'AFW_040215');