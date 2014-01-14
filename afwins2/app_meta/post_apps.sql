set define off
set serveroutput on
set feedback off

alter session set current_schema = afw_040215;

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$11_aplic;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_11_aplic');
  end if;
end;
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_11_aplic');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$11_versn;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_11_versn');
  end if;
end;
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_11_versn');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_type_fichr;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_13_type_fichr');
  end if;
end;
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_13_type_fichr');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$01_code_err_oracl;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_01_code_err_oracl');
  end if;
end;
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_01_code_err_oracl');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$01_type_comnc;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_01_type_comnc');
  end if;
end;
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_01_type_comnc');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$21_plugn_calnd_coulr;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_21_plugn_calnd_coulr');
  end if;
end;
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_21_plugn_calnd_coulr');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_12_FONCT' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_11_PARMT_AFW' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_12_DOMN_FONCT' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_13_OPERT_OPTIO' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_12_GR_UT_OPERT_OPTIO_DOMN' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_12_FONCT_STRUC_APLIC' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_30_CARNT_APLIC' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_07_VALR_AUDIT_STRUC_APLIC' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_12_ACTIO_AUDIT' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_01_MESG' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_12_ATRIB_STRUC_APLIC' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_30_AFECT_ITEM' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_30_PAGE_ITEM' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_30_CARNT_SPRIN' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_30_ITEM_CARNT_SPRIN' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_30_CARNT_PRODT' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_30_EFORT_ITEM' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_30_PAGE' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_12_REQT_INTER_UTILS' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_23_RESLT_RECHR' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_30_HISTR_EFORT_RESTN' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_30_ITEM_CARNT_PRODT' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_30_CAS_UTILS' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_25_CHAMP_PUBLC_TRAVL' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_25_OCURN_PARMT_PUBLC_TRAVL' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_23_DETL_APLIC_MODL_RECHR' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_23_ENONC_RECHR' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_23_PATRN_RECHR' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_23_APLIC_MODL_RECHR' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_12_STRUC_APLIC_SUIVI' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_01_MODL_COMNC' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_25_TYPE_TRAVL' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_01_CONFG_EVENM_NOTFB' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_01_MODL_AFICH_NOTFC' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_01_TYPE_COMNC' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_17_COMPT_TWILI' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_17_PIECE_TELCP_AXIAT' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_17_SMS_TWILI' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_01_EVENM_NOTFB' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_17_COMPT_AXIAT' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_23_MODL_RECHR' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_01_NOTFC' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_01_ATRIB_MODL_COMNC' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_23_DETL_RESLT_RECHR' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_12_STRUC_APLIC_DESTN' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_23_RECHR' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_03_JOURN_STRUC_APLIC' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_01_RESLT_DESTN' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_17_TELCP_AXIAT' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_25_VALR_CHAMP' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_01_MESG_LANG' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_17_SMS_TWILI_ENTRA' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_01_MESG_ERR_LIE' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_01_CODE_ERR_ORCL' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_01_LANG' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_21_PLUGN_ITEM_MENU' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_21_PLUGN_MENU' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_29_RESLT_REQUT_AQ' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_29_CONTR' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_25_CHAMP' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_25_VERSN_PUBLC' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_01_DESTN' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_13_EXPOR_APLIC' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_12_STRUC_ADMIN' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_13_PAGE_IR_COLN' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_07_INSTA_SEMPH' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_12_LIEN_GROUP_UTILS' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_04_FIL_ARIAN' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_12_LIEN_STRUC' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_01_MESG_TRADC_APEX' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_19_CLE' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_13_NAVGT' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_19_SPECF_FONCT' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_12_STAT' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_13_INSTA_PREFR' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_04_CONTX' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_19_FONCT_LANG' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_13_PAGE_ITEM' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_14_DOMN_VALR' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_12_STRUC_APLIC' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_12_STRUC_APLIC_LANG' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_19_FONCT' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_14_TYPE_DOMN_VALR' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_13_OPERT' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_12_GROUP_UTILS' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_12_TYPE_STRUC' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_12_UTILS' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_13_PAGE' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_13_PAGE_IR' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_14_FORMT' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_13_REGN_PILTB' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_01_LANG_LANG' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_04_CONTX_ETEND' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_01_MESG_INFOR' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_12_MEMBR_STRUC' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_14_DETL_DOMN_VALR' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_12_SESN' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_11_PRODT_LANG' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_13_PREFR' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_07_ETAT_SESN' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_13_LISTE_NAVGT' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_12_EVOLT_STAT' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_19_DISPN_FONCT' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_11_PRODT' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_07_SEMPH' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_03_JOURN' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_12_DEFNT_ACCES' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_13_CONDT_PILTB' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_21_PLUGN_CALND' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_13_CONDT_EXECT' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_20_MODL' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_25_TYPE_PUBLC' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_20_DETL_DOCMN' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_20_SECTN_DOCMN' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_20_DOCMN' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_12_DOMN_UTILS' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_25_GROUP_PUBLC' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_13_TYPE_FICHR' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_11_ENTIT' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_13_LIEN_CONDT_PILTB' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_13_ITEM_MENU' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_13_MIME_TYPE' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_25_ELEMN_CONFG_PUBLC' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_20_MODL_PARMT' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_12_HISTR_ACCES' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_21_PLUGN_ARBRE' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_13_PAGE_LANG' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_01_ELEMN_CONFG_EVENM_NOTFB' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_25_ENGIN_VERSN_PUBLC' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_25_JOURN_TRAVL_EXECT' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_13_RESRC' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_13_FORMT_RESRC' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_03_LIEN_CLAS_INTER_UTILS' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_12_DOMN' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_21_PLUGN_CALND_TYPE' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_25_DOMN_TYPE_PUBLC' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_20_MODL_EXCEP' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_25_PARMT_PUBLC_TRAVL' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_13_EXPOR_PAGE' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_25_PUBLC_TRAVL' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_21_PLUGN_ARBRE_NOEUD' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_11_PRODT_RESRC' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_19_BOUTN' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_20_DEPLM' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_04_NAVGT_HISTR' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_13_EMPLA_DOSR_VIRTL' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_13_PAGE_PREFR_NAVGT' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_12_GROUP_STAT' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_11_VERSN' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_13_MENU' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_25_PARMT_TYPE_PUBLC' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_13_DOSR_VIRTL' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_11_UTILS' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_12_FAVR' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_13_PAGE_ITEM_LANG' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_13_NAVGT_ELEMN' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_13_REGN_PILTB_LANG' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_25_TRAVL' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_25_ENGIN' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_01_HIERC_APLIC' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_03_CLAS_INTER' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_17_PROFL_COURL' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_13_OCURN_RESRC' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_25_VALR_ELEMN_CONFG' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_03_TRACE_EXECT' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_12_ARBRE_NOEUD' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_25_PARMT_PUBLC_TRAVL_EXECT' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_11_ATRIB_ENTIT' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_12_ARBRE' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_01_MODL_MESG_NOTFC' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_01_DESTN_CONFG_EVENM_NOTFB' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_01_OCURN_SA_EVENM_NOTFB' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_21_PLUGN_CALND_COULR' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_17_COURL' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_17_COURL_PIECE_JOINT' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_17_COURL_DESTN' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_11_APLIC' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_07_AUDIT_STRUC_APLIC' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_25_PUBLC' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_11_PLUGN' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_17_PROPR_COURL_ENTRA' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_17_ATACH_COURL_ENTRA' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
update sie_11_entit set ref_atrib_entit_supr = null where code = 'SIE_17_COURL_ENTRA' and ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Select');
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$11_entit;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_11_entit');
  end if;
end;
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_11_entit');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$01_modl_comnc;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_01_modl_comnc');
  end if;
end;
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_01_modl_comnc');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$14_formt;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_14_formt');
  end if;
end;
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_14_formt');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_COURT' and ref_entit = sie$migrt$pkg.obten_var_entit(6658, 'Select');
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('sie_11_atrib_entit');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('sie_11_atrib_entit');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_VARCH' and ref_entit = sie$migrt$pkg.obten_var_entit(6701, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC_PRESN' and ref_entit = sie$migrt$pkg.obten_var_entit(6658, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6707, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6642, 'Update') where code = 'REF_STRUC_APLIC' and ref_entit = sie$migrt$pkg.obten_var_entit(6669, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM_TABLE' and ref_entit = sie$migrt$pkg.obten_var_entit(6615, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6707, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6645, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6686, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6690, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6610, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_REINT_NAVGT' and ref_entit = sie$migrt$pkg.obten_var_entit(6684, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'MESG' and ref_entit = sie$migrt$pkg.obten_var_entit(6613, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'MESG_AIDE_CONTX' and ref_entit = sie$migrt$pkg.obten_var_entit(6706, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6624, 'Update') where code = 'REF_DESTN' and ref_entit = sie$migrt$pkg.obten_var_entit(6610, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_VARCH4' and ref_entit = sie$migrt$pkg.obten_var_entit(6732, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6711, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_ELEMN_CONFG_PUBLC' and ref_entit = sie$migrt$pkg.obten_var_entit(6729, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_DEBUT_EFECT' and ref_entit = sie$migrt$pkg.obten_var_entit(6657, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = sie$migrt$pkg.obten_var_entit(6672, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6646, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6645, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = sie$migrt$pkg.obten_var_entit(6647, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6690, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6704, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'LIBL_REGN' and ref_entit = sie$migrt$pkg.obten_var_entit(6651, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6639, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'EREUR' and ref_entit = sie$migrt$pkg.obten_var_entit(6668, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6654, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6673, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6704, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6626, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DERNR_PRODT_ACCES' and ref_entit = sie$migrt$pkg.obten_var_entit(6649, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'WHO_CALLED_ME' and ref_entit = sie$migrt$pkg.obten_var_entit(6730, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'TYPE_DON' and ref_entit = sie$migrt$pkg.obten_var_entit(6715, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'TAIL_TABL_EXTRA' and ref_entit = sie$migrt$pkg.obten_var_entit(6634, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6569, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6569, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6590, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DOMN' and ref_entit = sie$migrt$pkg.obten_var_entit(6729, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6726, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6680, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6666, 'Update') where code = 'REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6713, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_IGNOR' and ref_entit = sie$migrt$pkg.obten_var_entit(6638, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6718, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_LANG' and ref_entit = sie$migrt$pkg.obten_var_entit(6660, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6650, 'Update') where code = 'REF_PAGE' and ref_entit = sie$migrt$pkg.obten_var_entit(6640, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6626, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_NUMBR4' and ref_entit = sie$migrt$pkg.obten_var_entit(6732, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = sie$migrt$pkg.obten_var_entit(6642, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6661, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'ID_APEX' and ref_entit = sie$migrt$pkg.obten_var_entit(6627, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_VARCH1' and ref_entit = sie$migrt$pkg.obten_var_entit(6732, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6658, 'Update') where code = 'REF_DV_CONDT_UTILS' and ref_entit = sie$migrt$pkg.obten_var_entit(6661, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6675, 'Update') where code = 'REF_TYPE_PUBLC' and ref_entit = sie$migrt$pkg.obten_var_entit(6715, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6613, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6697, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6647, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_FONCT' and ref_entit = sie$migrt$pkg.obten_var_entit(6639, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_DEBUT_EFECT' and ref_entit = sie$migrt$pkg.obten_var_entit(6729, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'ADJEC_DEMNS' and ref_entit = sie$migrt$pkg.obten_var_entit(6643, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6672, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6719, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6681, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6728, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6716, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PREFR' and ref_entit = sie$migrt$pkg.obten_var_entit(6637, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6655, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM_PHYSQ' and ref_entit = sie$migrt$pkg.obten_var_entit(6728, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_UTILS' and ref_entit = sie$migrt$pkg.obten_var_entit(6579, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6703, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6580, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6682, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DV_TYPE_REQT_INTER' and ref_entit = sie$migrt$pkg.obten_var_entit(6581, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_DEFT_ATRIB2' and ref_entit = sie$migrt$pkg.obten_var_entit(6644, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_ARBRE' and ref_entit = sie$migrt$pkg.obten_var_entit(6731, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6634, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'ENONC_TRIER_PAR' and ref_entit = sie$migrt$pkg.obten_var_entit(6689, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6644, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_SUPRS' and ref_entit = sie$migrt$pkg.obten_var_entit(6640, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'LARGR' and ref_entit = sie$migrt$pkg.obten_var_entit(6695, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'IMAGE_SPRIT' and ref_entit = sie$migrt$pkg.obten_var_entit(6689, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6642, 'Update') where code = 'REF_STRUC_APLIC' and ref_entit = sie$migrt$pkg.obten_var_entit(6573, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6588, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6606, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6606, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6590, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'MOT' and ref_entit = sie$migrt$pkg.obten_var_entit(6589, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6608, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6606, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_MODL_RECHR' and ref_entit = sie$migrt$pkg.obten_var_entit(6591, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'ENONC_PLSQL_GAUCH' and ref_entit = sie$migrt$pkg.obten_var_entit(6590, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'FORMT' and ref_entit = sie$migrt$pkg.obten_var_entit(6691, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_ATRIB_SA_ADRES_DESTN' and ref_entit = sie$migrt$pkg.obten_var_entit(6736, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6737, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM_SCHEM' and ref_entit = sie$migrt$pkg.obten_var_entit(6642, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DERNR_DOMN_ACCES' and ref_entit = sie$migrt$pkg.obten_var_entit(6649, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PROFL_SMS_NOTFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6697, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6600, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = sie$migrt$pkg.obten_var_entit(6605, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6601, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6597, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6575, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6597, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6598, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'ID_SESN' and ref_entit = sie$migrt$pkg.obten_var_entit(6600, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'GROUP_SMS' and ref_entit = sie$migrt$pkg.obten_var_entit(6600, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'MIME_TYPE' and ref_entit = sie$migrt$pkg.obten_var_entit(6599, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6607, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6598, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_TELCP_AXIAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6599, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'COULR_ARIER_PLAN' and ref_entit = sie$migrt$pkg.obten_var_entit(6698, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = sie$migrt$pkg.obten_var_entit(6576, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_ITEM_CARNT_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6574, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6594, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6596, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'COULR_TITRE' and ref_entit = sie$migrt$pkg.obten_var_entit(6596, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6580, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_LIBL_STRUC_APLIC' and ref_entit = sie$migrt$pkg.obten_var_entit(6582, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6583, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_CAS_UTILS' and ref_entit = sie$migrt$pkg.obten_var_entit(6584, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6582, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6684, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NUMR_PAGE_APEX' and ref_entit = sie$migrt$pkg.obten_var_entit(6581, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6592, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6703, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6592, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_SUCRS_IMPLA' and ref_entit = sie$migrt$pkg.obten_var_entit(6592, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_REINT_SIDF' and ref_entit = sie$migrt$pkg.obten_var_entit(6663, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6624, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6573, 'Update') where code = 'REF_ATRIB_STRUC_APLIC' and ref_entit = sie$migrt$pkg.obten_var_entit(6624, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6739, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'PORT' and ref_entit = sie$migrt$pkg.obten_var_entit(6739, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_MODIF' and ref_entit = sie$migrt$pkg.obten_var_entit(6622, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PUBLC_TRAVL' and ref_entit = sie$migrt$pkg.obten_var_entit(6612, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_NOMBR' and ref_entit = sie$migrt$pkg.obten_var_entit(6612, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6572, 'Update') where code = 'REF_MESG_TROP_DON_TROUV' and ref_entit = sie$migrt$pkg.obten_var_entit(6650, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DOMN' and ref_entit = sie$migrt$pkg.obten_var_entit(6648, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6692, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6614, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6614, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_MESG_RANGE_MODF' and ref_entit = sie$migrt$pkg.obten_var_entit(6666, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6572, 'Update') where code = 'REF_MESG_RANGE_INSER_SPECF' and ref_entit = sie$migrt$pkg.obten_var_entit(6650, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'TW_RECPT_FROMCITY' and ref_entit = sie$migrt$pkg.obten_var_entit(6614, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'ID_APEX_REGN' and ref_entit = sie$migrt$pkg.obten_var_entit(6734, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6737, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6738, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_HIERC_APLIC' and ref_entit = sie$migrt$pkg.obten_var_entit(6737, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DOMN' and ref_entit = sie$migrt$pkg.obten_var_entit(6595, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_APLIC' and ref_entit = sie$migrt$pkg.obten_var_entit(6653, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_APLIC' and ref_entit = sie$migrt$pkg.obten_var_entit(6661, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'PAGE_PERST' and ref_entit = sie$migrt$pkg.obten_var_entit(6628, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6716, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6649, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6640, 'Update') where code = 'REF_PAGE_ITEM' and ref_entit = sie$migrt$pkg.obten_var_entit(6683, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6652, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_VARCH10' and ref_entit = sie$migrt$pkg.obten_var_entit(6732, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6689, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6714, 'Update') where code = 'REF_MENU' and ref_entit = sie$migrt$pkg.obten_var_entit(6684, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6667, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_LECTR_SEUL' and ref_entit = sie$migrt$pkg.obten_var_entit(6683, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = sie$migrt$pkg.obten_var_entit(6716, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = sie$migrt$pkg.obten_var_entit(6666, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_EXTRA_TOTAL' and ref_entit = sie$migrt$pkg.obten_var_entit(6634, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6706, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6653, 'Update') where code = 'REF_REGN_PILTB' and ref_entit = sie$migrt$pkg.obten_var_entit(6721, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = sie$migrt$pkg.obten_var_entit(6713, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6724, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'OBJET' and ref_entit = sie$migrt$pkg.obten_var_entit(6735, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6724, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'HEURE_FIN_EXTEN' and ref_entit = sie$migrt$pkg.obten_var_entit(6671, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CORPS_MESG' and ref_entit = sie$migrt$pkg.obten_var_entit(6735, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6735, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6573, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6573, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6735, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DOMN' and ref_entit = sie$migrt$pkg.obten_var_entit(6735, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_EVENM_NOTFB' and ref_entit = sie$migrt$pkg.obten_var_entit(6595, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6742, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6724, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'HEURE_DEBUT_EXTEN' and ref_entit = sie$migrt$pkg.obten_var_entit(6671, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOMBR_MINTS_INTER' and ref_entit = sie$migrt$pkg.obten_var_entit(6671, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = sie$migrt$pkg.obten_var_entit(6595, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = sie$migrt$pkg.obten_var_entit(6735, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = sie$migrt$pkg.obten_var_entit(6735, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'HEURE_FIN_NORML' and ref_entit = sie$migrt$pkg.obten_var_entit(6671, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'APLIC_PRIOR' and ref_entit = sie$migrt$pkg.obten_var_entit(6724, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = sie$migrt$pkg.obten_var_entit(6694, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6650, 'Update') where code = 'REF_PAGE_LISTE' and ref_entit = sie$migrt$pkg.obten_var_entit(6642, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_NUMBR' and ref_entit = sie$migrt$pkg.obten_var_entit(6655, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_NUMBR1' and ref_entit = sie$migrt$pkg.obten_var_entit(6732, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'FORML_VALR_SCPC' and ref_entit = sie$migrt$pkg.obten_var_entit(6684, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'COLN_AIDE_INSTA' and ref_entit = sie$migrt$pkg.obten_var_entit(6671, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = sie$migrt$pkg.obten_var_entit(6641, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_ATRIB_3' and ref_entit = sie$migrt$pkg.obten_var_entit(6635, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_SESN' and ref_entit = sie$migrt$pkg.obten_var_entit(6702, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6673, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6734, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6642, 'Update') where code = 'REF_STRUC_APLIC' and ref_entit = sie$migrt$pkg.obten_var_entit(6643, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6671, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_FONCT' and ref_entit = sie$migrt$pkg.obten_var_entit(6665, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6634, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DV_TYPE_ACTIO' and ref_entit = sie$migrt$pkg.obten_var_entit(6644, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6628, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6651, 'Update') where code = 'REF_PAGE_IR' and ref_entit = sie$migrt$pkg.obten_var_entit(6711, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6680, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_NUMBR7' and ref_entit = sie$migrt$pkg.obten_var_entit(6732, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6617, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6646, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6695, 'Update') where code = 'REF_FORMT_RESRC' and ref_entit = sie$migrt$pkg.obten_var_entit(6689, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = sie$migrt$pkg.obten_var_entit(6715, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6716, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE_VALR' and ref_entit = sie$migrt$pkg.obten_var_entit(6658, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_UTILS' and ref_entit = sie$migrt$pkg.obten_var_entit(6688, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DISPN_FONCT' and ref_entit = sie$migrt$pkg.obten_var_entit(6633, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6720, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6660, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6694, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_PUBLC' and ref_entit = sie$migrt$pkg.obten_var_entit(6694, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = sie$migrt$pkg.obten_var_entit(6663, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'MODE_CACHE' and ref_entit = sie$migrt$pkg.obten_var_entit(6689, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6716, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6662, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6704, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_EXTRA_TOUT' and ref_entit = sie$migrt$pkg.obten_var_entit(6666, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6734, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'COLN_AIDE_INSTA' and ref_entit = sie$migrt$pkg.obten_var_entit(6689, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6660, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_COMNC_PAR_RACN' and ref_entit = sie$migrt$pkg.obten_var_entit(6689, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6717, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6664, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6639, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'LIBL' and ref_entit = sie$migrt$pkg.obten_var_entit(6706, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6720, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6669, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6636, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_VARCH3' and ref_entit = sie$migrt$pkg.obten_var_entit(6732, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'LARGR_REGN_ARBRE' and ref_entit = sie$migrt$pkg.obten_var_entit(6689, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DV_TYPE_MODL' and ref_entit = sie$migrt$pkg.obten_var_entit(6674, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_COURN' and ref_entit = sie$migrt$pkg.obten_var_entit(6720, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'LIBL' and ref_entit = sie$migrt$pkg.obten_var_entit(6630, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'URL_SERVL' and ref_entit = sie$migrt$pkg.obten_var_entit(6723, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_FORMT' and ref_entit = sie$migrt$pkg.obten_var_entit(6705, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6635, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = sie$migrt$pkg.obten_var_entit(6642, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_VERSN' and ref_entit = sie$migrt$pkg.obten_var_entit(6666, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6670, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6725, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_DATE9' and ref_entit = sie$migrt$pkg.obten_var_entit(6732, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SESS_ID' and ref_entit = sie$migrt$pkg.obten_var_entit(6656, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6712, 'Update') where code = 'REF_GROUP_STAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6636, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6650, 'Update') where code = 'REF_PAGE' and ref_entit = sie$migrt$pkg.obten_var_entit(6684, 'Select');
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('sie_11_atrib_entit');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('sie_11_atrib_entit');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'COLN_DATE_FIN' and ref_entit = sie$migrt$pkg.obten_var_entit(6671, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'FORML_VALR_SSPI' and ref_entit = sie$migrt$pkg.obten_var_entit(6684, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6669, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = sie$migrt$pkg.obten_var_entit(6671, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PAGE' and ref_entit = sie$migrt$pkg.obten_var_entit(6635, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE_UTILS' and ref_entit = sie$migrt$pkg.obten_var_entit(6649, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC_CONTX_INTER' and ref_entit = sie$migrt$pkg.obten_var_entit(6638, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6639, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6722, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = sie$migrt$pkg.obten_var_entit(6682, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_EXTRA_TERMN' and ref_entit = sie$migrt$pkg.obten_var_entit(6634, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6722, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6728, 'Update') where code = 'REF_OCURN_RESRC' and ref_entit = sie$migrt$pkg.obten_var_entit(6704, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6675, 'Update') where code = 'REF_TYPE_PUBLC' and ref_entit = sie$migrt$pkg.obten_var_entit(6672, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6679, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6650, 'Update') where code = 'REF_PAGE_RECHR' and ref_entit = sie$migrt$pkg.obten_var_entit(6650, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6731, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6689, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PRODT_LANG' and ref_entit = sie$migrt$pkg.obten_var_entit(6678, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6733, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_ITEM' and ref_entit = sie$migrt$pkg.obten_var_entit(6635, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6704, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6723, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'TAIL_TABL_EXTRA' and ref_entit = sie$migrt$pkg.obten_var_entit(6642, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'MOT_PASSE' and ref_entit = sie$migrt$pkg.obten_var_entit(6649, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'MIME_TYPE' and ref_entit = sie$migrt$pkg.obten_var_entit(6685, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DV_TYPE_MESG_AIDE_CONTX' and ref_entit = sie$migrt$pkg.obten_var_entit(6706, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_UTILS' and ref_entit = sie$migrt$pkg.obten_var_entit(6656, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_MODL' and ref_entit = sie$migrt$pkg.obten_var_entit(6700, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6617, 'Update') where code = 'REF_LANG' and ref_entit = sie$migrt$pkg.obten_var_entit(6719, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_NUMBR8' and ref_entit = sie$migrt$pkg.obten_var_entit(6732, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6658, 'Update') where code = 'REF_DV_FORMT_SORT' and ref_entit = sie$migrt$pkg.obten_var_entit(6723, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CORDN_X_DEBUT' and ref_entit = sie$migrt$pkg.obten_var_entit(6728, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6636, 'Update') where code = 'REF_STAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6664, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR_COMNT' and ref_entit = sie$migrt$pkg.obten_var_entit(6661, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6643, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6733, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6705, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_EXTRA_TOUT' and ref_entit = sie$migrt$pkg.obten_var_entit(6642, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_ICON' and ref_entit = sie$migrt$pkg.obten_var_entit(6708, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6616, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6686, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6665, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6658, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6686, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6652, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6666, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'AGEND_COLN_TITRE' and ref_entit = sie$migrt$pkg.obten_var_entit(6671, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6648, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DOMN' and ref_entit = sie$migrt$pkg.obten_var_entit(6722, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_PRISE_CHARG_SIE14_POPUP' and ref_entit = sie$migrt$pkg.obten_var_entit(6650, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = sie$migrt$pkg.obten_var_entit(6670, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SESSION_ID' and ref_entit = sie$migrt$pkg.obten_var_entit(6630, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_DEBUT_EFECT' and ref_entit = sie$migrt$pkg.obten_var_entit(6658, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6641, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6682, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6627, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6728, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'TITRE_ATRIB2' and ref_entit = sie$migrt$pkg.obten_var_entit(6644, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'COLN_LIEN' and ref_entit = sie$migrt$pkg.obten_var_entit(6671, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6626, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = sie$migrt$pkg.obten_var_entit(6653, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6697, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6636, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6727, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6673, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6640, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'ORDRE_AFICH' and ref_entit = sie$migrt$pkg.obten_var_entit(6627, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6723, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'ID_APEX' and ref_entit = sie$migrt$pkg.obten_var_entit(6640, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6675, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6685, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6666, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_DEFT' and ref_entit = sie$migrt$pkg.obten_var_entit(6715, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6713, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6658, 'Update') where code = 'REF_DV_VALR_SAPI' and ref_entit = sie$migrt$pkg.obten_var_entit(6684, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_FIN_EFECT' and ref_entit = sie$migrt$pkg.obten_var_entit(6696, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6694, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'FORML_VALR_SSPC' and ref_entit = sie$migrt$pkg.obten_var_entit(6684, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6716, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6660, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6627, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'ORDRE_EXECT' and ref_entit = sie$migrt$pkg.obten_var_entit(6682, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6686, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6572, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6646, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6715, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6681, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'TYPE_ICONE_NOEUD' and ref_entit = sie$migrt$pkg.obten_var_entit(6689, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'APP_ID' and ref_entit = sie$migrt$pkg.obten_var_entit(6630, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6639, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_FIN_EFECT' and ref_entit = sie$migrt$pkg.obten_var_entit(6658, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6670, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6694, 'Update') where code = 'REF_RESRC' and ref_entit = sie$migrt$pkg.obten_var_entit(6728, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DV_TYPE_ATRIB4' and ref_entit = sie$migrt$pkg.obten_var_entit(6644, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6678, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_CONTX' and ref_entit = sie$migrt$pkg.obten_var_entit(6655, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_ACCES' and ref_entit = sie$migrt$pkg.obten_var_entit(6669, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6678, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NUMR_VERSN_1' and ref_entit = sie$migrt$pkg.obten_var_entit(6713, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6672, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6664, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6615, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'TEMPL_BOUTN' and ref_entit = sie$migrt$pkg.obten_var_entit(6706, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_REINT_PAGE_IR' and ref_entit = sie$migrt$pkg.obten_var_entit(6684, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DV_TYPE_EVENM' and ref_entit = sie$migrt$pkg.obten_var_entit(6688, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_AFICH' and ref_entit = sie$migrt$pkg.obten_var_entit(6630, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = sie$migrt$pkg.obten_var_entit(6686, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'COMNT' and ref_entit = sie$migrt$pkg.obten_var_entit(6615, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'AGEND_COLN_COULR' and ref_entit = sie$migrt$pkg.obten_var_entit(6671, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'TYPE_LARGR' and ref_entit = sie$migrt$pkg.obten_var_entit(6627, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_UTILS' and ref_entit = sie$migrt$pkg.obten_var_entit(6717, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6676, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6629, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'ORDRE' and ref_entit = sie$migrt$pkg.obten_var_entit(6636, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6688, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_NUMBR' and ref_entit = sie$migrt$pkg.obten_var_entit(6701, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6623, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6623, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6623, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6623, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6623, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_DEBUT_EFECT' and ref_entit = sie$migrt$pkg.obten_var_entit(6623, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_FIN_EFECT' and ref_entit = sie$migrt$pkg.obten_var_entit(6623, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6672, 'Update') where code = 'REF_PUBLC' and ref_entit = sie$migrt$pkg.obten_var_entit(6623, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = sie$migrt$pkg.obten_var_entit(6623, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6623, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = sie$migrt$pkg.obten_var_entit(6623, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6694, 'Update') where code = 'REF_RESRC' and ref_entit = sie$migrt$pkg.obten_var_entit(6684, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6728, 'Update') where code = 'REF_OCURN_RESRC' and ref_entit = sie$migrt$pkg.obten_var_entit(6684, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6695, 'Update') where code = 'REF_FORMT_RESRC' and ref_entit = sie$migrt$pkg.obten_var_entit(6684, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6658, 'Update') where code = 'REF_DV_VALR_INSTA_LIBL' and ref_entit = sie$migrt$pkg.obten_var_entit(6684, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'FORML_LIBL' and ref_entit = sie$migrt$pkg.obten_var_entit(6684, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6618, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6684, 'Update') where code = 'REF_ITEM_MENU' and ref_entit = sie$migrt$pkg.obten_var_entit(6618, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6619, 'Update') where code = 'REF_PLUGN_MENU' and ref_entit = sie$migrt$pkg.obten_var_entit(6618, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NIV_ITEM' and ref_entit = sie$migrt$pkg.obten_var_entit(6618, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'ETEND_NOMBR_COLN' and ref_entit = sie$migrt$pkg.obten_var_entit(6618, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'RANG_ITEM' and ref_entit = sie$migrt$pkg.obten_var_entit(6618, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'COLN_ITEM' and ref_entit = sie$migrt$pkg.obten_var_entit(6618, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6618, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6618, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6618, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6618, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6618, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6658, 'Update') where code = 'REF_DV_CONTN_ITEM_MENU' and ref_entit = sie$migrt$pkg.obten_var_entit(6618, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6658, 'Update') where code = 'REF_DV_ALIGN' and ref_entit = sie$migrt$pkg.obten_var_entit(6618, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6658, 'Update') where code = 'REF_DV_FORMT_MENU' and ref_entit = sie$migrt$pkg.obten_var_entit(6619, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'HAUTR_REGN_MENU' and ref_entit = sie$migrt$pkg.obten_var_entit(6619, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6658, 'Update') where code = 'REF_DV_COULR_THEME' and ref_entit = sie$migrt$pkg.obten_var_entit(6619, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6658, 'Update') where code = 'REF_DV_COULR_PRINC' and ref_entit = sie$migrt$pkg.obten_var_entit(6619, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6714, 'Update') where code = 'REF_MENU' and ref_entit = sie$migrt$pkg.obten_var_entit(6619, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6658, 'Update') where code = 'REF_DV_ORIEN_MENU' and ref_entit = sie$migrt$pkg.obten_var_entit(6619, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6619, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = sie$migrt$pkg.obten_var_entit(6619, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6619, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6619, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6619, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6619, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6619, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'LARGR_REGN_MENU' and ref_entit = sie$migrt$pkg.obten_var_entit(6619, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6658, 'Update') where code = 'REF_DV_TYPE_MENU' and ref_entit = sie$migrt$pkg.obten_var_entit(6619, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'TW_RECPT_FROM' and ref_entit = sie$migrt$pkg.obten_var_entit(6614, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'TW_RECPT_TOCOUNTRY' and ref_entit = sie$migrt$pkg.obten_var_entit(6614, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'TW_RECPT_BODY' and ref_entit = sie$migrt$pkg.obten_var_entit(6614, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'TW_RECPT_ACCOUNTSID' and ref_entit = sie$migrt$pkg.obten_var_entit(6614, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6614, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'TW_RECPT_TOCITY' and ref_entit = sie$migrt$pkg.obten_var_entit(6614, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6614, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_ATRIB_3' and ref_entit = sie$migrt$pkg.obten_var_entit(6665, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = sie$migrt$pkg.obten_var_entit(6725, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6666, 'Update') where code = 'REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6641, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6640, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6681, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6677, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'COLN_ID' and ref_entit = sie$migrt$pkg.obten_var_entit(6689, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6646, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_JOURN' and ref_entit = sie$migrt$pkg.obten_var_entit(6693, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6680, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM_ORGAN' and ref_entit = sie$migrt$pkg.obten_var_entit(6700, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'FORML_VALR_SCPI' and ref_entit = sie$migrt$pkg.obten_var_entit(6684, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'LIBL' and ref_entit = sie$migrt$pkg.obten_var_entit(6616, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'COURL' and ref_entit = sie$migrt$pkg.obten_var_entit(6649, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_ID_SESN' and ref_entit = sie$migrt$pkg.obten_var_entit(6659, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = sie$migrt$pkg.obten_var_entit(6646, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6705, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6639, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6731, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6617, 'Update') where code = 'REF_LANG' and ref_entit = sie$migrt$pkg.obten_var_entit(6690, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6640, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6662, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6708, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'ORDRE_PRESN' and ref_entit = sie$migrt$pkg.obten_var_entit(6663, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6701, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = sie$migrt$pkg.obten_var_entit(6645, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6715, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6615, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6654, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_STRUC_APLIC' and ref_entit = sie$migrt$pkg.obten_var_entit(6718, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CONTN' and ref_entit = sie$migrt$pkg.obten_var_entit(6721, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'AGEND_NOM_TABLE' and ref_entit = sie$migrt$pkg.obten_var_entit(6671, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6684, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6714, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_INTER' and ref_entit = sie$migrt$pkg.obten_var_entit(6633, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6688, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_TRAVL' and ref_entit = sie$migrt$pkg.obten_var_entit(6732, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DV_TYPE_ATRIB3' and ref_entit = sie$migrt$pkg.obten_var_entit(6644, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6687, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6649, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6722, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6645, 'Update') where code = 'REF_TYPE_DOMN_VALR' and ref_entit = sie$migrt$pkg.obten_var_entit(6641, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6726, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6677, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6694, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NUMR_VERSN_2' and ref_entit = sie$migrt$pkg.obten_var_entit(6713, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6626, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6708, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_RECHR' and ref_entit = sie$migrt$pkg.obten_var_entit(6640, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_FIN_EFECT' and ref_entit = sie$migrt$pkg.obten_var_entit(6629, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6616, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6706, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6671, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6671, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'TEXT_MESG' and ref_entit = sie$migrt$pkg.obten_var_entit(6656, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6631, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6650, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_UTILS' and ref_entit = sie$migrt$pkg.obten_var_entit(6657, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'TAIL_TABL_EXTRA' and ref_entit = sie$migrt$pkg.obten_var_entit(6666, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_CHANG_MOT_PASSE' and ref_entit = sie$migrt$pkg.obten_var_entit(6649, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'ENONC_CONDT_PLSQL' and ref_entit = sie$migrt$pkg.obten_var_entit(6673, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'HAUTR_PREPN' and ref_entit = sie$migrt$pkg.obten_var_entit(6728, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_DEPLC' and ref_entit = sie$migrt$pkg.obten_var_entit(6689, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6664, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_VARCH' and ref_entit = sie$migrt$pkg.obten_var_entit(6729, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6733, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DOMN' and ref_entit = sie$migrt$pkg.obten_var_entit(6699, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_ATRIB_4' and ref_entit = sie$migrt$pkg.obten_var_entit(6665, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6707, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_SUPRS' and ref_entit = sie$migrt$pkg.obten_var_entit(6669, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6729, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6629, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6729, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOEUD_OUVER' and ref_entit = sie$migrt$pkg.obten_var_entit(6731, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6675, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_SESN' and ref_entit = sie$migrt$pkg.obten_var_entit(6637, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6572, 'Update') where code = 'REF_MESG_AIDE' and ref_entit = sie$migrt$pkg.obten_var_entit(6640, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SSPI' and ref_entit = sie$migrt$pkg.obten_var_entit(6663, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = sie$migrt$pkg.obten_var_entit(6636, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6681, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_FIN_EFECT' and ref_entit = sie$migrt$pkg.obten_var_entit(6679, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6695, 'Select');
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('sie_11_atrib_entit');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('sie_11_atrib_entit');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6654, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6685, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6644, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6712, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6631, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_ATRIB_5' and ref_entit = sie$migrt$pkg.obten_var_entit(6635, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'IDENT_ENVIR' and ref_entit = sie$migrt$pkg.obten_var_entit(6666, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6714, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_SEMPH' and ref_entit = sie$migrt$pkg.obten_var_entit(6628, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6615, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6688, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6630, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6674, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_UTILS' and ref_entit = sie$migrt$pkg.obten_var_entit(6722, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6631, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DOCMN' and ref_entit = sie$migrt$pkg.obten_var_entit(6676, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_MODL' and ref_entit = sie$migrt$pkg.obten_var_entit(6707, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_HEURE' and ref_entit = sie$migrt$pkg.obten_var_entit(6668, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_CODE' and ref_entit = sie$migrt$pkg.obten_var_entit(6664, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6633, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6715, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6703, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PUBLC' and ref_entit = sie$migrt$pkg.obten_var_entit(6703, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6677, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_EXPRT' and ref_entit = sie$migrt$pkg.obten_var_entit(6627, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_PRISE_CHARG_SIE13_NAVGT' and ref_entit = sie$migrt$pkg.obten_var_entit(6650, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_ATRIB_2' and ref_entit = sie$migrt$pkg.obten_var_entit(6665, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6720, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_NAVGT_HISTR' and ref_entit = sie$migrt$pkg.obten_var_entit(6630, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6647, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6706, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6647, 'Update') where code = 'REF_GROUP_UTILS_LIE' and ref_entit = sie$migrt$pkg.obten_var_entit(6629, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'ADRES_IP' and ref_entit = sie$migrt$pkg.obten_var_entit(6688, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM_PACKG' and ref_entit = sie$migrt$pkg.obten_var_entit(6642, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'ID_TEMPL_BOUTN' and ref_entit = sie$migrt$pkg.obten_var_entit(6706, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6629, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6700, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'ICONE' and ref_entit = sie$migrt$pkg.obten_var_entit(6684, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DETL_DOCMN' and ref_entit = sie$migrt$pkg.obten_var_entit(6676, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM_TABLE' and ref_entit = sie$migrt$pkg.obten_var_entit(6689, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6658, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6718, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6705, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6726, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_SEQNC_STRUC_APLIC' and ref_entit = sie$migrt$pkg.obten_var_entit(6718, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_SHIFT' and ref_entit = sie$migrt$pkg.obten_var_entit(6633, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6647, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6687, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6634, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_NUMBR2' and ref_entit = sie$migrt$pkg.obten_var_entit(6732, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_RESRC_COMPS' and ref_entit = sie$migrt$pkg.obten_var_entit(6689, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = sie$migrt$pkg.obten_var_entit(6725, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6695, 'Update') where code = 'REF_FORMT_RESRC' and ref_entit = sie$migrt$pkg.obten_var_entit(6728, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_RESPN' and ref_entit = sie$migrt$pkg.obten_var_entit(6626, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DEFNT' and ref_entit = sie$migrt$pkg.obten_var_entit(6652, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'ENONC_CONDT_COMNC_PAR' and ref_entit = sie$migrt$pkg.obten_var_entit(6689, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'TITRE_ATRIB5' and ref_entit = sie$migrt$pkg.obten_var_entit(6644, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_RAPRT_INTER' and ref_entit = sie$migrt$pkg.obten_var_entit(6634, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_NUMBR5' and ref_entit = sie$migrt$pkg.obten_var_entit(6732, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_MODL' and ref_entit = sie$migrt$pkg.obten_var_entit(6674, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6698, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6637, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SAPC' and ref_entit = sie$migrt$pkg.obten_var_entit(6663, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6704, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6617, 'Update') where code = 'REF_LANG' and ref_entit = sie$migrt$pkg.obten_var_entit(6643, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6697, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6645, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CONDT' and ref_entit = sie$migrt$pkg.obten_var_entit(6670, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6640, 'Update') where code = 'REF_PAGE_ITEM_FOCUS' and ref_entit = sie$migrt$pkg.obten_var_entit(6670, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6712, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_UTILS' and ref_entit = sie$migrt$pkg.obten_var_entit(6708, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6670, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = sie$migrt$pkg.obten_var_entit(6695, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_MODL_PARMT' and ref_entit = sie$migrt$pkg.obten_var_entit(6707, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6655, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NUMR_SURCH' and ref_entit = sie$migrt$pkg.obten_var_entit(6674, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6715, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'COLN_TITRE_AIDE_INSTA' and ref_entit = sie$migrt$pkg.obten_var_entit(6689, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = sie$migrt$pkg.obten_var_entit(6653, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = sie$migrt$pkg.obten_var_entit(6686, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6643, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'COLN_TYPE' and ref_entit = sie$migrt$pkg.obten_var_entit(6689, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6695, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6699, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_LANG' and ref_entit = sie$migrt$pkg.obten_var_entit(6659, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOMBR_MESG_TOTL' and ref_entit = sie$migrt$pkg.obten_var_entit(6600, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6653, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_DATE3' and ref_entit = sie$migrt$pkg.obten_var_entit(6732, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SESSION_ID' and ref_entit = sie$migrt$pkg.obten_var_entit(6662, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6679, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6643, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DV_TYPE_SUBST' and ref_entit = sie$migrt$pkg.obten_var_entit(6635, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_IGNOR_GROUP_ADMIN' and ref_entit = sie$migrt$pkg.obten_var_entit(6647, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'PROCD_EXPOR_METDN' and ref_entit = sie$migrt$pkg.obten_var_entit(6666, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6669, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6652, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6569, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6569, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6569, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_UTILS_RESPN' and ref_entit = sie$migrt$pkg.obten_var_entit(6569, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_APLIC' and ref_entit = sie$migrt$pkg.obten_var_entit(6569, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_CARNT_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6569, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6569, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DOCMN_REFRC' and ref_entit = sie$migrt$pkg.obten_var_entit(6569, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6621, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6621, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6603, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6603, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = sie$migrt$pkg.obten_var_entit(6681, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_DEBUT_EFECT' and ref_entit = sie$migrt$pkg.obten_var_entit(6629, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DV_TYPE_EXPRE' and ref_entit = sie$migrt$pkg.obten_var_entit(6644, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'ORDRE_CHOIX' and ref_entit = sie$migrt$pkg.obten_var_entit(6685, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6722, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6703, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = sie$migrt$pkg.obten_var_entit(6639, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PUBLC' and ref_entit = sie$migrt$pkg.obten_var_entit(6699, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6727, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6712, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6640, 'Update') where code = 'REF_ITEM' and ref_entit = sie$migrt$pkg.obten_var_entit(6661, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'COLN_INDIC_EVENM_MODFB' and ref_entit = sie$migrt$pkg.obten_var_entit(6671, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6697, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6615, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE_INTER' and ref_entit = sie$migrt$pkg.obten_var_entit(6726, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_PRESN_APPEL' and ref_entit = sie$migrt$pkg.obten_var_entit(6715, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'AIDE_INSTA' and ref_entit = sie$migrt$pkg.obten_var_entit(6684, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'LARGR_DEFT' and ref_entit = sie$migrt$pkg.obten_var_entit(6651, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6660, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6709, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6657, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6662, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6683, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DV_TYPE_ATRIB5' and ref_entit = sie$migrt$pkg.obten_var_entit(6644, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6617, 'Update') where code = 'REF_LANG_CIBLE' and ref_entit = sie$migrt$pkg.obten_var_entit(6654, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_NUMBR' and ref_entit = sie$migrt$pkg.obten_var_entit(6729, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PROFL_COURL' and ref_entit = sie$migrt$pkg.obten_var_entit(6725, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DEUX' and ref_entit = sie$migrt$pkg.obten_var_entit(6730, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6672, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6650, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_NUMBR9' and ref_entit = sie$migrt$pkg.obten_var_entit(6732, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6696, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'HASH_DERNR_URL' and ref_entit = sie$migrt$pkg.obten_var_entit(6630, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6693, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6713, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6658, 'Update') where code = 'REF_DV_CONDT_SAUVG' and ref_entit = sie$migrt$pkg.obten_var_entit(6661, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6725, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6640, 'Update') where code = 'REF_PAGE_ITEM' and ref_entit = sie$migrt$pkg.obten_var_entit(6719, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6730, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6629, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6613, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_DATE' and ref_entit = sie$migrt$pkg.obten_var_entit(6729, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = sie$migrt$pkg.obten_var_entit(6646, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6682, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6695, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6635, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6644, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6648, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_DEFT_ATRIB5' and ref_entit = sie$migrt$pkg.obten_var_entit(6644, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6713, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6682, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6671, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6572, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6711, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_STRUC_ADMIN' and ref_entit = sie$migrt$pkg.obten_var_entit(6631, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6654, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_LANG' and ref_entit = sie$migrt$pkg.obten_var_entit(6633, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'FORML_VALR_REQST' and ref_entit = sie$migrt$pkg.obten_var_entit(6684, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6637, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6718, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'POSTN' and ref_entit = sie$migrt$pkg.obten_var_entit(6687, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6697, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CONTX' and ref_entit = sie$migrt$pkg.obten_var_entit(6638, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6638, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6711, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6726, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6640, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_RENMR' and ref_entit = sie$migrt$pkg.obten_var_entit(6689, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6684, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6701, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6642, 'Update') where code = 'REF_STRUC_APLIC' and ref_entit = sie$migrt$pkg.obten_var_entit(6650, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = sie$migrt$pkg.obten_var_entit(6647, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'ORDRE_PRESN' and ref_entit = sie$migrt$pkg.obten_var_entit(6684, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6646, 'Update') where code = 'REF_OPERT' and ref_entit = sie$migrt$pkg.obten_var_entit(6669, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6617, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6655, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'COMPR_MIGRT' and ref_entit = sie$migrt$pkg.obten_var_entit(6733, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DV_TYPE_DON' and ref_entit = sie$migrt$pkg.obten_var_entit(6687, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6689, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6647, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6680, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = sie$migrt$pkg.obten_var_entit(6712, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'LB' and ref_entit = sie$migrt$pkg.obten_var_entit(6730, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6636, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6641, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_DATE4' and ref_entit = sie$migrt$pkg.obten_var_entit(6732, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6664, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6685, 'Update') where code = 'REF_MIME_TYPE' and ref_entit = sie$migrt$pkg.obten_var_entit(6728, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_NUMBR10' and ref_entit = sie$migrt$pkg.obten_var_entit(6732, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_GROUP_UTILS' and ref_entit = sie$migrt$pkg.obten_var_entit(6696, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6665, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_DEFT_ATRIB4' and ref_entit = sie$migrt$pkg.obten_var_entit(6644, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6694, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6651, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = sie$migrt$pkg.obten_var_entit(6672, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_TRAVL' and ref_entit = sie$migrt$pkg.obten_var_entit(6703, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6645, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_NAVGT' and ref_entit = sie$migrt$pkg.obten_var_entit(6720, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_CREER_NOEUD' and ref_entit = sie$migrt$pkg.obten_var_entit(6704, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6713, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = sie$migrt$pkg.obten_var_entit(6572, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6645, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6695, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6698, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CONCT_PROPR_ENTET_DROIT' and ref_entit = sie$migrt$pkg.obten_var_entit(6671, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PRODT_LANG' and ref_entit = sie$migrt$pkg.obten_var_entit(6707, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_AUTHID_CURNT_UTILS' and ref_entit = sie$migrt$pkg.obten_var_entit(6674, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6716, 'Update') where code = 'REF_DOSR_VIRTL' and ref_entit = sie$migrt$pkg.obten_var_entit(6709, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_APLIC' and ref_entit = sie$migrt$pkg.obten_var_entit(6690, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_APLIC' and ref_entit = sie$migrt$pkg.obten_var_entit(6719, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_APLIC' and ref_entit = sie$migrt$pkg.obten_var_entit(6640, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_APLIC' and ref_entit = sie$migrt$pkg.obten_var_entit(6627, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_APLIC' and ref_entit = sie$migrt$pkg.obten_var_entit(6651, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6742, 'Update') where code = 'REF_APLIC' and ref_entit = sie$migrt$pkg.obten_var_entit(6650, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_APLIC' and ref_entit = sie$migrt$pkg.obten_var_entit(6663, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'APLIC' and ref_entit = sie$migrt$pkg.obten_var_entit(6663, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_APLIC' and ref_entit = sie$migrt$pkg.obten_var_entit(6683, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6742, 'Update') where code = 'REF_APLIC' and ref_entit = sie$migrt$pkg.obten_var_entit(6684, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_APLIC' and ref_entit = sie$migrt$pkg.obten_var_entit(6670, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_TRAIT' and ref_entit = sie$migrt$pkg.obten_var_entit(6581, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'PROCD_VALD_NIV_SECRT_MOT_PASSE' and ref_entit = sie$migrt$pkg.obten_var_entit(6697, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_DEMND_ACTIV_COMPT_UTILS' and ref_entit = sie$migrt$pkg.obten_var_entit(6697, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6571, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6571, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6571, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_MESG' and ref_entit = sie$migrt$pkg.obten_var_entit(6571, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = sie$migrt$pkg.obten_var_entit(6571, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_STRUC_APLIC' and ref_entit = sie$migrt$pkg.obten_var_entit(6571, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6571, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6742, 'Update') where code = 'REF_APLIC' and ref_entit = sie$migrt$pkg.obten_var_entit(6713, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_MESG_AUDIT_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6666, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_MESG_AUDIT_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6666, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'FONCT_OBTEN_BASE_URL' and ref_entit = sie$migrt$pkg.obten_var_entit(6666, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_APLIC_COMNT_BOGUE' and ref_entit = sie$migrt$pkg.obten_var_entit(6666, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_APLIC_ACUEI' and ref_entit = sie$migrt$pkg.obten_var_entit(6666, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6742, 'Update') where code = 'REF_APLIC_AUTHE' and ref_entit = sie$migrt$pkg.obten_var_entit(6742, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_APLIC_AUTHE' and ref_entit = sie$migrt$pkg.obten_var_entit(6742, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NUMR_APLIC_APEX' and ref_entit = sie$migrt$pkg.obten_var_entit(6742, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6742, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6742, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6742, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = sie$migrt$pkg.obten_var_entit(6742, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6742, 'Select');
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('sie_11_atrib_entit');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('sie_11_atrib_entit');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6666, 'Update') where code = 'REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6742, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6650, 'Update') where code = 'REF_PAGE_CONXN' and ref_entit = sie$migrt$pkg.obten_var_entit(6742, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6666, 'Update') where code = 'REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6689, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6570, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = sie$migrt$pkg.obten_var_entit(6570, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_AUDIT_STRUC_APLIC' and ref_entit = sie$migrt$pkg.obten_var_entit(6570, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6570, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6570, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6570, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6743, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6743, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6743, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NATR_AUDIT' and ref_entit = sie$migrt$pkg.obten_var_entit(6743, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PAGE' and ref_entit = sie$migrt$pkg.obten_var_entit(6743, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_ACTIO_AUDIT' and ref_entit = sie$migrt$pkg.obten_var_entit(6743, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_STRUC_APLIC' and ref_entit = sie$migrt$pkg.obten_var_entit(6743, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_SEQNC_STRUC_APLIC' and ref_entit = sie$migrt$pkg.obten_var_entit(6743, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_UTILS' and ref_entit = sie$migrt$pkg.obten_var_entit(6743, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6743, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'APLIC' and ref_entit = sie$migrt$pkg.obten_var_entit(6630, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6707, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6617, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6712, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6653, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6675, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6731, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6683, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6726, 'Update') where code = 'REF_PLUGN' and ref_entit = sie$migrt$pkg.obten_var_entit(6713, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_FORMT' and ref_entit = sie$migrt$pkg.obten_var_entit(6677, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6721, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6642, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'ID_SESN' and ref_entit = sie$migrt$pkg.obten_var_entit(6659, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6708, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6605, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6647, 'Update') where code = 'REF_GROUP' and ref_entit = sie$migrt$pkg.obten_var_entit(6629, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6697, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_ALT' and ref_entit = sie$migrt$pkg.obten_var_entit(6633, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NUMR_ELEMN' and ref_entit = sie$migrt$pkg.obten_var_entit(6720, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR' and ref_entit = sie$migrt$pkg.obten_var_entit(6637, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6709, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'APP_USER' and ref_entit = sie$migrt$pkg.obten_var_entit(6659, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_SUPRM_NOEUD' and ref_entit = sie$migrt$pkg.obten_var_entit(6704, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6644, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6680, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_MODL' and ref_entit = sie$migrt$pkg.obten_var_entit(6687, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PUBLC_TRAVL' and ref_entit = sie$migrt$pkg.obten_var_entit(6701, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6642, 'Update') where code = 'REF_STRUC_APLIC' and ref_entit = sie$migrt$pkg.obten_var_entit(6694, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_DATE6' and ref_entit = sie$migrt$pkg.obten_var_entit(6732, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6675, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6716, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6648, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6719, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6663, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6628, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6682, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6681, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'PILE_TRACE' and ref_entit = sie$migrt$pkg.obten_var_entit(6668, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6713, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6658, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6716, 'Update') where code = 'REF_DOSR_VIRTL' and ref_entit = sie$migrt$pkg.obten_var_entit(6694, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'COLN_DATE_DEBUT' and ref_entit = sie$migrt$pkg.obten_var_entit(6671, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6713, 'Update') where code = 'REF_VERSN' and ref_entit = sie$migrt$pkg.obten_var_entit(6682, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6665, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6632, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = sie$migrt$pkg.obten_var_entit(6648, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6674, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6653, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6616, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6645, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6641, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6658, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6711, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = sie$migrt$pkg.obten_var_entit(6727, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6723, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = sie$migrt$pkg.obten_var_entit(6673, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'FORML_VALR_SAPC' and ref_entit = sie$migrt$pkg.obten_var_entit(6684, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_PREVN_ACTIO_DEFT' and ref_entit = sie$migrt$pkg.obten_var_entit(6644, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6681, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6658, 'Update') where code = 'REF_DV_VALR_URL' and ref_entit = sie$migrt$pkg.obten_var_entit(6684, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'FORML_VALR_URL' and ref_entit = sie$migrt$pkg.obten_var_entit(6684, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = sie$migrt$pkg.obten_var_entit(6624, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6573, 'Update') where code = 'REF_ATRIB_STRUC_APLIC' and ref_entit = sie$migrt$pkg.obten_var_entit(6724, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6595, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6724, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6573, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'HEURE_DEBUT_NORML' and ref_entit = sie$migrt$pkg.obten_var_entit(6671, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6724, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6601, 'Update') where code = 'REF_EVENM_NOTFB' and ref_entit = sie$migrt$pkg.obten_var_entit(6724, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6713, 'Update') where code = 'REF_VERSN' and ref_entit = sie$migrt$pkg.obten_var_entit(6726, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6709, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'TYPE_ALIMN' and ref_entit = sie$migrt$pkg.obten_var_entit(6655, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_VARCH8' and ref_entit = sie$migrt$pkg.obten_var_entit(6732, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'EXT' and ref_entit = sie$migrt$pkg.obten_var_entit(6685, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6632, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'ROLE' and ref_entit = sie$migrt$pkg.obten_var_entit(6717, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6731, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6655, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6616, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6689, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6689, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6718, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'TYPE_ELEMN' and ref_entit = sie$migrt$pkg.obten_var_entit(6655, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM_TABLE_TEMPR' and ref_entit = sie$migrt$pkg.obten_var_entit(6682, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6683, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6714, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_URL' and ref_entit = sie$migrt$pkg.obten_var_entit(6708, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = sie$migrt$pkg.obten_var_entit(6650, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6646, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = sie$migrt$pkg.obten_var_entit(6675, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6641, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6648, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = sie$migrt$pkg.obten_var_entit(6673, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'COLN_DESCR' and ref_entit = sie$migrt$pkg.obten_var_entit(6671, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_UTILS' and ref_entit = sie$migrt$pkg.obten_var_entit(6637, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6700, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6689, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6669, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6572, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6657, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'APP_USER' and ref_entit = sie$migrt$pkg.obten_var_entit(6730, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_SYSTM' and ref_entit = sie$migrt$pkg.obten_var_entit(6641, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6572, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_UTILS_POUR' and ref_entit = sie$migrt$pkg.obten_var_entit(6688, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6733, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = sie$migrt$pkg.obten_var_entit(6698, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6733, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6721, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6684, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CONCT_PROPR_ENTET_CENTR' and ref_entit = sie$migrt$pkg.obten_var_entit(6671, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6643, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6663, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6678, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM_FICHR' and ref_entit = sie$migrt$pkg.obten_var_entit(6740, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'ADRES_ENVOY' and ref_entit = sie$migrt$pkg.obten_var_entit(6739, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DOMN' and ref_entit = sie$migrt$pkg.obten_var_entit(6598, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CONTN' and ref_entit = sie$migrt$pkg.obten_var_entit(6740, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PROFL_COURL' and ref_entit = sie$migrt$pkg.obten_var_entit(6595, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6739, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'STAT_SOUMS' and ref_entit = sie$migrt$pkg.obten_var_entit(6739, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6741, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6741, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'ADRES' and ref_entit = sie$migrt$pkg.obten_var_entit(6741, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM_ENVOY' and ref_entit = sie$migrt$pkg.obten_var_entit(6739, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6741, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6610, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DOMN' and ref_entit = sie$migrt$pkg.obten_var_entit(6739, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6741, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SENS' and ref_entit = sie$migrt$pkg.obten_var_entit(6739, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'TAIL' and ref_entit = sie$migrt$pkg.obten_var_entit(6740, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOMBR_TENTV_MAX' and ref_entit = sie$migrt$pkg.obten_var_entit(6739, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SUJET' and ref_entit = sie$migrt$pkg.obten_var_entit(6739, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6740, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_FIL_ATENT' and ref_entit = sie$migrt$pkg.obten_var_entit(6741, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'AUTHE_MDP' and ref_entit = sie$migrt$pkg.obten_var_entit(6739, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6739, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DESTN' and ref_entit = sie$migrt$pkg.obten_var_entit(6607, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6573, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6601, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6586, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6724, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CONTN' and ref_entit = sie$migrt$pkg.obten_var_entit(6586, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_CHAMP' and ref_entit = sie$migrt$pkg.obten_var_entit(6586, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PUBLC_TRAVL' and ref_entit = sie$migrt$pkg.obten_var_entit(6586, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6586, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6586, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6586, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6732, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM_PROCD_INFOR_SUPLM' and ref_entit = sie$migrt$pkg.obten_var_entit(6638, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_PAGE_INEXS_MAJ_REFRN' and ref_entit = sie$migrt$pkg.obten_var_entit(6666, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CONTX_FORMT' and ref_entit = sie$migrt$pkg.obten_var_entit(6638, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_MESG_SUCS' and ref_entit = sie$migrt$pkg.obten_var_entit(6666, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_MESG_ECHEC' and ref_entit = sie$migrt$pkg.obten_var_entit(6666, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6572, 'Update') where code = 'REF_MESG_ECHEC_SPECF' and ref_entit = sie$migrt$pkg.obten_var_entit(6650, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'POSTN_X' and ref_entit = sie$migrt$pkg.obten_var_entit(6622, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'POSTN_Y' and ref_entit = sie$migrt$pkg.obten_var_entit(6622, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'ANGLE_ORINT' and ref_entit = sie$migrt$pkg.obten_var_entit(6622, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_FORMT' and ref_entit = sie$migrt$pkg.obten_var_entit(6622, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DV_TYPE_CHAMP' and ref_entit = sie$migrt$pkg.obten_var_entit(6622, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'PDF_FUSN' and ref_entit = sie$migrt$pkg.obten_var_entit(6692, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6612, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_CHAMP' and ref_entit = sie$migrt$pkg.obten_var_entit(6612, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6612, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6612, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6612, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_DATE' and ref_entit = sie$migrt$pkg.obten_var_entit(6612, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_EXPOR_TABL_INDEX' and ref_entit = sie$migrt$pkg.obten_var_entit(6682, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_MESG_TROP_DON_TROUV' and ref_entit = sie$migrt$pkg.obten_var_entit(6666, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_COMNC_PAR_COLN_PARNT_NUL' and ref_entit = sie$migrt$pkg.obten_var_entit(6689, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_AFICH_ERR_CODE' and ref_entit = sie$migrt$pkg.obten_var_entit(6666, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'JQUER_UI_CSS_SCOPE' and ref_entit = sie$migrt$pkg.obten_var_entit(6666, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DOMN' and ref_entit = sie$migrt$pkg.obten_var_entit(6626, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6622, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6622, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6622, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6622, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = sie$migrt$pkg.obten_var_entit(6622, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_VERSN_PUBLC' and ref_entit = sie$migrt$pkg.obten_var_entit(6622, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6692, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6692, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6692, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'TW_RECPT_SMSSTATUS' and ref_entit = sie$migrt$pkg.obten_var_entit(6614, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'IDEN_ACCES' and ref_entit = sie$migrt$pkg.obten_var_entit(6692, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_NOUVL_ATRIB' and ref_entit = sie$migrt$pkg.obten_var_entit(6733, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6733, 'Update') where code = 'REF_ATRIB_ENTIT_SUPR' and ref_entit = sie$migrt$pkg.obten_var_entit(6682, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6714, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_DISPN_DOCMN' and ref_entit = sie$migrt$pkg.obten_var_entit(6642, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_FIN_EFECT' and ref_entit = sie$migrt$pkg.obten_var_entit(6581, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_SEQNC_STRUC_APLIC' and ref_entit = sie$migrt$pkg.obten_var_entit(6678, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_STRUC_APLIC' and ref_entit = sie$migrt$pkg.obten_var_entit(6678, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6629, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_NUMBR' and ref_entit = sie$migrt$pkg.obten_var_entit(6587, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_DATE' and ref_entit = sie$migrt$pkg.obten_var_entit(6587, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6682, 'Update') where code = 'REF_ENTIT_REFRN' and ref_entit = sie$migrt$pkg.obten_var_entit(6733, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_VARCH' and ref_entit = sie$migrt$pkg.obten_var_entit(6587, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CARDN' and ref_entit = sie$migrt$pkg.obten_var_entit(6715, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_FORCE_SELCT' and ref_entit = sie$migrt$pkg.obten_var_entit(6682, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6587, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PARMT_PUBLC_TRAVL' and ref_entit = sie$migrt$pkg.obten_var_entit(6587, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = sie$migrt$pkg.obten_var_entit(6593, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6602, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6611, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'TW_PRICE' and ref_entit = sie$migrt$pkg.obten_var_entit(6600, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6611, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6607, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6597, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6604, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'TITRE_MESG' and ref_entit = sie$migrt$pkg.obten_var_entit(6595, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'COLN_DATE_JOURN_COMPL' and ref_entit = sie$migrt$pkg.obten_var_entit(6671, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6609, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6601, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6602, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6596, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'TW_URI' and ref_entit = sie$migrt$pkg.obten_var_entit(6600, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CONFG_INCLU_MIGRT' and ref_entit = sie$migrt$pkg.obten_var_entit(6682, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SERVR_ENTRA' and ref_entit = sie$migrt$pkg.obten_var_entit(6727, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_SSL_SORTN' and ref_entit = sie$migrt$pkg.obten_var_entit(6727, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_SSL_ENTRA' and ref_entit = sie$migrt$pkg.obten_var_entit(6727, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'AUTHE_USAGR_ENTRA' and ref_entit = sie$migrt$pkg.obten_var_entit(6727, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SERVR_SORTN' and ref_entit = sie$migrt$pkg.obten_var_entit(6727, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'PORT_SORTN' and ref_entit = sie$migrt$pkg.obten_var_entit(6727, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'AUTHE_METHD_ENTRA' and ref_entit = sie$migrt$pkg.obten_var_entit(6727, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NIV_INCLU_MIGRT' and ref_entit = sie$migrt$pkg.obten_var_entit(6682, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'AUTHE_USAGR_SORTN' and ref_entit = sie$migrt$pkg.obten_var_entit(6727, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'PORT_ENTRA' and ref_entit = sie$migrt$pkg.obten_var_entit(6727, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'AUTHE_MDP_SORTN' and ref_entit = sie$migrt$pkg.obten_var_entit(6727, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'AUTHE_MDP_ENTRA' and ref_entit = sie$migrt$pkg.obten_var_entit(6727, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_COMPT_AXIAT_DEFT' and ref_entit = sie$migrt$pkg.obten_var_entit(6697, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'AUTHE_METHD_SORTN' and ref_entit = sie$migrt$pkg.obten_var_entit(6727, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6642, 'Update') where code = 'REF_STRUC_APLIC' and ref_entit = sie$migrt$pkg.obten_var_entit(6684, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_RAFRC' and ref_entit = sie$migrt$pkg.obten_var_entit(6734, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_STRUC_APLIC' and ref_entit = sie$migrt$pkg.obten_var_entit(6592, 'Select');
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('sie_11_atrib_entit');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('sie_11_atrib_entit');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC_PRESN' and ref_entit = sie$migrt$pkg.obten_var_entit(6592, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6642, 'Update') where code = 'REF_STRUC_APLIC' and ref_entit = sie$migrt$pkg.obten_var_entit(6675, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_SUIVI' and ref_entit = sie$migrt$pkg.obten_var_entit(6592, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6592, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_CREAT_INITL' and ref_entit = sie$migrt$pkg.obten_var_entit(6592, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_CHARG_PROGR' and ref_entit = sie$migrt$pkg.obten_var_entit(6689, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_STAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6722, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM_PERSN' and ref_entit = sie$migrt$pkg.obten_var_entit(6592, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_STAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6703, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6592, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PAGE' and ref_entit = sie$migrt$pkg.obten_var_entit(6635, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6697, 'Update') where code = 'REF_DOMN' and ref_entit = sie$migrt$pkg.obten_var_entit(6647, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM_PROCD_GLISR_ELEMN_ARBRE' and ref_entit = sie$migrt$pkg.obten_var_entit(6689, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_STRUC_APLIC' and ref_entit = sie$migrt$pkg.obten_var_entit(6637, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM_PROCD_DEPSR_ELEMN_ARBRE' and ref_entit = sie$migrt$pkg.obten_var_entit(6689, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6593, 'Update') where code = 'REF_MODL_COMNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6596, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6597, 'Update') where code = 'REF_TYPE_COMNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6596, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6624, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6624, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_DESTN' and ref_entit = sie$migrt$pkg.obten_var_entit(6573, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6624, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CORPS' and ref_entit = sie$migrt$pkg.obten_var_entit(6739, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6624, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_COMPT_TWILI' and ref_entit = sie$migrt$pkg.obten_var_entit(6595, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_COURL' and ref_entit = sie$migrt$pkg.obten_var_entit(6740, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'MODE_ATACH' and ref_entit = sie$migrt$pkg.obten_var_entit(6740, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6739, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6741, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'AUTHE_USAGR' and ref_entit = sie$migrt$pkg.obten_var_entit(6739, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SERVR' and ref_entit = sie$migrt$pkg.obten_var_entit(6739, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOMBR_TENTV' and ref_entit = sie$migrt$pkg.obten_var_entit(6739, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6741, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'TYPE' and ref_entit = sie$migrt$pkg.obten_var_entit(6741, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6739, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6684, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6613, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6661, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6721, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_DEFT' and ref_entit = sie$migrt$pkg.obten_var_entit(6687, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = sie$migrt$pkg.obten_var_entit(6670, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM_STRUC_ACCES_DON' and ref_entit = sie$migrt$pkg.obten_var_entit(6642, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6572, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6645, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_ORGAN' and ref_entit = sie$migrt$pkg.obten_var_entit(6658, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6677, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6696, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_VERL' and ref_entit = sie$migrt$pkg.obten_var_entit(6649, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6713, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'COLN_VALR' and ref_entit = sie$migrt$pkg.obten_var_entit(6689, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = sie$migrt$pkg.obten_var_entit(6726, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6658, 'Update') where code = 'REF_DV_VALR_SNPI' and ref_entit = sie$migrt$pkg.obten_var_entit(6684, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6573, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6638, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_FORMT_ORCL' and ref_entit = sie$migrt$pkg.obten_var_entit(6652, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6670, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6658, 'Update') where code = 'REF_DV_VALR_SCPI' and ref_entit = sie$migrt$pkg.obten_var_entit(6684, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6651, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'PAGE' and ref_entit = sie$migrt$pkg.obten_var_entit(6630, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6665, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6708, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6688, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = sie$migrt$pkg.obten_var_entit(6712, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'COLN_INDIC_JOURN_COMPL' and ref_entit = sie$migrt$pkg.obten_var_entit(6671, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = sie$migrt$pkg.obten_var_entit(6571, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_MESG_AUDIT_SUPRS' and ref_entit = sie$migrt$pkg.obten_var_entit(6666, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PAGE_ACUEI' and ref_entit = sie$migrt$pkg.obten_var_entit(6666, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_DERNR_MAJ_REFRN_APEX' and ref_entit = sie$migrt$pkg.obten_var_entit(6742, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6742, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_FORMT' and ref_entit = sie$migrt$pkg.obten_var_entit(6570, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6570, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6743, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6675, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_PIPLN' and ref_entit = sie$migrt$pkg.obten_var_entit(6674, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'TITRE_ATRIB3' and ref_entit = sie$migrt$pkg.obten_var_entit(6644, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'TYPE_DON' and ref_entit = sie$migrt$pkg.obten_var_entit(6733, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6687, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'FIN_EFECT' and ref_entit = sie$migrt$pkg.obten_var_entit(6626, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6650, 'Update') where code = 'REF_PAGE' and ref_entit = sie$migrt$pkg.obten_var_entit(6711, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_TRAVL_PUBLC' and ref_entit = sie$migrt$pkg.obten_var_entit(6732, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6725, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6687, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UN' and ref_entit = sie$migrt$pkg.obten_var_entit(6730, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6667, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6727, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6717, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6580, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6593, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'OBJET' and ref_entit = sie$migrt$pkg.obten_var_entit(6595, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6604, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_AFICH_UNIQ' and ref_entit = sie$migrt$pkg.obten_var_entit(6604, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6596, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NUMR_APEX' and ref_entit = sie$migrt$pkg.obten_var_entit(6580, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6728, 'Update') where code = 'REF_OCURN_RESRC_ICON' and ref_entit = sie$migrt$pkg.obten_var_entit(6596, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = sie$migrt$pkg.obten_var_entit(6601, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DV_CURSR_AIDE_INSTA' and ref_entit = sie$migrt$pkg.obten_var_entit(6689, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = sie$migrt$pkg.obten_var_entit(6727, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6609, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NUMR_REFRC_DOCMN' and ref_entit = sie$migrt$pkg.obten_var_entit(6577, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = sie$migrt$pkg.obten_var_entit(6584, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_MESG_PRECD' and ref_entit = sie$migrt$pkg.obten_var_entit(6600, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'ACTIO_JOURN' and ref_entit = sie$migrt$pkg.obten_var_entit(6609, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NUMR' and ref_entit = sie$migrt$pkg.obten_var_entit(6602, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6601, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_UTILS_RESPN' and ref_entit = sie$migrt$pkg.obten_var_entit(6576, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6595, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6598, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_COMPT_AXIAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6611, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6611, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6599, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6605, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_STRUC_APLIC' and ref_entit = sie$migrt$pkg.obten_var_entit(6582, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6599, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'STAT_SOUMS' and ref_entit = sie$migrt$pkg.obten_var_entit(6600, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_ITEM_CARNT_SPRIN' and ref_entit = sie$migrt$pkg.obten_var_entit(6583, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6579, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6600, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NUMR_DESTN' and ref_entit = sie$migrt$pkg.obten_var_entit(6611, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'MESG_SMS' and ref_entit = sie$migrt$pkg.obten_var_entit(6595, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_ENVOI_DIFR' and ref_entit = sie$migrt$pkg.obten_var_entit(6611, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NUMR_ERR' and ref_entit = sie$migrt$pkg.obten_var_entit(6609, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6579, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6598, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6597, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6577, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6609, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6595, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6607, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6598, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_HEURE_SAISI' and ref_entit = sie$migrt$pkg.obten_var_entit(6583, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6600, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = sie$migrt$pkg.obten_var_entit(6601, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6594, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6695, 'Update') where code = 'REF_FORMT_RESRC_ICON' and ref_entit = sie$migrt$pkg.obten_var_entit(6596, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_PARMT_ALIMN' and ref_entit = sie$migrt$pkg.obten_var_entit(6703, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6592, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = sie$migrt$pkg.obten_var_entit(6651, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6683, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_MODIF_OCURN' and ref_entit = sie$migrt$pkg.obten_var_entit(6682, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6657, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6571, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6666, 'Update') where code = 'REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6671, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_SEQNC_SA_FORMT' and ref_entit = sie$migrt$pkg.obten_var_entit(6743, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6652, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_TYPE_STRUC' and ref_entit = sie$migrt$pkg.obten_var_entit(6626, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_PRISE_CHARG_SIE01' and ref_entit = sie$migrt$pkg.obten_var_entit(6650, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'TIMST' and ref_entit = sie$migrt$pkg.obten_var_entit(6630, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_IMEDT' and ref_entit = sie$migrt$pkg.obten_var_entit(6722, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE_KEYDW' and ref_entit = sie$migrt$pkg.obten_var_entit(6633, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = sie$migrt$pkg.obten_var_entit(6617, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6658, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VERSN_BD_APLIC' and ref_entit = sie$migrt$pkg.obten_var_entit(6674, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6667, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6712, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_ATRIB_1' and ref_entit = sie$migrt$pkg.obten_var_entit(6635, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = sie$migrt$pkg.obten_var_entit(6603, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6572, 'Update') where code = 'REF_MESG_SUCS_SPECF' and ref_entit = sie$migrt$pkg.obten_var_entit(6650, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6622, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'TW_RECPT_FROMSTATE' and ref_entit = sie$migrt$pkg.obten_var_entit(6614, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DESTN' and ref_entit = sie$migrt$pkg.obten_var_entit(6736, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_APLIC' and ref_entit = sie$migrt$pkg.obten_var_entit(6721, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6709, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_SECTN_DOCMN' and ref_entit = sie$migrt$pkg.obten_var_entit(6677, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6705, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6633, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6666, 'Update') where code = 'REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6652, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6705, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'EMPLA' and ref_entit = sie$migrt$pkg.obten_var_entit(6709, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6715, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6703, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_AVERT_AUTR_UNIQ' and ref_entit = sie$migrt$pkg.obten_var_entit(6725, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6572, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6650, 'Update') where code = 'REF_PAGE' and ref_entit = sie$migrt$pkg.obten_var_entit(6690, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_PRISE_CHARG_SIE19' and ref_entit = sie$migrt$pkg.obten_var_entit(6650, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6725, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = sie$migrt$pkg.obten_var_entit(6681, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6617, 'Update') where code = 'REF_LANG' and ref_entit = sie$migrt$pkg.obten_var_entit(6654, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6633, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM_TABLE' and ref_entit = sie$migrt$pkg.obten_var_entit(6671, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6717, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_EN_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6640, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_DATE1' and ref_entit = sie$migrt$pkg.obten_var_entit(6732, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6649, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'MIME_TYPE' and ref_entit = sie$migrt$pkg.obten_var_entit(6740, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'AUTHE_METHD' and ref_entit = sie$migrt$pkg.obten_var_entit(6739, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_FORMT_HTML' and ref_entit = sie$migrt$pkg.obten_var_entit(6739, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_MESG_LANG' and ref_entit = sie$migrt$pkg.obten_var_entit(6656, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_SUPRM_DON_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6682, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6658, 'Update') where code = 'REF_DV_NATR_INFOR' and ref_entit = sie$migrt$pkg.obten_var_entit(6573, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6586, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INFOR_SUPLM' and ref_entit = sie$migrt$pkg.obten_var_entit(6638, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'LISTE_REF_PAGE_ACTIV' and ref_entit = sie$migrt$pkg.obten_var_entit(6684, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6723, 'Update') where code = 'REF_ENGIN' and ref_entit = sie$migrt$pkg.obten_var_entit(6692, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6612, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_VARCH' and ref_entit = sie$migrt$pkg.obten_var_entit(6612, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'MESG_TOUT_DROIT_RESRV' and ref_entit = sie$migrt$pkg.obten_var_entit(6666, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6622, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6692, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_VERSN_PUBLC' and ref_entit = sie$migrt$pkg.obten_var_entit(6703, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'TW_RECPT_FROMZIP' and ref_entit = sie$migrt$pkg.obten_var_entit(6614, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'TW_RECPT_APIVERSION' and ref_entit = sie$migrt$pkg.obten_var_entit(6614, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6576, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DESTN_FORMT' and ref_entit = sie$migrt$pkg.obten_var_entit(6611, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NUMR_MESG' and ref_entit = sie$migrt$pkg.obten_var_entit(6600, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6585, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6601, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6598, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6600, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_MODL_AFICH_NOTFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6604, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOMBR_PAGE' and ref_entit = sie$migrt$pkg.obten_var_entit(6599, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DOMN' and ref_entit = sie$migrt$pkg.obten_var_entit(6604, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_TIME' and ref_entit = sie$migrt$pkg.obten_var_entit(6609, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6605, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6596, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC_STRUC_APLIC' and ref_entit = sie$migrt$pkg.obten_var_entit(6609, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'EFORT_RESTN' and ref_entit = sie$migrt$pkg.obten_var_entit(6577, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6579, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DOMN' and ref_entit = sie$migrt$pkg.obten_var_entit(6581, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6584, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6578, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = sie$migrt$pkg.obten_var_entit(6714, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6727, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NUMR_VERSN_3' and ref_entit = sie$migrt$pkg.obten_var_entit(6713, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6734, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_BOUTN' and ref_entit = sie$migrt$pkg.obten_var_entit(6644, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6690, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6635, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = sie$migrt$pkg.obten_var_entit(6645, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6610, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_RESLT_DESTN' and ref_entit = sie$migrt$pkg.obten_var_entit(6736, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6642, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6655, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6639, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'LARGR' and ref_entit = sie$migrt$pkg.obten_var_entit(6627, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6726, 'Update') where code = 'REF_PLUGN' and ref_entit = sie$migrt$pkg.obten_var_entit(6694, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6635, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6650, 'Update') where code = 'REF_PAGE' and ref_entit = sie$migrt$pkg.obten_var_entit(6651, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6650, 'Update') where code = 'REF_PAGE' and ref_entit = sie$migrt$pkg.obten_var_entit(6653, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_DERNR_MAJ_REFRN_APEX' and ref_entit = sie$migrt$pkg.obten_var_entit(6650, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'MOT_PASSE_WALT' and ref_entit = sie$migrt$pkg.obten_var_entit(6598, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6672, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6617, 'Update') where code = 'REF_LANG' and ref_entit = sie$migrt$pkg.obten_var_entit(6721, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DOMN' and ref_entit = sie$migrt$pkg.obten_var_entit(6596, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6709, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6676, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6658, 'Update') where code = 'REF_DV_TYPE_REGN_PILTB' and ref_entit = sie$migrt$pkg.obten_var_entit(6653, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC_CONTX' and ref_entit = sie$migrt$pkg.obten_var_entit(6638, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6651, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6717, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6701, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_SYSTM' and ref_entit = sie$migrt$pkg.obten_var_entit(6647, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6686, 'Select');
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('sie_11_atrib_entit');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('sie_11_atrib_entit');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6613, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6656, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'TYPE_LIAIS' and ref_entit = sie$migrt$pkg.obten_var_entit(6615, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6671, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_EVENM' and ref_entit = sie$migrt$pkg.obten_var_entit(6688, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6629, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_ELEMN_SUP' and ref_entit = sie$migrt$pkg.obten_var_entit(6630, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR' and ref_entit = sie$migrt$pkg.obten_var_entit(6676, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'ENONC_PRE_REQT' and ref_entit = sie$migrt$pkg.obten_var_entit(6689, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_EXCLU' and ref_entit = sie$migrt$pkg.obten_var_entit(6667, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6652, 'Update') where code = 'REF_FORMT' and ref_entit = sie$migrt$pkg.obten_var_entit(6641, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_CREER_OCURN' and ref_entit = sie$migrt$pkg.obten_var_entit(6682, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6675, 'Update') where code = 'REF_TYPE_PUBLC' and ref_entit = sie$migrt$pkg.obten_var_entit(6686, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6689, 'Update') where code = 'REF_PLUGN_ARBRE' and ref_entit = sie$migrt$pkg.obten_var_entit(6704, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM_ORGAN' and ref_entit = sie$migrt$pkg.obten_var_entit(6674, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6708, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DISPN_FONCT' and ref_entit = sie$migrt$pkg.obten_var_entit(6706, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_ACTIF' and ref_entit = sie$migrt$pkg.obten_var_entit(6706, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6683, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6717, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_AGEND' and ref_entit = sie$migrt$pkg.obten_var_entit(6671, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6658, 'Update') where code = 'REF_DV_VALR_SAPC' and ref_entit = sie$migrt$pkg.obten_var_entit(6684, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6733, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_LIBL' and ref_entit = sie$migrt$pkg.obten_var_entit(6708, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = sie$migrt$pkg.obten_var_entit(6714, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_ATRIB_4' and ref_entit = sie$migrt$pkg.obten_var_entit(6635, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_LANG' and ref_entit = sie$migrt$pkg.obten_var_entit(6639, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_SECTN_DOCMN' and ref_entit = sie$migrt$pkg.obten_var_entit(6676, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_LANG' and ref_entit = sie$migrt$pkg.obten_var_entit(6706, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6655, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6636, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6666, 'Update') where code = 'REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6645, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DUREE' and ref_entit = sie$migrt$pkg.obten_var_entit(6730, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6712, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6627, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6679, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6713, 'Update') where code = 'REF_VERSN' and ref_entit = sie$migrt$pkg.obten_var_entit(6709, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_APLIC' and ref_entit = sie$migrt$pkg.obten_var_entit(6650, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_GERER_SIDF' and ref_entit = sie$migrt$pkg.obten_var_entit(6684, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6571, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6571, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_APLIC' and ref_entit = sie$migrt$pkg.obten_var_entit(6713, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PAGE_COMNT_BOGUE' and ref_entit = sie$migrt$pkg.obten_var_entit(6666, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6713, 'Update') where code = 'REF_VERSN' and ref_entit = sie$migrt$pkg.obten_var_entit(6742, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6742, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_APLIC' and ref_entit = sie$migrt$pkg.obten_var_entit(6711, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DOMN' and ref_entit = sie$migrt$pkg.obten_var_entit(6743, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = sie$migrt$pkg.obten_var_entit(6694, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6704, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6734, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'HAUTR' and ref_entit = sie$migrt$pkg.obten_var_entit(6695, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_STOCK_MEME_REPRT' and ref_entit = sie$migrt$pkg.obten_var_entit(6694, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_DATE' and ref_entit = sie$migrt$pkg.obten_var_entit(6701, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PUBLC_TRAVL' and ref_entit = sie$migrt$pkg.obten_var_entit(6693, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_VARCH7' and ref_entit = sie$migrt$pkg.obten_var_entit(6732, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6633, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'ERR_CODE' and ref_entit = sie$migrt$pkg.obten_var_entit(6616, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_VARCH' and ref_entit = sie$migrt$pkg.obten_var_entit(6655, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_APLIC' and ref_entit = sie$migrt$pkg.obten_var_entit(6625, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6714, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6695, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6572, 'Update') where code = 'REF_MESG' and ref_entit = sie$migrt$pkg.obten_var_entit(6613, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6616, 'Update') where code = 'REF_CODE_ERR_ORACL' and ref_entit = sie$migrt$pkg.obten_var_entit(6615, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_FIXE' and ref_entit = sie$migrt$pkg.obten_var_entit(6715, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6679, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'EMPLA_HTML' and ref_entit = sie$migrt$pkg.obten_var_entit(6694, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_VARCH5' and ref_entit = sie$migrt$pkg.obten_var_entit(6732, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_EFORT' and ref_entit = sie$migrt$pkg.obten_var_entit(6579, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6699, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6575, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_CONTX' and ref_entit = sie$migrt$pkg.obten_var_entit(6661, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_SEQNC_STRUC_APLIC' and ref_entit = sie$migrt$pkg.obten_var_entit(6582, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6721, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6649, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = sie$migrt$pkg.obten_var_entit(6697, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'FORML_VALR_INSTA' and ref_entit = sie$migrt$pkg.obten_var_entit(6661, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = sie$migrt$pkg.obten_var_entit(6680, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6641, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'FIL' and ref_entit = sie$migrt$pkg.obten_var_entit(6730, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SENS' and ref_entit = sie$migrt$pkg.obten_var_entit(6687, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_VALID' and ref_entit = sie$migrt$pkg.obten_var_entit(6573, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6588, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6603, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6716, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6658, 'Update') where code = 'REF_DV_VUE_DEFT' and ref_entit = sie$migrt$pkg.obten_var_entit(6671, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6729, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6591, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6591, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6590, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'OPERT' and ref_entit = sie$migrt$pkg.obten_var_entit(6590, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_ACTIF' and ref_entit = sie$migrt$pkg.obten_var_entit(6649, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DOMN' and ref_entit = sie$migrt$pkg.obten_var_entit(6602, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6595, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_SEQNC_STRUC_APLIC' and ref_entit = sie$migrt$pkg.obten_var_entit(6606, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM_STRUC_ACCES' and ref_entit = sie$migrt$pkg.obten_var_entit(6621, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6574, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6607, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CSS_ICONE_BOOTS' and ref_entit = sie$migrt$pkg.obten_var_entit(6663, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DOMN' and ref_entit = sie$migrt$pkg.obten_var_entit(6594, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6578, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6593, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6666, 'Update') where code = 'DNR_REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6623, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6666, 'Update') where code = 'DNR_REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6675, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6666, 'Update') where code = 'DNR_REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6672, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6666, 'Update') where code = 'DNR_REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6715, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6666, 'Update') where code = 'DNR_REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6692, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6666, 'Update') where code = 'DNR_REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6686, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6623, 'Update') where code = 'REF_VERSN_PUBLC' and ref_entit = sie$migrt$pkg.obten_var_entit(6692, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_VARCH6' and ref_entit = sie$migrt$pkg.obten_var_entit(6732, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_NUMBR6' and ref_entit = sie$migrt$pkg.obten_var_entit(6732, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_DATE5' and ref_entit = sie$migrt$pkg.obten_var_entit(6732, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_RETR' and ref_entit = sie$migrt$pkg.obten_var_entit(6687, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6614, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_MESG_FETCH' and ref_entit = sie$migrt$pkg.obten_var_entit(6666, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_MESG_RANGE_SUPRM' and ref_entit = sie$migrt$pkg.obten_var_entit(6666, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_MESG_RANGE_INSER' and ref_entit = sie$migrt$pkg.obten_var_entit(6666, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_MESG_AUCUN_DON_TROUV' and ref_entit = sie$migrt$pkg.obten_var_entit(6666, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6572, 'Update') where code = 'REF_MESG_FETCH_SPECF' and ref_entit = sie$migrt$pkg.obten_var_entit(6650, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6572, 'Update') where code = 'REF_MESG_RANGE_SUPRM_SPECF' and ref_entit = sie$migrt$pkg.obten_var_entit(6650, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6572, 'Update') where code = 'REF_MESG_RANGE_MODF_SPECF' and ref_entit = sie$migrt$pkg.obten_var_entit(6650, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6572, 'Update') where code = 'REF_MESG_AUCUN_DON_TROUV' and ref_entit = sie$migrt$pkg.obten_var_entit(6650, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'TW_RECPT_SMSMESSAGESID' and ref_entit = sie$migrt$pkg.obten_var_entit(6614, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_ACCES_GLOBL' and ref_entit = sie$migrt$pkg.obten_var_entit(6647, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'TW_RECPT_TOZIP' and ref_entit = sie$migrt$pkg.obten_var_entit(6614, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'TW_RECPT_TOSTATE' and ref_entit = sie$migrt$pkg.obten_var_entit(6614, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'TW_RECPT_FROMCOUNTRY' and ref_entit = sie$migrt$pkg.obten_var_entit(6614, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'TW_RECPT_SMSSID' and ref_entit = sie$migrt$pkg.obten_var_entit(6614, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'TW_RECPT_TO' and ref_entit = sie$migrt$pkg.obten_var_entit(6614, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6666, 'Update') where code = 'REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6619, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6691, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'IDENT_ACCES_FORMT' and ref_entit = sie$migrt$pkg.obten_var_entit(6691, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6737, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6736, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_CONFG_EVENM_NOTFB' and ref_entit = sie$migrt$pkg.obten_var_entit(6737, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6691, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_CONFG_EVENM_NOTFB' and ref_entit = sie$migrt$pkg.obten_var_entit(6736, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6738, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6691, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_CONFG_EVENM_NOTFB' and ref_entit = sie$migrt$pkg.obten_var_entit(6691, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'IDENT_ACCES' and ref_entit = sie$migrt$pkg.obten_var_entit(6691, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6736, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6737, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6736, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6691, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6738, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6736, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'COULR' and ref_entit = sie$migrt$pkg.obten_var_entit(6738, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'ORDRE_PRESN' and ref_entit = sie$migrt$pkg.obten_var_entit(6738, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6691, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = sie$migrt$pkg.obten_var_entit(6691, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6736, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6737, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6738, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DV_NATR_DESTN' and ref_entit = sie$migrt$pkg.obten_var_entit(6736, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6738, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6601, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6604, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6580, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'TW_STATUS' and ref_entit = sie$migrt$pkg.obten_var_entit(6600, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6584, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DON_NOMNL' and ref_entit = sie$migrt$pkg.obten_var_entit(6609, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'COLN_AGEND' and ref_entit = sie$migrt$pkg.obten_var_entit(6671, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6727, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6611, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6595, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'TAIL_TITRE' and ref_entit = sie$migrt$pkg.obten_var_entit(6596, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'PROCD_AUTHE_EXTER_AFW' and ref_entit = sie$migrt$pkg.obten_var_entit(6697, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6593, 'Update') where code = 'REF_MODL_COMNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6605, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM_FICHR' and ref_entit = sie$migrt$pkg.obten_var_entit(6599, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'MESG' and ref_entit = sie$migrt$pkg.obten_var_entit(6595, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DOMN' and ref_entit = sie$migrt$pkg.obten_var_entit(6727, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PROFL_COURL_NOTFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6697, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6602, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDEN_MESG' and ref_entit = sie$migrt$pkg.obten_var_entit(6604, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_RECHR' and ref_entit = sie$migrt$pkg.obten_var_entit(6582, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6604, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_COMPT_TWILI' and ref_entit = sie$migrt$pkg.obten_var_entit(6600, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = sie$migrt$pkg.obten_var_entit(6598, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'MESG' and ref_entit = sie$migrt$pkg.obten_var_entit(6600, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6601, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = sie$migrt$pkg.obten_var_entit(6598, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6597, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6609, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = sie$migrt$pkg.obten_var_entit(6594, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_ENVOI_DIFR' and ref_entit = sie$migrt$pkg.obten_var_entit(6600, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = sie$migrt$pkg.obten_var_entit(6604, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'ORDRE_ATACH' and ref_entit = sie$migrt$pkg.obten_var_entit(6599, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DOMN' and ref_entit = sie$migrt$pkg.obten_var_entit(6593, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'TITRE_MESG' and ref_entit = sie$migrt$pkg.obten_var_entit(6604, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NUMR_A' and ref_entit = sie$migrt$pkg.obten_var_entit(6600, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6602, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6593, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6599, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_PARTG' and ref_entit = sie$migrt$pkg.obten_var_entit(6598, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6599, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6611, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = sie$migrt$pkg.obten_var_entit(6596, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REPNS_SERVR' and ref_entit = sie$migrt$pkg.obten_var_entit(6600, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'COULR_TEXTE' and ref_entit = sie$migrt$pkg.obten_var_entit(6596, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'STRUC_APLIC' and ref_entit = sie$migrt$pkg.obten_var_entit(6609, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6602, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_DEBUT_PREVU' and ref_entit = sie$migrt$pkg.obten_var_entit(6576, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6580, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6581, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6585, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6577, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_ITEM_CARNT_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6575, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_ITEM_CARNT_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6577, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6584, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6577, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6575, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR' and ref_entit = sie$migrt$pkg.obten_var_entit(6579, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_SIE_30_PAGE' and ref_entit = sie$migrt$pkg.obten_var_entit(6575, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6585, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6583, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6578, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6596, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6697, 'Update') where code = 'REF_DOMN' and ref_entit = sie$migrt$pkg.obten_var_entit(6698, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_SPECF' and ref_entit = sie$migrt$pkg.obten_var_entit(6604, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6595, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6582, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6597, 'Update') where code = 'REF_TYPE_COMNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6593, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = sie$migrt$pkg.obten_var_entit(6596, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DOCMN_REFRC' and ref_entit = sie$migrt$pkg.obten_var_entit(6578, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6576, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6597, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'TAIL_TEXTE' and ref_entit = sie$migrt$pkg.obten_var_entit(6596, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6599, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = sie$migrt$pkg.obten_var_entit(6597, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6605, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_PERTN' and ref_entit = sie$migrt$pkg.obten_var_entit(6582, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'COULR_TEXTE' and ref_entit = sie$migrt$pkg.obten_var_entit(6698, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6642, 'Update') where code = 'REF_STRUC_APLIC' and ref_entit = sie$migrt$pkg.obten_var_entit(6601, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'MESG' and ref_entit = sie$migrt$pkg.obten_var_entit(6604, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'COLN_IDENT' and ref_entit = sie$migrt$pkg.obten_var_entit(6671, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6609, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6574, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_TYPE_TRAVL' and ref_entit = sie$migrt$pkg.obten_var_entit(6722, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_STRUC_APLIC' and ref_entit = sie$migrt$pkg.obten_var_entit(6607, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6600, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6593, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6607, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6594, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = sie$migrt$pkg.obten_var_entit(6602, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_FLECH_AIDE_INSTA' and ref_entit = sie$migrt$pkg.obten_var_entit(6689, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'TEMPS_AFICH' and ref_entit = sie$migrt$pkg.obten_var_entit(6596, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DV_PRIOR' and ref_entit = sie$migrt$pkg.obten_var_entit(6577, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REPRT_WALT' and ref_entit = sie$migrt$pkg.obten_var_entit(6598, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DOMN' and ref_entit = sie$migrt$pkg.obten_var_entit(6609, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6594, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6594, 'Select');
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('sie_11_atrib_entit');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('sie_11_atrib_entit');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_FIN_PREVU' and ref_entit = sie$migrt$pkg.obten_var_entit(6576, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_SYSTM' and ref_entit = sie$migrt$pkg.obten_var_entit(6593, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6593, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6604, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6584, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6605, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6602, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6578, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = sie$migrt$pkg.obten_var_entit(6593, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_DEBUT_EFECT' and ref_entit = sie$migrt$pkg.obten_var_entit(6581, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6576, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'IDENT' and ref_entit = sie$migrt$pkg.obten_var_entit(6581, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DOCMN_REFRC' and ref_entit = sie$migrt$pkg.obten_var_entit(6585, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_APLIC_MODL_RECHR' and ref_entit = sie$migrt$pkg.obten_var_entit(6582, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6582, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_NOUVL_ENTIT' and ref_entit = sie$migrt$pkg.obten_var_entit(6682, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6583, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6579, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_LIBL_STRUC_APLIC_HTML' and ref_entit = sie$migrt$pkg.obten_var_entit(6582, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6578, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6582, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6574, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'EFORT_PREVU' and ref_entit = sie$migrt$pkg.obten_var_entit(6577, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = sie$migrt$pkg.obten_var_entit(6585, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6584, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_SEQNC_STRUC_APLIC' and ref_entit = sie$migrt$pkg.obten_var_entit(6737, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6574, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = sie$migrt$pkg.obten_var_entit(6577, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'LONGR_BLOC' and ref_entit = sie$migrt$pkg.obten_var_entit(6682, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_CARNT_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6576, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'PROTC_ENTRA' and ref_entit = sie$migrt$pkg.obten_var_entit(6727, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NUMR_APLIC_APEX' and ref_entit = sie$migrt$pkg.obten_var_entit(6581, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6669, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6642, 'Update') where code = 'REF_STRUC_APLIC_ACCES' and ref_entit = sie$migrt$pkg.obten_var_entit(6610, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6577, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'AUTHE_TOKEN' and ref_entit = sie$migrt$pkg.obten_var_entit(6598, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6581, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6605, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_SIE_30_PAGE' and ref_entit = sie$migrt$pkg.obten_var_entit(6577, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6682, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6613, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6636, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_UTILS' and ref_entit = sie$migrt$pkg.obten_var_entit(6679, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6661, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_SESN' and ref_entit = sie$migrt$pkg.obten_var_entit(6734, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6711, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_DATE8' and ref_entit = sie$migrt$pkg.obten_var_entit(6732, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6664, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6696, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6634, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'ENONC_PRE_REQT' and ref_entit = sie$migrt$pkg.obten_var_entit(6671, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6714, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6660, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6680, 'Update') where code = 'REF_GROUP_PUBLC' and ref_entit = sie$migrt$pkg.obten_var_entit(6672, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6616, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM_CONTR' and ref_entit = sie$migrt$pkg.obten_var_entit(6615, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6690, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DOMN' and ref_entit = sie$migrt$pkg.obten_var_entit(6679, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = sie$migrt$pkg.obten_var_entit(6644, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6665, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = sie$migrt$pkg.obten_var_entit(6684, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_CLEAR_PAGE_IR' and ref_entit = sie$migrt$pkg.obten_var_entit(6684, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'STAT_SOUMS' and ref_entit = sie$migrt$pkg.obten_var_entit(6611, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6720, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6663, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6712, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_DETRM' and ref_entit = sie$migrt$pkg.obten_var_entit(6674, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6673, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6661, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_SUPRM_OCURN' and ref_entit = sie$migrt$pkg.obten_var_entit(6682, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6725, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'TYPE_RESRC' and ref_entit = sie$migrt$pkg.obten_var_entit(6694, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6657, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'TYPE_VALR_DEFT' and ref_entit = sie$migrt$pkg.obten_var_entit(6715, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = sie$migrt$pkg.obten_var_entit(6677, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6647, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_GROUP_UTILS_ADMIN' and ref_entit = sie$migrt$pkg.obten_var_entit(6666, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6681, 'Update') where code = 'REF_TYPE_FICHR' and ref_entit = sie$migrt$pkg.obten_var_entit(6695, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'PAGE_CIBLE' and ref_entit = sie$migrt$pkg.obten_var_entit(6655, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_VARCH2' and ref_entit = sie$migrt$pkg.obten_var_entit(6732, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6678, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6695, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'TYPE_ITEM' and ref_entit = sie$migrt$pkg.obten_var_entit(6640, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6647, 'Update') where code = 'REF_GROUP_UTILS' and ref_entit = sie$migrt$pkg.obten_var_entit(6669, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6728, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6681, 'Update') where code = 'REF_TYPE_FICHR' and ref_entit = sie$migrt$pkg.obten_var_entit(6694, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6734, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'PREFX_MESG' and ref_entit = sie$migrt$pkg.obten_var_entit(6650, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6666, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = sie$migrt$pkg.obten_var_entit(6733, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_DEBUT_EFECT' and ref_entit = sie$migrt$pkg.obten_var_entit(6631, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6650, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = sie$migrt$pkg.obten_var_entit(6667, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6722, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6636, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6674, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_FIN_EFECT' and ref_entit = sie$migrt$pkg.obten_var_entit(6657, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NUMR_VERSN_4' and ref_entit = sie$migrt$pkg.obten_var_entit(6713, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6719, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6658, 'Update') where code = 'REF_DV_VALR_SSPC' and ref_entit = sie$migrt$pkg.obten_var_entit(6684, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6649, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6651, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6649, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6643, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6676, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6698, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'IDENT_ACCES_FORMT' and ref_entit = sie$migrt$pkg.obten_var_entit(6610, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6610, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6610, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'IDENT_ACCES' and ref_entit = sie$migrt$pkg.obten_var_entit(6610, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6610, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6610, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_FIL_ARIAN' and ref_entit = sie$migrt$pkg.obten_var_entit(6638, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_FIN_EFECT' and ref_entit = sie$migrt$pkg.obten_var_entit(6729, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_UTILS' and ref_entit = sie$migrt$pkg.obten_var_entit(6696, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = sie$migrt$pkg.obten_var_entit(6641, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'OBJET' and ref_entit = sie$migrt$pkg.obten_var_entit(6611, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6642, 'Update') where code = 'REF_STRUC_APLIC' and ref_entit = sie$migrt$pkg.obten_var_entit(6636, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NUMR_APEX' and ref_entit = sie$migrt$pkg.obten_var_entit(6650, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6643, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_ATRIB_1' and ref_entit = sie$migrt$pkg.obten_var_entit(6665, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6684, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6644, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6677, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'ITEM_SUBST' and ref_entit = sie$migrt$pkg.obten_var_entit(6706, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'ENONC_SQL' and ref_entit = sie$migrt$pkg.obten_var_entit(6634, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_STRUC_LIE' and ref_entit = sie$migrt$pkg.obten_var_entit(6631, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6690, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6658, 'Update') where code = 'REF_DV_TYPE_INSTA' and ref_entit = sie$migrt$pkg.obten_var_entit(6661, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6637, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DISPN_FONCT' and ref_entit = sie$migrt$pkg.obten_var_entit(6635, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6696, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6713, 'Update') where code = 'REF_VERSN' and ref_entit = sie$migrt$pkg.obten_var_entit(6728, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'TYPE_DON' and ref_entit = sie$migrt$pkg.obten_var_entit(6641, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6686, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6632, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'LARGR_REGN_CALND' and ref_entit = sie$migrt$pkg.obten_var_entit(6671, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6634, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6617, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = sie$migrt$pkg.obten_var_entit(6716, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'EFACR_CACHE' and ref_entit = sie$migrt$pkg.obten_var_entit(6684, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_INITL' and ref_entit = sie$migrt$pkg.obten_var_entit(6636, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6666, 'Update') where code = 'REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6647, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6719, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOMBR_RANG_EXTRA' and ref_entit = sie$migrt$pkg.obten_var_entit(6634, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DEBUT_EFECT' and ref_entit = sie$migrt$pkg.obten_var_entit(6626, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'AGEND_COLN_VALR' and ref_entit = sie$migrt$pkg.obten_var_entit(6671, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6719, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_CTRL' and ref_entit = sie$migrt$pkg.obten_var_entit(6633, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6712, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CONCT_PROPR_ENTET_GAUCH' and ref_entit = sie$migrt$pkg.obten_var_entit(6671, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6627, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_CONFR_SAUVG' and ref_entit = sie$migrt$pkg.obten_var_entit(6640, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_EN_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6640, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'TITRE' and ref_entit = sie$migrt$pkg.obten_var_entit(6677, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'TITRE_AIDE_INSTA' and ref_entit = sie$migrt$pkg.obten_var_entit(6684, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PAGE' and ref_entit = sie$migrt$pkg.obten_var_entit(6702, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM_PHYSQ_COMPS' and ref_entit = sie$migrt$pkg.obten_var_entit(6694, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6698, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_ATRIB_2' and ref_entit = sie$migrt$pkg.obten_var_entit(6635, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM_APEX' and ref_entit = sie$migrt$pkg.obten_var_entit(6640, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_SOUMS_PAGE' and ref_entit = sie$migrt$pkg.obten_var_entit(6684, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'EXPLI' and ref_entit = sie$migrt$pkg.obten_var_entit(6668, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_UTILS' and ref_entit = sie$migrt$pkg.obten_var_entit(6718, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'PAGE' and ref_entit = sie$migrt$pkg.obten_var_entit(6615, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6617, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'EXPRE_ACTIO' and ref_entit = sie$migrt$pkg.obten_var_entit(6644, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'FORML_CONDT_UTILS' and ref_entit = sie$migrt$pkg.obten_var_entit(6661, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM_TABLE_EREUR' and ref_entit = sie$migrt$pkg.obten_var_entit(6682, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6650, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6658, 'Update') where code = 'REF_DV_VALR_SCPC' and ref_entit = sie$migrt$pkg.obten_var_entit(6684, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6715, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6670, 'Update') where code = 'REF_CONDT_PILTB' and ref_entit = sie$migrt$pkg.obten_var_entit(6683, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DEPSM_ALIAS_COLN' and ref_entit = sie$migrt$pkg.obten_var_entit(6640, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VARBL2' and ref_entit = sie$migrt$pkg.obten_var_entit(6667, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6631, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_DOCMN_VERL' and ref_entit = sie$migrt$pkg.obten_var_entit(6713, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6642, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6675, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PUBLC_PAGE_GARDE' and ref_entit = sie$migrt$pkg.obten_var_entit(6602, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = sie$migrt$pkg.obten_var_entit(6684, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_REINT_PAGNT' and ref_entit = sie$migrt$pkg.obten_var_entit(6684, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_PRISE_CHARG_SIE13_CONFR' and ref_entit = sie$migrt$pkg.obten_var_entit(6650, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6731, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6594, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6662, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6647, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6694, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6672, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6650, 'Update') where code = 'REF_PAGE' and ref_entit = sie$migrt$pkg.obten_var_entit(6663, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'LIBL' and ref_entit = sie$migrt$pkg.obten_var_entit(6627, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6703, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_ACTIF' and ref_entit = sie$migrt$pkg.obten_var_entit(6633, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6652, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_PRISE_CHARG_SIE18' and ref_entit = sie$migrt$pkg.obten_var_entit(6650, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6572, 'Update') where code = 'REF_MESG' and ref_entit = sie$migrt$pkg.obten_var_entit(6615, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_DATE2' and ref_entit = sie$migrt$pkg.obten_var_entit(6732, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6651, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'FORML_VALR_SAPI' and ref_entit = sie$migrt$pkg.obten_var_entit(6684, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6694, 'Update') where code = 'REF_RESRC' and ref_entit = sie$migrt$pkg.obten_var_entit(6704, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'FORML_CONDT_SAUVG' and ref_entit = sie$migrt$pkg.obten_var_entit(6661, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE_KEYPR' and ref_entit = sie$migrt$pkg.obten_var_entit(6633, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DV_TYPE_ECRIT' and ref_entit = sie$migrt$pkg.obten_var_entit(6693, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'LIBL' and ref_entit = sie$migrt$pkg.obten_var_entit(6663, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DOSR_FICHR' and ref_entit = sie$migrt$pkg.obten_var_entit(6666, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6663, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SAPI' and ref_entit = sie$migrt$pkg.obten_var_entit(6663, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'TYPE_DON' and ref_entit = sie$migrt$pkg.obten_var_entit(6652, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_DATE7' and ref_entit = sie$migrt$pkg.obten_var_entit(6732, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UNITE_MESR_LARGR_DEFT' and ref_entit = sie$migrt$pkg.obten_var_entit(6651, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6699, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOEUD_ACTIF' and ref_entit = sie$migrt$pkg.obten_var_entit(6734, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'COLN_TITRE' and ref_entit = sie$migrt$pkg.obten_var_entit(6671, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6642, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_TRAVL' and ref_entit = sie$migrt$pkg.obten_var_entit(6693, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = sie$migrt$pkg.obten_var_entit(6698, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6637, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_STRUC_APLIC' and ref_entit = sie$migrt$pkg.obten_var_entit(6677, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6723, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6628, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_STRUC_ADMIN' and ref_entit = sie$migrt$pkg.obten_var_entit(6657, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6728, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6713, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_DEBUT_EFECT' and ref_entit = sie$migrt$pkg.obten_var_entit(6679, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6666, 'Update') where code = 'REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6714, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_STAT_UTILS' and ref_entit = sie$migrt$pkg.obten_var_entit(6636, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_ID_SESN' and ref_entit = sie$migrt$pkg.obten_var_entit(6634, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6650, 'Update') where code = 'REF_PAGE_FORML' and ref_entit = sie$migrt$pkg.obten_var_entit(6642, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'OBTEN_JSON_NOEUD_NOMBR_NIV' and ref_entit = sie$migrt$pkg.obten_var_entit(6689, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_FIL_ARIAN' and ref_entit = sie$migrt$pkg.obten_var_entit(6634, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6706, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6646, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6685, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_EVENM_MODFB' and ref_entit = sie$migrt$pkg.obten_var_entit(6671, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DOMN' and ref_entit = sie$migrt$pkg.obten_var_entit(6727, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6640, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6719, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'PRENM' and ref_entit = sie$migrt$pkg.obten_var_entit(6649, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6615, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6658, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6723, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6694, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'ENONC_SOURC' and ref_entit = sie$migrt$pkg.obten_var_entit(6641, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = sie$migrt$pkg.obten_var_entit(6636, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6704, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6641, 'Update') where code = 'REF_DOMN_VALR' and ref_entit = sie$migrt$pkg.obten_var_entit(6658, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6663, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6669, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6626, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6626, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6658, 'Update') where code = 'REF_DV_VALR_INSTA' and ref_entit = sie$migrt$pkg.obten_var_entit(6661, 'Select');
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('sie_11_atrib_entit');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('sie_11_atrib_entit');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_UTILS' and ref_entit = sie$migrt$pkg.obten_var_entit(6629, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6682, 'Update') where code = 'REF_ENTIT' and ref_entit = sie$migrt$pkg.obten_var_entit(6733, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6729, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6695, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6643, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_PUBLC' and ref_entit = sie$migrt$pkg.obten_var_entit(6687, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6669, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CONTX_INTER' and ref_entit = sie$migrt$pkg.obten_var_entit(6638, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'PAGE' and ref_entit = sie$migrt$pkg.obten_var_entit(6730, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = sie$migrt$pkg.obten_var_entit(6661, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'COLN_ID_PARNT' and ref_entit = sie$migrt$pkg.obten_var_entit(6689, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6729, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6648, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'COLN_VALR' and ref_entit = sie$migrt$pkg.obten_var_entit(6671, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6700, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'TYPE_MESG' and ref_entit = sie$migrt$pkg.obten_var_entit(6572, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'COLN_TABLE' and ref_entit = sie$migrt$pkg.obten_var_entit(6627, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6688, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6684, 'Update') where code = 'REF_ITEM_MENU' and ref_entit = sie$migrt$pkg.obten_var_entit(6684, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6728, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6572, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6658, 'Update') where code = 'REF_DV_VALR_REQST' and ref_entit = sie$migrt$pkg.obten_var_entit(6684, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DV_TYPE_ATRIB2' and ref_entit = sie$migrt$pkg.obten_var_entit(6644, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6617, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'LIBL' and ref_entit = sie$migrt$pkg.obten_var_entit(6640, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6662, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6728, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_FERMR_NOEUD' and ref_entit = sie$migrt$pkg.obten_var_entit(6704, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6725, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6640, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PLUGN_ARBRE_NOEUD' and ref_entit = sie$migrt$pkg.obten_var_entit(6689, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_UNITE_INCLU' and ref_entit = sie$migrt$pkg.obten_var_entit(6652, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = sie$migrt$pkg.obten_var_entit(6680, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6677, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = sie$migrt$pkg.obten_var_entit(6704, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6654, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6648, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6617, 'Update') where code = 'REF_LANG' and ref_entit = sie$migrt$pkg.obten_var_entit(6632, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_VERSN' and ref_entit = sie$migrt$pkg.obten_var_entit(6674, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6650, 'Update') where code = 'REF_PAGE' and ref_entit = sie$migrt$pkg.obten_var_entit(6670, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6642, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'ENONC_CONDT' and ref_entit = sie$migrt$pkg.obten_var_entit(6689, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6656, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'ID_SESN' and ref_entit = sie$migrt$pkg.obten_var_entit(6628, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NUMR_MESG' and ref_entit = sie$migrt$pkg.obten_var_entit(6572, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_NUMBR3' and ref_entit = sie$migrt$pkg.obten_var_entit(6732, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6650, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6657, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'ACTIO' and ref_entit = sie$migrt$pkg.obten_var_entit(6638, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'FORML_VALR_SNPI' and ref_entit = sie$migrt$pkg.obten_var_entit(6684, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6672, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_CLAS_INTER' and ref_entit = sie$migrt$pkg.obten_var_entit(6696, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6716, 'Update') where code = 'REF_DOSR_VIRTL' and ref_entit = sie$migrt$pkg.obten_var_entit(6728, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'ADRES_ENVOY' and ref_entit = sie$migrt$pkg.obten_var_entit(6727, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'TITRE_ATRIB4' and ref_entit = sie$migrt$pkg.obten_var_entit(6644, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6666, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6572, 'Update') where code = 'REF_MESG_AIDE' and ref_entit = sie$migrt$pkg.obten_var_entit(6627, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6654, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'TRAVL' and ref_entit = sie$migrt$pkg.obten_var_entit(6668, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_AFECT_INPUT_HTML' and ref_entit = sie$migrt$pkg.obten_var_entit(6644, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR' and ref_entit = sie$migrt$pkg.obten_var_entit(6658, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_UTILS' and ref_entit = sie$migrt$pkg.obten_var_entit(6669, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PARMT_TYPE_PUBLC' and ref_entit = sie$migrt$pkg.obten_var_entit(6701, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6723, 'Update') where code = 'REF_ENGIN' and ref_entit = sie$migrt$pkg.obten_var_entit(6715, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'TYPE_DON' and ref_entit = sie$migrt$pkg.obten_var_entit(6686, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM_COLN' and ref_entit = sie$migrt$pkg.obten_var_entit(6615, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PLUGN' and ref_entit = sie$migrt$pkg.obten_var_entit(6705, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6632, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6636, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6613, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VARBL3' and ref_entit = sie$migrt$pkg.obten_var_entit(6667, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'ORDRE_PRESN' and ref_entit = sie$migrt$pkg.obten_var_entit(6715, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6653, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NUMR_APLIC_CIBLE' and ref_entit = sie$migrt$pkg.obten_var_entit(6625, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_MAJ_REFRN' and ref_entit = sie$migrt$pkg.obten_var_entit(6625, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_SESN' and ref_entit = sie$migrt$pkg.obten_var_entit(6625, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6625, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6656, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS' and ref_entit = sie$migrt$pkg.obten_var_entit(6730, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6572, 'Update') where code = 'REF_MESG_SUPRS_SPECF' and ref_entit = sie$migrt$pkg.obten_var_entit(6650, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_CLE' and ref_entit = sie$migrt$pkg.obten_var_entit(6644, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6666, 'Update') where code = 'REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6642, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'LARGR_PREPN' and ref_entit = sie$migrt$pkg.obten_var_entit(6728, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SSPC' and ref_entit = sie$migrt$pkg.obten_var_entit(6663, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6636, 'Update') where code = 'REF_STAT_EVOLT' and ref_entit = sie$migrt$pkg.obten_var_entit(6664, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6707, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6674, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6653, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6646, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_PRISE_CHARG_SIE04' and ref_entit = sie$migrt$pkg.obten_var_entit(6650, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6642, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'TEXT' and ref_entit = sie$migrt$pkg.obten_var_entit(6632, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6615, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6709, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6646, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6702, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6700, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6706, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DV_TYPE_ATRIB1' and ref_entit = sie$migrt$pkg.obten_var_entit(6644, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'LIBL' and ref_entit = sie$migrt$pkg.obten_var_entit(6652, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6705, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6674, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR' and ref_entit = sie$migrt$pkg.obten_var_entit(6662, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6631, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6647, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6673, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6651, 'Update') where code = 'REF_PAGE_IR' and ref_entit = sie$migrt$pkg.obten_var_entit(6627, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PROFL_COURL' and ref_entit = sie$migrt$pkg.obten_var_entit(6602, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6652, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6604, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_STAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6585, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DV_TAIL_RELTV' and ref_entit = sie$migrt$pkg.obten_var_entit(6584, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6585, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_MODL_RECHR_DEFT' and ref_entit = sie$migrt$pkg.obten_var_entit(6697, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6582, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = sie$migrt$pkg.obten_var_entit(6585, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_LIEN' and ref_entit = sie$migrt$pkg.obten_var_entit(6582, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6580, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_DEFT' and ref_entit = sie$migrt$pkg.obten_var_entit(6595, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_DECMP_RESLT' and ref_entit = sie$migrt$pkg.obten_var_entit(6582, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6576, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_STAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6584, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6584, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6583, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6576, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_CARNT_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6585, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_VERSN' and ref_entit = sie$migrt$pkg.obten_var_entit(6576, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6581, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_UTILS_RESPN' and ref_entit = sie$migrt$pkg.obten_var_entit(6585, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6577, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6665, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_DEFT_ATRIB3' and ref_entit = sie$migrt$pkg.obten_var_entit(6644, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_RESRC' and ref_entit = sie$migrt$pkg.obten_var_entit(6705, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6701, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'COLN_LIEN' and ref_entit = sie$migrt$pkg.obten_var_entit(6689, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = sie$migrt$pkg.obten_var_entit(6723, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_AGREG' and ref_entit = sie$migrt$pkg.obten_var_entit(6674, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6638, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_DEFT' and ref_entit = sie$migrt$pkg.obten_var_entit(6626, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_SIE_13_PAGE' and ref_entit = sie$migrt$pkg.obten_var_entit(6580, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'URL_SERVL_EXTER' and ref_entit = sie$migrt$pkg.obten_var_entit(6723, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6718, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6642, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6653, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6635, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = sie$migrt$pkg.obten_var_entit(6675, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_FIN_EFECT' and ref_entit = sie$migrt$pkg.obten_var_entit(6631, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6698, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6633, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6714, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'ENONC' and ref_entit = sie$migrt$pkg.obten_var_entit(6693, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6701, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VARBL1' and ref_entit = sie$migrt$pkg.obten_var_entit(6667, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6646, 'Update') where code = 'REF_OPERT' and ref_entit = sie$migrt$pkg.obten_var_entit(6640, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6700, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'COLN_TITRE' and ref_entit = sie$migrt$pkg.obten_var_entit(6689, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6685, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6664, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6728, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_VARCH9' and ref_entit = sie$migrt$pkg.obten_var_entit(6732, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6581, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6579, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6577, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC_ELEMN' and ref_entit = sie$migrt$pkg.obten_var_entit(6720, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = sie$migrt$pkg.obten_var_entit(6643, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6717, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'APP' and ref_entit = sie$migrt$pkg.obten_var_entit(6730, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_ITEM_CARNT_SPRIN' and ref_entit = sie$migrt$pkg.obten_var_entit(6579, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6581, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'ID_APEX' and ref_entit = sie$migrt$pkg.obten_var_entit(6651, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6630, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6671, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6641, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6699, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6699, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DV_TYPE_SECTN' and ref_entit = sie$migrt$pkg.obten_var_entit(6677, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6690, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_DATE10' and ref_entit = sie$migrt$pkg.obten_var_entit(6732, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'COLN_TITRE_AIDE_INSTA' and ref_entit = sie$migrt$pkg.obten_var_entit(6671, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6673, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6726, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6666, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6679, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_AFICH' and ref_entit = sie$migrt$pkg.obten_var_entit(6683, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6666, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_EXPIR' and ref_entit = sie$migrt$pkg.obten_var_entit(6649, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'HAUTR_REGN_ARBRE' and ref_entit = sie$migrt$pkg.obten_var_entit(6689, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6661, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = sie$migrt$pkg.obten_var_entit(6695, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6669, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6615, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_PUBLC' and ref_entit = sie$migrt$pkg.obten_var_entit(6674, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_TYPE_PUBLC' and ref_entit = sie$migrt$pkg.obten_var_entit(6699, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6682, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6650, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6727, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6637, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_DEFT_ATRIB1' and ref_entit = sie$migrt$pkg.obten_var_entit(6644, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'OBTEN_JSON_ARBRE_NOMBR_NIV' and ref_entit = sie$migrt$pkg.obten_var_entit(6689, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6676, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'APEX_REPTS_ID' and ref_entit = sie$migrt$pkg.obten_var_entit(6634, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6720, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = sie$migrt$pkg.obten_var_entit(6704, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6627, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6630, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_CONDT_EXECT' and ref_entit = sie$migrt$pkg.obten_var_entit(6705, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_OUVRI_NOEUD' and ref_entit = sie$migrt$pkg.obten_var_entit(6704, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6684, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DTHR' and ref_entit = sie$migrt$pkg.obten_var_entit(6730, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'PAGE' and ref_entit = sie$migrt$pkg.obten_var_entit(6663, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6632, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'BB' and ref_entit = sie$migrt$pkg.obten_var_entit(6730, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6670, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6680, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6722, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6572, 'Update') where code = 'REF_MESG_ERR_SUPRS' and ref_entit = sie$migrt$pkg.obten_var_entit(6642, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM_ENVOY' and ref_entit = sie$migrt$pkg.obten_var_entit(6727, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6658, 'Update') where code = 'REF_DV_VALR_SSPI' and ref_entit = sie$migrt$pkg.obten_var_entit(6684, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'TITRE_ATRIB1' and ref_entit = sie$migrt$pkg.obten_var_entit(6644, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6681, 'Update') where code = 'REF_TYPE_FICHR' and ref_entit = sie$migrt$pkg.obten_var_entit(6685, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = sie$migrt$pkg.obten_var_entit(6648, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6694, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6632, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = sie$migrt$pkg.obten_var_entit(6697, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_DEBUT_EFECT' and ref_entit = sie$migrt$pkg.obten_var_entit(6696, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6733, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_SELCT_NOEUD' and ref_entit = sie$migrt$pkg.obten_var_entit(6704, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6725, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6685, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CONDT_PRISE_CHARG' and ref_entit = sie$migrt$pkg.obten_var_entit(6644, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = sie$migrt$pkg.obten_var_entit(6689, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6694, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6670, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6641, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6687, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6676, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6662, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6660, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'COLN_TYPE' and ref_entit = sie$migrt$pkg.obten_var_entit(6671, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = sie$migrt$pkg.obten_var_entit(6715, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM_ICON' and ref_entit = sie$migrt$pkg.obten_var_entit(6681, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6696, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6721, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6726, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6617, 'Update') where code = 'REF_LANG' and ref_entit = sie$migrt$pkg.obten_var_entit(6613, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR_ATRIB_5' and ref_entit = sie$migrt$pkg.obten_var_entit(6665, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6678, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM_ORGAN' and ref_entit = sie$migrt$pkg.obten_var_entit(6687, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM_COLN' and ref_entit = sie$migrt$pkg.obten_var_entit(6573, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6573, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'COLN_DATE_FIN_JOURN_COMPL' and ref_entit = sie$migrt$pkg.obten_var_entit(6671, 'Select');
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('sie_11_atrib_entit');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('sie_11_atrib_entit');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM_FONCT' and ref_entit = sie$migrt$pkg.obten_var_entit(6573, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6573, 'Update') where code = 'REF_ATRIB_STRUC_APLIC' and ref_entit = sie$migrt$pkg.obten_var_entit(6573, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_UTILS' and ref_entit = sie$migrt$pkg.obten_var_entit(6608, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6589, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_PERTN' and ref_entit = sie$migrt$pkg.obten_var_entit(6606, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6603, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6603, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOMBR_MAXIM_RESLT' and ref_entit = sie$migrt$pkg.obten_var_entit(6591, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DETL_APLIC_MODL_RECHR' and ref_entit = sie$migrt$pkg.obten_var_entit(6606, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6640, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'ACTIO_INTER' and ref_entit = sie$migrt$pkg.obten_var_entit(6638, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6628, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6716, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6707, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6638, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6698, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6695, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CORDN_Y_DEBUT' and ref_entit = sie$migrt$pkg.obten_var_entit(6728, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_RECHR' and ref_entit = sie$migrt$pkg.obten_var_entit(6589, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'ENONC_PLSQL_DROIT' and ref_entit = sie$migrt$pkg.obten_var_entit(6590, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PATRN_RECHR' and ref_entit = sie$migrt$pkg.obten_var_entit(6588, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6666, 'Update') where code = 'REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6590, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_MODL_RECHR' and ref_entit = sie$migrt$pkg.obten_var_entit(6608, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6608, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6608, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6603, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DOMN' and ref_entit = sie$migrt$pkg.obten_var_entit(6603, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = sie$migrt$pkg.obten_var_entit(6590, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_ENONC_RECHR' and ref_entit = sie$migrt$pkg.obten_var_entit(6606, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_ATRIB_STRUC_APLIC' and ref_entit = sie$migrt$pkg.obten_var_entit(6588, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DV_PRIOR' and ref_entit = sie$migrt$pkg.obten_var_entit(6584, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_UTILS' and ref_entit = sie$migrt$pkg.obten_var_entit(6581, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'ORDRE_EXECT' and ref_entit = sie$migrt$pkg.obten_var_entit(6588, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6578, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6603, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6606, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE_CONTR' and ref_entit = sie$migrt$pkg.obten_var_entit(6621, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'ORDRE_APART' and ref_entit = sie$migrt$pkg.obten_var_entit(6589, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6590, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6588, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_STRUC_APLIC_LIEN' and ref_entit = sie$migrt$pkg.obten_var_entit(6591, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6589, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6621, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6588, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6590, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = sie$migrt$pkg.obten_var_entit(6590, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6589, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6606, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_UTILS' and ref_entit = sie$migrt$pkg.obten_var_entit(6574, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SENS' and ref_entit = sie$migrt$pkg.obten_var_entit(6611, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6591, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = sie$migrt$pkg.obten_var_entit(6603, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6591, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6590, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_UTILS_RESPN' and ref_entit = sie$migrt$pkg.obten_var_entit(6578, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6588, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6585, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_EXECT' and ref_entit = sie$migrt$pkg.obten_var_entit(6608, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6589, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_APLIC_MODL_RECHR' and ref_entit = sie$migrt$pkg.obten_var_entit(6588, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6575, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6575, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6608, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NIV_GRAVT' and ref_entit = sie$migrt$pkg.obten_var_entit(6620, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6590, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6591, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'PAGE_ID' and ref_entit = sie$migrt$pkg.obten_var_entit(6620, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6574, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'PERTN' and ref_entit = sie$migrt$pkg.obten_var_entit(6588, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6589, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6608, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'EFORT_RESTN' and ref_entit = sie$migrt$pkg.obten_var_entit(6583, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6603, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SENS' and ref_entit = sie$migrt$pkg.obten_var_entit(6600, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_STRUC_APLIC_RECHR' and ref_entit = sie$migrt$pkg.obten_var_entit(6591, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6581, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6624, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'COULR_TEXT' and ref_entit = sie$migrt$pkg.obten_var_entit(6738, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'FLOW_ID' and ref_entit = sie$migrt$pkg.obten_var_entit(6620, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'ACOUN_ID' and ref_entit = sie$migrt$pkg.obten_var_entit(6598, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = sie$migrt$pkg.obten_var_entit(6594, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6621, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'TYPE_TRAVL_DEFT' and ref_entit = sie$migrt$pkg.obten_var_entit(6697, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = sie$migrt$pkg.obten_var_entit(6604, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'RESLT' and ref_entit = sie$migrt$pkg.obten_var_entit(6609, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'COULR_BORDR' and ref_entit = sie$migrt$pkg.obten_var_entit(6698, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6694, 'Update') where code = 'REF_RESRC_ICON' and ref_entit = sie$migrt$pkg.obten_var_entit(6596, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_ATRIB_STRUC_APLIC_AFICH' and ref_entit = sie$migrt$pkg.obten_var_entit(6591, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6621, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6621, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_RECHR' and ref_entit = sie$migrt$pkg.obten_var_entit(6606, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'ID' and ref_entit = sie$migrt$pkg.obten_var_entit(6620, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6621, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6621, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NATR' and ref_entit = sie$migrt$pkg.obten_var_entit(6620, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NIV_GRAVT' and ref_entit = sie$migrt$pkg.obten_var_entit(6621, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_CONTR' and ref_entit = sie$migrt$pkg.obten_var_entit(6620, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_ATRIB_SA_NOM_FORMT' and ref_entit = sie$migrt$pkg.obten_var_entit(6736, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM_COMPS' and ref_entit = sie$migrt$pkg.obten_var_entit(6620, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_CARNT_SPRIN' and ref_entit = sie$migrt$pkg.obten_var_entit(6577, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_RESLT_RECHR' and ref_entit = sie$migrt$pkg.obten_var_entit(6606, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6585, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6596, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = sie$migrt$pkg.obten_var_entit(6605, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NUMR' and ref_entit = sie$migrt$pkg.obten_var_entit(6598, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6593, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NUMR_DE' and ref_entit = sie$migrt$pkg.obten_var_entit(6600, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_TYPE_COMNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6595, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_CARNT_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6584, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6583, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'COMNT' and ref_entit = sie$migrt$pkg.obten_var_entit(6579, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CONTN' and ref_entit = sie$migrt$pkg.obten_var_entit(6599, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'TW_SID' and ref_entit = sie$migrt$pkg.obten_var_entit(6600, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = sie$migrt$pkg.obten_var_entit(6602, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6760, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6760, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6760, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6760, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6760, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_COURL_ENTRA' and ref_entit = sie$migrt$pkg.obten_var_entit(6760, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6760, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_REPRS_LECTR_ENTRA' and ref_entit = sie$migrt$pkg.obten_var_entit(6727, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_LECTR_ENTRA_ERR' and ref_entit = sie$migrt$pkg.obten_var_entit(6727, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_LIRE_PROFL_ENTRA' and ref_entit = sie$migrt$pkg.obten_var_entit(6727, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_RECPT' and ref_entit = sie$migrt$pkg.obten_var_entit(6769, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PROFL_COURL' and ref_entit = sie$migrt$pkg.obten_var_entit(6769, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6769, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_COURL' and ref_entit = sie$migrt$pkg.obten_var_entit(6769, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6769, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6769, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6769, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6769, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'TAIL_MESG' and ref_entit = sie$migrt$pkg.obten_var_entit(6769, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_REPND' and ref_entit = sie$migrt$pkg.obten_var_entit(6769, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_RECNT' and ref_entit = sie$migrt$pkg.obten_var_entit(6769, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_LU' and ref_entit = sie$migrt$pkg.obten_var_entit(6769, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_SUPRM' and ref_entit = sie$migrt$pkg.obten_var_entit(6769, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'COURL_EXPED' and ref_entit = sie$migrt$pkg.obten_var_entit(6769, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM_EXPED' and ref_entit = sie$migrt$pkg.obten_var_entit(6769, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CONTN_HTML' and ref_entit = sie$migrt$pkg.obten_var_entit(6769, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CONTN_TEXTE_PUR' and ref_entit = sie$migrt$pkg.obten_var_entit(6769, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'OBJET' and ref_entit = sie$migrt$pkg.obten_var_entit(6769, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6761, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'TAIL' and ref_entit = sie$migrt$pkg.obten_var_entit(6761, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'PROPR' and ref_entit = sie$migrt$pkg.obten_var_entit(6761, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_MIME_TYPE' and ref_entit = sie$migrt$pkg.obten_var_entit(6761, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CONTN' and ref_entit = sie$migrt$pkg.obten_var_entit(6761, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6761, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_COURL_ENTRA' and ref_entit = sie$migrt$pkg.obten_var_entit(6761, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6761, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6761, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NUMR_PIECE_CORPS_MESG' and ref_entit = sie$migrt$pkg.obten_var_entit(6761, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6761, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DOMN' and ref_entit = sie$migrt$pkg.obten_var_entit(6641, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOMBR_PAGE_LARGR' and ref_entit = sie$migrt$pkg.obten_var_entit(6651, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_FORCR_AJUST_PAGE' and ref_entit = sie$migrt$pkg.obten_var_entit(6651, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'RESRC_ADITN' and ref_entit = sie$migrt$pkg.obten_var_entit(6714, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DV_COMPL_MAXM' and ref_entit = sie$migrt$pkg.obten_var_entit(6649, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'PROCD_IMPRE_PIED_PAGE_PDF_IR' and ref_entit = sie$migrt$pkg.obten_var_entit(6666, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6814, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6807, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6807, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6807, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6807, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = sie$migrt$pkg.obten_var_entit(6807, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6807, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6646, 'Update') where code = 'REF_OPERT' and ref_entit = sie$migrt$pkg.obten_var_entit(6807, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6807, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'PREPN' and ref_entit = sie$migrt$pkg.obten_var_entit(6807, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'FORML_CONDT_AFICH' and ref_entit = sie$migrt$pkg.obten_var_entit(6684, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6658, 'Update') where code = 'REF_DV_VALR_INSTA_CONDT_AFICH' and ref_entit = sie$migrt$pkg.obten_var_entit(6684, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE_UTILS_BASE_DON' and ref_entit = sie$migrt$pkg.obten_var_entit(6649, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6812, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6812, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6812, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6812, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_OPERT_OPTIO' and ref_entit = sie$migrt$pkg.obten_var_entit(6812, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_OPERT' and ref_entit = sie$migrt$pkg.obten_var_entit(6812, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_GROUP_UTILS' and ref_entit = sie$migrt$pkg.obten_var_entit(6812, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6804, 'Update') where code = 'REF_FONCT' and ref_entit = sie$migrt$pkg.obten_var_entit(6647, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6814, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6814, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6814, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6642, 'Update') where code = 'REF_STRUC_APLIC' and ref_entit = sie$migrt$pkg.obten_var_entit(6814, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6804, 'Update') where code = 'REF_FONCT' and ref_entit = sie$migrt$pkg.obten_var_entit(6814, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6814, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6804, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6804, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6804, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6804, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6804, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = sie$migrt$pkg.obten_var_entit(6804, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'NOM' and ref_entit = sie$migrt$pkg.obten_var_entit(6804, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = sie$migrt$pkg.obten_var_entit(6804, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6666, 'Update') where code = 'REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6804, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6804, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6806, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6806, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6806, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6806, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'INDIC_ACTIF' and ref_entit = sie$migrt$pkg.obten_var_entit(6806, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DOMN' and ref_entit = sie$migrt$pkg.obten_var_entit(6806, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_FONCT' and ref_entit = sie$migrt$pkg.obten_var_entit(6806, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6806, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'COMPT_GENRL' and ref_entit = sie$migrt$pkg.obten_var_entit(6666, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6805, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6805, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6805, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6805, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR' and ref_entit = sie$migrt$pkg.obten_var_entit(6805, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = sie$migrt$pkg.obten_var_entit(6805, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6805, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DESCR' and ref_entit = sie$migrt$pkg.obten_var_entit(6621, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'VALR' and ref_entit = sie$migrt$pkg.obten_var_entit(6760, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'TYPE_CONTN' and ref_entit = sie$migrt$pkg.obten_var_entit(6769, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_MODFC' and ref_entit = sie$migrt$pkg.obten_var_entit(6761, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'UTILS_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6807, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'CODE' and ref_entit = sie$migrt$pkg.obten_var_entit(6807, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6804, 'Update') where code = 'REF_FONCT' and ref_entit = sie$migrt$pkg.obten_var_entit(6646, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DOMN' and ref_entit = sie$migrt$pkg.obten_var_entit(6629, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_DOMN' and ref_entit = sie$migrt$pkg.obten_var_entit(6812, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'SEQNC' and ref_entit = sie$migrt$pkg.obten_var_entit(6812, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DATE_CREAT' and ref_entit = sie$migrt$pkg.obten_var_entit(6814, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'PROCD_PLPDF_COULR' and ref_entit = sie$migrt$pkg.obten_var_entit(6666, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'PROCD_IMPRE_ENTET_PDF_IR' and ref_entit = sie$migrt$pkg.obten_var_entit(6666, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'REF_PAGE_ACUEI' and ref_entit = sie$migrt$pkg.obten_var_entit(6742, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = null where code = 'DNR_REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6632, 'Select');
update sie_11_atrib_entit set ref_entit_refrn = sie$migrt$pkg.obten_var_entit(6666, 'Update') where code = 'REF_PRODT' and ref_entit = sie$migrt$pkg.obten_var_entit(6632, 'Select');
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$11_atrib_entit;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_11_atrib_entit');
  end if;
end;
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_11_atrib_entit');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$01_atrib_modl_comnc;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_01_atrib_modl_comnc');
  end if;
end;
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_01_atrib_modl_comnc');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$14_type_domn_valr;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_14_type_domn_valr');
  end if;
end;
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_14_type_domn_valr');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
update sie_13_mime_type set ref_type_fichr = null where ext = '.sbk' and mime_type = 'application/x-tbook';
update sie_13_mime_type set ref_type_fichr = null where ext = '.scm' and mime_type = 'application/x-lotusscreencam';
update sie_13_mime_type set ref_type_fichr = null where ext = '.scm' and mime_type = 'text/x-script.guile';
update sie_13_mime_type set ref_type_fichr = null where ext = '.scm' and mime_type = 'text/x-script.scheme';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.scm' and mime_type = 'video/x-scm';
update sie_13_mime_type set ref_type_fichr = null where ext = '.sdml' and mime_type = 'text/plain';
update sie_13_mime_type set ref_type_fichr = null where ext = '.sdp' and mime_type = 'application/sdp';
update sie_13_mime_type set ref_type_fichr = null where ext = '.sdp' and mime_type = 'application/x-sdp';
update sie_13_mime_type set ref_type_fichr = null where ext = '.sdr' and mime_type = 'application/sounder';
update sie_13_mime_type set ref_type_fichr = null where ext = '.sea' and mime_type = 'application/sea';
update sie_13_mime_type set ref_type_fichr = null where ext = '.sea' and mime_type = 'application/x-sea';
update sie_13_mime_type set ref_type_fichr = null where ext = '.set' and mime_type = 'application/set';
update sie_13_mime_type set ref_type_fichr = null where ext = '.sgm' and mime_type = 'text/sgml';
update sie_13_mime_type set ref_type_fichr = null where ext = '.sgm' and mime_type = 'text/x-sgml';
update sie_13_mime_type set ref_type_fichr = null where ext = '.sgml' and mime_type = 'text/sgml';
update sie_13_mime_type set ref_type_fichr = null where ext = '.sgml' and mime_type = 'text/x-sgml';
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('sie_13_mime_type');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('sie_13_mime_type');
update sie_13_mime_type set ref_type_fichr = null where ext = '.sh' and mime_type = 'application/x-bsh';
update sie_13_mime_type set ref_type_fichr = null where ext = '.sh' and mime_type = 'application/x-sh';
update sie_13_mime_type set ref_type_fichr = null where ext = '.sh' and mime_type = 'application/x-shar';
update sie_13_mime_type set ref_type_fichr = null where ext = '.sh' and mime_type = 'text/x-script.sh';
update sie_13_mime_type set ref_type_fichr = null where ext = '.shar' and mime_type = 'application/x-bsh';
update sie_13_mime_type set ref_type_fichr = null where ext = '.shar' and mime_type = 'application/x-shar';
update sie_13_mime_type set ref_type_fichr = null where ext = '.shtml' and mime_type = 'text/html';
update sie_13_mime_type set ref_type_fichr = null where ext = '.shtml' and mime_type = 'text/x-server-parsed-html';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.sid' and mime_type = 'audio/x-psid';
update sie_13_mime_type set ref_type_fichr = null where ext = '.sit' and mime_type = 'application/x-sit';
update sie_13_mime_type set ref_type_fichr = null where ext = '.sit' and mime_type = 'application/x-stuffit';
update sie_13_mime_type set ref_type_fichr = null where ext = '.skd' and mime_type = 'application/x-koan';
update sie_13_mime_type set ref_type_fichr = null where ext = '.skm' and mime_type = 'application/x-koan';
update sie_13_mime_type set ref_type_fichr = null where ext = '.skp' and mime_type = 'application/x-koan';
update sie_13_mime_type set ref_type_fichr = null where ext = '.skt' and mime_type = 'application/x-koan';
update sie_13_mime_type set ref_type_fichr = null where ext = '.sl' and mime_type = 'application/x-seelogo';
update sie_13_mime_type set ref_type_fichr = null where ext = '.smi' and mime_type = 'application/smil';
update sie_13_mime_type set ref_type_fichr = null where ext = '.smil' and mime_type = 'application/smil';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.snd' and mime_type = 'audio/basic';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.snd' and mime_type = 'audio/x-adpcm';
update sie_13_mime_type set ref_type_fichr = null where ext = '.sol' and mime_type = 'application/solids';
update sie_13_mime_type set ref_type_fichr = null where ext = '.spc' and mime_type = 'application/x-pkcs7-certificates';
update sie_13_mime_type set ref_type_fichr = null where ext = '.spc' and mime_type = 'text/x-speech';
update sie_13_mime_type set ref_type_fichr = null where ext = '.spl' and mime_type = 'application/futuresplash';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.spr' and mime_type = 'application/x-sprite';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.sprite' and mime_type = 'application/x-sprite';
update sie_13_mime_type set ref_type_fichr = null where ext = '.src' and mime_type = 'application/x-wais-source';
update sie_13_mime_type set ref_type_fichr = null where ext = '.ssi' and mime_type = 'text/x-server-parsed-html';
update sie_13_mime_type set ref_type_fichr = null where ext = '.ssm' and mime_type = 'application/streamingmedia';
update sie_13_mime_type set ref_type_fichr = null where ext = '.sst' and mime_type = 'application/vnd.ms-pki.certstore';
update sie_13_mime_type set ref_type_fichr = null where ext = '.step' and mime_type = 'application/step';
update sie_13_mime_type set ref_type_fichr = null where ext = '.stl' and mime_type = 'application/sla';
update sie_13_mime_type set ref_type_fichr = null where ext = '.stl' and mime_type = 'application/vnd.ms-pki.stl';
update sie_13_mime_type set ref_type_fichr = null where ext = '.stl' and mime_type = 'application/x-navistyle';
update sie_13_mime_type set ref_type_fichr = null where ext = '.stp' and mime_type = 'application/step';
update sie_13_mime_type set ref_type_fichr = null where ext = '.sv4cpio' and mime_type = 'application/x-sv4cpio';
update sie_13_mime_type set ref_type_fichr = null where ext = '.sv4crc' and mime_type = 'application/x-sv4crc';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.svf' and mime_type = 'image/vnd.dwg';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.svf' and mime_type = 'image/x-dwg';
update sie_13_mime_type set ref_type_fichr = null where ext = '.svr' and mime_type = 'application/x-world';
update sie_13_mime_type set ref_type_fichr = null where ext = '.svr' and mime_type = 'x-world/x-svr';
update sie_13_mime_type set ref_type_fichr = null where ext = '.swf' and mime_type = 'application/x-shockwave-flash';
update sie_13_mime_type set ref_type_fichr = null where ext = '.t' and mime_type = 'application/x-troff';
update sie_13_mime_type set ref_type_fichr = null where ext = '.talk' and mime_type = 'text/x-speech';
update sie_13_mime_type set ref_type_fichr = null where ext = '.tar' and mime_type = 'application/x-tar';
update sie_13_mime_type set ref_type_fichr = null where ext = '.tbk' and mime_type = 'application/toolbook';
update sie_13_mime_type set ref_type_fichr = null where ext = '.tbk' and mime_type = 'application/x-tbook';
update sie_13_mime_type set ref_type_fichr = null where ext = '.tcl' and mime_type = 'application/x-tcl';
update sie_13_mime_type set ref_type_fichr = null where ext = '.tcl' and mime_type = 'text/x-script.tcl';
update sie_13_mime_type set ref_type_fichr = null where ext = '.tcsh' and mime_type = 'text/x-script.tcsh';
update sie_13_mime_type set ref_type_fichr = null where ext = '.tex' and mime_type = 'application/x-tex';
update sie_13_mime_type set ref_type_fichr = null where ext = '.texi' and mime_type = 'application/x-texinfo';
update sie_13_mime_type set ref_type_fichr = null where ext = '.texinfo' and mime_type = 'application/x-texinfo';
update sie_13_mime_type set ref_type_fichr = null where ext = '.text' and mime_type = 'application/plain';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(23, 'Update') where ext = '.text' and mime_type = 'text/plain';
update sie_13_mime_type set ref_type_fichr = null where ext = '.tgz' and mime_type = 'application/gnutar';
update sie_13_mime_type set ref_type_fichr = null where ext = '.tgz' and mime_type = 'application/x-compressed';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.tif' and mime_type = 'image/tiff';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.tif' and mime_type = 'image/x-tiff';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.tiff' and mime_type = 'image/tiff';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.tiff' and mime_type = 'image/x-tiff';
update sie_13_mime_type set ref_type_fichr = null where ext = '.tr' and mime_type = 'application/x-troff';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.tsi' and mime_type = 'audio/tsp-audio';
update sie_13_mime_type set ref_type_fichr = null where ext = '.tsp' and mime_type = 'application/dsptype';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.tsp' and mime_type = 'audio/tsplayer';
update sie_13_mime_type set ref_type_fichr = null where ext = '.tsv' and mime_type = 'text/tab-separated-values';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.turbot' and mime_type = 'image/florian';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(23, 'Update') where ext = '.txt' and mime_type = 'text/plain';
update sie_13_mime_type set ref_type_fichr = null where ext = '.uil' and mime_type = 'text/x-uil';
update sie_13_mime_type set ref_type_fichr = null where ext = '.uni' and mime_type = 'text/uri-list';
update sie_13_mime_type set ref_type_fichr = null where ext = '.unis' and mime_type = 'text/uri-list';
update sie_13_mime_type set ref_type_fichr = null where ext = '.unv' and mime_type = 'application/i-deas';
update sie_13_mime_type set ref_type_fichr = null where ext = '.uri' and mime_type = 'text/uri-list';
update sie_13_mime_type set ref_type_fichr = null where ext = '.uris' and mime_type = 'text/uri-list';
update sie_13_mime_type set ref_type_fichr = null where ext = '.ustar' and mime_type = 'application/x-ustar';
update sie_13_mime_type set ref_type_fichr = null where ext = '.ustar' and mime_type = 'multipart/x-ustar';
update sie_13_mime_type set ref_type_fichr = null where ext = '.uu' and mime_type = 'application/octet-stream';
update sie_13_mime_type set ref_type_fichr = null where ext = '.uu' and mime_type = 'text/x-uuencode';
update sie_13_mime_type set ref_type_fichr = null where ext = '.uue' and mime_type = 'text/x-uuencode';
update sie_13_mime_type set ref_type_fichr = null where ext = '.vcd' and mime_type = 'application/x-cdlink';
update sie_13_mime_type set ref_type_fichr = null where ext = '.vcs' and mime_type = 'text/x-vcalendar';
update sie_13_mime_type set ref_type_fichr = null where ext = '.vda' and mime_type = 'application/vda';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.vdo' and mime_type = 'video/vdo';
update sie_13_mime_type set ref_type_fichr = null where ext = '.vew' and mime_type = 'application/groupwise';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.viv' and mime_type = 'video/vivo';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.viv' and mime_type = 'video/vnd.vivo';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.vivo' and mime_type = 'video/vivo';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.vivo' and mime_type = 'video/vnd.vivo';
update sie_13_mime_type set ref_type_fichr = null where ext = '.vmd' and mime_type = 'application/vocaltec-media-desc';
update sie_13_mime_type set ref_type_fichr = null where ext = '.vmf' and mime_type = 'application/vocaltec-media-file';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.voc' and mime_type = 'audio/voc';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.voc' and mime_type = 'audio/x-voc';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.vos' and mime_type = 'video/vosaic';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.vox' and mime_type = 'audio/voxware';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.vqe' and mime_type = 'audio/x-twinvq-plugin';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.vqf' and mime_type = 'audio/x-twinvq';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.vql' and mime_type = 'audio/x-twinvq-plugin';
update sie_13_mime_type set ref_type_fichr = null where ext = '.vrml' and mime_type = 'application/x-vrml';
update sie_13_mime_type set ref_type_fichr = null where ext = '.vrml' and mime_type = 'model/vrml';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(21, 'Update') where ext = '.xls' and mime_type = 'application/x-msexcel';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(21, 'Update') where ext = '.xlt' and mime_type = 'application/excel';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(21, 'Update') where ext = '.xlt' and mime_type = 'application/x-excel';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(21, 'Update') where ext = '.xlv' and mime_type = 'application/excel';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(21, 'Update') where ext = '.xlv' and mime_type = 'application/x-excel';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(21, 'Update') where ext = '.xlw' and mime_type = 'application/excel';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(21, 'Update') where ext = '.xlw' and mime_type = 'application/vnd.ms-excel';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(21, 'Update') where ext = '.xlw' and mime_type = 'application/x-excel';
update sie_13_mime_type set ref_type_fichr = null where ext = '.xlw' and mime_type = 'application/x-msexcel';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.xm' and mime_type = 'audio/xm';
update sie_13_mime_type set ref_type_fichr = null where ext = '.xml' and mime_type = 'application/xml';
update sie_13_mime_type set ref_type_fichr = null where ext = '.xml' and mime_type = 'text/xml';
update sie_13_mime_type set ref_type_fichr = null where ext = '.xmz' and mime_type = 'xgl/movie';
update sie_13_mime_type set ref_type_fichr = null where ext = '.xpix' and mime_type = 'application/x-vnd.ls-xpix';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.xpm' and mime_type = 'image/x-xpixmap';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.xpm' and mime_type = 'image/xpm';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.x-png' and mime_type = 'image/png';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.xsr' and mime_type = 'video/x-amt-showrun';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.xwd' and mime_type = 'image/x-xwd';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.xwd' and mime_type = 'image/x-xwindowdump';
update sie_13_mime_type set ref_type_fichr = null where ext = '.xyz' and mime_type = 'chemical/x-pdb';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(4, 'Update') where ext = '.z' and mime_type = 'application/x-compress';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(4, 'Update') where ext = '.z' and mime_type = 'application/x-compressed';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(4, 'Update') where ext = '.zip' and mime_type = 'application/x-compressed';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(4, 'Update') where ext = '.zip' and mime_type = 'application/x-zip-compressed';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(4, 'Update') where ext = '.zip' and mime_type = 'application/zip';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(4, 'Update') where ext = '.zip' and mime_type = 'multipart/x-zip';
update sie_13_mime_type set ref_type_fichr = null where ext = '.zoo' and mime_type = 'application/octet-stream';
update sie_13_mime_type set ref_type_fichr = null where ext = '.zsh' and mime_type = 'text/x-script.zsh';
update sie_13_mime_type set ref_type_fichr = null where ext = '.3dm' and mime_type = 'x-world/x-3dmf';
update sie_13_mime_type set ref_type_fichr = null where ext = '.3dmf' and mime_type = 'x-world/x-3dmf';
update sie_13_mime_type set ref_type_fichr = null where ext = '.a' and mime_type = 'application/octet-stream';
update sie_13_mime_type set ref_type_fichr = null where ext = '.aab' and mime_type = 'application/x-authorware-bin';
update sie_13_mime_type set ref_type_fichr = null where ext = '.aam' and mime_type = 'application/x-authorware-map';
update sie_13_mime_type set ref_type_fichr = null where ext = '.aas' and mime_type = 'application/x-authorware-seg';
update sie_13_mime_type set ref_type_fichr = null where ext = '.abc' and mime_type = 'text/vnd.abc';
update sie_13_mime_type set ref_type_fichr = null where ext = '.acgi' and mime_type = 'text/html';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.afl' and mime_type = 'video/animaflex';
update sie_13_mime_type set ref_type_fichr = null where ext = '.ai' and mime_type = 'application/postscript';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.aif' and mime_type = 'audio/aiff';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.aif' and mime_type = 'audio/x-aiff';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.aifc' and mime_type = 'audio/aiff';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.aifc' and mime_type = 'audio/x-aiff';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.aiff' and mime_type = 'audio/aiff';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.aiff' and mime_type = 'audio/x-aiff';
update sie_13_mime_type set ref_type_fichr = null where ext = '.aim' and mime_type = 'application/x-aim';
update sie_13_mime_type set ref_type_fichr = null where ext = '.aip' and mime_type = 'text/x-audiosoft-intra';
update sie_13_mime_type set ref_type_fichr = null where ext = '.ani' and mime_type = 'application/x-navi-animation';
update sie_13_mime_type set ref_type_fichr = null where ext = '.aos' and mime_type = 'application/x-nokia-9000-communicator-add-on-software';
update sie_13_mime_type set ref_type_fichr = null where ext = '.aps' and mime_type = 'application/mime';
update sie_13_mime_type set ref_type_fichr = null where ext = '.arc' and mime_type = 'application/octet-stream';
update sie_13_mime_type set ref_type_fichr = null where ext = '.arj' and mime_type = 'application/arj';
update sie_13_mime_type set ref_type_fichr = null where ext = '.arj' and mime_type = 'application/octet-stream';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.art' and mime_type = 'image/x-jg';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.asf' and mime_type = 'video/x-ms-asf';
update sie_13_mime_type set ref_type_fichr = null where ext = '.asm' and mime_type = 'text/x-asm';
update sie_13_mime_type set ref_type_fichr = null where ext = '.asp' and mime_type = 'text/asp';
update sie_13_mime_type set ref_type_fichr = null where ext = '.asx' and mime_type = 'application/x-mplayer2';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.asx' and mime_type = 'video/x-ms-asf';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.asx' and mime_type = 'video/x-ms-asf-plugin';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.au' and mime_type = 'audio/basic';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.au' and mime_type = 'audio/x-au';
update sie_13_mime_type set ref_type_fichr = null where ext = '.avi' and mime_type = 'application/x-troff-msvideo';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.avi' and mime_type = 'video/avi';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.avi' and mime_type = 'video/msvideo';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.avi' and mime_type = 'video/x-msvideo';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.avs' and mime_type = 'video/avs-video';
update sie_13_mime_type set ref_type_fichr = null where ext = '.bcpio' and mime_type = 'application/x-bcpio';
update sie_13_mime_type set ref_type_fichr = null where ext = '.bin' and mime_type = 'application/mac-binary';
update sie_13_mime_type set ref_type_fichr = null where ext = '.bin' and mime_type = 'application/macbinary';
update sie_13_mime_type set ref_type_fichr = null where ext = '.bin' and mime_type = 'application/octet-stream';
update sie_13_mime_type set ref_type_fichr = null where ext = '.bin' and mime_type = 'application/x-binary';
update sie_13_mime_type set ref_type_fichr = null where ext = '.bin' and mime_type = 'application/x-macbinary';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.bm' and mime_type = 'image/bmp';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.bmp' and mime_type = 'image/bmp';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.bmp' and mime_type = 'image/x-windows-bmp';
update sie_13_mime_type set ref_type_fichr = null where ext = '.boo' and mime_type = 'application/book';
update sie_13_mime_type set ref_type_fichr = null where ext = '.book' and mime_type = 'application/book';
update sie_13_mime_type set ref_type_fichr = null where ext = '.boz' and mime_type = 'application/x-bzip2';
update sie_13_mime_type set ref_type_fichr = null where ext = '.bsh' and mime_type = 'application/x-bsh';
update sie_13_mime_type set ref_type_fichr = null where ext = '.bz' and mime_type = 'application/x-bzip';
update sie_13_mime_type set ref_type_fichr = null where ext = '.bz2' and mime_type = 'application/x-bzip2';
update sie_13_mime_type set ref_type_fichr = null where ext = '.c' and mime_type = 'text/plain';
update sie_13_mime_type set ref_type_fichr = null where ext = '.c' and mime_type = 'text/x-c';
update sie_13_mime_type set ref_type_fichr = null where ext = '.c++' and mime_type = 'text/plain';
update sie_13_mime_type set ref_type_fichr = null where ext = '.cat' and mime_type = 'application/vnd.ms-pki.seccat';
update sie_13_mime_type set ref_type_fichr = null where ext = '.cc' and mime_type = 'text/plain';
update sie_13_mime_type set ref_type_fichr = null where ext = '.cc' and mime_type = 'text/x-c';
update sie_13_mime_type set ref_type_fichr = null where ext = '.ccad' and mime_type = 'application/clariscad';
update sie_13_mime_type set ref_type_fichr = null where ext = '.cco' and mime_type = 'application/x-cocoa';
update sie_13_mime_type set ref_type_fichr = null where ext = '.cdf' and mime_type = 'application/cdf';
update sie_13_mime_type set ref_type_fichr = null where ext = '.cdf' and mime_type = 'application/x-cdf';
update sie_13_mime_type set ref_type_fichr = null where ext = '.cdf' and mime_type = 'application/x-netcdf';
update sie_13_mime_type set ref_type_fichr = null where ext = '.cer' and mime_type = 'application/pkix-cert';
update sie_13_mime_type set ref_type_fichr = null where ext = '.cer' and mime_type = 'application/x-x509-ca-cert';
update sie_13_mime_type set ref_type_fichr = null where ext = '.cha' and mime_type = 'application/x-chat';
update sie_13_mime_type set ref_type_fichr = null where ext = '.chat' and mime_type = 'application/x-chat';
update sie_13_mime_type set ref_type_fichr = null where ext = '.class' and mime_type = 'application/java';
update sie_13_mime_type set ref_type_fichr = null where ext = '.class' and mime_type = 'application/java-byte-code';
update sie_13_mime_type set ref_type_fichr = null where ext = '.class' and mime_type = 'application/x-java-class';
update sie_13_mime_type set ref_type_fichr = null where ext = '.com' and mime_type = 'application/octet-stream';
update sie_13_mime_type set ref_type_fichr = null where ext = '.com' and mime_type = 'text/plain';
update sie_13_mime_type set ref_type_fichr = null where ext = '.conf' and mime_type = 'text/plain';
update sie_13_mime_type set ref_type_fichr = null where ext = '.cpio' and mime_type = 'application/x-cpio';
update sie_13_mime_type set ref_type_fichr = null where ext = '.cpp' and mime_type = 'text/x-c';
update sie_13_mime_type set ref_type_fichr = null where ext = '.cpt' and mime_type = 'application/mac-compactpro';
update sie_13_mime_type set ref_type_fichr = null where ext = '.cpt' and mime_type = 'application/x-compactpro';
update sie_13_mime_type set ref_type_fichr = null where ext = '.cpt' and mime_type = 'application/x-cpt';
update sie_13_mime_type set ref_type_fichr = null where ext = '.crl' and mime_type = 'application/pkcs-crl';
update sie_13_mime_type set ref_type_fichr = null where ext = '.crl' and mime_type = 'application/pkix-crl';
update sie_13_mime_type set ref_type_fichr = null where ext = '.crt' and mime_type = 'application/pkix-cert';
update sie_13_mime_type set ref_type_fichr = null where ext = '.crt' and mime_type = 'application/x-x509-ca-cert';
update sie_13_mime_type set ref_type_fichr = null where ext = '.crt' and mime_type = 'application/x-x509-user-cert';
update sie_13_mime_type set ref_type_fichr = null where ext = '.csh' and mime_type = 'application/x-csh';
update sie_13_mime_type set ref_type_fichr = null where ext = '.csh' and mime_type = 'text/x-script.csh';
update sie_13_mime_type set ref_type_fichr = null where ext = '.css' and mime_type = 'application/x-pointplus';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(62, 'Update') where ext = '.css' and mime_type = 'text/css';
update sie_13_mime_type set ref_type_fichr = null where ext = '.cxx' and mime_type = 'text/plain';
update sie_13_mime_type set ref_type_fichr = null where ext = '.dcr' and mime_type = 'application/x-director';
update sie_13_mime_type set ref_type_fichr = null where ext = '.deepv' and mime_type = 'application/x-deepv';
update sie_13_mime_type set ref_type_fichr = null where ext = '.def' and mime_type = 'text/plain';
update sie_13_mime_type set ref_type_fichr = null where ext = '.der' and mime_type = 'application/x-x509-ca-cert';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.dif' and mime_type = 'video/x-dv';
update sie_13_mime_type set ref_type_fichr = null where ext = '.dir' and mime_type = 'application/x-director';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.dl' and mime_type = 'video/dl';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.dl' and mime_type = 'video/x-dl';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(2, 'Update') where ext = '.doc' and mime_type = 'application/msword';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(2, 'Update') where ext = '.dot' and mime_type = 'application/msword';
update sie_13_mime_type set ref_type_fichr = null where ext = '.dp' and mime_type = 'application/commonground';
update sie_13_mime_type set ref_type_fichr = null where ext = '.drw' and mime_type = 'application/drafting';
update sie_13_mime_type set ref_type_fichr = null where ext = '.dump' and mime_type = 'application/octet-stream';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.dv' and mime_type = 'video/x-dv';
update sie_13_mime_type set ref_type_fichr = null where ext = '.dvi' and mime_type = 'application/x-dvi';
update sie_13_mime_type set ref_type_fichr = null where ext = '.dwf' and mime_type = 'drawing/x-dwf (old)';
update sie_13_mime_type set ref_type_fichr = null where ext = '.dwf' and mime_type = 'model/vnd.dwf';
update sie_13_mime_type set ref_type_fichr = null where ext = '.dwg' and mime_type = 'application/acad';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.dwg' and mime_type = 'image/vnd.dwg';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.dwg' and mime_type = 'image/x-dwg';
update sie_13_mime_type set ref_type_fichr = null where ext = '.dxf' and mime_type = 'application/dxf';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.dxf' and mime_type = 'image/vnd.dwg';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.dxf' and mime_type = 'image/x-dwg';
update sie_13_mime_type set ref_type_fichr = null where ext = '.dxr' and mime_type = 'application/x-director';
update sie_13_mime_type set ref_type_fichr = null where ext = '.el' and mime_type = 'text/x-script.elisp';
update sie_13_mime_type set ref_type_fichr = null where ext = '.elc' and mime_type = 'application/x-bytecode.elisp (compiled elisp)';
update sie_13_mime_type set ref_type_fichr = null where ext = '.elc' and mime_type = 'application/x-elc';
update sie_13_mime_type set ref_type_fichr = null where ext = '.env' and mime_type = 'application/x-envoy';
update sie_13_mime_type set ref_type_fichr = null where ext = '.eps' and mime_type = 'application/postscript';
update sie_13_mime_type set ref_type_fichr = null where ext = '.es' and mime_type = 'application/x-esrehber';
update sie_13_mime_type set ref_type_fichr = null where ext = '.etx' and mime_type = 'text/x-setext';
update sie_13_mime_type set ref_type_fichr = null where ext = '.evy' and mime_type = 'application/envoy';
update sie_13_mime_type set ref_type_fichr = null where ext = '.evy' and mime_type = 'application/x-envoy';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(41, 'Update') where ext = '.exe' and mime_type = 'application/octet-stream';
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('sie_13_mime_type');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('sie_13_mime_type');
update sie_13_mime_type set ref_type_fichr = null where ext = '.f' and mime_type = 'text/plain';
update sie_13_mime_type set ref_type_fichr = null where ext = '.f' and mime_type = 'text/x-fortran';
update sie_13_mime_type set ref_type_fichr = null where ext = '.f77' and mime_type = 'text/x-fortran';
update sie_13_mime_type set ref_type_fichr = null where ext = '.f90' and mime_type = 'text/plain';
update sie_13_mime_type set ref_type_fichr = null where ext = '.f90' and mime_type = 'text/x-fortran';
update sie_13_mime_type set ref_type_fichr = null where ext = '.fdf' and mime_type = 'application/vnd.fdf';
update sie_13_mime_type set ref_type_fichr = null where ext = '.fif' and mime_type = 'application/fractals';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.fif' and mime_type = 'image/fif';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.fli' and mime_type = 'video/fli';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.fli' and mime_type = 'video/x-fli';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.flo' and mime_type = 'image/florian';
update sie_13_mime_type set ref_type_fichr = null where ext = '.flx' and mime_type = 'text/vnd.fmi.flexstor';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.fmf' and mime_type = 'video/x-atomic3d-feature';
update sie_13_mime_type set ref_type_fichr = null where ext = '.for' and mime_type = 'text/plain';
update sie_13_mime_type set ref_type_fichr = null where ext = '.for' and mime_type = 'text/x-fortran';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.fpx' and mime_type = 'image/vnd.fpx';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.fpx' and mime_type = 'image/vnd.net-fpx';
update sie_13_mime_type set ref_type_fichr = null where ext = '.frl' and mime_type = 'application/freeloader';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.funk' and mime_type = 'audio/make';
update sie_13_mime_type set ref_type_fichr = null where ext = '.g' and mime_type = 'text/plain';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.g3' and mime_type = 'image/g3fax';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.gif' and mime_type = 'image/gif';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.gl' and mime_type = 'video/gl';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.gl' and mime_type = 'video/x-gl';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.gsd' and mime_type = 'audio/x-gsm';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.gsm' and mime_type = 'audio/x-gsm';
update sie_13_mime_type set ref_type_fichr = null where ext = '.gsp' and mime_type = 'application/x-gsp';
update sie_13_mime_type set ref_type_fichr = null where ext = '.gss' and mime_type = 'application/x-gss';
update sie_13_mime_type set ref_type_fichr = null where ext = '.gtar' and mime_type = 'application/x-gtar';
update sie_13_mime_type set ref_type_fichr = null where ext = '.gz' and mime_type = 'application/x-compressed';
update sie_13_mime_type set ref_type_fichr = null where ext = '.gz' and mime_type = 'application/x-gzip';
update sie_13_mime_type set ref_type_fichr = null where ext = '.gzip' and mime_type = 'application/x-gzip';
update sie_13_mime_type set ref_type_fichr = null where ext = '.gzip' and mime_type = 'multipart/x-gzip';
update sie_13_mime_type set ref_type_fichr = null where ext = '.h' and mime_type = 'text/plain';
update sie_13_mime_type set ref_type_fichr = null where ext = '.h' and mime_type = 'text/x-h';
update sie_13_mime_type set ref_type_fichr = null where ext = '.hdf' and mime_type = 'application/x-hdf';
update sie_13_mime_type set ref_type_fichr = null where ext = '.help' and mime_type = 'application/x-helpfile';
update sie_13_mime_type set ref_type_fichr = null where ext = '.hgl' and mime_type = 'application/vnd.hp-hpgl';
update sie_13_mime_type set ref_type_fichr = null where ext = '.hh' and mime_type = 'text/plain';
update sie_13_mime_type set ref_type_fichr = null where ext = '.hh' and mime_type = 'text/x-h';
update sie_13_mime_type set ref_type_fichr = null where ext = '.hlb' and mime_type = 'text/x-script';
update sie_13_mime_type set ref_type_fichr = null where ext = '.hlp' and mime_type = 'application/hlp';
update sie_13_mime_type set ref_type_fichr = null where ext = '.hlp' and mime_type = 'application/x-helpfile';
update sie_13_mime_type set ref_type_fichr = null where ext = '.hlp' and mime_type = 'application/x-winhelp';
update sie_13_mime_type set ref_type_fichr = null where ext = '.hpg' and mime_type = 'application/vnd.hp-hpgl';
update sie_13_mime_type set ref_type_fichr = null where ext = '.hpgl' and mime_type = 'application/vnd.hp-hpgl';
update sie_13_mime_type set ref_type_fichr = null where ext = '.hqx' and mime_type = 'application/binhex';
update sie_13_mime_type set ref_type_fichr = null where ext = '.hqx' and mime_type = 'application/binhex4';
update sie_13_mime_type set ref_type_fichr = null where ext = '.hqx' and mime_type = 'application/mac-binhex';
update sie_13_mime_type set ref_type_fichr = null where ext = '.hqx' and mime_type = 'application/mac-binhex40';
update sie_13_mime_type set ref_type_fichr = null where ext = '.hqx' and mime_type = 'application/x-binhex40';
update sie_13_mime_type set ref_type_fichr = null where ext = '.hqx' and mime_type = 'application/x-mac-binhex40';
update sie_13_mime_type set ref_type_fichr = null where ext = '.hta' and mime_type = 'application/hta';
update sie_13_mime_type set ref_type_fichr = null where ext = '.htc' and mime_type = 'text/x-component';
update sie_13_mime_type set ref_type_fichr = null where ext = '.htm' and mime_type = 'text/html';
update sie_13_mime_type set ref_type_fichr = null where ext = '.html' and mime_type = 'text/html';
update sie_13_mime_type set ref_type_fichr = null where ext = '.htmls' and mime_type = 'text/html';
update sie_13_mime_type set ref_type_fichr = null where ext = '.htt' and mime_type = 'text/webviewhtml';
update sie_13_mime_type set ref_type_fichr = null where ext = '.htx' and mime_type = 'text/html';
update sie_13_mime_type set ref_type_fichr = null where ext = '.ice' and mime_type = 'x-conference/x-cooltalk';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.ico' and mime_type = 'image/x-icon';
update sie_13_mime_type set ref_type_fichr = null where ext = '.idc' and mime_type = 'text/plain';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.ief' and mime_type = 'image/ief';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.iefs' and mime_type = 'image/ief';
update sie_13_mime_type set ref_type_fichr = null where ext = '.iges' and mime_type = 'application/iges';
update sie_13_mime_type set ref_type_fichr = null where ext = '.iges' and mime_type = 'model/iges';
update sie_13_mime_type set ref_type_fichr = null where ext = '.igs' and mime_type = 'application/iges';
update sie_13_mime_type set ref_type_fichr = null where ext = '.igs' and mime_type = 'model/iges';
update sie_13_mime_type set ref_type_fichr = null where ext = '.ima' and mime_type = 'application/x-ima';
update sie_13_mime_type set ref_type_fichr = null where ext = '.imap' and mime_type = 'application/x-httpd-imap';
update sie_13_mime_type set ref_type_fichr = null where ext = '.inf' and mime_type = 'application/inf';
update sie_13_mime_type set ref_type_fichr = null where ext = '.ins' and mime_type = 'application/x-internett-signup';
update sie_13_mime_type set ref_type_fichr = null where ext = '.ip' and mime_type = 'application/x-ip2';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.isu' and mime_type = 'video/x-isvideo';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.it' and mime_type = 'audio/it';
update sie_13_mime_type set ref_type_fichr = null where ext = '.iv' and mime_type = 'application/x-inventor';
update sie_13_mime_type set ref_type_fichr = null where ext = '.ivr' and mime_type = 'i-world/i-vrml';
update sie_13_mime_type set ref_type_fichr = null where ext = '.ivy' and mime_type = 'application/x-livescreen';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.jam' and mime_type = 'audio/x-jam';
update sie_13_mime_type set ref_type_fichr = null where ext = '.jav' and mime_type = 'text/plain';
update sie_13_mime_type set ref_type_fichr = null where ext = '.jav' and mime_type = 'text/x-java-source';
update sie_13_mime_type set ref_type_fichr = null where ext = '.java' and mime_type = 'text/plain';
update sie_13_mime_type set ref_type_fichr = null where ext = '.java' and mime_type = 'text/x-java-source';
update sie_13_mime_type set ref_type_fichr = null where ext = '.jcm' and mime_type = 'application/x-java-commerce';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.jfif' and mime_type = 'image/jpeg';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.jfif' and mime_type = 'image/pjpeg';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.jfif-tbnl' and mime_type = 'image/jpeg';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.jpe' and mime_type = 'image/jpeg';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.jpe' and mime_type = 'image/pjpeg';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.jpeg' and mime_type = 'image/jpeg';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.jpeg' and mime_type = 'image/pjpeg';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.jpg' and mime_type = 'image/jpeg';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.jpg' and mime_type = 'image/pjpeg';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.jps' and mime_type = 'image/x-jps';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(61, 'Update') where ext = '.js' and mime_type = 'application/x-javascript';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.jut' and mime_type = 'image/jutvision';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.kar' and mime_type = 'audio/midi';
update sie_13_mime_type set ref_type_fichr = null where ext = '.kar' and mime_type = 'music/x-karaoke';
update sie_13_mime_type set ref_type_fichr = null where ext = '.ksh' and mime_type = 'application/x-ksh';
update sie_13_mime_type set ref_type_fichr = null where ext = '.ksh' and mime_type = 'text/x-script.ksh';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.la' and mime_type = 'audio/nspaudio';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.la' and mime_type = 'audio/x-nspaudio';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.lam' and mime_type = 'audio/x-liveaudio';
update sie_13_mime_type set ref_type_fichr = null where ext = '.latex' and mime_type = 'application/x-latex';
update sie_13_mime_type set ref_type_fichr = null where ext = '.lha' and mime_type = 'application/lha';
update sie_13_mime_type set ref_type_fichr = null where ext = '.lha' and mime_type = 'application/octet-stream';
update sie_13_mime_type set ref_type_fichr = null where ext = '.lha' and mime_type = 'application/x-lha';
update sie_13_mime_type set ref_type_fichr = null where ext = '.lhx' and mime_type = 'application/octet-stream';
update sie_13_mime_type set ref_type_fichr = null where ext = '.list' and mime_type = 'text/plain';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.lma' and mime_type = 'audio/nspaudio';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.lma' and mime_type = 'audio/x-nspaudio';
update sie_13_mime_type set ref_type_fichr = null where ext = '.log' and mime_type = 'text/plain';
update sie_13_mime_type set ref_type_fichr = null where ext = '.lsp' and mime_type = 'application/x-lisp';
update sie_13_mime_type set ref_type_fichr = null where ext = '.lsp' and mime_type = 'text/x-script.lisp';
update sie_13_mime_type set ref_type_fichr = null where ext = '.lst' and mime_type = 'text/plain';
update sie_13_mime_type set ref_type_fichr = null where ext = '.lsx' and mime_type = 'text/x-la-asf';
update sie_13_mime_type set ref_type_fichr = null where ext = '.ltx' and mime_type = 'application/x-latex';
update sie_13_mime_type set ref_type_fichr = null where ext = '.lzh' and mime_type = 'application/octet-stream';
update sie_13_mime_type set ref_type_fichr = null where ext = '.lzh' and mime_type = 'application/x-lzh';
update sie_13_mime_type set ref_type_fichr = null where ext = '.lzx' and mime_type = 'application/lzx';
update sie_13_mime_type set ref_type_fichr = null where ext = '.lzx' and mime_type = 'application/octet-stream';
update sie_13_mime_type set ref_type_fichr = null where ext = '.lzx' and mime_type = 'application/x-lzx';
update sie_13_mime_type set ref_type_fichr = null where ext = '.m' and mime_type = 'text/plain';
update sie_13_mime_type set ref_type_fichr = null where ext = '.m' and mime_type = 'text/x-m';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.m1v' and mime_type = 'video/mpeg';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.m2a' and mime_type = 'audio/mpeg';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.m2v' and mime_type = 'video/mpeg';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.m3u' and mime_type = 'audio/x-mpequrl';
update sie_13_mime_type set ref_type_fichr = null where ext = '.man' and mime_type = 'application/x-troff-man';
update sie_13_mime_type set ref_type_fichr = null where ext = '.map' and mime_type = 'application/x-navimap';
update sie_13_mime_type set ref_type_fichr = null where ext = '.mar' and mime_type = 'text/plain';
update sie_13_mime_type set ref_type_fichr = null where ext = '.mbd' and mime_type = 'application/mbedlet';
update sie_13_mime_type set ref_type_fichr = null where ext = '.mc$' and mime_type = 'application/x-magic-cap-package-1.0';
update sie_13_mime_type set ref_type_fichr = null where ext = '.mcd' and mime_type = 'application/mcad';
update sie_13_mime_type set ref_type_fichr = null where ext = '.mcd' and mime_type = 'application/x-mathcad';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.mcf' and mime_type = 'image/vasa';
update sie_13_mime_type set ref_type_fichr = null where ext = '.mcf' and mime_type = 'text/mcf';
update sie_13_mime_type set ref_type_fichr = null where ext = '.mcp' and mime_type = 'application/netmc';
update sie_13_mime_type set ref_type_fichr = null where ext = '.me' and mime_type = 'application/x-troff-me';
update sie_13_mime_type set ref_type_fichr = null where ext = '.mht' and mime_type = 'message/rfc822';
update sie_13_mime_type set ref_type_fichr = null where ext = '.mhtml' and mime_type = 'message/rfc822';
update sie_13_mime_type set ref_type_fichr = null where ext = '.mid' and mime_type = 'application/x-midi';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.mid' and mime_type = 'audio/midi';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.mid' and mime_type = 'audio/x-mid';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.mid' and mime_type = 'audio/x-midi';
update sie_13_mime_type set ref_type_fichr = null where ext = '.mid' and mime_type = 'music/crescendo';
update sie_13_mime_type set ref_type_fichr = null where ext = '.mid' and mime_type = 'x-music/x-midi';
update sie_13_mime_type set ref_type_fichr = null where ext = '.midi' and mime_type = 'application/x-midi';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.midi' and mime_type = 'audio/midi';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.midi' and mime_type = 'audio/x-mid';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.midi' and mime_type = 'audio/x-midi';
update sie_13_mime_type set ref_type_fichr = null where ext = '.midi' and mime_type = 'music/crescendo';
update sie_13_mime_type set ref_type_fichr = null where ext = '.midi' and mime_type = 'x-music/x-midi';
update sie_13_mime_type set ref_type_fichr = null where ext = '.mif' and mime_type = 'application/x-frame';
update sie_13_mime_type set ref_type_fichr = null where ext = '.mif' and mime_type = 'application/x-mif';
update sie_13_mime_type set ref_type_fichr = null where ext = '.mime' and mime_type = 'message/rfc822';
update sie_13_mime_type set ref_type_fichr = null where ext = '.mime' and mime_type = 'www/mime';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.mjf' and mime_type = 'audio/x-vnd.audioexplosion.mjuicemediafile';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.mjpg' and mime_type = 'video/x-motion-jpeg';
update sie_13_mime_type set ref_type_fichr = null where ext = '.mm' and mime_type = 'application/base64';
update sie_13_mime_type set ref_type_fichr = null where ext = '.mm' and mime_type = 'application/x-meme';
update sie_13_mime_type set ref_type_fichr = null where ext = '.mme' and mime_type = 'application/base64';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.mod' and mime_type = 'audio/mod';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.mod' and mime_type = 'audio/x-mod';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.moov' and mime_type = 'video/quicktime';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.mov' and mime_type = 'video/quicktime';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.movie' and mime_type = 'video/x-sgi-movie';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.mp2' and mime_type = 'audio/mpeg';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.mp2' and mime_type = 'audio/x-mpeg';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.mp2' and mime_type = 'video/mpeg';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.mp2' and mime_type = 'video/x-mpeg';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.mp2' and mime_type = 'video/x-mpeq2a';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.mp3' and mime_type = 'audio/mpeg3';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.mp3' and mime_type = 'audio/x-mpeg-3';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.mp3' and mime_type = 'video/mpeg';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.mp3' and mime_type = 'video/x-mpeg';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.mpa' and mime_type = 'audio/mpeg';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.mpa' and mime_type = 'video/mpeg';
update sie_13_mime_type set ref_type_fichr = null where ext = '.mpc' and mime_type = 'application/x-project';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.mpe' and mime_type = 'video/mpeg';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.mpeg' and mime_type = 'video/mpeg';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.mpg' and mime_type = 'audio/mpeg';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.mpg' and mime_type = 'video/mpeg';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.mpga' and mime_type = 'audio/mpeg';
update sie_13_mime_type set ref_type_fichr = null where ext = '.mpp' and mime_type = 'application/vnd.ms-project';
update sie_13_mime_type set ref_type_fichr = null where ext = '.mpt' and mime_type = 'application/x-project';
update sie_13_mime_type set ref_type_fichr = null where ext = '.mpv' and mime_type = 'application/x-project';
update sie_13_mime_type set ref_type_fichr = null where ext = '.mpx' and mime_type = 'application/x-project';
update sie_13_mime_type set ref_type_fichr = null where ext = '.mrc' and mime_type = 'application/marc';
update sie_13_mime_type set ref_type_fichr = null where ext = '.ms' and mime_type = 'application/x-troff-ms';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.mv' and mime_type = 'video/x-sgi-movie';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.my' and mime_type = 'audio/make';
update sie_13_mime_type set ref_type_fichr = null where ext = '.mzz' and mime_type = 'application/x-vnd.audioexplosion.mzz';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.nap' and mime_type = 'image/naplps';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.naplps' and mime_type = 'image/naplps';
update sie_13_mime_type set ref_type_fichr = null where ext = '.nc' and mime_type = 'application/x-netcdf';
update sie_13_mime_type set ref_type_fichr = null where ext = '.ncm' and mime_type = 'application/vnd.nokia.configuration-message';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.nif' and mime_type = 'image/x-niff';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.niff' and mime_type = 'image/x-niff';
update sie_13_mime_type set ref_type_fichr = null where ext = '.nix' and mime_type = 'application/x-mix-transfer';
update sie_13_mime_type set ref_type_fichr = null where ext = '.nsc' and mime_type = 'application/x-conference';
update sie_13_mime_type set ref_type_fichr = null where ext = '.nvd' and mime_type = 'application/x-navidoc';
update sie_13_mime_type set ref_type_fichr = null where ext = '.o' and mime_type = 'application/octet-stream';
update sie_13_mime_type set ref_type_fichr = null where ext = '.oda' and mime_type = 'application/oda';
update sie_13_mime_type set ref_type_fichr = null where ext = '.omc' and mime_type = 'application/x-omc';
update sie_13_mime_type set ref_type_fichr = null where ext = '.omcd' and mime_type = 'application/x-omcdatamaker';
update sie_13_mime_type set ref_type_fichr = null where ext = '.omcr' and mime_type = 'application/x-omcregerator';
update sie_13_mime_type set ref_type_fichr = null where ext = '.p' and mime_type = 'text/x-pascal';
update sie_13_mime_type set ref_type_fichr = null where ext = '.p10' and mime_type = 'application/pkcs10';
update sie_13_mime_type set ref_type_fichr = null where ext = '.p10' and mime_type = 'application/x-pkcs10';
update sie_13_mime_type set ref_type_fichr = null where ext = '.p12' and mime_type = 'application/pkcs-12';
update sie_13_mime_type set ref_type_fichr = null where ext = '.p12' and mime_type = 'application/x-pkcs12';
update sie_13_mime_type set ref_type_fichr = null where ext = '.p7a' and mime_type = 'application/x-pkcs7-signature';
update sie_13_mime_type set ref_type_fichr = null where ext = '.p7c' and mime_type = 'application/pkcs7-mime';
update sie_13_mime_type set ref_type_fichr = null where ext = '.p7c' and mime_type = 'application/x-pkcs7-mime';
update sie_13_mime_type set ref_type_fichr = null where ext = '.p7m' and mime_type = 'application/pkcs7-mime';
update sie_13_mime_type set ref_type_fichr = null where ext = '.p7m' and mime_type = 'application/x-pkcs7-mime';
update sie_13_mime_type set ref_type_fichr = null where ext = '.p7r' and mime_type = 'application/x-pkcs7-certreqresp';
update sie_13_mime_type set ref_type_fichr = null where ext = '.p7s' and mime_type = 'application/pkcs7-signature';
update sie_13_mime_type set ref_type_fichr = null where ext = '.part' and mime_type = 'application/pro_eng';
update sie_13_mime_type set ref_type_fichr = null where ext = '.pas' and mime_type = 'text/pascal';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.pbm' and mime_type = 'image/x-portable-bitmap';
update sie_13_mime_type set ref_type_fichr = null where ext = '.pcl' and mime_type = 'application/vnd.hp-pcl';
update sie_13_mime_type set ref_type_fichr = null where ext = '.pcl' and mime_type = 'application/x-pcl';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.pct' and mime_type = 'image/x-pict';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.pcx' and mime_type = 'image/x-pcx';
update sie_13_mime_type set ref_type_fichr = null where ext = '.pdb' and mime_type = 'chemical/x-pdb';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(3, 'Update') where ext = '.pdf' and mime_type = 'application/pdf';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.pfunk' and mime_type = 'audio/make';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.pfunk' and mime_type = 'audio/make.my.funk';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.pgm' and mime_type = 'image/x-portable-graymap';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.pgm' and mime_type = 'image/x-portable-greymap';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.pic' and mime_type = 'image/pict';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.pict' and mime_type = 'image/pict';
update sie_13_mime_type set ref_type_fichr = null where ext = '.pkg' and mime_type = 'application/x-newton-compatible-pkg';
update sie_13_mime_type set ref_type_fichr = null where ext = '.pko' and mime_type = 'application/vnd.ms-pki.pko';
update sie_13_mime_type set ref_type_fichr = null where ext = '.pl' and mime_type = 'text/plain';
update sie_13_mime_type set ref_type_fichr = null where ext = '.pl' and mime_type = 'text/x-script.perl';
update sie_13_mime_type set ref_type_fichr = null where ext = '.plx' and mime_type = 'application/x-pixclscript';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.pm' and mime_type = 'image/x-xpixmap';
update sie_13_mime_type set ref_type_fichr = null where ext = '.pm' and mime_type = 'text/x-script.perl-module';
update sie_13_mime_type set ref_type_fichr = null where ext = '.pm4' and mime_type = 'application/x-pagemaker';
update sie_13_mime_type set ref_type_fichr = null where ext = '.pm5' and mime_type = 'application/x-pagemaker';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.png' and mime_type = 'image/png';
update sie_13_mime_type set ref_type_fichr = null where ext = '.pnm' and mime_type = 'application/x-portable-anymap';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.pnm' and mime_type = 'image/x-portable-anymap';
update sie_13_mime_type set ref_type_fichr = null where ext = '.pot' and mime_type = 'application/mspowerpoint';
update sie_13_mime_type set ref_type_fichr = null where ext = '.pot' and mime_type = 'application/vnd.ms-powerpoint';
update sie_13_mime_type set ref_type_fichr = null where ext = '.pov' and mime_type = 'model/x-pov';
update sie_13_mime_type set ref_type_fichr = null where ext = '.ppa' and mime_type = 'application/vnd.ms-powerpoint';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.ppm' and mime_type = 'image/x-portable-pixmap';
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('sie_13_mime_type');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('sie_13_mime_type');
update sie_13_mime_type set ref_type_fichr = null where ext = '.pps' and mime_type = 'application/mspowerpoint';
update sie_13_mime_type set ref_type_fichr = null where ext = '.pps' and mime_type = 'application/vnd.ms-powerpoint';
update sie_13_mime_type set ref_type_fichr = null where ext = '.ppt' and mime_type = 'application/mspowerpoint';
update sie_13_mime_type set ref_type_fichr = null where ext = '.ppt' and mime_type = 'application/powerpoint';
update sie_13_mime_type set ref_type_fichr = null where ext = '.ppt' and mime_type = 'application/vnd.ms-powerpoint';
update sie_13_mime_type set ref_type_fichr = null where ext = '.ppt' and mime_type = 'application/x-mspowerpoint';
update sie_13_mime_type set ref_type_fichr = null where ext = '.ppz' and mime_type = 'application/mspowerpoint';
update sie_13_mime_type set ref_type_fichr = null where ext = '.pre' and mime_type = 'application/x-freelance';
update sie_13_mime_type set ref_type_fichr = null where ext = '.prt' and mime_type = 'application/pro_eng';
update sie_13_mime_type set ref_type_fichr = null where ext = '.ps' and mime_type = 'application/postscript';
update sie_13_mime_type set ref_type_fichr = null where ext = '.psd' and mime_type = 'application/octet-stream';
update sie_13_mime_type set ref_type_fichr = null where ext = '.pvu' and mime_type = 'paleovu/x-pv';
update sie_13_mime_type set ref_type_fichr = null where ext = '.pwz' and mime_type = 'application/vnd.ms-powerpoint';
update sie_13_mime_type set ref_type_fichr = null where ext = '.py' and mime_type = 'text/x-script.phyton';
update sie_13_mime_type set ref_type_fichr = null where ext = '.pyc' and mime_type = 'applicaiton/x-bytecode.python';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.qcp' and mime_type = 'audio/vnd.qcelp';
update sie_13_mime_type set ref_type_fichr = null where ext = '.qd3' and mime_type = 'x-world/x-3dmf';
update sie_13_mime_type set ref_type_fichr = null where ext = '.qd3d' and mime_type = 'x-world/x-3dmf';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.qif' and mime_type = 'image/x-quicktime';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.qt' and mime_type = 'video/quicktime';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.qtc' and mime_type = 'video/x-qtc';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.qti' and mime_type = 'image/x-quicktime';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.qtif' and mime_type = 'image/x-quicktime';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.ra' and mime_type = 'audio/x-pn-realaudio';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.ra' and mime_type = 'audio/x-pn-realaudio-plugin';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.ra' and mime_type = 'audio/x-realaudio';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.ram' and mime_type = 'audio/x-pn-realaudio';
update sie_13_mime_type set ref_type_fichr = null where ext = '.ras' and mime_type = 'application/x-cmu-raster';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.ras' and mime_type = 'image/cmu-raster';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.ras' and mime_type = 'image/x-cmu-raster';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.rast' and mime_type = 'image/cmu-raster';
update sie_13_mime_type set ref_type_fichr = null where ext = '.rexx' and mime_type = 'text/x-script.rexx';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.rf' and mime_type = 'image/vnd.rn-realflash';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.rgb' and mime_type = 'image/x-rgb';
update sie_13_mime_type set ref_type_fichr = null where ext = '.rm' and mime_type = 'application/vnd.rn-realmedia';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.rm' and mime_type = 'audio/x-pn-realaudio';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.rmi' and mime_type = 'audio/mid';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.rmm' and mime_type = 'audio/x-pn-realaudio';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.rmp' and mime_type = 'audio/x-pn-realaudio';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.rmp' and mime_type = 'audio/x-pn-realaudio-plugin';
update sie_13_mime_type set ref_type_fichr = null where ext = '.rng' and mime_type = 'application/ringing-tones';
update sie_13_mime_type set ref_type_fichr = null where ext = '.rng' and mime_type = 'application/vnd.nokia.ringing-tone';
update sie_13_mime_type set ref_type_fichr = null where ext = '.rnx' and mime_type = 'application/vnd.rn-realplayer';
update sie_13_mime_type set ref_type_fichr = null where ext = '.roff' and mime_type = 'application/x-troff';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.rp' and mime_type = 'image/vnd.rn-realpix';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.rpm' and mime_type = 'audio/x-pn-realaudio-plugin';
update sie_13_mime_type set ref_type_fichr = null where ext = '.rt' and mime_type = 'text/richtext';
update sie_13_mime_type set ref_type_fichr = null where ext = '.rt' and mime_type = 'text/vnd.rn-realtext';
update sie_13_mime_type set ref_type_fichr = null where ext = '.rtf' and mime_type = 'application/rtf';
update sie_13_mime_type set ref_type_fichr = null where ext = '.rtf' and mime_type = 'application/x-rtf';
update sie_13_mime_type set ref_type_fichr = null where ext = '.rtf' and mime_type = 'text/richtext';
update sie_13_mime_type set ref_type_fichr = null where ext = '.rtx' and mime_type = 'application/rtf';
update sie_13_mime_type set ref_type_fichr = null where ext = '.rtx' and mime_type = 'text/richtext';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.rv' and mime_type = 'video/vnd.rn-realvideo';
update sie_13_mime_type set ref_type_fichr = null where ext = '.s' and mime_type = 'text/x-asm';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.s3m' and mime_type = 'audio/s3m';
update sie_13_mime_type set ref_type_fichr = null where ext = '.saveme' and mime_type = 'application/octet-stream';
update sie_13_mime_type set ref_type_fichr = null where ext = '.vrml' and mime_type = 'x-world/x-vrml';
update sie_13_mime_type set ref_type_fichr = null where ext = '.vrt' and mime_type = 'x-world/x-vrt';
update sie_13_mime_type set ref_type_fichr = null where ext = '.vsd' and mime_type = 'application/x-visio';
update sie_13_mime_type set ref_type_fichr = null where ext = '.vst' and mime_type = 'application/x-visio';
update sie_13_mime_type set ref_type_fichr = null where ext = '.vsw' and mime_type = 'application/x-visio';
update sie_13_mime_type set ref_type_fichr = null where ext = '.w60' and mime_type = 'application/wordperfect6.0';
update sie_13_mime_type set ref_type_fichr = null where ext = '.w61' and mime_type = 'application/wordperfect6.1';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(2, 'Update') where ext = '.w6w' and mime_type = 'application/msword';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.wav' and mime_type = 'audio/wav';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(22, 'Update') where ext = '.wav' and mime_type = 'audio/x-wav';
update sie_13_mime_type set ref_type_fichr = null where ext = '.wb1' and mime_type = 'application/x-qpro';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.wbmp' and mime_type = 'image/vnd.wap.wbmp';
update sie_13_mime_type set ref_type_fichr = null where ext = '.web' and mime_type = 'application/vnd.xara';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(2, 'Update') where ext = '.wiz' and mime_type = 'application/msword';
update sie_13_mime_type set ref_type_fichr = null where ext = '.wk1' and mime_type = 'application/x-123';
update sie_13_mime_type set ref_type_fichr = null where ext = '.wmf' and mime_type = 'windows/metafile';
update sie_13_mime_type set ref_type_fichr = null where ext = '.wml' and mime_type = 'text/vnd.wap.wml';
update sie_13_mime_type set ref_type_fichr = null where ext = '.wmlc' and mime_type = 'application/vnd.wap.wmlc';
update sie_13_mime_type set ref_type_fichr = null where ext = '.wmls' and mime_type = 'text/vnd.wap.wmlscript';
update sie_13_mime_type set ref_type_fichr = null where ext = '.wmlsc' and mime_type = 'application/vnd.wap.wmlscriptc';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(2, 'Update') where ext = '.word' and mime_type = 'application/msword';
update sie_13_mime_type set ref_type_fichr = null where ext = '.wp' and mime_type = 'application/wordperfect';
update sie_13_mime_type set ref_type_fichr = null where ext = '.wp5' and mime_type = 'application/wordperfect';
update sie_13_mime_type set ref_type_fichr = null where ext = '.wp5' and mime_type = 'application/wordperfect6.0';
update sie_13_mime_type set ref_type_fichr = null where ext = '.wp6' and mime_type = 'application/wordperfect';
update sie_13_mime_type set ref_type_fichr = null where ext = '.wpd' and mime_type = 'application/wordperfect';
update sie_13_mime_type set ref_type_fichr = null where ext = '.wpd' and mime_type = 'application/x-wpwin';
update sie_13_mime_type set ref_type_fichr = null where ext = '.wq1' and mime_type = 'application/x-lotus';
update sie_13_mime_type set ref_type_fichr = null where ext = '.wri' and mime_type = 'application/mswrite';
update sie_13_mime_type set ref_type_fichr = null where ext = '.wri' and mime_type = 'application/x-wri';
update sie_13_mime_type set ref_type_fichr = null where ext = '.wrl' and mime_type = 'application/x-world';
update sie_13_mime_type set ref_type_fichr = null where ext = '.wrl' and mime_type = 'model/vrml';
update sie_13_mime_type set ref_type_fichr = null where ext = '.wrl' and mime_type = 'x-world/x-vrml';
update sie_13_mime_type set ref_type_fichr = null where ext = '.wrz' and mime_type = 'model/vrml';
update sie_13_mime_type set ref_type_fichr = null where ext = '.wrz' and mime_type = 'x-world/x-vrml';
update sie_13_mime_type set ref_type_fichr = null where ext = '.wsc' and mime_type = 'text/scriplet';
update sie_13_mime_type set ref_type_fichr = null where ext = '.wsrc' and mime_type = 'application/x-wais-source';
update sie_13_mime_type set ref_type_fichr = null where ext = '.wtk' and mime_type = 'application/x-wintalk';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.xbm' and mime_type = 'image/x-xbitmap';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.xbm' and mime_type = 'image/x-xbm';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.xbm' and mime_type = 'image/xbm';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(5, 'Update') where ext = '.xdr' and mime_type = 'video/x-amt-demorun';
update sie_13_mime_type set ref_type_fichr = null where ext = '.xgz' and mime_type = 'xgl/drawing';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(1, 'Update') where ext = '.xif' and mime_type = 'image/vnd.xiff';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(21, 'Update') where ext = '.xl' and mime_type = 'application/excel';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(21, 'Update') where ext = '.xla' and mime_type = 'application/excel';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(21, 'Update') where ext = '.xla' and mime_type = 'application/x-excel';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(21, 'Update') where ext = '.xla' and mime_type = 'application/x-msexcel';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(21, 'Update') where ext = '.xlb' and mime_type = 'application/excel';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(21, 'Update') where ext = '.xlb' and mime_type = 'application/vnd.ms-excel';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(21, 'Update') where ext = '.xlb' and mime_type = 'application/x-excel';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(21, 'Update') where ext = '.xlc' and mime_type = 'application/excel';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(21, 'Update') where ext = '.xlc' and mime_type = 'application/vnd.ms-excel';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(21, 'Update') where ext = '.xlc' and mime_type = 'application/x-excel';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(21, 'Update') where ext = '.xld' and mime_type = 'application/excel';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(21, 'Update') where ext = '.xld' and mime_type = 'application/x-excel';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(21, 'Update') where ext = '.xlk' and mime_type = 'application/excel';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(21, 'Update') where ext = '.xlk' and mime_type = 'application/x-excel';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(21, 'Update') where ext = '.xll' and mime_type = 'application/excel';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(21, 'Update') where ext = '.xll' and mime_type = 'application/vnd.ms-excel';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(21, 'Update') where ext = '.xll' and mime_type = 'application/x-excel';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(21, 'Update') where ext = '.xlm' and mime_type = 'application/excel';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(21, 'Update') where ext = '.xlm' and mime_type = 'application/vnd.ms-excel';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(21, 'Update') where ext = '.xlm' and mime_type = 'application/x-excel';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(21, 'Update') where ext = '.xls' and mime_type = 'application/excel';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(21, 'Update') where ext = '.xls' and mime_type = 'application/x-excel';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(21, 'Update') where ext = '.xlsx' and mime_type = 'application/octet-stream';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(4, 'Update') where ext = '.rar' and mime_type = 'application/x-compressed';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(23, 'Update') where ext = '.sql' and mime_type = 'text/plain';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(2, 'Update') where ext = '.docx' and mime_type = 'application/octet-stream';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(21, 'Update') where ext = '.xls' and mime_type = 'application/vnd.ms-excel';
update sie_13_mime_type set ref_type_fichr = sie$migrt$pkg.obten_var_type_fichr(21, 'Update') where ext = '.csv' and mime_type = 'text/csv';
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_mime_type;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_13_mime_type');
  end if;
end;
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_13_mime_type');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$14_domn_valr;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_14_domn_valr');
  end if;
end;
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_14_domn_valr');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$12_group_stat;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_12_group_stat');
  end if;
end;
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_12_group_stat');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$14_detl_domn_valr;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_14_detl_domn_valr');
  end if;
end;
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_14_detl_domn_valr');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$25_engin;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_25_engin');
  end if;
end;
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_25_engin');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$01_lang;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_01_lang');
  end if;
end;
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_01_lang');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$25_group_publc;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_25_group_publc');
  end if;
end;
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_25_group_publc');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_dosr_virtl;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_13_dosr_virtl');
  end if;
end;
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_13_dosr_virtl');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_empla_dosr_virtl;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_13_empla_dosr_virtl');
  end if;
end;
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_13_empla_dosr_virtl');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$01_lang_lang;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_01_lang_lang');
  end if;
end;
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_01_lang_lang');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$01_mesg_tradc_apex;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_01_mesg_tradc_apex');
  end if;
end;
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_01_mesg_tradc_apex');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_formt_resrc;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_13_formt_resrc');
  end if;
end;
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_13_formt_resrc');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$23_patrn_rechr;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_23_patrn_rechr');
  end if;
end;
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_23_patrn_rechr');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$01_mesg;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_01_mesg');
  end if;
end;
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_01_mesg');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$01_mesg_lang;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_01_mesg_lang');
  end if;
end;
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_01_mesg_lang');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$01_mesg_err_lie;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_01_mesg_err_lie');
  end if;
end;
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_01_mesg_err_lie');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = sie$migrt$pkg.obten_var_page(17255, 'Update'), ref_page_liste = sie$migrt$pkg.obten_var_page(17254, 'Update') where code = 'PAGE';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = sie$migrt$pkg.obten_var_page(17266, 'Update'), ref_page_liste = sie$migrt$pkg.obten_var_page(17265, 'Update') where code = 'PREFR';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'STRUC_ADMIN';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'ITEM_MENU';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'PLUGN';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'SIE_14_POPUP_LOV_IR';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'REGN_PILTB';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'TRADC_REGN_PILTB';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'APLIC';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'TYPE_ITEM_MENU';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'DOMN';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'RESRC';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'TYPE_PARMT_PUBLC';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'GROUP_STAT';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'ELEMN_CONFG_PUBLC';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'POPUP_LOV_IR';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'POPUP_LOV_IR_FILTR';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'EVENM_NOTFB';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'MESG';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'OPERT';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'UTILS';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'PAGE_PLUGN_CALND';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'ENGIN';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'LIAIS_MESG';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'GROUP_OPERT';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = sie$migrt$pkg.obten_var_page(17301, 'Update'), ref_page_liste = null where code = 'VERSN';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'SECTN_DOCMN';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'GROUP_UTILS';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'TYPE_PUBLC';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'PLUGN_ARBRE';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'CLE_FONCT';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'MENU';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'STRUC_APLIC';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'LICNS';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'MODL';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'SOUS_MODL';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'TRAVL';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'PUBLC_TRAVL';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'CODE_UTILS_OUBLI';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'REQT_OBTEN_CODE_UTILS';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'REQT_ACTIV_COMPT_UTILS';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'ACUEI_APLIC_SAFD';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'ACUEI_APLIC_SAFP';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'ACUEI_APLIC_SAFU';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'ACUEI_APLIC_SAFS';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = sie$migrt$pkg.obten_var_page(17281, 'Update'), ref_page_liste = sie$migrt$pkg.obten_var_page(17279, 'Update') where code = 'DOMN_VALR';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = sie$migrt$pkg.obten_var_page(17283, 'Update'), ref_page_liste = sie$migrt$pkg.obten_var_page(17282, 'Update') where code = 'TYPE_DOMN_VALR';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = sie$migrt$pkg.obten_var_page(17267, 'Update'), ref_page_liste = null where code = 'INSTA_PREFR';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'MOTR_PDF';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'JOURN';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'FONCT';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'TRACE_EXECT';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'CODE_ORACL';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'MESG_APEX';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'LISTE_NAVGT';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'CONDT_PILTB';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'RAPRT_INTER';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'TRADC';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'VALR_RETR';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'EXPOR';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'ASURN_QUALT';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'STRUC_APLIC_STAT';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'STRUC_APLIC_TRADC';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'AUTOR';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'DECLN_PILE';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'LANG';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'EXTEN_ARBRE_NOEUD';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'EXTEN_MENU';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'ENGIN_VERSN_PUBLC';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'FORMT_RESRC';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'OCURN_RESRC';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'DOSR_VIRTL';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'CONDT_EXEC';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'SAFP_EVENM_NOTFB';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'DEPLM_RESRC';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'IDENT_ACCES';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'ATRIB_EVENM_NOTFB';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'MODL_RECHR';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'DESTN_CONFG_EVENM_NOTFB';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'ETUDE_IMPAC';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'AIDE_PAGE';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'GROUP_PUBLC';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'AFW_DOCMN';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'COMPT_NOTFC_SMS';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'SIE_11_APLIC';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'PRODT';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'ITEM';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'TYPE_AFICH';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'PATRN_RECHR';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'ACCES_APLIC';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'CHAMP_PUBLC';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = sie$migrt$pkg.obten_var_page(17310, 'Update'), ref_page_liste = sie$migrt$pkg.obten_var_page(17309, 'Update') where code = 'ENTIT';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'UTILS_SAFP';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'GROUP_DROIT';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'UTILS_SAFD';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'POPUP_LOV_IR_SAFD';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'DEFNT_EVENM_NOTFB';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'PUBLC';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'IMPRE';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'VERSN_PUBLC';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'SYSTM';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'MENU_SAFS';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'ITEM_MENU_SAFS';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'MODL_PARMT';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'COMNT_BOGUE';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'CONFG_EVENM_NOFTB';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'DESTN';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'CARNT_SYSTM';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'APLIC_MODL_RECHR';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'DETL_APLIC_MODL_RECHR';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'RESLT_RECHR';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'DETL_DOMN_VALR';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'REQT_INTER_UTILS_SAFP';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'ELEMN_CONFG_EVENM_NOTFB';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'RESLT_DESTN';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'REQT_INTER_UTILS';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'PROFL_COUR';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'CONXN';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'MOT_PASSE_OUBLI';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'REINT_MOT_PASSE';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'REQT_REINT_MOT_PASSE';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'FORMT_REPNS';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'AFW_GABRT_FORML';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'ACUEI_APLIC_SAF';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'AFW_COURL';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'MEMBR';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'TYPE_STRUC_ADMIN';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'FILE_ATENT';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'CLAS_INTER';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'MODL_NOTFC';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'MODL_MESG_NOTFC';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'AFW_MODL_COMNC';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'MODFR_MOT_PASSE';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'MOT_PASSE';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'HISTR_ACCES';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'COMPT_TELCP';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'AFW_ROLE';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'AFW_ENVIR';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'AFW_JALON_EQUIP';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'AFW_TACHE';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'TACHE_EFORT';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'AFW_LIEN_EQUIP';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = sie$migrt$pkg.obten_var_page(17982, 'Update'), ref_page_liste = sie$migrt$pkg.obten_var_page(17974, 'Update') where code = 'AFW_JALON';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = sie$migrt$pkg.obten_var_page(17978, 'Update'), ref_page_liste = sie$migrt$pkg.obten_var_page(17972, 'Update') where code = 'AFW_EQUIP';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'AFW_DISPN_UTILS';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'AFW_ROLE_UTILS';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'AFW_SCHEM';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'AFW_DEFN_CAPTR';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'TEST_EN_INSCR';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = sie$migrt$pkg.obten_var_page(18071, 'Update'), ref_page_liste = sie$migrt$pkg.obten_var_page(18070, 'Update') where code = 'AFW_FONCT';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'AFW_ASURN_QUALT';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'AFW-DOMN_FONCT';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = sie$migrt$pkg.obten_var_page(18069, 'Update'), ref_page_liste = null where code = 'LIEN_FONCT_STRUC_APLIC';
update sie_12_struc_aplic set ref_mesg_err_suprs = null, ref_page_forml = null, ref_page_liste = null where code = 'AFW_PRECN_REALS';
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$12_struc_aplic;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_12_struc_aplic');
  end if;
end;
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_12_struc_aplic');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$01_evenm_notfb;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_01_evenm_notfb');
  end if;
end;
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_01_evenm_notfb');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$12_fonct;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_12_fonct');
  end if;
end;
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_12_fonct');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3674, 'Select');
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('sie_12_atrib_struc_aplic');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('sie_12_atrib_struc_aplic');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_MESG_RANGE_SUPRM_SPECF' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3674, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_MESG_RANGE_MODF_SPECF' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3674, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_MESG_RANGE_INSER_SPECF' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3674, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = sie$migrt$pkg.obten_var_atrib_struc_aplic(50553, 'Update') where nom_coln = 'REF_MESG_TROP_DON_TROUV' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3674, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_TYPE_DOMN_VALR' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4501, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_SYSTM' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4501, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_SYSTM_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4501, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4501, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'CODE' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4501, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DESCR' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4501, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'ENONC_SOURC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4501, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4501, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4501, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'TYPE_DON' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4501, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'TYPE_DON_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4501, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4501, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_PRODT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4501, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_PRODT_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4501, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4573, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SERVR_SORTN' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4573, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'PORT_SORTN' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4573, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'AUTHE_METHD_SORTN' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4573, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'AUTHE_USAGR_SORTN' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4573, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_SSL_SORTN' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4573, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'PORT_ENTRA' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4573, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'AUTHE_MDP_ENTRA' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4573, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'AUTHE_METHD_ENTRA' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4573, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_SSL_ENTRA' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4573, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DOMN' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4573, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM_ENVOY' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4573, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4573, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4573, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4573, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DOMN' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4573, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DOMN_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4573, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DESCR' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4573, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'PROTC_ENTRA' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4573, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_UTILS_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4569, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DOMN' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4569, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_PRODT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4569, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NUMR_PAGE_APEX' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4569, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'URL_INTER' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4569, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_TRAIT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4569, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM_FORMT_COMNC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4549, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_ACTIF' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4549, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_ACTIF_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4549, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_ACTIF_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4551, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NUMR_SURCH' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3630, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_MODL' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3630, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_AGREG' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3630, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3630, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_DETRM' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3630, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_PIPLN' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3630, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM_ORGAN' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3630, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3630, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'VERSN_BD_APLIC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3630, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_AUTHID_CURNT_UTILS' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3630, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3630, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_TYPE_MODL' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3630, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DESCR' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3682, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3682, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3682, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DNR_REF_PRODT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3682, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3682, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4549, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'TYPE_MESG' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3682, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_PRODT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3682, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3704, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DOMN' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3704, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3704, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4549, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4549, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4549, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NUMR_SURCH' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3631, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_MODL' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3631, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3631, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3631, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_DETRM' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3631, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_PIPLN' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3631, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM_ORGAN' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3631, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3631, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_AUTHID_CURNT_UTILS' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3631, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_VERSN' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3631, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'CODE' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3682, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3682, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NUMR_MESG' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3682, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM_ORGAN' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4560, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'POSTN' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4560, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'VALR_DEFT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4560, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4560, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4560, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_PUBLC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4560, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DNR_REF_PRODT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4560, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_RETR' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4560, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_SYSTM' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4564, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_SYSTM_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4564, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_DOCMN_REFRC_VALR' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4564, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_DOCMN_REFRC_CODE' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4564, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_UTILS_RESPN' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4564, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4564, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4564, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4564, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4569, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'IDENT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4569, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = sie$migrt$pkg.obten_var_atrib_struc_aplic(50272, 'Update') where nom_coln = 'REF_UTILS' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4569, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_TYPE_REQT_INTER' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4569, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_DEBUT_EFECT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4569, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_FIN_EFECT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4569, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4569, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4569, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4569, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4569, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_SYSTM_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3682, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_CODE_SYSTM' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3682, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3682, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NUMR_APEX' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3682, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_VERSN_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3682, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_LANG' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3682, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'LANG_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3682, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4572, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4572, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4572, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'IDENT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4572, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = sie$migrt$pkg.obten_var_atrib_struc_aplic(50421, 'Update') where nom_coln = 'REF_UTILS' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4572, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = sie$migrt$pkg.obten_var_atrib_struc_aplic(50411, 'Update') where nom_coln = 'REF_DV_TYPE_REQT_INTER' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4572, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_TYPE_REQT_INTER_CODE' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4572, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_TYPE_REQT_INTER_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4572, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_DEBUT_EFECT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4572, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_FIN_EFECT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4572, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DOMN' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4572, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_PRODT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4572, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'URL_INTER' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4572, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4572, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4572, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4551, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'PRENM' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4551, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4551, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'CODE_UTILS' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4551, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'MOT_PASSE' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4551, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_VERL' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4551, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_VERL_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4551, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_CHANG_MOT_PASSE' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4551, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DERNR_PRODT_ACCES' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4551, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4551, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4551, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4551, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM_FORMT_COMNC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4551, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3674, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'APP_ID_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3674, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_STRUC_APLIC_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3674, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DESCR' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3082, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_PRODT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3082, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_PRODT_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3082, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_CODE_MESG_SUPRS_SPECF' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3674, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3082, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_MESG_ERR_SUPRS' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3082, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_CODE_MESG_ERR_SUPRS' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3082, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_EXTRA_TOUT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3082, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM_STRUC_ACCES_DON' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3082, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_PAGE_FORML' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3082, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM_FONCT_VALR_COURT_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3082, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_DISPN_DOCMN' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3082, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_TYPE_REQT_INTER_CODE' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4569, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4570, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'CODE' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4570, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'IDENT_ACCES' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4570, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'IDENT_ACCES_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4570, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4570, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4570, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4570, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'MESG' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4562, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_EVENM_NOTFB' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4562, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DESCR' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4562, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DOMN' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4562, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4562, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4562, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4562, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'TITRE_MESG' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4562, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'MESG_SMS' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4562, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'CODE_VALR' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4568, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'VALR' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4568, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DOMN_VALR' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4568, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'VERSN_BD_APLIC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3631, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_TYPE_MODL' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3631, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4560, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4560, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4551, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'COURL' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4551, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_CHANG_MOT_PASSE_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4551, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4551, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3082, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3082, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3082, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM_FONCT_VALR_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3082, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM_PACKG' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3082, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_TYPE_REQT_INTER_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4569, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4570, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4562, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4562, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4562, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DOSR_FICHR' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4541, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4541, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'PAGE_ACUEI' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4541, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_MESG_ECHEC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3682, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_MESG_RANGE_MODF' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3682, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NUMR_APLIC_APEX' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3682, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_EXTRA_TOUT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3682, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_DERNR_MAJ_REFRN_APEX' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3682, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'MESG_TOUT_DROIT_RESRV' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3682, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = sie$migrt$pkg.obten_var_atrib_struc_aplic(50266, 'Update') where nom_coln = 'REF_PRODT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3692, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NUMR_APEX' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3674, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3674, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_STRUC_APLIC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3674, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_PRISE_CHARG_SIE19' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3674, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_PRISE_CHARG_SIE14_POPUP' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3674, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_MESG_ECHEC_SPECF' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3674, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_MESG_AUCUN_DON_TROUV' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3674, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_SYSTM' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4501, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4501, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4501, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4501, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_CODE_FORMT_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4501, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'CODE' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4573, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'AUTHE_MDP_SORTN' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4573, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SERVR_ENTRA' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4573, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'AUTHE_USAGR_ENTRA' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4573, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'ADRES_ENVOY' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4573, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4573, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4573, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_UTILS_CODE' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4569, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NUMR_APLIC_APEX' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4569, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_TRAIT_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4569, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_ACTIF' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4551, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC_PRESN' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4568, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_DEBUT_EFECT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4568, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_FIN_EFECT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4568, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4568, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4568, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4568, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4568, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'VALR_COURT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4568, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'VALR_ORGAN' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4568, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_PRODT_DV' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4568, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4549, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'PRENM' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4549, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'COURL' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4549, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4549, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'CODE_UTILS' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4549, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'MOT_PASSE' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4549, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_EXPIR' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4549, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_VERL' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4549, 'Select');
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('sie_12_atrib_struc_aplic');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('sie_12_atrib_struc_aplic');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_CHANG_MOT_PASSE' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4549, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_CHANG_MOT_PASSE_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4549, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4534, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_NATR_DESTN_CODE' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4534, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_NATR_DESTN_VALR' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4534, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_CONFG_EVENM_NOTFB' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4534, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DESTN_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4534, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_RESLT_DESTN' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4534, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_RESLT_DESTN_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4534, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_ATRIB_SA_NOM_FORMT_CODE' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4534, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_ATRIB_SA_ADRES_DESTN' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4534, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_ATRIB_SA_ADRES_DESTN_CODE' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4534, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4534, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4534, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4534, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DESTN' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4571, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DNR_REF_PRODT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4571, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'IDENT_ACCES_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4571, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4571, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4571, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4571, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4571, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4541, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4541, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DESCR' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4541, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4541, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4541, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4541, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'PRODT_COMNT_BOGUE' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4541, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'PAGE_COMNT_BOGUE' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4541, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_AFICH_ERR_CODE' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3682, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_SYSTM' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3682, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_MESG_SUCS' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3682, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_MESG_FETCH' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3682, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_MESG_RANGE_SUPRM' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3682, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_MESG_AUCUN_DON_TROUV' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3682, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_MESG_TROP_DON_TROUV' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3682, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'PAGE_ACUEI' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3682, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'TAIL_TABL_EXTRA' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3682, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_GROUP_UTILS_ADMIN' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3682, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_PROFL_COURL' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3682, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'IDENT_ENVIR' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3682, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_VERSN' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3682, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_PRODT_AUTHE' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3682, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'JQUER_UI_CSS_SCOPE' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3682, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3692, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NUMR_MESG' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3692, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'TYPE_MESG' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3692, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3674, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DESCR' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3674, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3674, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3674, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_PRODT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3674, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_PRISE_CHARG_SIE01' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3674, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_PRISE_CHARG_SIE04' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3674, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_MESG_SUPRS_SPECF' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3674, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_PRISE_CHARG_SIE13_NAVGT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3674, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_PRISE_CHARG_SIE18' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3674, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_PAGE_RECHR' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3674, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_PRISE_CHARG_SIE13_CONFR' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3674, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'PREFX_MESG' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3674, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_DERNR_MAJ_REFRN_APEX' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3674, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_MESG_SUCS_SPECF' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3674, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_MESG_FETCH_SPECF' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3674, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3692, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3692, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3692, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3692, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DNR_REF_PRODT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3692, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_PUBLC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3630, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3630, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3630, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DNR_REF_PRODT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3630, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_VERSN' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3630, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3682, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3682, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4549, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DESCR' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3704, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'MESG' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3704, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_PUBLC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3631, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_AGREG' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3631, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3631, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DNR_REF_PRODT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3631, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3631, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_MODL' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4560, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SENS' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4560, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4560, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4564, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_DOCMN_REFRC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4564, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_UTILS_RESPN_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4564, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4564, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3082, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'CODE' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3082, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'TAIL_TABL_EXTRA' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3082, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM_FONCT_DESCR_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3082, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_CONFG_EVENM_NOTFB' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4570, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4570, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'CODE' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4562, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_TYPE_COMNC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4562, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'OBJET' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4562, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4568, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_CODE_DOMN_VALR_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4568, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_TYPE_DON' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4560, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_EXPIR' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4551, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3082, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_PAGE_LISTE' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3082, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DERNR_PRODT_ACCES' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4549, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4541, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'PAGE_CONXN' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3682, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_VERL_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4549, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_NATR_DESTN' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4534, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DESTN' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4534, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_ATRIB_SA_NOM_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4534, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4534, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4571, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'IDENT_ACCES' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4571, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4571, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'CODE' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4541, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'FONCT_OBTEN_BASE_URL' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4541, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'PRODT_ACUEI' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4541, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_PAGE_INEXS_MAJ_REFRN' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3682, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_MESG_RANGE_INSER' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3682, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'PROCD_EXPOR_METDN' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3682, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DOSR_FICHR' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3682, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_PRODT_AUTHE' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3682, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DESCR' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3692, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3674, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4941, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4941, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4934, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'CODE' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4934, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4934, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DESCR' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4934, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4934, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4934, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4934, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4934, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4936, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_EQUIP' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4936, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_EQUIP_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4936, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_JALON' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4936, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_JALON_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4936, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DEBUT_EFECT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4936, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'FIN_EFECT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4936, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'POURC_AFECT_EQUIP_JALON' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4936, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4936, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4936, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4936, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4936, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4938, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_TACHE' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4938, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_ROLE' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4938, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_ROLE_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4938, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_UTILS' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4938, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_UTILS_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4938, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'EFORT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4938, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_EFORT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4938, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4938, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4938, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4938, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4938, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4943, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_ROLE' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4943, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_UTILS' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4943, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DEBUT_EFECT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4943, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'FIN_EFECT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4943, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4943, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4943, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4943, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4943, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4937, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NUMR_SIGNF' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4937, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_COMPL' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4937, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_COMPL_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4937, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4937, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DESCR' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4937, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'CONTN_SOURCE' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4937, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_SIGNL' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4937, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_UTILS_SIGNL' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4937, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_UTILS_SIGNL_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4937, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_MODE_SIGNL' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4937, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_MODE_SIGNL_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4937, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_PROFL_COURL_SIGNL' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4937, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_P_COURL_SIGNL_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4937, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_ENVIR' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4937, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_ENVIR_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4937, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_PRIOR' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4937, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_PRIOR_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4937, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_STAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4937, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_STAT_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4937, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_TACHE' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4937, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'COMNT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4937, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4937, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4937, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4937, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4937, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_META_APLIC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4937, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_META_PRODT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4937, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_APLIC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4937, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4939, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_EQUIP' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4939, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_UTILS' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4939, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DEBUT_EFECT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4939, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'FIN_EFECT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4939, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'POURC_IMPLI_EQUIP' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4939, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4939, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4939, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4939, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4939, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4942, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_UTILS' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4942, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_UTILS_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4942, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DEBUT_EFECT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4942, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'EFORT_DISPN_SEMN' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4942, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'FIN_EFECT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4942, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4942, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4942, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4942, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4942, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4940, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4940, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_PRODT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4940, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_PRODT_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4940, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_PREVU' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4940, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4940, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4940, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4940, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4940, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4941, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'CODE' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4941, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4941, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DESCR' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4941, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4941, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4941, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_EVENM_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4995, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_COMPR_SI_VERL' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4995, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_COMPR_SI_VERL_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4995, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4854, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_TYPE_DON_SAIS' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4854, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_REPNS_OBLIG' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4854, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4854, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_INTER' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4854, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_REPNS_MULTP' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4854, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOMBR_MINM_OCURN_INTER' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4854, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOMBR_MAXM_OCURN_INTER' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4854, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_TYPE_CHAMP_REPNS' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4854, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DOMN_VALR' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4854, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOMBR_CARCT_REPNS' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4854, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_MASQ_FORMT_REPNS' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4854, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'LARGR_REPNS' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4854, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOMBR_COLN_REPNS' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4854, 'Select');
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('sie_12_atrib_struc_aplic');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('sie_12_atrib_struc_aplic');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOMBR_RANGE_REPNS' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4854, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_AUTRE' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4854, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_TYPE_CHAMP_AUTRE' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4854, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOMBR_CARCT_AUTRE' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4854, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_MASQ_FORMT_AUTRE' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4854, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'LARGR_AUTRE' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4854, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOMBR_COLN_AUTRE' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4854, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOMBR_RANGE_AUTRE' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4854, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4854, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4854, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4854, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4854, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4855, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'CODE' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4855, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4855, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DESCR' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4855, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DOMN' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4855, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_STAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4855, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_STAT_CODE' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4855, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_STAT_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4855, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4855, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4855, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4855, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4855, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3694, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3694, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'PRENM' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3694, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'COURL' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3694, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3694, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM_FORMT_COMNC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3694, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'CODE_UTILS' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3694, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'MOT_PASSE' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3694, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_EXPIR' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3694, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_VERL' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3694, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_VERL_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3694, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_CHANG_MOT_PASSE' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3694, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_CHANG_MOT_PASSE_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3694, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_ACTIF' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3694, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_ACTIF_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3694, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DERNR_PRODT_ACCES' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3694, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DERNR_DOMN_ACCES' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3694, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3694, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3694, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3694, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3694, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_UTILS' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(5001, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4994, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'CODE' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4994, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4994, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_ENVIR' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4994, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_ENVIR_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4994, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_SCHEM_ENVIR_CIBLE' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4994, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_CAPTR_DDL' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4994, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4994, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4994, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4994, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4994, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4995, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_SCHEM' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4995, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_SCHEM_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4995, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_NATR_OBJET' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4995, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_NATR_OBJET_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4995, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_EVENM' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4995, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_VERL_SI_OBJET_NON_VERL' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4995, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4995, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4995, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4995, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4995, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_PRIS_CHARG_ENONC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4995, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_JOURN_ENONC_COMPL' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4995, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_META_PRODT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4998, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_TACHE_PARNT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4998, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_NATR_TACHE' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4998, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_COMNC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4998, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_PRODT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4998, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_INSCR' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4998, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_ENVIR' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4998, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_PRIOR' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4998, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_STAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4998, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_TACHE_ORIGN' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4998, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'COMNT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4998, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4998, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4998, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4998, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4998, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4998, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NUMR_SIGNF' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4998, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4998, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DESCR' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4998, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4997, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_PRODT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4997, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'CODE' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4997, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4997, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DESCR' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4997, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4997, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4997, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4997, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4997, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DNR_REF_PRODT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4997, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_AFICH_ERR_CODE' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4541, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'PROCD_IMPRE_ENTET_PDF_IR' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4541, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'PROCD_IMPRE_PIED_PAGE_PDF_IR' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4541, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'PROCD_PLPDF_COULR' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4541, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_MESG_SUCS' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4541, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_MESG_ECHEC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4541, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_MESG_FETCH' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4541, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_MESG_RANGE_SUPRM' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4541, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_MESG_RANGE_INSER' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4541, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_MESG_AUCUN_DON_TROUV' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4541, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_MESG_TROP_DON_TROUV' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4541, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_MESG_AUDIT_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4541, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_MESG_AUDIT_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4541, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_MESG_AUDIT_SUPRS' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4541, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'TAIL_TABL_EXTRA' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4541, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_EXTRA_TOUT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4541, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_GROUP_UTILS_ADMIN' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4541, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_VERSN' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4541, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'MESG_TOUT_DROIT_RESRV' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4541, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'JQUER_UI_CSS_SCOPE' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4541, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_APLIC_ACUEI' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4541, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_PAGE_ACUEI' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4541, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_APLIC_COMNT_BOGUE' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4541, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4999, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_FONCT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4999, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DOMN' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4999, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4999, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4999, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4999, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_FONCT_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4999, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DOMN_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4999, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_NUMR_VERSN_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4541, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_NUMR_APLIC_ACUEI' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4541, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_NUMR_PAGE_ACUEI' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4541, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_NUMR_APLIC_COMNT_BOGUE' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4541, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(5000, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_FONCT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(5000, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_STRUC_APLIC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(5000, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(5000, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(5000, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(5000, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'SEQNC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(5001, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NUMR_SIGNF' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(5001, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'NOM' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(5001, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DESCR' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(5001, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_INSCR' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(5001, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_ENVIR' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(5001, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_ENVIR_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(5001, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_PRIOR' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(5001, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_PRIOR_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(5001, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_STAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(5001, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_STAT_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(5001, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_TACHE_ORIGN' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(5001, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'COMNT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(5001, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(5001, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_CREAT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(5001, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(5001, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DATE_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(5001, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_META_PRODT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(5001, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_TACHE_PARNT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(5001, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_NATR_TACHE' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(5001, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_NATR_TACHE_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(5001, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_COMNC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(5001, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_PRODT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(5001, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_PRODT_FORMT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(5001, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_DV_COMPL' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(5001, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_JALON' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(5001, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_STAT_REALS' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(5001, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_MESG_RANGE_MODF' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4541, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'COMPT_GENRL' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4541, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'PROCD_EXPOR_METDN' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4541, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'IDENT_ENVIR' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4541, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_PAGE_INEXS_MAJ_REFRN' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4541, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_PAGE_COMNT_BOGUE' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4541, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'INDIC_ACTIF' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4999, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4999, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_NOM_VERSN' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4541, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'REF_NUMR_PAGE_COMNT_BOGUE' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4541, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'DNR_REF_PRODT' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(5000, 'Select');
update sie_12_atrib_struc_aplic set ref_atrib_struc_aplic = null where nom_coln = 'UTILS_MODFC' and ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(5000, 'Select');
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$12_atrib_struc_aplic;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_12_atrib_struc_aplic');
  end if;
end;
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_12_atrib_struc_aplic');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$01_destn;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_01_destn');
  end if;
end;
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_01_destn');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$12_fonct_struc_aplic;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_12_fonct_struc_aplic');
  end if;
end;
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_12_fonct_struc_aplic');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$01_hierc_aplic;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_01_hierc_aplic');
  end if;
end;
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_01_hierc_aplic');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$12_struc_aplic_lang;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_12_struc_aplic_lang');
  end if;
end;
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_12_struc_aplic_lang');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$01_reslt_destn;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_01_reslt_destn');
  end if;
end;
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_01_reslt_destn');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
update sie_13_resrc set ref_dosr_virtl = sie$migrt$pkg.obten_var_dosr_virtl(470, 'Update') where code = 'ABC' and ref_plugn is null and ref_prodt = sie$migrt$pkg.vnu_seqnc_prodt and ref_struc_aplic is null;
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_resrc;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_13_resrc');
  end if;
end;
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_13_resrc');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$25_type_publc;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_25_type_publc');
  end if;
end;
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_25_type_publc');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
update sie_13_ocurn_resrc set ref_dosr_virtl = null, ref_mime_type = sie$migrt$pkg.obten_var_mime_type(88, 'Update'), ref_versn = sie$migrt$pkg.obten_var_versn(144, 'Update') where ref_formt_resrc = sie$migrt$pkg.obten_var_formt_resrc(368, 'Select') and ref_resrc = sie$migrt$pkg.obten_var_resrc(3506, 'Select');
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('sie_13_ocurn_resrc');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('sie_13_ocurn_resrc');
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_ocurn_resrc;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_13_ocurn_resrc');
  end if;
end;
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_13_ocurn_resrc');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$25_parmt_type_publc;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_25_parmt_type_publc');
  end if;
end;
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_25_parmt_type_publc');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$25_elemn_confg_publc;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_25_elemn_confg_publc');
  end if;
end;
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_25_elemn_confg_publc');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$25_publc;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_25_publc');
  end if;
end;
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_25_publc');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$25_versn_publc;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_25_versn_publc');
  end if;
end;
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_25_versn_publc');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_opert;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_13_opert');
  end if;
end;
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_13_opert');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$25_engin_versn_publc;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_25_engin_versn_publc');
  end if;
end;
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_25_engin_versn_publc');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_opert_optio;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_13_opert_optio');
  end if;
end;
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_13_opert_optio');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$12_group_utils;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_12_group_utils');
  end if;
end;
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_12_group_utils');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$12_defnt_acces;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_12_defnt_acces');
  end if;
end;
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_12_defnt_acces');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$12_lien_group_utils;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_12_lien_group_utils');
  end if;
end;
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_12_lien_group_utils');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$12_stat;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_12_stat');
  end if;
end;
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_12_stat');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$12_evolt_stat;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_12_evolt_stat');
  end if;
end;
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_12_evolt_stat');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_menu;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_13_menu');
  end if;
end;
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_13_menu');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(400, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17164, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'GROUP' and ref_menu = sie$migrt$pkg.obten_var_menu(141, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','ITEM',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(430, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17357, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'UTILS' and ref_menu = sie$migrt$pkg.obten_var_menu(142, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(416, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17336, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'DOSR_VIRTL' and ref_menu = sie$migrt$pkg.obten_var_menu(143, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(417, 'Update'), ref_ocurn_resrc = null, ref_page = null, ref_resrc = null, ref_struc_aplic = null where code = 'EXTNS' and ref_menu = sie$migrt$pkg.obten_var_menu(143, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(417, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17279, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'DOMN_VALR' and ref_menu = sie$migrt$pkg.obten_var_menu(143, 'Select');
update sie_13_item_menu set ref_aplic = sie$migrt$pkg.obten_var_aplic(191, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(417, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17270, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'STRUC_LOGCL' and ref_menu = sie$migrt$pkg.obten_var_menu(143, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(417, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17285, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'LANG' and ref_menu = sie$migrt$pkg.obten_var_menu(143, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(385, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17282, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'TYPE' and ref_menu = sie$migrt$pkg.obten_var_menu(143, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(563, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17277, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'GROUP_STAT' and ref_menu = sie$migrt$pkg.obten_var_menu(143, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(563, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17265, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'PREF' and ref_menu = sie$migrt$pkg.obten_var_menu(143, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(563, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17274, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'OPERT' and ref_menu = sie$migrt$pkg.obten_var_menu(143, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(563, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17270, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'STRUC_APLIC' and ref_menu = sie$migrt$pkg.obten_var_menu(143, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(429, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17199, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'NOTFC_SMS' and ref_menu = sie$migrt$pkg.obten_var_menu(141, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','PL/SQL',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = null, ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','PL/SQL',sie$migrt$pkg.vva_code_prodt), ref_formt_resrc = null, ref_item_menu = null, ref_ocurn_resrc = null, ref_page = null, ref_resrc = null, ref_struc_aplic = null where code = 'INFOR_UTILS' and ref_menu = sie$migrt$pkg.obten_var_menu(103, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = null, ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','ITEM',sie$migrt$pkg.vva_code_prodt), ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(159, 'Update'), ref_ocurn_resrc = null, ref_page = null, ref_resrc = null, ref_struc_aplic = null where code = 'ZONE_DECNX' and ref_menu = sie$migrt$pkg.obten_var_menu(103, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(216, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17311, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'ENGIN' and ref_menu = sie$migrt$pkg.obten_var_menu(104, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(181, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17342, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'EVENM_NOTFB' and ref_menu = sie$migrt$pkg.obten_var_menu(104, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(189, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17195, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'MODL_MESG_NOTFC' and ref_menu = sie$migrt$pkg.obten_var_menu(102, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(181, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17344, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'DESTN' and ref_menu = sie$migrt$pkg.obten_var_menu(104, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(224, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17175, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'MODL_RECHR' and ref_menu = sie$migrt$pkg.obten_var_menu(102, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(189, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17203, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'EVENM_NOTFB' and ref_menu = sie$migrt$pkg.obten_var_menu(102, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(225, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17352, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'RECHR_UTILS' and ref_menu = sie$migrt$pkg.obten_var_menu(103, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = null, ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = null, ref_ocurn_resrc = null, ref_page = null, ref_resrc = null, ref_struc_aplic = null where code = 'ADMIN' and ref_menu = sie$migrt$pkg.obten_var_menu(104, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(190, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17181, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'FIL_ATENT' and ref_menu = sie$migrt$pkg.obten_var_menu(102, 'Select');
update sie_13_item_menu set ref_aplic = sie$migrt$pkg.obten_var_aplic(191, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(179, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17288, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'ARBOR' and ref_menu = sie$migrt$pkg.obten_var_menu(104, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = null, ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','ITEM',sie$migrt$pkg.vva_code_prodt), ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(222, 'Update'), ref_ocurn_resrc = null, ref_page = null, ref_resrc = null, ref_struc_aplic = null where code = 'ZONE_DECNX' and ref_menu = sie$migrt$pkg.obten_var_menu(102, 'Select');
update sie_13_item_menu set ref_aplic = sie$migrt$pkg.obten_var_aplic(191, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(179, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17295, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'MENU' and ref_menu = sie$migrt$pkg.obten_var_menu(104, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','ITEM',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(225, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17357, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'UTILS' and ref_menu = sie$migrt$pkg.obten_var_menu(103, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','PL/SQL',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = null, ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','PL/SQL',sie$migrt$pkg.vva_code_prodt), ref_formt_resrc = null, ref_item_menu = null, ref_ocurn_resrc = null, ref_page = null, ref_resrc = null, ref_struc_aplic = null where code = 'INFOR_UTILS' and ref_menu = sie$migrt$pkg.obten_var_menu(101, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = null, ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','ITEM',sie$migrt$pkg.vva_code_prodt), ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(174, 'Update'), ref_ocurn_resrc = null, ref_page = null, ref_resrc = null, ref_struc_aplic = null where code = 'DECNX' and ref_menu = sie$migrt$pkg.obten_var_menu(101, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(195, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17208, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'REQT_INTER_UTILS' and ref_menu = sie$migrt$pkg.obten_var_menu(102, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(195, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17164, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'GROUP' and ref_menu = sie$migrt$pkg.obten_var_menu(102, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(212, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17336, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'DOSR_VIRTL' and ref_menu = sie$migrt$pkg.obten_var_menu(104, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(213, 'Update'), ref_ocurn_resrc = null, ref_page = null, ref_resrc = null, ref_struc_aplic = null where code = 'EXTNS' and ref_menu = sie$migrt$pkg.obten_var_menu(104, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(213, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17279, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'DOMN_VALR' and ref_menu = sie$migrt$pkg.obten_var_menu(104, 'Select');
update sie_13_item_menu set ref_aplic = sie$migrt$pkg.obten_var_aplic(191, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(213, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17270, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'STRUC_LOGCL' and ref_menu = sie$migrt$pkg.obten_var_menu(104, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(213, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17285, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'LANG' and ref_menu = sie$migrt$pkg.obten_var_menu(104, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(180, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17282, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'TYPE' and ref_menu = sie$migrt$pkg.obten_var_menu(104, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(181, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17277, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'GROUP_STAT' and ref_menu = sie$migrt$pkg.obten_var_menu(104, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(181, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17265, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'PREF' and ref_menu = sie$migrt$pkg.obten_var_menu(104, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(181, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17274, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'OPERT' and ref_menu = sie$migrt$pkg.obten_var_menu(104, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(181, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17270, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'STRUC_APLIC' and ref_menu = sie$migrt$pkg.obten_var_menu(104, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(224, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17199, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'NOTFC_SMS' and ref_menu = sie$migrt$pkg.obten_var_menu(102, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = null, ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(224, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17157, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'NOTFC' and ref_menu = sie$migrt$pkg.obten_var_menu(102, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(224, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17201, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'COMPT_TELCP' and ref_menu = sie$migrt$pkg.obten_var_menu(102, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(189, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17197, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'MODL_COMNC' and ref_menu = sie$migrt$pkg.obten_var_menu(102, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(190, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17183, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'CLAS_INTER' and ref_menu = sie$migrt$pkg.obten_var_menu(102, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(223, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17160, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'UTILS' and ref_menu = sie$migrt$pkg.obten_var_menu(102, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(223, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17166, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'STRUC_ADMIN' and ref_menu = sie$migrt$pkg.obten_var_menu(102, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(223, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17174, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'AUTOR' and ref_menu = sie$migrt$pkg.obten_var_menu(102, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(196, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17172, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'TYPE' and ref_menu = sie$migrt$pkg.obten_var_menu(102, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(223, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17169, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'DOMN' and ref_menu = sie$migrt$pkg.obten_var_menu(102, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(216, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17318, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'PUBLC' and ref_menu = sie$migrt$pkg.obten_var_menu(104, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(216, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17316, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'GROUP_PUBLC' and ref_menu = sie$migrt$pkg.obten_var_menu(104, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(215, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17276, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'AUTOR' and ref_menu = sie$migrt$pkg.obten_var_menu(104, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(215, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17268, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'GROUP_DROIT' and ref_menu = sie$migrt$pkg.obten_var_menu(104, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(168, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17339, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'CONDT_EXEC' and ref_menu = sie$migrt$pkg.obten_var_menu(104, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(214, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17244, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'MESG' and ref_menu = sie$migrt$pkg.obten_var_menu(104, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(214, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17242, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'LIAIS' and ref_menu = sie$migrt$pkg.obten_var_menu(104, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(207, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17252, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'TRADC_APEX' and ref_menu = sie$migrt$pkg.obten_var_menu(104, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(212, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17328, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'RESRC' and ref_menu = sie$migrt$pkg.obten_var_menu(104, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = null, ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17328, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'RESRC_SUPR' and ref_menu = sie$migrt$pkg.obten_var_menu(104, 'Select');
update sie_13_item_menu set ref_aplic = sie$migrt$pkg.obten_var_aplic(191, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','PL/SQL',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = null, ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17250, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'SYSTM' and ref_menu = sie$migrt$pkg.obten_var_menu(104, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = null, ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17244, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'MESG_SUPR' and ref_menu = sie$migrt$pkg.obten_var_menu(104, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = null, ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17276, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'SECRT_SUPR' and ref_menu = sie$migrt$pkg.obten_var_menu(104, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = null, ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17318, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'RAPRT_SUPR' and ref_menu = sie$migrt$pkg.obten_var_menu(104, 'Select');
update sie_13_item_menu set ref_aplic = sie$migrt$pkg.obten_var_aplic(191, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(179, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17291, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'CALND' and ref_menu = sie$migrt$pkg.obten_var_menu(104, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(205, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17248, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'TRACE_EXECT' and ref_menu = sie$migrt$pkg.obten_var_menu(104, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(168, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17284, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'DECLN_PILE' and ref_menu = sie$migrt$pkg.obten_var_menu(104, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','PL/SQL',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','PL/SQL',sie$migrt$pkg.vva_code_prodt), ref_formt_resrc = null, ref_item_menu = null, ref_ocurn_resrc = null, ref_page = null, ref_resrc = null, ref_struc_aplic = null where code = 'INFOR_UTILS' and ref_menu = sie$migrt$pkg.obten_var_menu(104, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','ITEM',sie$migrt$pkg.vva_code_prodt), ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(220, 'Update'), ref_ocurn_resrc = null, ref_page = null, ref_resrc = null, ref_struc_aplic = null where code = 'ZONE_DECNX' and ref_menu = sie$migrt$pkg.obten_var_menu(104, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','PL/SQL',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = null, ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','PL/SQL',sie$migrt$pkg.vva_code_prodt), ref_formt_resrc = null, ref_item_menu = null, ref_ocurn_resrc = null, ref_page = null, ref_resrc = null, ref_struc_aplic = null where code = 'INFOR_UTILS' and ref_menu = sie$migrt$pkg.obten_var_menu(102, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = null, ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17174, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'SECRT' and ref_menu = sie$migrt$pkg.obten_var_menu(102, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = null, ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = null, ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17157, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'ADMIN' and ref_menu = sie$migrt$pkg.obten_var_menu(102, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = null, ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17357, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'SECRT' and ref_menu = sie$migrt$pkg.obten_var_menu(103, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = null, ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17353, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'RAPRT' and ref_menu = sie$migrt$pkg.obten_var_menu(103, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(226, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17353, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'IMPRE' and ref_menu = sie$migrt$pkg.obten_var_menu(103, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(224, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17179, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'COURL' and ref_menu = sie$migrt$pkg.obten_var_menu(102, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(189, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17190, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'MODL_AFICH' and ref_menu = sie$migrt$pkg.obten_var_menu(102, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(216, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17313, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'TYPE_PUBLC' and ref_menu = sie$migrt$pkg.obten_var_menu(104, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(168, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17241, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'JOURNL' and ref_menu = sie$migrt$pkg.obten_var_menu(104, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(207, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17251, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'CODE_EREUR_ORACL' and ref_menu = sie$migrt$pkg.obten_var_menu(104, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = null, ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(429, 'Update'), ref_ocurn_resrc = null, ref_page = null, ref_resrc = null, ref_struc_aplic = null where code = 'NOTFC' and ref_menu = sie$migrt$pkg.obten_var_menu(141, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(429, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17179, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'COURL' and ref_menu = sie$migrt$pkg.obten_var_menu(141, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(429, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17201, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'COMPT_TELCP' and ref_menu = sie$migrt$pkg.obten_var_menu(141, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(394, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17197, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'MODL_COMNC' and ref_menu = sie$migrt$pkg.obten_var_menu(141, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(395, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17183, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'CLAS_INTER' and ref_menu = sie$migrt$pkg.obten_var_menu(141, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(394, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17190, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'MODL_AFICH' and ref_menu = sie$migrt$pkg.obten_var_menu(141, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(428, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17160, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'UTILS' and ref_menu = sie$migrt$pkg.obten_var_menu(141, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(428, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17166, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'STRUC_ADMIN' and ref_menu = sie$migrt$pkg.obten_var_menu(141, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(428, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17174, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'AUTOR' and ref_menu = sie$migrt$pkg.obten_var_menu(141, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(401, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17172, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'TYPE' and ref_menu = sie$migrt$pkg.obten_var_menu(141, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(420, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17313, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'TYPE_PUBLC' and ref_menu = sie$migrt$pkg.obten_var_menu(143, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(420, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17318, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'PUBLC' and ref_menu = sie$migrt$pkg.obten_var_menu(143, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(420, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17316, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'GROUP_PUBLC' and ref_menu = sie$migrt$pkg.obten_var_menu(143, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(419, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17276, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'AUTOR' and ref_menu = sie$migrt$pkg.obten_var_menu(143, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(419, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17268, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'GROUP_DROIT' and ref_menu = sie$migrt$pkg.obten_var_menu(143, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(443, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17241, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'JOURNL' and ref_menu = sie$migrt$pkg.obten_var_menu(143, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(443, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17339, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'CONDT_EXEC' and ref_menu = sie$migrt$pkg.obten_var_menu(143, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(418, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17244, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'MESG' and ref_menu = sie$migrt$pkg.obten_var_menu(143, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(418, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17242, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'LIAIS' and ref_menu = sie$migrt$pkg.obten_var_menu(143, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(411, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17252, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'TRADC_APEX' and ref_menu = sie$migrt$pkg.obten_var_menu(143, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(411, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17251, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'CODE_EREUR_ORACL' and ref_menu = sie$migrt$pkg.obten_var_menu(143, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(416, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17328, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'RESRC' and ref_menu = sie$migrt$pkg.obten_var_menu(143, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = null, ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17328, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'RESRC_SUPR' and ref_menu = sie$migrt$pkg.obten_var_menu(143, 'Select');
update sie_13_item_menu set ref_aplic = sie$migrt$pkg.obten_var_aplic(191, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','PL/SQL',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = null, ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17250, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'SYSTM' and ref_menu = sie$migrt$pkg.obten_var_menu(143, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = null, ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17244, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'MESG_SUPR' and ref_menu = sie$migrt$pkg.obten_var_menu(143, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = null, ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17276, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'SECRT_SUPR' and ref_menu = sie$migrt$pkg.obten_var_menu(143, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = null, ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17318, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'RAPRT_SUPR' and ref_menu = sie$migrt$pkg.obten_var_menu(143, 'Select');
update sie_13_item_menu set ref_aplic = sie$migrt$pkg.obten_var_aplic(191, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(384, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17291, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'CALND' and ref_menu = sie$migrt$pkg.obten_var_menu(143, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(409, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17248, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'TRACE_EXECT' and ref_menu = sie$migrt$pkg.obten_var_menu(143, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(443, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17284, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'DECLN_PILE' and ref_menu = sie$migrt$pkg.obten_var_menu(143, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','ITEM',sie$migrt$pkg.vva_code_prodt), ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(424, 'Update'), ref_ocurn_resrc = null, ref_page = null, ref_resrc = null, ref_struc_aplic = null where code = 'ZONE_DECNX' and ref_menu = sie$migrt$pkg.obten_var_menu(143, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','PL/SQL',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = null, ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','PL/SQL',sie$migrt$pkg.vva_code_prodt), ref_formt_resrc = null, ref_item_menu = null, ref_ocurn_resrc = null, ref_page = null, ref_resrc = null, ref_struc_aplic = null where code = 'INFOR_UTILS' and ref_menu = sie$migrt$pkg.obten_var_menu(141, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = null, ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','ITEM',sie$migrt$pkg.vva_code_prodt), ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(426, 'Update'), ref_ocurn_resrc = null, ref_page = null, ref_resrc = null, ref_struc_aplic = null where code = 'ZONE_DECNX' and ref_menu = sie$migrt$pkg.obten_var_menu(141, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = null, ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17174, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'SECRT' and ref_menu = sie$migrt$pkg.obten_var_menu(141, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = null, ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = null, ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17157, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'ADMIN' and ref_menu = sie$migrt$pkg.obten_var_menu(141, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = null, ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17357, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'SECRT' and ref_menu = sie$migrt$pkg.obten_var_menu(142, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = null, ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17353, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'RAPRT' and ref_menu = sie$migrt$pkg.obten_var_menu(142, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(431, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17353, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'IMPRE' and ref_menu = sie$migrt$pkg.obten_var_menu(142, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','PL/SQL',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = null, ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','PL/SQL',sie$migrt$pkg.vva_code_prodt), ref_formt_resrc = null, ref_item_menu = null, ref_ocurn_resrc = null, ref_page = null, ref_resrc = null, ref_struc_aplic = null where code = 'INFOR_UTILS' and ref_menu = sie$migrt$pkg.obten_var_menu(142, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = null, ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','ITEM',sie$migrt$pkg.vva_code_prodt), ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(433, 'Update'), ref_ocurn_resrc = null, ref_page = null, ref_resrc = null, ref_struc_aplic = null where code = 'ZONE_DECNX' and ref_menu = sie$migrt$pkg.obten_var_menu(142, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(420, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17311, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'ENGIN' and ref_menu = sie$migrt$pkg.obten_var_menu(143, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(563, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17342, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'EVENM_NOTFB' and ref_menu = sie$migrt$pkg.obten_var_menu(143, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(394, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17195, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'MODL_MESG_NOTFC' and ref_menu = sie$migrt$pkg.obten_var_menu(141, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(563, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17344, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'DESTN' and ref_menu = sie$migrt$pkg.obten_var_menu(143, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(429, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17175, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'MODL_RECHR' and ref_menu = sie$migrt$pkg.obten_var_menu(141, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(394, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17203, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'EVENM_NOTFB' and ref_menu = sie$migrt$pkg.obten_var_menu(141, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(430, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17352, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'RECHR_UTILS' and ref_menu = sie$migrt$pkg.obten_var_menu(142, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = null, ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = null, ref_ocurn_resrc = null, ref_page = null, ref_resrc = null, ref_struc_aplic = null where code = 'ADMIN' and ref_menu = sie$migrt$pkg.obten_var_menu(143, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(395, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17181, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'FIL_ATENT' and ref_menu = sie$migrt$pkg.obten_var_menu(141, 'Select');
update sie_13_item_menu set ref_aplic = sie$migrt$pkg.obten_var_aplic(191, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(384, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17288, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'ARBOR' and ref_menu = sie$migrt$pkg.obten_var_menu(143, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = null, ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(433, 'Update'), ref_ocurn_resrc = null, ref_page = null, ref_resrc = null, ref_struc_aplic = null where code = 'ACTIO_AIDE_PAGE' and ref_menu = sie$migrt$pkg.obten_var_menu(142, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = null, ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(426, 'Update'), ref_ocurn_resrc = null, ref_page = null, ref_resrc = null, ref_struc_aplic = null where code = 'ACTIO_AIDE_PAGE' and ref_menu = sie$migrt$pkg.obten_var_menu(141, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','PL/SQL',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = null, ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(455, 'Update'), ref_ocurn_resrc = null, ref_page = null, ref_resrc = null, ref_struc_aplic = null where code = 'DOMN_SESN' and ref_menu = sie$migrt$pkg.obten_var_menu(144, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','PL/SQL',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = null, ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(424, 'Update'), ref_ocurn_resrc = null, ref_page = null, ref_resrc = null, ref_struc_aplic = null where code = 'DOMN_SESN' and ref_menu = sie$migrt$pkg.obten_var_menu(143, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','PL/SQL',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = null, ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(426, 'Update'), ref_ocurn_resrc = null, ref_page = null, ref_resrc = null, ref_struc_aplic = null where code = 'DOMN_SESN' and ref_menu = sie$migrt$pkg.obten_var_menu(141, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','PL/SQL',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = null, ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(433, 'Update'), ref_ocurn_resrc = null, ref_page = null, ref_resrc = null, ref_struc_aplic = null where code = 'DOMN_SESN' and ref_menu = sie$migrt$pkg.obten_var_menu(142, 'Select');
update sie_13_item_menu set ref_aplic = sie$migrt$pkg.obten_var_aplic(191, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(417, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17236, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'MENU' and ref_menu = sie$migrt$pkg.obten_var_menu(143, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = null, ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(455, 'Update'), ref_ocurn_resrc = null, ref_page = null, ref_resrc = null, ref_struc_aplic = null where code = 'ACTIO_AIDE_PAGE' and ref_menu = sie$migrt$pkg.obten_var_menu(144, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = null, ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(424, 'Update'), ref_ocurn_resrc = null, ref_page = null, ref_resrc = null, ref_struc_aplic = null where code = 'ACTIO_AIDE_PAGE' and ref_menu = sie$migrt$pkg.obten_var_menu(143, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','PL/SQL',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = null, ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','PL/SQL',sie$migrt$pkg.vva_code_prodt), ref_formt_resrc = null, ref_item_menu = null, ref_ocurn_resrc = null, ref_page = null, ref_resrc = null, ref_struc_aplic = null where code = 'INFOR_UTILS' and ref_menu = sie$migrt$pkg.obten_var_menu(144, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = null, ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','ITEM',sie$migrt$pkg.vva_code_prodt), ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(455, 'Update'), ref_ocurn_resrc = null, ref_page = null, ref_resrc = null, ref_struc_aplic = null where code = 'DECNX' and ref_menu = sie$migrt$pkg.obten_var_menu(144, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(400, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17208, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'REQT_INTER_UTILS' and ref_menu = sie$migrt$pkg.obten_var_menu(141, 'Select');
update sie_13_item_menu set ref_aplic = sie$migrt$pkg.obten_var_aplic(191, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(384, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17295, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'EXTEN_MENU' and ref_menu = sie$migrt$pkg.obten_var_menu(143, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','PL/SQL',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = null, ref_ocurn_resrc = null, ref_page = null, ref_resrc = null, ref_struc_aplic = null where code = 'DOMN' and ref_menu = sie$migrt$pkg.obten_var_menu(141, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','PL/SQL',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','PL/SQL',sie$migrt$pkg.vva_code_prodt), ref_formt_resrc = null, ref_item_menu = null, ref_ocurn_resrc = null, ref_page = null, ref_resrc = null, ref_struc_aplic = null where code = 'INFOR_UTILS' and ref_menu = sie$migrt$pkg.obten_var_menu(143, 'Select');
update sie_13_item_menu set ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(428, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(18056, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'FONCT' and ref_menu = sie$migrt$pkg.obten_var_menu(141, 'Select');
update sie_13_item_menu set ref_aplic = sie$migrt$pkg.obten_var_aplic(191, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(563, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(18070, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'FONCT' and ref_menu = sie$migrt$pkg.obten_var_menu(143, 'Select');
update sie_13_item_menu set ref_aplic = sie$migrt$pkg.obten_var_aplic(191, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = null, ref_dv_valr_reqst = null, ref_dv_valr_sapc = null, ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(417, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17220, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'APLIC' and ref_menu = sie$migrt$pkg.obten_var_menu(143, 'Select');
update sie_13_item_menu set ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Update'), ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = null, ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(459, 'Update'), ref_ocurn_resrc = null, ref_page = sie$migrt$pkg.obten_var_page(17938, 'Update'), ref_resrc = null, ref_struc_aplic = null where code = 'FORMT_REPNS' and ref_menu = sie$migrt$pkg.obten_var_menu(141, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = null, ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(455, 'Update'), ref_ocurn_resrc = null, ref_page = null, ref_resrc = null, ref_struc_aplic = null where code = 'MODFR_MOT_PASSE' and ref_menu = sie$migrt$pkg.obten_var_menu(144, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = null, ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(424, 'Update'), ref_ocurn_resrc = null, ref_page = null, ref_resrc = null, ref_struc_aplic = null where code = 'MODFR_MOT_PASSE' and ref_menu = sie$migrt$pkg.obten_var_menu(143, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = null, ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(433, 'Update'), ref_ocurn_resrc = null, ref_page = null, ref_resrc = null, ref_struc_aplic = null where code = 'MODFR_MOT_PASSE' and ref_menu = sie$migrt$pkg.obten_var_menu(142, 'Select');
update sie_13_item_menu set ref_aplic = null, ref_dv_valr_insta_condt_afich = null, ref_dv_valr_insta_libl = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_dv_valr_reqst = null, ref_dv_valr_sapc = null, ref_dv_valr_sapi = null, ref_dv_valr_scpc = null, ref_dv_valr_scpi = null, ref_dv_valr_snpi = null, ref_dv_valr_sspc = null, ref_dv_valr_sspi = null, ref_dv_valr_url = sie_14_domn_valr_pkg.obten_seqnc('VALR_INSTA_SAFP','VALR_FIXE',sie$migrt$pkg.vva_code_prodt), ref_formt_resrc = null, ref_item_menu = sie$migrt$pkg.obten_var_item_menu(426, 'Update'), ref_ocurn_resrc = null, ref_page = null, ref_resrc = null, ref_struc_aplic = null where code = 'MODFR_MOT_PASSE' and ref_menu = sie$migrt$pkg.obten_var_menu(141, 'Select');
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_item_menu;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_13_item_menu');
  end if;
end;
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_13_item_menu');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
update sie_21_plugn_menu set ref_dv_coulr_princ = sie_14_domn_valr_pkg.obten_seqnc('COULR_PRINC','BLEU_SIE',sie$migrt$pkg.vva_code_prodt), ref_dv_coulr_theme = sie_14_domn_valr_pkg.obten_seqnc('COULR_THEME','CLAIR',sie$migrt$pkg.vva_code_prodt), ref_dv_formt_menu = sie_14_domn_valr_pkg.obten_seqnc('FORMT_MENU','COMPL',sie$migrt$pkg.vva_code_prodt), ref_dv_orien_menu = sie_14_domn_valr_pkg.obten_seqnc('ORIEN_MENU','HORZT',sie$migrt$pkg.vva_code_prodt), ref_dv_type_menu = null where code = 'MENU_ACUEI' and ref_menu = sie$migrt$pkg.obten_var_menu(144, 'Select') and ref_prodt = sie$migrt$pkg.vnu_seqnc_prodt;
update sie_21_plugn_menu set ref_dv_coulr_princ = sie_14_domn_valr_pkg.obten_seqnc('COULR_PRINC','BLEU_SIE',sie$migrt$pkg.vva_code_prodt), ref_dv_coulr_theme = sie_14_domn_valr_pkg.obten_seqnc('COULR_THEME','CLAIR',sie$migrt$pkg.vva_code_prodt), ref_dv_formt_menu = sie_14_domn_valr_pkg.obten_seqnc('FORMT_MENU','COMPL',sie$migrt$pkg.vva_code_prodt), ref_dv_orien_menu = sie_14_domn_valr_pkg.obten_seqnc('ORIEN_MENU','HORZT',sie$migrt$pkg.vva_code_prodt), ref_dv_type_menu = sie_14_domn_valr_pkg.obten_seqnc('TYPE_MENU','PRODT',sie$migrt$pkg.vva_code_prodt) where code = 'MENU_PRINC_SAFD' and ref_menu = sie$migrt$pkg.obten_var_menu(141, 'Select') and ref_prodt = sie$migrt$pkg.vnu_seqnc_prodt;
update sie_21_plugn_menu set ref_dv_coulr_princ = sie_14_domn_valr_pkg.obten_seqnc('COULR_PRINC','BLEU_SIE',sie$migrt$pkg.vva_code_prodt), ref_dv_coulr_theme = sie_14_domn_valr_pkg.obten_seqnc('COULR_THEME','CLAIR',sie$migrt$pkg.vva_code_prodt), ref_dv_formt_menu = sie_14_domn_valr_pkg.obten_seqnc('FORMT_MENU','COMPL',sie$migrt$pkg.vva_code_prodt), ref_dv_orien_menu = sie_14_domn_valr_pkg.obten_seqnc('ORIEN_MENU','HORZT',sie$migrt$pkg.vva_code_prodt), ref_dv_type_menu = sie_14_domn_valr_pkg.obten_seqnc('TYPE_MENU','PRODT',sie$migrt$pkg.vva_code_prodt) where code = 'MENU_PRINC_SAFU' and ref_menu = sie$migrt$pkg.obten_var_menu(142, 'Select') and ref_prodt = sie$migrt$pkg.vnu_seqnc_prodt;
update sie_21_plugn_menu set ref_dv_coulr_princ = sie_14_domn_valr_pkg.obten_seqnc('COULR_PRINC','BLEU_SIE',sie$migrt$pkg.vva_code_prodt), ref_dv_coulr_theme = sie_14_domn_valr_pkg.obten_seqnc('COULR_THEME','CLAIR',sie$migrt$pkg.vva_code_prodt), ref_dv_formt_menu = sie_14_domn_valr_pkg.obten_seqnc('FORMT_MENU','COMPL',sie$migrt$pkg.vva_code_prodt), ref_dv_orien_menu = sie_14_domn_valr_pkg.obten_seqnc('ORIEN_MENU','HORZT',sie$migrt$pkg.vva_code_prodt), ref_dv_type_menu = sie_14_domn_valr_pkg.obten_seqnc('TYPE_MENU','PRODT',sie$migrt$pkg.vva_code_prodt) where code = 'MENU_PRINC_SAFP' and ref_menu = sie$migrt$pkg.obten_var_menu(143, 'Select') and ref_prodt = sie$migrt$pkg.vnu_seqnc_prodt;
update sie_21_plugn_menu set ref_dv_coulr_princ = sie_14_domn_valr_pkg.obten_seqnc('COULR_PRINC','BLEU_SIE',sie$migrt$pkg.vva_code_prodt), ref_dv_coulr_theme = sie_14_domn_valr_pkg.obten_seqnc('COULR_THEME','CLAIR',sie$migrt$pkg.vva_code_prodt), ref_dv_formt_menu = sie_14_domn_valr_pkg.obten_seqnc('FORMT_MENU','COMPL',sie$migrt$pkg.vva_code_prodt), ref_dv_orien_menu = sie_14_domn_valr_pkg.obten_seqnc('ORIEN_MENU','HORZT',sie$migrt$pkg.vva_code_prodt), ref_dv_type_menu = null where code = 'P0_MENU_SANS_CONTX' and ref_menu = sie$migrt$pkg.obten_var_menu(101, 'Select') and ref_prodt = sie$migrt$pkg.vnu_seqnc_prodt;
update sie_21_plugn_menu set ref_dv_coulr_princ = sie_14_domn_valr_pkg.obten_seqnc('COULR_PRINC','BLEU_SIE',sie$migrt$pkg.vva_code_prodt), ref_dv_coulr_theme = sie_14_domn_valr_pkg.obten_seqnc('COULR_THEME','CLAIR',sie$migrt$pkg.vva_code_prodt), ref_dv_formt_menu = sie_14_domn_valr_pkg.obten_seqnc('FORMT_MENU','COMPL',sie$migrt$pkg.vva_code_prodt), ref_dv_orien_menu = sie_14_domn_valr_pkg.obten_seqnc('ORIEN_MENU','HORZT',sie$migrt$pkg.vva_code_prodt), ref_dv_type_menu = sie_14_domn_valr_pkg.obten_seqnc('TYPE_MENU','PRODT',sie$migrt$pkg.vva_code_prodt) where code = 'P0_MENU_PILTB_SAFD' and ref_menu = sie$migrt$pkg.obten_var_menu(102, 'Select') and ref_prodt = sie$migrt$pkg.vnu_seqnc_prodt;
update sie_21_plugn_menu set ref_dv_coulr_princ = sie_14_domn_valr_pkg.obten_seqnc('COULR_PRINC','BLEU_SIE',sie$migrt$pkg.vva_code_prodt), ref_dv_coulr_theme = sie_14_domn_valr_pkg.obten_seqnc('COULR_THEME','CLAIR',sie$migrt$pkg.vva_code_prodt), ref_dv_formt_menu = sie_14_domn_valr_pkg.obten_seqnc('FORMT_MENU','COMPL',sie$migrt$pkg.vva_code_prodt), ref_dv_orien_menu = sie_14_domn_valr_pkg.obten_seqnc('ORIEN_MENU','HORZT',sie$migrt$pkg.vva_code_prodt), ref_dv_type_menu = sie_14_domn_valr_pkg.obten_seqnc('TYPE_MENU','PRODT',sie$migrt$pkg.vva_code_prodt) where code = 'P0_MENU_PILTB_SAFU' and ref_menu = sie$migrt$pkg.obten_var_menu(103, 'Select') and ref_prodt = sie$migrt$pkg.vnu_seqnc_prodt;
update sie_21_plugn_menu set ref_dv_coulr_princ = sie_14_domn_valr_pkg.obten_seqnc('COULR_PRINC','BLEU_SIE',sie$migrt$pkg.vva_code_prodt), ref_dv_coulr_theme = sie_14_domn_valr_pkg.obten_seqnc('COULR_THEME','CLAIR',sie$migrt$pkg.vva_code_prodt), ref_dv_formt_menu = sie_14_domn_valr_pkg.obten_seqnc('FORMT_MENU','COMPL',sie$migrt$pkg.vva_code_prodt), ref_dv_orien_menu = sie_14_domn_valr_pkg.obten_seqnc('ORIEN_MENU','HORZT',sie$migrt$pkg.vva_code_prodt), ref_dv_type_menu = sie_14_domn_valr_pkg.obten_seqnc('TYPE_MENU','PRODT',sie$migrt$pkg.vva_code_prodt) where code = 'P0_MENU_PILTB_SAFP' and ref_menu = sie$migrt$pkg.obten_var_menu(104, 'Select') and ref_prodt = sie$migrt$pkg.vnu_seqnc_prodt;
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$21_plugn_menu;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_21_plugn_menu');
  end if;
end;
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_21_plugn_menu');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$21_plugn_arbre;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_21_plugn_arbre');
  end if;
end;
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_21_plugn_arbre');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = sie_14_domn_valr_pkg.obten_seqnc('CONTN_ITEM_MENU','COLN_SIMPL',sie$migrt$pkg.vva_code_prodt) where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(417, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1684, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(386, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1684, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(392, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1684, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(391, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1684, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(390, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1684, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(389, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1684, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(385, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1684, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(388, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1684, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(387, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1684, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(384, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1684, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(411, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1684, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(413, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1684, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(414, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1684, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(412, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1684, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = sie_14_domn_valr_pkg.obten_seqnc('CONTN_ITEM_MENU','COLN_SIMPL',sie$migrt$pkg.vva_code_prodt) where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(416, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1684, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(383, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1684, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(415, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1684, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = sie_14_domn_valr_pkg.obten_seqnc('CONTN_ITEM_MENU','COLN_SIMPL',sie$migrt$pkg.vva_code_prodt) where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(419, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1684, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(408, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1684, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(407, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1684, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = sie_14_domn_valr_pkg.obten_seqnc('CONTN_ITEM_MENU','COLN_SIMPL',sie$migrt$pkg.vva_code_prodt) where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(420, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1684, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(404, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1684, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(406, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1684, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(405, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1684, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = sie_14_domn_valr_pkg.obten_seqnc('CONTN_ITEM_MENU','COLN_SIMPL',sie$migrt$pkg.vva_code_prodt) where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(418, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1684, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(409, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1684, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(422, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1684, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(410, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1684, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(423, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1684, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(382, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1683, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = sie_14_domn_valr_pkg.obten_seqnc('ALIGN_PLUGN_ITEM','DROIT',sie$migrt$pkg.vva_code_prodt), ref_dv_contn_item_menu = sie_14_domn_valr_pkg.obten_seqnc('CONTN_ITEM_MENU','COLN_SIMPL',sie$migrt$pkg.vva_code_prodt) where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(433, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1683, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = sie_14_domn_valr_pkg.obten_seqnc('CONTN_ITEM_MENU','COLN_SIMPL',sie$migrt$pkg.vva_code_prodt) where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(430, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1683, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = sie_14_domn_valr_pkg.obten_seqnc('CONTN_ITEM_MENU','COLN_SIMPL',sie$migrt$pkg.vva_code_prodt) where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(431, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1683, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = sie_14_domn_valr_pkg.obten_seqnc('ALIGN_PLUGN_ITEM','GAUCH',sie$migrt$pkg.vva_code_prodt), ref_dv_contn_item_menu = sie_14_domn_valr_pkg.obten_seqnc('CONTN_ITEM_MENU','COLN_SIMPL',sie$migrt$pkg.vva_code_prodt) where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(428, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1682, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = sie_14_domn_valr_pkg.obten_seqnc('ALIGN_PLUGN_ITEM','GAUCH',sie$migrt$pkg.vva_code_prodt), ref_dv_contn_item_menu = sie_14_domn_valr_pkg.obten_seqnc('CONTN_ITEM_MENU','COLN_SIMPL',sie$migrt$pkg.vva_code_prodt) where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(429, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1682, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = sie_14_domn_valr_pkg.obten_seqnc('ALIGN_PLUGN_ITEM','DROIT',sie$migrt$pkg.vva_code_prodt), ref_dv_contn_item_menu = sie_14_domn_valr_pkg.obten_seqnc('CONTN_ITEM_MENU','COLN_SIMPL',sie$migrt$pkg.vva_code_prodt) where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(426, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1682, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(427, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1682, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(432, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1683, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(434, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1683, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(400, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1682, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(381, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1682, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(402, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1682, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(401, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1682, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(403, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1682, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(395, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1682, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(398, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1682, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(394, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1682, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(399, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1682, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(397, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1682, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(393, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1682, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(396, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1682, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = sie_14_domn_valr_pkg.obten_seqnc('ALIGN_PLUGN_ITEM','DROIT',sie$migrt$pkg.vva_code_prodt), ref_dv_contn_item_menu = sie_14_domn_valr_pkg.obten_seqnc('CONTN_ITEM_MENU','COLN_SIMPL',sie$migrt$pkg.vva_code_prodt) where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(424, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1684, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(425, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1684, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(437, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1682, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = sie_14_domn_valr_pkg.obten_seqnc('ALIGN_PLUGN_ITEM','GAUCH',sie$migrt$pkg.vva_code_prodt), ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(456, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1681, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = sie_14_domn_valr_pkg.obten_seqnc('ALIGN_PLUGN_ITEM','DROIT',sie$migrt$pkg.vva_code_prodt), ref_dv_contn_item_menu = sie_14_domn_valr_pkg.obten_seqnc('CONTN_ITEM_MENU','COLN_SIMPL',sie$migrt$pkg.vva_code_prodt) where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(455, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1681, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(439, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1682, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(440, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1682, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = sie_14_domn_valr_pkg.obten_seqnc('ALIGN_PLUGN_ITEM','GAUCH',sie$migrt$pkg.vva_code_prodt), ref_dv_contn_item_menu = sie_14_domn_valr_pkg.obten_seqnc('CONTN_ITEM_MENU','COLN_SIMPL',sie$migrt$pkg.vva_code_prodt) where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(459, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1682, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(444, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1682, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(457, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1682, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(450, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1682, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(447, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1682, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(435, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1684, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(436, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1684, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(438, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1684, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = sie_14_domn_valr_pkg.obten_seqnc('ALIGN_PLUGN_ITEM','GAUCH',sie$migrt$pkg.vva_code_prodt), ref_dv_contn_item_menu = sie_14_domn_valr_pkg.obten_seqnc('CONTN_ITEM_MENU','COLN_SIMPL',sie$migrt$pkg.vva_code_prodt) where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(443, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1684, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = sie_14_domn_valr_pkg.obten_seqnc('ALIGN_PLUGN_ITEM','GAUCH',sie$migrt$pkg.vva_code_prodt), ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(175, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1641, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = sie_14_domn_valr_pkg.obten_seqnc('ALIGN_PLUGN_ITEM','DROIT',sie$migrt$pkg.vva_code_prodt), ref_dv_contn_item_menu = sie_14_domn_valr_pkg.obten_seqnc('CONTN_ITEM_MENU','COLN_DOUBL',sie$migrt$pkg.vva_code_prodt) where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(174, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1641, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = sie_14_domn_valr_pkg.obten_seqnc('CONTN_ITEM_MENU','COLN_SIMPL',sie$migrt$pkg.vva_code_prodt) where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(213, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1644, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(181, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1644, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(187, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1644, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(186, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1644, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(185, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1644, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(184, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1644, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(180, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1644, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(183, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1644, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(182, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1644, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(179, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1644, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(207, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1644, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(209, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1644, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(210, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1644, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(208, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1644, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = sie_14_domn_valr_pkg.obten_seqnc('CONTN_ITEM_MENU','COLN_SIMPL',sie$migrt$pkg.vva_code_prodt) where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(212, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1644, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(178, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1644, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(211, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1644, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = sie_14_domn_valr_pkg.obten_seqnc('CONTN_ITEM_MENU','COLN_SIMPL',sie$migrt$pkg.vva_code_prodt) where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(215, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1644, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(204, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1644, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(203, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1644, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = sie_14_domn_valr_pkg.obten_seqnc('CONTN_ITEM_MENU','COLN_SIMPL',sie$migrt$pkg.vva_code_prodt) where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(216, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1644, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(200, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1644, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(202, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1644, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(201, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1644, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = sie_14_domn_valr_pkg.obten_seqnc('CONTN_ITEM_MENU','COLN_SIMPL',sie$migrt$pkg.vva_code_prodt) where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(214, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1644, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(205, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1644, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(218, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1644, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(206, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1644, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(219, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1644, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(173, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1643, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = sie_14_domn_valr_pkg.obten_seqnc('ALIGN_PLUGN_ITEM','DROIT',sie$migrt$pkg.vva_code_prodt), ref_dv_contn_item_menu = sie_14_domn_valr_pkg.obten_seqnc('CONTN_ITEM_MENU','COLN_DOUBL',sie$migrt$pkg.vva_code_prodt) where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(159, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1643, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = sie_14_domn_valr_pkg.obten_seqnc('CONTN_ITEM_MENU','COLN_SIMPL',sie$migrt$pkg.vva_code_prodt) where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(225, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1643, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = sie_14_domn_valr_pkg.obten_seqnc('CONTN_ITEM_MENU','COLN_SIMPL',sie$migrt$pkg.vva_code_prodt) where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(226, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1643, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = sie_14_domn_valr_pkg.obten_seqnc('CONTN_ITEM_MENU','COLN_SIMPL',sie$migrt$pkg.vva_code_prodt) where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(223, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1642, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = sie_14_domn_valr_pkg.obten_seqnc('CONTN_ITEM_MENU','COLN_SIMPL',sie$migrt$pkg.vva_code_prodt) where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(224, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1642, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = sie_14_domn_valr_pkg.obten_seqnc('ALIGN_PLUGN_ITEM','DROIT',sie$migrt$pkg.vva_code_prodt), ref_dv_contn_item_menu = sie_14_domn_valr_pkg.obten_seqnc('CONTN_ITEM_MENU','COLN_DOUBL',sie$migrt$pkg.vva_code_prodt) where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(222, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1642, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(171, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1642, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(227, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1643, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(160, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1643, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(195, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1642, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(177, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1642, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(199, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1642, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(197, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1642, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(196, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1642, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(198, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1642, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(190, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1642, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(193, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1642, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(189, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1642, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(194, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1642, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(192, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1642, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(188, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1642, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(191, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1642, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = sie_14_domn_valr_pkg.obten_seqnc('ALIGN_PLUGN_ITEM','DROIT',sie$migrt$pkg.vva_code_prodt), ref_dv_contn_item_menu = sie_14_domn_valr_pkg.obten_seqnc('CONTN_ITEM_MENU','COLN_DOUBL',sie$migrt$pkg.vva_code_prodt) where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(220, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1644, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(221, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1644, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(163, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1642, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(161, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1644, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(162, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1644, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(164, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1644, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = sie_14_domn_valr_pkg.obten_seqnc('ALIGN_PLUGN_ITEM','GAUCH',sie$migrt$pkg.vva_code_prodt), ref_dv_contn_item_menu = sie_14_domn_valr_pkg.obten_seqnc('CONTN_ITEM_MENU','COLN_SIMPL',sie$migrt$pkg.vva_code_prodt) where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(168, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1644, 'Select');
update sie_21_plugn_item_menu set ref_dv_align = null, ref_dv_contn_item_menu = null where ref_item_menu = sie$migrt$pkg.obten_var_item_menu(563, 'Select') and ref_plugn_menu = sie$migrt$pkg.obten_var_plugn_menu(1684, 'Select');
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$21_plugn_item_menu;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_21_plugn_item_menu');
  end if;
end;
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_21_plugn_item_menu');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$21_plugn_arbre_noeud;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_21_plugn_arbre_noeud');
  end if;
end;
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_21_plugn_arbre_noeud');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
update sie_21_plugn_calnd set ref_dv_vue_deft = sie_14_domn_valr_pkg.obten_seqnc('VUE_DISPN_CALND','JOUR',sie$migrt$pkg.vva_code_prodt) where code = '61' and ref_prodt = sie$migrt$pkg.vnu_seqnc_prodt;
update sie_21_plugn_calnd set ref_dv_vue_deft = sie_14_domn_valr_pkg.obten_seqnc('VUE_DISPN_CALND','SEMN_SIMPL',sie$migrt$pkg.vva_code_prodt) where code = '62' and ref_prodt = sie$migrt$pkg.vnu_seqnc_prodt;
update sie_21_plugn_calnd set ref_dv_vue_deft = sie_14_domn_valr_pkg.obten_seqnc('VUE_DISPN_CALND','JOUR',sie$migrt$pkg.vva_code_prodt) where code = '21' and ref_prodt = sie$migrt$pkg.vnu_seqnc_prodt;
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$21_plugn_calnd;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_21_plugn_calnd');
  end if;
end;
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_21_plugn_calnd');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
update sie_01_modl_afich_notfc set ref_formt_resrc_icon = null, ref_modl_comnc = sie$migrt$pkg.obten_var_modl_comnc(88, 'Update'), ref_ocurn_resrc_icon = null, ref_resrc_icon = null where code = 'ECRAN_IMPOR' and ref_domn is null;
update sie_01_modl_afich_notfc set ref_formt_resrc_icon = null, ref_modl_comnc = sie$migrt$pkg.obten_var_modl_comnc(87, 'Update'), ref_ocurn_resrc_icon = null, ref_resrc_icon = null where code = 'SMS' and ref_domn is null;
update sie_01_modl_afich_notfc set ref_formt_resrc_icon = null, ref_modl_comnc = sie$migrt$pkg.obten_var_modl_comnc(86, 'Update'), ref_ocurn_resrc_icon = null, ref_resrc_icon = null where code = 'COURL_BASE' and ref_domn is null;
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$01_modl_afich_notfc;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_01_modl_afich_notfc');
  end if;
end;
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_01_modl_afich_notfc');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
update sie_11_prodt
                       set indic_extra_tout = 'N',
                           ref_group_utils_admin = null,
                           dosr_fichr = '/res/afw/',
                           ident_envir = 'Développement',
                           ref_versn = sie$migrt$pkg.obten_var_versn(521, 'Update'),
                           mesg_tout_droit_resrv = 'GPLv3',
                           jquer_ui_css_scope = 'ui-afw',
                           indic_afich_err_code = 'O',
                           indic_page_inexs_maj_refrn = 'N',
                           fonct_obten_base_url = null,
                           ref_mesg_sucs = sie$migrt$pkg.obten_var_mesg(49221, 'Update'),
                           ref_mesg_echec = sie$migrt$pkg.obten_var_mesg(49222, 'Update'),
                           ref_mesg_fetch = sie$migrt$pkg.obten_var_mesg(49202, 'Update'),
                           ref_mesg_range_suprm = sie$migrt$pkg.obten_var_mesg(49204, 'Update'),
                           ref_mesg_range_modf = sie$migrt$pkg.obten_var_mesg(49534, 'Update'),
                           ref_mesg_range_inser = sie$migrt$pkg.obten_var_mesg(49203, 'Update'),
                           ref_mesg_aucun_don_trouv = sie$migrt$pkg.obten_var_mesg(49535, 'Update'),
                           ref_mesg_trop_don_trouv = sie$migrt$pkg.obten_var_mesg(48991, 'Update'),
                           ref_aplic_acuei = sie$migrt$pkg.obten_var_aplic(189, 'Update'),
                           ref_page_acuei = sie$migrt$pkg.obten_var_page(17210, 'Update'),
                           ref_aplic_comnt_bogue = sie$migrt$pkg.obten_var_aplic(191, 'Update'),
                           ref_page_comnt_bogue = sie$migrt$pkg.obten_var_page(17224, 'Update')
                     where seqnc = sie$migrt$pkg.vnu_seqnc_prodt;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_11_prodt');
end;
/
begin
  if sie$migrt$pkg.vnu_sql_code = 0 then
    commit;
    dbms_output.put_line ('La migration s''est completee correctement.');
  else
    rollback;
    sie_13_condt_piltb_pkg.vbo_en_charg := false;
    dbms_output.put_line ('Une erreur est survenue lors de l''execution du script de migration.');
    dbms_output.put_line ('Bloc   : ' || sie$migrt$pkg.vva_nom_bloc_err);
    dbms_output.put_line ('Code   : ' || sie$migrt$pkg.vnu_sql_code);
    dbms_output.put_line ('Message: ' || sie$migrt$pkg.vva_sql_errm);
    dbms_output.put_line ('Pile   :');
    dbms_output.put_line (sie$migrt$pkg.vva_back_trace);
    sie_03_journ_pkg.ecrir_journ (sie$migrt$pkg.vva_sql_errm);
    sie_03_journ_pkg.ecrir_journ (sie$migrt$pkg.vva_back_trace);
  end if;
end;
/

begin
  if sie$migrt$pkg.vnu_sql_code <> 0 then
    raise_application_error (-20100, sie$migrt$pkg.vva_sql_errm);
  end if;
end;
/

exec sie$migrt$pkg.suprm_table_tempr;

drop package sie$migrt$pkg;

begin 
                    sie_11_migrt_pkg.gva_indic_migrt := 'N'; 
                  end;
                  /
