SET DEFINE OFF;
Prompt Trigger SIE_01_ATRIB_MODL_COMNC_BIU_T;
/* Formatted on 04/12/2013 11:26:35 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_01_ATRIB_MODL_COMNC_BIU_T"
  before insert or update
  on sie_01_atrib_modl_comnc
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_01_atrib_modl_comnc_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);

  if inserting
  or (updating and :old.code != :new.code) then
    :new.code := upper (:new.code);
  end if;
end sie_01_atrib_modl_comnc_biu_t;
/


Prompt Trigger SIE_01_CODE_ERR_ORACL_BIU_TRG;
/* Formatted on 04/12/2013 11:26:35 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_01_CODE_ERR_ORACL_BIU_TRG"
  before insert or update
  on sie_01_code_err_oracl
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_01_code_err_oracl_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_01_code_err_oracl_biu_trg;
/


Prompt Trigger SIE_01_CONFG_EVENM_NOTFB_BIU_T;
/* Formatted on 04/12/2013 11:26:35 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_01_CONFG_EVENM_NOTFB_BIU_T"
  before insert or update
  on sie_01_confg_evenm_notfb
  for each row
declare
  vva_code_type_comnc                     varchar2 (23);
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_01_confg_evenm_notfb_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);

  --Validation à ajouter
  --Si le type de communication est SMS et que ref_compt_twili est null, lever message
  --Si le type de communication est COURL et que ref_profl_courl est null, lever message
  select   code
    into   vva_code_type_comnc
    from   vd_i_sie_01_type_comnc
   where   seqnc = :new.ref_type_comnc;

  if vva_code_type_comnc = 'SMS' and :new.ref_compt_twili is null then
    sie_01_err_apex_pkg.lever_err_apex_code ('EVM.000001',
                                             'SMS',
                                             pva_code_prodt             => 'AFW');
  end if;

  if vva_code_type_comnc = 'COURL' and :new.ref_profl_courl is null then
    sie_01_err_apex_pkg.lever_err_apex_code ('EVM.000001',
                                             'Courriel',
                                             pva_code_prodt             => 'AFW');
  end if;
end sie_01_confg_evenm_notfb_biu_t;
/


Prompt Trigger SIE_01_DESTN_BIU_TRG;
/* Formatted on 04/12/2013 11:26:35 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_01_destn_biu_trg
  before insert or update
  on sie_01_destn
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_01_destn_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_01_destn_biu_trg;
/


Prompt Trigger SIE_01_DESTN_BI_99_TRG;
/* Formatted on 04/12/2013 11:26:35 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_01_destn_bi_99_trg
  before insert
  on sie_01_destn
  for each row
begin
  if :new.dnr_ref_prodt is null then
    :new.dnr_ref_prodt := sie_07_sesn_pkg.gva_prodt_en_cours;
  end if;
end sie_01_destn_bi_99_trg;
/


Prompt Trigger SIE_01_DESTN_CONFG_EN_BIU_T;
/* Formatted on 04/12/2013 11:26:35 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_01_destn_confg_en_biu_t
  before insert or update
  on sie_01_destn_confg_evenm_notfb
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_01_destn_confg_en_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_01_destn_confg_en_biu_t;
/


Prompt Trigger SIE_01_ELEMN_CONFG_EN_BIU_T;
/* Formatted on 04/12/2013 11:26:35 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_01_elemn_confg_en_biu_t
  before insert or update
  on sie_01_elemn_confg_evenm_notfb
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_01_elemn_confg_en_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_01_elemn_confg_en_biu_t;
/


Prompt Trigger SIE_01_EVENM_NOTFB_BIU_TRG;
/* Formatted on 04/12/2013 11:26:35 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_01_EVENM_NOTFB_BIU_TRG"
  before insert or update
  on sie_01_evenm_notfb
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_01_evenm_notfb_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);

  if inserting
  or (updating and :old.code != :new.code) then
    :new.code := upper (:new.code);
  end if;
end sie_01_evenm_notfb_biu_trg;
/


Prompt Trigger SIE_01_EVENM_NOTFB_BI_99_TRG;
/* Formatted on 04/12/2013 11:26:35 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_01_evenm_notfb_bi_99_trg
  before insert
  on sie_01_evenm_notfb
  for each row
begin
  if :new.dnr_ref_prodt is null then
    :new.dnr_ref_prodt := sie_07_sesn_pkg.gva_prodt_en_cours;
  end if;
end sie_01_evenm_notfb_bi_99_trg;
/


Prompt Trigger SIE_01_HIERC_APLIC_BIU_TRG;
/* Formatted on 04/12/2013 11:26:35 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_01_hierc_aplic_biu_trg
  before insert or update
  on sie_01_hierc_aplic
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_01_hierc_aplic_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_01_hierc_aplic_biu_trg;
/


Prompt Trigger SIE_01_HIERC_APLIC_BI_99_TRG;
/* Formatted on 04/12/2013 11:26:35 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_01_hierc_aplic_bi_99_trg
  before insert
  on sie_01_hierc_aplic
  for each row
begin
  if :new.dnr_ref_prodt is null then
    :new.dnr_ref_prodt := sie_07_sesn_pkg.gva_prodt_en_cours;
  end if;
end sie_01_hierc_aplic_bi_99_trg;
/


Prompt Trigger SIE_01_LANG_BIU_TRG;
/* Formatted on 04/12/2013 11:26:35 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_01_LANG_BIU_TRG"
  before insert or update
  on sie_01_lang
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_01_lang_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);

  if inserting
  or (updating and :old.code != :new.code) then
    :new.code := upper (:new.code);
  end if;
end sie_01_lang_biu_trg;
/


Prompt Trigger SIE_01_LANG_LANG_BIU_TRG;
/* Formatted on 04/12/2013 11:26:35 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_01_LANG_LANG_BIU_TRG"
  before insert or update
  on sie_01_lang_lang
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_01_lang_lang_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_01_lang_lang_biu_trg;
/


Prompt Trigger SIE_01_MESG_BIU_TRG;
/* Formatted on 04/12/2013 11:26:35 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_01_MESG_BIU_TRG"
  before insert or update
  on sie_01_mesg
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_01_mesg_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_01_mesg_biu_trg;
/


Prompt Trigger SIE_01_MESG_BI_99_TRG;
/* Formatted on 04/12/2013 11:26:35 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_01_mesg_bi_99_trg
  before insert
  on sie_01_mesg
  for each row
begin
  if :new.dnr_ref_prodt is null then
    :new.dnr_ref_prodt := sie_07_sesn_pkg.gva_prodt_en_cours;
  end if;
end sie_01_mesg_bi_99_trg;
/


Prompt Trigger SIE_01_MESG_ERR_LIE_BIU_TRG;
/* Formatted on 04/12/2013 11:26:35 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_01_MESG_ERR_LIE_BIU_TRG"
  before insert or update
  on sie_01_mesg_err_lie
  for each row
declare
  vnu_code_err                            number (5);
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_01_mesg_err_lie_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);

  begin
    select   err_code
      into   vnu_code_err
      from   vd_i_sie_01_code_err_oracl
     where   seqnc = :new.ref_code_err_oracl;
  exception
    when no_data_found then
      vnu_code_err := null;
  end;

  --  if vnu_code_err in (1, 2291, 2292, 2290)
  --     and (:new.nom_table is null
  --          or :new.nom_coln is null) then
  --    sie_01_err_apex_pkg.lever_err_apex_code ('MES.000011',
  --                                             pva_code_prodt  => 'SAFP');
  --  end if;
  --
  --  if vnu_code_err in (1407, 1438, 1841, 1861, 20507, 12899)
  --     and :new.nom_contr is null then
  --    sie_01_err_apex_pkg.lever_err_apex_code ('MES.000012',
  --                                             pva_code_prodt  => 'SAFP');
  --  end if;

  if (:new.type_liais = 1
  and (:new.ref_prodt is null
    or :new.page is null
    or :new.ref_code_err_oracl is null)
  and (:new.nom_contr is null
    or :new.nom_table is null and :new.nom_coln is null))
  or (:new.type_liais = 2
  and (:new.ref_prodt is null
    or :new.page is null
    or :new.ref_code_err_oracl is null))
  or (:new.type_liais = 3
  and (:new.ref_prodt is null
    or :new.page is null))
  or (:new.type_liais = 4
  and (:new.ref_prodt is null
    or :new.ref_code_err_oracl is null)
  and (:new.nom_contr is null
    or :new.nom_table is null and :new.nom_coln is null))
  or (:new.type_liais = 5
  and (:new.ref_prodt is null
    or :new.ref_code_err_oracl is null))
  or (:new.type_liais = 8
  and (:new.ref_prodt is null
    or :new.page is not null
    or :new.ref_code_err_oracl is not null
    or :new.nom_contr is not null
    or :new.nom_table is not null
    or :new.nom_coln is not null)) then
    sie_01_err_apex_pkg.lever_err_apex_code ('MES.000013',
                                             pva_code_prodt             => 'AFW');
  end if;
end sie_01_mesg_err_lie_biu_trg;
/


Prompt Trigger SIE_01_MESG_ERR_LIE_BI_99_TRG;
/* Formatted on 04/12/2013 11:26:35 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_01_mesg_err_lie_bi_99_trg
  before insert
  on sie_01_mesg_err_lie
  for each row
begin
  if :new.dnr_ref_prodt is null then
    :new.dnr_ref_prodt := sie_07_sesn_pkg.gva_prodt_en_cours;
  end if;
end sie_01_mesg_err_lie_bi_99_trg;
/


Prompt Trigger SIE_01_MESG_INFOR_BI_TRG;
/* Formatted on 04/12/2013 11:26:35 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_01_MESG_INFOR_BI_TRG"
  before insert
  on sie_01_mesg_infor
  for each row
declare
  vva_utils_bidon                         varchar2 (30);
  vda_date_bidon                          date;
begin
  if inserting then
    if :new.seqnc is null then
      :new.seqnc := sie_01_mesg_infor_seq.nextval;
    end if;

    if :new.ref_utils is null then
      :new.sess_id := sie_07_util_pkg.nv ('APP_SESSION');
    end if;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   vva_utils_bidon,
                                   vda_date_bidon);
end sie_01_mesg_infor_bi_trg;
/


Prompt Trigger SIE_01_MESG_LANG_BIU_TRG;
/* Formatted on 04/12/2013 11:26:35 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_01_MESG_LANG_BIU_TRG"
  before insert or update
  on sie_01_mesg_lang
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_01_mesg_lang_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);

  if :new.ref_lang is null then
    sie_01_err_apex_pkg.lever_err_apex_code ('LAN.000029',
                                             pva_code_prodt             => 'SEM');
  end if;
end sie_01_mesg_lang_biu_trg;
/


Prompt Trigger SIE_01_MESG_LANG_BI_99_TRG;
/* Formatted on 04/12/2013 11:26:35 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_01_mesg_lang_bi_99_trg
  before insert
  on sie_01_mesg_lang
  for each row
begin
  if :new.dnr_ref_prodt is null then
    :new.dnr_ref_prodt := sie_07_sesn_pkg.gva_prodt_en_cours;
  end if;
end sie_01_mesg_lang_bi_99_trg;
/


Prompt Trigger SIE_01_MESG_TRADC_AP_BI_99_TRG;
/* Formatted on 04/12/2013 11:26:35 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_01_mesg_tradc_ap_bi_99_trg
  before insert
  on sie_01_mesg_tradc_apex
  for each row
begin
  if :new.dnr_ref_prodt is null then
    :new.dnr_ref_prodt := sie_07_sesn_pkg.gva_prodt_en_cours;
  end if;
end sie_01_mesg_tradc_ap_bi_99_trg;
/


Prompt Trigger SIE_01_MESG_TR_APEX_ASU_TRG;
/* Formatted on 04/12/2013 11:26:35 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_01_mesg_tr_apex_asu_trg
  after update
  on sie_01_mesg_tradc_apex
declare
  vnu_seqnc                               number (10);
begin
  sie_09_pile_pkg.mode_depil ('POUSR_MESG_UPDAT');
  vnu_seqnc := sie_09_pile_pkg.depil_numbr ('POUSR_MESG_UPDAT');

  while vnu_seqnc is not null loop
    if sie_11_migrt_pkg.gva_indic_migrt = 'N' then
      sie_01_mesg_tradc_apex_pkg.pousr_mesg (vnu_seqnc);
    end if;

    vnu_seqnc := sie_09_pile_pkg.depil_numbr ('POUSR_MESG_UPDAT');
  end loop;

  sie_09_pile_pkg.termn_utils_pile ('POUSR_MESG_UPDAT');
exception
  when others then
    sie_09_pile_pkg.vider_pile ();
    raise;
end sie_01_mesg_tr_apex_asu_trg;
/


Prompt Trigger SIE_01_MESG_TR_APEX_AU_TRG;
/* Formatted on 04/12/2013 11:26:35 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_01_mesg_tr_apex_au_trg
  after update
  on sie_01_mesg_tradc_apex
  for each row
declare
begin
  sie_09_pile_pkg.empil_numbr ('POUSR_MESG_UPDAT',
                               :new.seqnc);
exception
  when others then
    sie_09_pile_pkg.vider_pile ();
    raise;
end sie_01_mesg_tr_apex_au_trg;
/


Prompt Trigger SIE_01_MESG_TR_APEX_BSU_TRG;
/* Formatted on 04/12/2013 11:26:35 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_01_mesg_tr_apex_bsu_trg
  before update
  on sie_01_mesg_tradc_apex
declare
begin
  sie_09_pile_pkg.init_pile ('POUSR_MESG_UPDAT');
exception
  when others then
    sie_09_pile_pkg.vider_pile ();
    raise;
end sie_01_mesg_tr_apex_bsu_trg;
/


Prompt Trigger SIE_01_MESG_TR_APX_BIU_01_TRG;
/* Formatted on 04/12/2013 11:26:36 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_01_MESG_TR_APX_BIU_01_TRG"
  before insert or update
  on sie_01_mesg_tradc_apex
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_01_mesg_tradc_apex_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_01_mesg_tr_apx_biu_01_trg;
/


Prompt Trigger SIE_01_MODL_AFICH_NOT_BIU_TRG;
/* Formatted on 04/12/2013 11:26:36 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_01_MODL_AFICH_NOT_BIU_TRG"
  before insert or update
  on sie_01_modl_afich_notfc
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_01_modl_afich_notfc_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);

  if inserting
  or (updating and :old.code != :new.code) then
    :new.code := upper (:new.code);
  end if;
end sie_01_modl_afich_not_biu_trg;
/


Prompt Trigger SIE_01_MODL_COMNC_BIU_TRG;
/* Formatted on 04/12/2013 11:26:36 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_01_MODL_COMNC_BIU_TRG"
  before insert or update
  on sie_01_modl_comnc
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_01_modl_comnc_seq.nextval;
  end if;

  if :new.indic_systm is null then
    :new.indic_systm := 'N';
  end if;

  if inserting and :new.code is null and :new.indic_systm = 'N' then
    :new.code := :new.seqnc;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_01_modl_comnc_biu_trg;
/


Prompt Trigger SIE_01_MODL_MESG_NOTFC_BIU_TRG;
/* Formatted on 04/12/2013 11:26:36 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_01_modl_mesg_notfc_biu_trg
  before insert or update
  on sie_01_modl_mesg_notfc
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_01_modl_mesg_notfc_seq.nextval;
  end if;
end sie_01_modl_mesg_notfc_biu_trg;
/


Prompt Trigger SIE_01_NOTFC_BIU_TRG;
/* Formatted on 04/12/2013 11:26:36 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_01_NOTFC_BIU_TRG"
  before insert or update
  on sie_01_notfc
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_01_notfc_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);

  if inserting
  or (updating and :old.code != :new.code) then
    :new.code := upper (:new.code);
  end if;
end sie_01_notfc_biu_trg;
/


Prompt Trigger SIE_01_OCURN_SA_EN_BIU_TRG;
/* Formatted on 04/12/2013 11:26:36 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_01_ocurn_sa_en_biu_trg
  before insert or update
  on sie_01_ocurn_sa_evenm_notfb
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_01_ocurn_sa_en_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_01_ocurn_sa_en_biu_trg;
/


Prompt Trigger SIE_01_RESLT_DESTN_BIU_TRG;
/* Formatted on 04/12/2013 11:26:36 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_01_RESLT_DESTN_BIU_TRG"
  before insert or update
  on sie_01_reslt_destn
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_01_reslt_destn_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_01_reslt_destn_biu_trg;
/


Prompt Trigger SIE_01_RESLT_DESTN_BI_99_TRG;
/* Formatted on 04/12/2013 11:26:36 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_01_reslt_destn_bi_99_trg
  before insert
  on sie_01_reslt_destn
  for each row
begin
  if :new.dnr_ref_prodt is null then
    :new.dnr_ref_prodt := sie_07_sesn_pkg.gva_prodt_en_cours;
  end if;
end sie_01_reslt_destn_bi_99_trg;
/


Prompt Trigger SIE_01_TYPE_COMNC_BIU_TRG;
/* Formatted on 04/12/2013 11:26:36 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_01_TYPE_COMNC_BIU_TRG"
  before insert or update
  on sie_01_type_comnc
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_01_type_comnc_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);

  if inserting
  or (updating and :old.code != :new.code) then
    :new.code := upper (:new.code);
  end if;
end sie_01_type_comnc_biu_trg;
/


Prompt Trigger SIE_03_CLAS_INTER_BIU_TRG;
/* Formatted on 04/12/2013 11:26:36 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_03_CLAS_INTER_BIU_TRG"
  before insert or update
  on sie_03_clas_inter
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_03_clas_inter_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_03_clas_inter_biu_trg;
/


Prompt Trigger SIE_03_JOURN_S_A_BIU_TRG;
/* Formatted on 04/12/2013 11:26:36 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_03_JOURN_S_A_BIU_TRG"
  before insert
  on sie_03_journ_struc_aplic
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_03_journ_struc_aplic_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end;
/


Prompt Trigger SIE_03_LIEN_CLAS_INT_U_BIU_TRG;
/* Formatted on 04/12/2013 11:26:36 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_03_LIEN_CLAS_INT_U_BIU_TRG"
  before insert or update
  on sie_03_lien_clas_inter_utils
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_03_lien_clas_inter_uti_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_03_lien_clas_int_u_biu_trg;
/


Prompt Trigger SIE_03_TRACE_EXECT_BI;
/* Formatted on 04/12/2013 11:26:36 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_03_TRACE_EXECT_BI"
  before insert
  on sie_03_trace_exect
  for each row
begin
  if inserting then
    :new.seqnc := sie_03_trace_exect_seq.nextval;
  end if;

  :new.page := sie_07_util_pkg.v ('APP_PAGE_ID');
  :new.app := sie_07_util_pkg.v ('APP_ID');
  :new.app_user := sie_07_util_pkg.v ('APP_USER');
end;
/


Prompt Trigger SIE_04_CONTX_BIU_TRG;
/* Formatted on 04/12/2013 11:26:36 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_04_CONTX_BIU_TRG"
  before insert or update
  on sie_04_contx
  for each row
begin
  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);

  --Valider les contextes
  if :new.contx is not null then
    sie_04_contx_pkg.valdr_contx (:new.contx);
  end if;

  if :new.contx_inter is not null then
    sie_04_contx_pkg.valdr_contx (:new.contx_inter);
  end if;

  -- Si une modification est faite post-insertion, on ne veut plus ignorer le contexte
  if updating and :old.indic_ignor = 'O' then
    :new.indic_ignor := 'N';
  end if;
end sie_04_contx_biu_trg;
/


Prompt Trigger SIE_04_CONTX_ETEND_BIU_TRG;
/* Formatted on 04/12/2013 11:26:36 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_04_CONTX_ETEND_BIU_TRG"
  before insert or update
  on sie_04_contx_etend
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_04_contx_etend_seq.nextval;
  end if;

  :new.nom := upper (:new.nom);
  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end;
/


Prompt Trigger SIE_04_FIL_ARIAN_BI_TRG;
/* Formatted on 04/12/2013 11:26:36 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_04_fil_arian_bi_trg
  before insert
  on sie_04_fil_arian
  for each row
declare
  vva_utils_bidon                         varchar2 (30);
  vda_date_bidon                          date;
  vnu_seqnc                               number (10);
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_04_fil_arian_seq.nextval;
  end if;

  if :new.timst is null then
    :new.timst := systimestamp;
  end if;

  begin
    select   seqnc
      into   vnu_seqnc
      from   vd_sie_13_page p
     where   p.ref_aplic = sie_11_aplic_pkg.obten_aplic_sesn and numr_apex = :new.page;

    select   nom
      into   :new.libl
      from   vd_sie_13_page_lang pl
     where   pl.ref_page = vnu_seqnc and pl.ref_lang = sie_01_lang_pkg.obten_lang_sesn ();
  exception
    when others then
      :new.libl := 'Page non definie dans le systeme de pilotage';
  end;

  :new.app_id := sie_07_util_pkg.nv ('APP_ID');
  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   vva_utils_bidon,
                                   vda_date_bidon);
end sie_04_fil_arian_bi_trg;
/


Prompt Trigger SIE_04_NAVGT_HISTR_BI_TRG;
/* Formatted on 04/12/2013 11:26:36 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_04_NAVGT_HISTR_BI_TRG"
  before insert
  on sie_04_navgt_histr
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_04_navgt_histr_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_04_navgt_histr_bi_trg;
/


Prompt Trigger SIE_07_AUDIT_STR_APL_BIU_TRG;
/* Formatted on 04/12/2013 11:26:36 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_07_audit_str_apl_biu_trg
  before insert or update
  on sie_07_audit_struc_aplic
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_07_audit_struc_aplic_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_07_audit_str_apl_biu_trg;
/


Prompt Trigger SIE_07_ETAT_SESN_BIU_TRG;
/* Formatted on 04/12/2013 11:26:36 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_07_ETAT_SESN_BIU_TRG"
  before insert
  on sie_07_etat_sesn
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_07_sesn_seq.nextval;
  end if;

  :new.session_id := sie_07_util_pkg.nv ('SESSION');

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_07_etat_sesn_biu_trg;
/


Prompt Trigger SIE_07_ETAT_SESN_BSIU_TRG;
/* Formatted on 04/12/2013 11:26:36 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_07_ETAT_SESN_BSIU_TRG"
  before insert or update
  on sie_07_etat_sesn
begin
  sie_12_utils_pkg.init ();
end sie_07_etat_sesn_bsiu_trg;
/


Prompt Trigger SIE_07_INSTA_SEMPH_AD_TRG;
/* Formatted on 04/12/2013 11:26:36 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_07_INSTA_SEMPH_AD_TRG"
  after delete
  on sie_07_insta_semph
  for each row
declare
begin
  sie_09_pile_pkg.empil_numbr ('SEMPH',
                               :old.ref_semph);
exception
  when others then
    sie_09_pile_pkg.vider_pile ();
    raise;
end;
/


Prompt Trigger SIE_07_INSTA_SEMPH_ASD_TRG;
/* Formatted on 04/12/2013 11:26:36 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_07_INSTA_SEMPH_ASD_TRG"
  after delete
  on sie_07_insta_semph
declare
  enfan_trouv                             exception;
  pragma exception_init (enfan_trouv, -2292);

  vnu_seqnc                               number;
begin
  sie_09_pile_pkg.mode_depil ('SEMPH');
  vnu_seqnc := sie_09_pile_pkg.depil_numbr ('SEMPH');

  while vnu_seqnc is not null loop
    begin
      delete   sie_07_semph s
       where   s.seqnc = vnu_seqnc;
    exception
      when enfan_trouv then
        null;
    end;

    vnu_seqnc := sie_09_pile_pkg.depil_numbr ('SEMPH');
  end loop;

  sie_09_pile_pkg.termn_utils_pile ('SEMPH');
exception
  when others then
    sie_09_pile_pkg.vider_pile ();
    raise;
end;
/


Prompt Trigger SIE_07_INSTA_SEMPH_BI_TRG;
/* Formatted on 04/12/2013 11:26:36 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_07_INSTA_SEMPH_BI_TRG"
  before insert
  on sie_07_insta_semph
  for each row
declare
  vda_date                                date;
  vva_varch                               varchar2 (30);
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_07_insta_semph_seq.nextval;
  end if;

  :new.id_sesn := sie_07_util_pkg.nv ('APP_SESSION');

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   vva_varch,
                                   vda_date);
end;
/


Prompt Trigger SIE_07_INSTA_SEMPH_BSD_TRG;
/* Formatted on 04/12/2013 11:26:36 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_07_INSTA_SEMPH_BSD_TRG"
  before delete
  on sie_07_insta_semph
declare
begin
  sie_09_pile_pkg.init_pile ('SEMPH');
exception
  when others then
    sie_09_pile_pkg.vider_pile ();
    raise;
end;
/


Prompt Trigger SIE_07_SEMPH_BI_TRG;
/* Formatted on 04/12/2013 11:26:36 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_07_SEMPH_BI_TRG"
  before insert
  on sie_07_semph
  for each row
declare
  vda_date                                date;
  vva_varch                               varchar2 (30);
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_07_semph_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   vva_varch,
                                   vda_date);

  if inserting
  or (updating and :old.code != :new.code) then
    :new.code := upper (:new.code);
  end if;
end sie_07_semph_bi_trg;
/


Prompt Trigger SIE_07_VALR_AUDIT_SA_BIU_TRG;
/* Formatted on 04/12/2013 11:26:36 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_07_valr_audit_sa_biu_trg
  before insert or update
  on sie_07_valr_audit_struc_aplic
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_07_valr_audit_sa_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_07_valr_audit_sa_biu_trg;
/


Prompt Trigger SIE_11_APLIC_BIU_TRG;
/* Formatted on 04/12/2013 11:26:36 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_11_APLIC_BIU_TRG"
  before insert or update
  on sie_11_aplic
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_11_aplic_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);

  if inserting
  or (updating and :old.code != :new.code) then
    :new.code := upper (:new.code);
  end if;
end sie_11_aplic_biu_trg;
/


Prompt Trigger SIE_11_APLIC_BI_99_TRG;
/* Formatted on 04/12/2013 11:26:36 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_11_aplic_bi_99_trg
  before insert
  on sie_11_aplic
  for each row
begin
  if :new.dnr_ref_prodt is null then
    :new.dnr_ref_prodt := sie_07_sesn_pkg.gva_prodt_en_cours;
  end if;
end sie_11_aplic_bi_99_trg;
/


Prompt Trigger SIE_11_ATRIB_ENTIT_BIU_TRG;
/* Formatted on 04/12/2013 11:26:36 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_11_ATRIB_ENTIT_BIU_TRG"
  before insert or update
  on sie_11_atrib_entit
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_11_atrib_entit_seq.nextval;
  end if;

  if inserting and :new.code is null then
    :new.code := :new.nom;
  end if;

  if updating and :new.indic_nouvl_atrib = 'O' then
    :new.indic_nouvl_atrib := 'N';
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_11_atrib_entit_biu_trg;
/


Prompt Trigger SIE_11_ATRIB_ENTIT_BI_99_TRG;
/* Formatted on 04/12/2013 11:26:36 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_11_atrib_entit_bi_99_trg
  before insert
  on sie_11_atrib_entit
  for each row
begin
  if :new.dnr_ref_prodt is null then
    :new.dnr_ref_prodt := sie_07_sesn_pkg.gva_prodt_en_cours;
  end if;
end sie_11_atrib_entit_bi_99_trg;
/


Prompt Trigger SIE_11_ENTIT_BIU_TRG;
/* Formatted on 04/12/2013 11:26:36 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_11_ENTIT_BIU_TRG"
  before insert or update
  on sie_11_entit
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_11_entit_seq.nextval;
  end if;

  if inserting and :new.ordre_exect is null then
    :new.ordre_exect := 1;
  end if;

  if inserting and :new.code is null then
    :new.code := :new.nom;
  end if;

  if updating and :new.indic_nouvl_entit = 'O' then
    :new.indic_nouvl_entit := 'N';
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_11_entit_biu_trg;
/


Prompt Trigger SIE_11_ENTIT_BI_99_TRG;
/* Formatted on 04/12/2013 11:26:36 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_11_entit_bi_99_trg
  before insert
  on sie_11_entit
  for each row
begin
  if :new.dnr_ref_prodt is null then
    :new.dnr_ref_prodt := sie_07_sesn_pkg.gva_prodt_en_cours;
  end if;
end sie_11_entit_bi_99_trg;
/


Prompt Trigger SIE_11_PARMT_AFW_BIU_01_TRG;
/* Formatted on 04/12/2013 11:26:36 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_11_PARMT_AFW_BIU_01_TRG"
  before insert or update
  on sie_11_parmt_afw
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_11_parmt_afw_seqnc.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_11_parmt_afw_biu_01_trg;
/


Prompt Trigger SIE_11_PLUGN_BIU_TRG;
/* Formatted on 04/12/2013 11:26:36 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_11_PLUGN_BIU_TRG"
  before insert or update
  on sie_11_plugn
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_11_plugn_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);

  if inserting
  or (updating and :old.code_inter != :new.code_inter) then
    :new.code_inter := upper (:new.code_inter);
  end if;
end sie_11_plugn_biu_trg;
/


Prompt Trigger SIE_11_PRODT_AI_TRG;
/* Formatted on 04/12/2013 11:26:36 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_11_prodt_ai_trg
  after insert
  on sie_11_prodt
  for each row
declare
begin
  sie_09_pile_pkg.empil_numbr ('MESG_PRODT',
                               :new.seqnc);
exception
  when others then
    sie_09_pile_pkg.vider_pile ();
    raise;
end sie_11_prodt_ai_trg;
/


Prompt Trigger SIE_11_PRODT_ASI_TRG;
/* Formatted on 04/12/2013 11:26:36 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_11_prodt_asi_trg
  after insert
  on sie_11_prodt
declare
  vnu_seqnc                               number (10);
begin
  sie_09_pile_pkg.mode_depil ('MESG_PRODT');
  vnu_seqnc := sie_09_pile_pkg.depil_numbr ('MESG_PRODT');

  while vnu_seqnc is not null loop
    if sie_11_migrt_pkg.gva_indic_migrt = 'N' then
      sie_11_prodt_pkg.creer_mesg_base_prodt (vnu_seqnc);
    end if;

    vnu_seqnc := sie_09_pile_pkg.depil_numbr ('MESG_PRODT');
  end loop;

  sie_09_pile_pkg.termn_utils_pile ('MESG_PRODT');
exception
  when others then
    sie_09_pile_pkg.vider_pile ();
    raise;
end sie_11_prodt_asi_trg;
/


Prompt Trigger SIE_11_PRODT_BIU_TRG;
/* Formatted on 04/12/2013 11:26:36 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_11_PRODT_BIU_TRG"
  before insert or update
  on sie_11_prodt
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_11_prodt_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);

  if inserting
  or (updating and :old.code != :new.code) then
    :new.code := upper (:new.code);
  end if;
end sie_11_prodt_biu_trg;
/


Prompt Trigger SIE_11_PRODT_BSI_TRG;
/* Formatted on 04/12/2013 11:26:36 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_11_prodt_bsi_trg
  before insert
  on sie_11_prodt
declare
begin
  sie_09_pile_pkg.init_pile ('MESG_PRODT');
exception
  when others then
    sie_09_pile_pkg.vider_pile ();
    raise;
end sie_11_prodt_bsi_trg;
/


Prompt Trigger SIE_11_PRODT_LANG_BIU_TRG;
/* Formatted on 04/12/2013 11:26:36 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_11_PRODT_LANG_BIU_TRG"
  before insert or update
  on sie_11_prodt_lang
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_11_prodt_lang_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_11_prodt_lang_biu_trg;
/


Prompt Trigger SIE_11_PRODT_RESRC_BIU_TRG;
/* Formatted on 04/12/2013 11:26:36 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_11_PRODT_RESRC_BIU_TRG"
  before insert or update
  on sie_11_prodt_resrc
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_11_prodt_resrc_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_11_prodt_resrc_biu_trg;
/


Prompt Trigger SIE_11_UTILS_BIU_TRG;
/* Formatted on 04/12/2013 11:26:36 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_11_UTILS_BIU_TRG"
  before insert or update
  on sie_11_utils
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_11_utils_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_11_utils_biu_trg;
/


Prompt Trigger SIE_11_VERSN_BIU_TRG;
/* Formatted on 04/12/2013 11:26:36 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_11_VERSN_BIU_TRG"
  before insert or update
  on sie_11_versn
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_11_versn_seq.nextval;
  end if;

  if inserting and :new.code is null then
    :new.code := :new.numr_versn_1 || :new.numr_versn_2 || :new.numr_versn_3 || :new.numr_versn_4;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_11_versn_biu_trg;
/


Prompt Trigger SIE_11_VERSN_BI_98_TRG;
/* Formatted on 04/12/2013 11:26:36 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_11_versn_bi_98_trg
  before insert
  on sie_11_versn
  for each row
begin
  if :new.dnr_ref_aplic is null and :new.ref_aplic is not null then
    :new.dnr_ref_aplic := sie_07_sesn_pkg.gva_aplic_en_cours;
  end if;
end sie_11_versn_bi_98_trg;
/


Prompt Trigger SIE_11_VERSN_BI_99_TRG;
/* Formatted on 04/12/2013 11:26:36 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_11_versn_bi_99_trg
  before insert
  on sie_11_versn
  for each row
begin
  if :new.dnr_ref_prodt is null and :new.ref_prodt is not null then
    :new.dnr_ref_prodt := sie_07_sesn_pkg.gva_prodt_en_cours;
  end if;
end sie_11_versn_bi_99_trg;
/


Prompt Trigger SIE_12_ACTIO_AUDIT_BIU_TRG;
/* Formatted on 04/12/2013 11:26:36 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_12_actio_audit_biu_trg
  before insert or update
  on sie_12_actio_audit
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_12_actio_audit_seq.nextval;
  end if;

  :new.code := upper (:new.code);

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_12_actio_audit_biu_trg;
/


Prompt Trigger SIE_12_ACTIO_AUDIT_BI_99_TRG;
/* Formatted on 04/12/2013 11:26:36 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_12_actio_audit_bi_99_trg
  before insert
  on sie_12_actio_audit
  for each row
begin
  if :new.dnr_ref_prodt is null then
    :new.dnr_ref_prodt := sie_07_sesn_pkg.gva_prodt_en_cours;
  end if;
end sie_12_actio_audit_bi_99_trg;
/


Prompt Trigger SIE_12_ARBRE_BIU_TRG;
/* Formatted on 04/12/2013 11:26:36 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_12_ARBRE_BIU_TRG"
  before insert or update
  on sie_12_arbre
  for each row
declare
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_12_arbre_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_12_arbre_biu_trg;
/


Prompt Trigger SIE_12_ARBRE_NOEUD_BIU_TRG;
/* Formatted on 04/12/2013 11:26:36 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_12_ARBRE_NOEUD_BIU_TRG"
  before insert or update
  on sie_12_arbre_noeud
  for each row
declare
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_12_arbre_noeud_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_12_arbre_noeud_biu_trg;
/


Prompt Trigger SIE_12_ATRIB_STRUC_A_BI_99_TRG;
/* Formatted on 04/12/2013 11:26:36 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_12_atrib_struc_a_bi_99_trg
  before insert
  on sie_12_atrib_struc_aplic
  for each row
begin
  if :new.dnr_ref_prodt is null then
    :new.dnr_ref_prodt := sie_07_sesn_pkg.gva_prodt_en_cours;
  end if;
end sie_12_atrib_struc_a_bi_99_trg;
/


Prompt Trigger SIE_12_ATRI_STRU_APLI_ASU_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_12_atri_stru_apli_asu_trg
  after update
  on sie_12_atrib_struc_aplic
declare
  vnu_seqnc                               number;
  vnu_natr_infor                          number;
  vnu_ref_parnt                           number;
  vva_nom_coln                            varchar2 (50);

  cursor cur_atrib_parnt is
    select   distinct ref_atrib_struc_aplic
      from   vd_i_sie_12_atrib_struc_aplic
     where   ref_atrib_struc_aplic is not null;
begin
  sie_09_pile_pkg.init_pile ('ATRIB_PARNT');

  for rec_atrib_parnt in cur_atrib_parnt loop
    sie_09_pile_pkg.empil_numbr ('ATRIB_PARNT',
                                 rec_atrib_parnt.ref_atrib_struc_aplic);
  end loop;

  sie_09_pile_pkg.mode_depil ('ATRIB_STRUC_APLIC');
  sie_09_pile_pkg.mode_depil ('ATRIB_PARNT');

  vnu_ref_parnt := sie_09_pile_pkg.depil_numbr ('ATRIB_PARNT');

  while vnu_ref_parnt is not null loop
    select   ref_dv_natr_infor,
             nom_coln
      into   vnu_natr_infor,
             vva_nom_coln
      from   vd_i_sie_12_atrib_struc_aplic
     where   seqnc = vnu_ref_parnt;

    if (vnu_natr_infor != sie_14_domn_valr_pkg.obten_seqnc ('NATR_INFOR_STRUC_APLIC',
                                                            'CLE_PRIMR',
                                                            'AFW')
     or vnu_natr_infor is null) then
      sie_01_err_apex_pkg.ajout_mesg_infor_sesn_code ('STR.000002',
                                                      pva_code_prodt             => 'AFW',
                                                      pva_valr_subst1            => vva_nom_coln);

      update   vd_i_sie_12_atrib_struc_aplic
         set   ref_dv_natr_infor =
                 sie_14_domn_valr_pkg.obten_seqnc ('NATR_INFOR_STRUC_APLIC',
                                                   'CLE_PRIMR',
                                                   'AFW')
       where   seqnc = vnu_ref_parnt;
    end if;

    vnu_ref_parnt := sie_09_pile_pkg.depil_numbr ('ATRIB_PARNT');
  end loop;

  /*vnu_seqnc := sie_09_pile_pkg.depil_numbr ('ATRIB_STRUC_APLIC');

  while vnu_seqnc is not null loop
    --traitement ici

  select natr_infor into vnu_natr_infor from sie_12_atrib_struc_aplic where seqnc = vnu_seqnc;

  if (vnu_natr_infor != sie_14_domn_valr_pkg.obten_seqnc (
                'NATR_INFOR_STRUC_APLIC',
                'CLE_PRIMR',
                sie_11_prodt_pkg.obten_code_prodt (
                   sie_07_util_pkg.v ('A_SAFP_PRODT'))) or vnu_natr_infor is null) then
UPDATE sie_12_atrib_struc_aplic
         SET ref_atrib_struc_aplic = NULL
       WHERE ref_atrib_struc_aplic = vnu_seqnc;
 end if;
    vnu_seqnc := sie_09_pile_pkg.depil_numbr ('ATRIB_STRUC_APLIC');
  end loop;*/

  sie_09_pile_pkg.termn_utils_pile ('ATRIB_STRUC_APLIC');
  sie_09_pile_pkg.termn_utils_pile ('ATRIB_PARNT');
exception
  when others then
    sie_09_pile_pkg.vider_pile ();
    raise;
end sie_12_atri_stru_apli_asu_trg;
/


Prompt Trigger SIE_12_ATRI_STRU_APLI_AU_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_12_atri_stru_apli_au_trg
  after update
  on sie_12_atrib_struc_aplic
  for each row
declare
begin
  --sie_09_pile_pkg.empil_numbr ('ATRIB_STRUC_APLIC', :new.seqnc);
  null;
exception
  when others then
    sie_09_pile_pkg.vider_pile ();
    raise;
end sie_12_atri_stru_apli_au_trg;
/


Prompt Trigger SIE_12_ATRI_STRU_APLI_BIU_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_12_atri_stru_apli_biu_trg
  before insert or update
  on sie_12_atrib_struc_aplic
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_12_atrib_struc_aplic_seq.nextval;
  end if;

  if :new.ref_dv_natr_infor != sie_14_domn_valr_pkg.obten_seqnc ('NATR_INFOR_STRUC_APLIC',
                                                                 'CLE_PRIMR',
                                                                 'AFW') then
    :new.indic_destn := 'N';
  end if;

  if :new.ref_dv_natr_infor is null then
    :new.ref_atrib_struc_aplic := null;
    :new.indic_destn := 'N';
  end if;


  --Gérer les destinataires
  if updating and :new.indic_destn = 'O' and :old.indic_destn = 'N' and sie_11_migrt_pkg.gva_indic_migrt = 'N' then
    insert into   vd_i_sie_01_destn (ref_atrib_struc_aplic, dnr_ref_prodt)
         values   (:new.seqnc,
                   :new.dnr_ref_prodt);
  elsif updating and :new.indic_destn = 'N' and :old.indic_destn = 'O' and sie_11_migrt_pkg.gva_indic_migrt = 'N' then
    delete from   vd_i_sie_01_destn
          where   ref_atrib_struc_aplic = :new.seqnc;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_12_atri_stru_apli_biu_trg;
/


Prompt Trigger SIE_12_ATRI_STRU_APLI_BSU_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_12_atri_stru_apli_bsu_trg
  before update
  on sie_12_atrib_struc_aplic
declare
begin
  --sie_09_pile_pkg.init_pile ('ATRIB_STRUC_APLIC');
  null;
exception
  when others then
    sie_09_pile_pkg.vider_pile ();
    raise;
end sie_12_atri_stru_apli_bsu_trg;
/


Prompt Trigger SIE_12_DEFNT_ACCES_BIU_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_12_DEFNT_ACCES_BIU_TRG"
  before insert or update
  on sie_12_defnt_acces
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_12_defnt_acces_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_12_defnt_acces_biu_trg;
/


Prompt Trigger SIE_12_DEFNT_ACCES_BI_99_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_12_defnt_acces_bi_99_trg
  before insert
  on sie_12_defnt_acces
  for each row
begin
  if :new.dnr_ref_prodt is null then
    :new.dnr_ref_prodt := sie_07_sesn_pkg.gva_prodt_en_cours;
  end if;
end sie_12_defnt_acces_bi_99_trg;
/


Prompt Trigger SIE_12_DOMN_AI_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_12_domn_ai_trg
  after insert
  on sie_12_domn
  for each row
begin
  sie_12_domn_pkg.alimn_type_travl (:new.seqnc);

  sie_09_pile_pkg.empil_numbr ('DOMN_TYPE_TRAVL',
                               :new.seqnc);
end sie_12_domn_ai_trg;
/


Prompt Trigger SIE_12_DOMN_ASI_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_12_domn_asi_trg
  after insert
  on sie_12_domn
declare
  vnu_seqnc                               number (10);
begin
  sie_09_pile_pkg.mode_depil ('DOMN_TYPE_TRAVL');
  vnu_seqnc := sie_09_pile_pkg.depil_numbr ('DOMN_TYPE_TRAVL');

  while vnu_seqnc is not null loop
    update   sie_12_domn
       set   type_travl_deft =
               (select   seqnc
                  from   vd_sie_25_type_travl
                 where   code = 'FILE_ATENT' and ref_domn = vnu_seqnc)
     where   seqnc = vnu_seqnc;

    --Ajouter AFW_ADMIN au domaine
    sie_12_group_utils_pkg.ajout_utils_super_utils (sie_12_utils_pkg.obten_utils_de_code ('AFW_ADMIN'),
                                                    pnu_domn                   => vnu_seqnc);

    vnu_seqnc := sie_09_pile_pkg.depil_numbr ('DOMN_TYPE_TRAVL');
  end loop;

  sie_09_pile_pkg.termn_utils_pile ('DOMN_TYPE_TRAVL');
exception
  when others then
    sie_09_pile_pkg.vider_pile ();
    raise;
end sie_12_domn_asi_trg;
/


Prompt Trigger SIE_12_DOMN_BIU_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_12_DOMN_BIU_TRG"
  before insert or update
  on sie_12_domn
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_12_domn_seq.nextval;
  end if;

  :new.code := upper (:new.code);
  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_12_domn_biu_trg;
/


Prompt Trigger SIE_12_DOMN_BSI_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_12_domn_bsi_trg
  before insert
  on sie_12_domn
declare
begin
  sie_09_pile_pkg.init_pile ('DOMN_TYPE_TRAVL');
exception
  when others then
    sie_09_pile_pkg.vider_pile ();
    raise;
end sie_12_domn_bsi_trg;
/


Prompt Trigger SIE_12_DOMN_FONCT_BIU_01_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_12_DOMN_FONCT_BIU_01_TRG"
  before insert or update
  on sie_12_domn_fonct
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_12_domn_fonct_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_12_domn_fonct_biu_01_trg;
/


Prompt Trigger SIE_12_DOMN_SERVR_LDAP_BIU_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_12_domn_servr_ldap_biu_trg
  before insert or update
  on sie_12_domn_servr_ldap
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_12_domn_servr_ldap_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_12_domn_servr_ldap_biu_trg;
/


Prompt Trigger SIE_12_DOMN_UTILS_AIU_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_12_DOMN_UTILS_AIU_TRG"
  after insert or update
  on sie_12_domn_utils
  for each row
begin
  sie_09_pile_pkg.empil_numbr ('DOMN_UTILS',
                               :new.seqnc);
exception
  when others then
    sie_09_pile_pkg.vider_pile ();
    raise;
end sie_12_domn_utils_aiu_trg;
/


Prompt Trigger SIE_12_DOMN_UTILS_ASIU_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_12_domn_utils_asiu_trg
  after insert or update
  on sie_12_domn_utils
declare
  vnu_seqnc                               number;
  vda_date_debut                          date;
  vda_date_fin                            date;
  vnu_ref_domn                            number;
  vnu_ref_utils                           number;
  vnu_count                               number;
begin
  sie_09_pile_pkg.mode_depil ('DOMN_UTILS');
  vnu_seqnc := sie_09_pile_pkg.depil_numbr ('DOMN_UTILS');

  while vnu_seqnc is not null loop
    begin
      select   date_debut_efect,
               date_fin_efect,
               ref_domn,
               ref_utils
        into   vda_date_debut,
               vda_date_fin,
               vnu_ref_domn,
               vnu_ref_utils
        from   sie_12_domn_utils
       where   seqnc = vnu_seqnc;

      sie_12_domn_pkg.valdr_chevc_date_domn_utils (vnu_seqnc,
                                                   vnu_ref_domn,
                                                   vnu_ref_utils,
                                                   vda_date_debut,
                                                   vda_date_fin);
    end;

    vnu_seqnc := sie_09_pile_pkg.depil_numbr ('DOMN_UTILS');
  end loop;

  sie_09_pile_pkg.termn_utils_pile ('DOMN_UTILS');
exception
  when others then
    sie_09_pile_pkg.vider_pile ();
    raise;
end;
/


Prompt Trigger SIE_12_DOMN_UTILS_BIU_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_12_DOMN_UTILS_BIU_TRG"
  before insert or update
  on sie_12_domn_utils
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_12_domn_utils_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_12_domn_utils_biu_trg;
/


Prompt Trigger SIE_12_DOMN_UTILS_BSIU_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_12_domn_utils_bsiu_trg
  before insert or update
  on sie_12_domn_utils
declare
begin
  sie_09_pile_pkg.init_pile ('DOMN_UTILS');
exception
  when others then
    sie_09_pile_pkg.vider_pile ();
    raise;
end sie_12_domn_utils_bsiu_trg;
/


Prompt Trigger SIE_12_EVOLT_STAT_BIU_01_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_12_EVOLT_STAT_BIU_01_TRG"
  before insert or update
  on sie_12_evolt_stat
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_12_evolt_stat_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_12_evolt_stat_biu_01_trg;
/


Prompt Trigger SIE_12_EVOLT_STAT_BI_99_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_12_evolt_stat_bi_99_trg
  before insert
  on sie_12_evolt_stat
  for each row
begin
  if :new.dnr_ref_prodt is null then
    :new.dnr_ref_prodt := sie_07_sesn_pkg.gva_prodt_en_cours;
  end if;
end sie_12_evolt_stat_bi_99_trg;
/


Prompt Trigger SIE_12_FAVR_BIUD_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_12_FAVR_BIUD_TRG"
  before insert or update or delete
  on sie_12_favr
  for each row
declare
  vnu_utils                               number (10);
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_12_favr_seq.nextval;
  end if;

  if inserting
  or updating then
    sie_07_util_pkg.genr_valr_audit (inserting,
                                     updating,
                                     :new.utils_creat,
                                     :new.date_creat,
                                     :new.utils_modfc,
                                     :new.date_modfc);
  end if;

  if inserting
  or updating then
    vnu_utils := :new.ref_utils;
  elsif deleting then
    vnu_utils := :new.ref_utils;
  end if;

  --Invalider l'arbre
  sie_21_plugn_arbre_pkg.forcr_rafrc ('P0_FAVRS',
                                      0,
                                      vnu_utils);
end sie_12_favr_biud_trg;
/


Prompt Trigger SIE_12_FONCT_BIU_01_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_12_FONCT_BIU_01_TRG"
  before insert or update
  on sie_12_fonct
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_12_fonct_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_12_fonct_biu_01_trg;
/


Prompt Trigger SIE_12_FONCT_BI_99_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_12_FONCT_BI_99_TRG"
  before insert
  on sie_12_fonct
  for each row
begin
  if :new.dnr_ref_prodt is null then
    :new.dnr_ref_prodt := sie_07_sesn_pkg.gva_prodt_en_cours;
  end if;
end sie_12_fonct_bi_99_trg;
/


Prompt Trigger SIE_12_FONCT_STR_AP_BI_99_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_12_FONCT_STR_AP_BI_99_TRG"
  before insert
  on sie_12_fonct_struc_aplic
  for each row
begin
  if :new.dnr_ref_prodt is null then
    :new.dnr_ref_prodt := sie_07_sesn_pkg.gva_prodt_en_cours;
  end if;
end sie_12_fonct_str_ap_bi_99_trg;
/


Prompt Trigger SIE_12_FONC_STR_AP_BIU_01_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_12_FONC_STR_AP_BIU_01_TRG"
  before insert or update
  on sie_12_fonct_struc_aplic
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_12_fonct_struc_aplic_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_12_fonc_str_ap_biu_01_trg;
/


Prompt Trigger SIE_12_GROUP_STAT_BIU_01_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_12_GROUP_STAT_BIU_01_TRG"
  before insert or update
  on sie_12_group_stat
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_12_group_stat_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);

  if inserting
  or (updating and :old.code != :new.code) then
    :new.code := upper (:new.code);
  end if;
end sie_12_group_stat_biu_01_trg;
/


Prompt Trigger SIE_12_GROUP_STAT_BI_99_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_12_group_stat_bi_99_trg
  before insert
  on sie_12_group_stat
  for each row
begin
  if :new.dnr_ref_prodt is null then
    :new.dnr_ref_prodt := sie_07_sesn_pkg.gva_prodt_en_cours;
  end if;
end sie_12_group_stat_bi_99_trg;
/


Prompt Trigger SIE_12_GROUP_UTILS_BIU_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_12_GROUP_UTILS_BIU_TRG"
  before insert or update
  on sie_12_group_utils
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_12_group_utils_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);

  if inserting
  or (updating and :old.code != :new.code) then
    :new.code := upper (:new.code);
  end if;
end sie_12_group_utils_biu_trg;
/


Prompt Trigger SIE_12_GROUP_UTILS_BI_99_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_12_group_utils_bi_99_trg
  before insert
  on sie_12_group_utils
  for each row
begin
  if :new.dnr_ref_prodt is null then
    :new.dnr_ref_prodt := sie_07_sesn_pkg.gva_prodt_en_cours;
  end if;
end sie_12_group_utils_bi_99_trg;
/


Prompt Trigger SIE_12_G_U_OPR_O_D_BIU_01_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_12_G_U_OPR_O_D_BIU_01_TRG"
  before insert or update
  on sie_12_gr_ut_opert_optio_domn
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_12_gr_ut_opert_opt_d_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_12_g_u_opr_o_d_biu_01_trg;
/


Prompt Trigger SIE_12_HISTR_ACCES_BIU_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_12_HISTR_ACCES_BIU_TRG"
  before insert or update
  on sie_12_histr_acces
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_12_histr_acces_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);

  if inserting then
    :new.date_evenm := sysdate;
  end if;

  :new.adres_ip := sie_07_util_pkg.obten_ip ();
end sie_12_histr_acces_biu_trg;
/


Prompt Trigger SIE_12_LIEN_GROUP_UTIL_BIU_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_12_LIEN_GROUP_UTIL_BIU_TRG"
  before insert or update
  on sie_12_lien_group_utils
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_12_lien_group_utils_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_12_lien_group_util_biu_trg;
/


Prompt Trigger SIE_12_LIEN_GROUP_UT_BI_99_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_12_lien_group_ut_bi_99_trg
  before insert
  on sie_12_lien_group_utils
  for each row
begin
  if :new.dnr_ref_prodt is null then
    :new.dnr_ref_prodt := sie_07_sesn_pkg.gva_prodt_en_cours;
  end if;
end sie_12_lien_group_ut_bi_99_trg;
/


Prompt Trigger SIE_12_LIEN_STRUC_BIU_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_12_LIEN_STRUC_BIU_TRG"
  before insert or update
  on sie_12_lien_struc
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_12_lien_struc_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_12_lien_struc_biu_trg;
/


Prompt Trigger SIE_12_MEMBR_STRUC_BIU_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_12_MEMBR_STRUC_BIU_TRG"
  before insert or update
  on sie_12_membr_struc
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_12_membr_struc_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_12_membr_struc_biu_trg;
/


Prompt Trigger SIE_12_REQT_INTER_UTIL_BIU_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_12_reqt_inter_util_biu_trg
  before insert or update
  on sie_12_reqt_inter_utils
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_12_reqt_inter_utils_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_12_reqt_inter_util_biu_trg;
/


Prompt Trigger SIE_12_SERVR_LDAP_BIU_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_12_servr_ldap_biu_trg
  before insert or update
  on sie_12_servr_ldap
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_12_servr_ldap_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_12_servr_ldap_biu_trg;
/


Prompt Trigger SIE_12_SESN_BI_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_12_SESN_BI_TRG"
  before insert
  on sie_12_sesn
  for each row
begin
  if inserting then
    if :new.id_sesn is null then
      :new.id_sesn := sie_07_util_pkg.nv ('SESSION');
    end if;

    if :new.app_user is null then
      :new.app_user := sie_07_util_pkg.v ('APP_USER');
    end if;
  end if;
end;
/


Prompt Trigger SIE_12_STAT_BIU_01_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_12_STAT_BIU_01_TRG"
  before insert or update
  on sie_12_stat
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_12_stat_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);

  if inserting
  or (updating and :old.code != :new.code) then
    :new.code := upper (:new.code);
  end if;

  if inserting and :new.ordre is null then
    :new.ordre := :new.seqnc;
  end if;
end sie_12_stat_biu_01_trg;
/


Prompt Trigger SIE_12_STAT_BI_99_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_12_stat_bi_99_trg
  before insert
  on sie_12_stat
  for each row
begin
  if :new.dnr_ref_prodt is null then
    :new.dnr_ref_prodt := sie_07_sesn_pkg.gva_prodt_en_cours;
  end if;
end sie_12_stat_bi_99_trg;
/


Prompt Trigger SIE_12_STRUC_APLIC_BIU_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_12_STRUC_APLIC_BIU_TRG"
  before insert or update
  on sie_12_struc_aplic
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_12_struc_aplic_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);

  if inserting
  or (updating and :old.code != :new.code) then
    :new.code := upper (:new.code);
  end if;
end sie_12_struc_aplic_biu_trg;
/


Prompt Trigger SIE_12_STRUC_APLIC_BI_99_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_12_struc_aplic_bi_99_trg
  before insert
  on sie_12_struc_aplic
  for each row
begin
  if :new.dnr_ref_prodt is null then
    :new.dnr_ref_prodt := sie_07_sesn_pkg.gva_prodt_en_cours;
  end if;
end sie_12_struc_aplic_bi_99_trg;
/


Prompt Trigger SIE_12_STRUC_APLIC_DESTN_BIU_T;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_12_STRUC_APLIC_DESTN_BIU_T"
  before insert or update
  on sie_12_struc_aplic_destn
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_12_struc_aplic_destn_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_12_struc_aplic_destn_biu_t;
/


Prompt Trigger SIE_12_STRUC_APLIC_LAN_BIU_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_12_STRUC_APLIC_LAN_BIU_TRG"
  before insert or update
  on sie_12_struc_aplic_lang
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_12_struc_aplic_lang_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_12_struc_aplic_lan_biu_trg;
/


Prompt Trigger SIE_12_STRUC_APLIC_L_BI_99_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_12_struc_aplic_l_bi_99_trg
  before insert
  on sie_12_struc_aplic_lang
  for each row
begin
  if :new.dnr_ref_prodt is null then
    :new.dnr_ref_prodt := sie_07_sesn_pkg.gva_prodt_en_cours;
  end if;
end sie_12_struc_aplic_l_bi_99_trg;
/


Prompt Trigger SIE_12_STRUC_BIU_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_12_STRUC_BIU_TRG"
  before insert or update
  on sie_12_struc_admin
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_12_struc_admin_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_12_struc_biu_trg;
/


Prompt Trigger SIE_12_TYPE_STRUC_BIU_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_12_TYPE_STRUC_BIU_TRG"
  before insert or update
  on sie_12_type_struc
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_12_type_struc_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);

  if inserting
  or (updating and :old.code != :new.code) then
    :new.code := upper (:new.code);
  end if;
end sie_12_type_struc_biu_trg;
/


Prompt Trigger SIE_12_UTILS_BIUD_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_12_utils_biud_trg
  before insert or update or delete
  on sie_12_utils
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_12_utils_seq.nextval;
  end if;

  if inserting
  or updating then
    :new.code_utils := upper (:new.code_utils);
    :new.courl := lower (:new.courl);

    sie_07_util_pkg.genr_valr_audit (inserting,
                                     updating,
                                     :new.utils_creat,
                                     :new.date_creat,
                                     :new.utils_modfc,
                                     :new.date_modfc);
  end if;

  if deleting and :old.code_utils = sie_07_util_pkg.v ('APP_USER') then
    sie_01_err_apex_pkg.lever_err_apex_code ('AFW.000003',
                                             pva_code_prodt             => 'AFW');
  end if;
end sie_12_utils_biud_trg;
/


Prompt Trigger SIE_13_CONDT_EXECT_BIU_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_13_CONDT_EXECT_BIU_TRG"
  before insert or update
  on sie_13_condt_exect
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_13_condt_exect_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_13_condt_exect_biu_trg;
/


Prompt Trigger SIE_13_CONDT_PILTB_AI_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_13_CONDT_PILTB_AI_TRG"
  after insert
  on sie_13_condt_piltb
  for each row
begin
  if not sie_13_condt_piltb_pkg.vbo_en_charg and sie_11_migrt_pkg.gva_indic_migrt = 'N' then
    sie_13_condt_piltb_pkg.ajout_lien_cas_lectr (:new.seqnc,
                                                 :new.ref_page);
  end if;
end sie_13_condt_piltb_ai_trg;
/


Prompt Trigger SIE_13_CONDT_PILTB_BIU_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_13_CONDT_PILTB_BIU_TRG"
  before insert
  on sie_13_condt_piltb
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_13_condt_piltb_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);

  if inserting
  or (updating and :old.code != :new.code) then
    :new.code := upper (:new.code);
  end if;
end sie_13_condt_piltb_biu_trg;
/


Prompt Trigger SIE_13_CONDT_PILTB_BI_98_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_13_condt_piltb_bi_98_trg
  before insert
  on sie_13_condt_piltb
  for each row
begin
  if :new.dnr_ref_aplic is null then
    :new.dnr_ref_aplic := sie_07_sesn_pkg.gva_aplic_en_cours;
  end if;
end sie_13_condt_piltb_bi_98_trg;
/


Prompt Trigger SIE_13_DOSR_VIRTL_BIU_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_13_DOSR_VIRTL_BIU_TRG"
  before insert or update
  on sie_13_dosr_virtl
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_13_dosr_virtl_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_13_dosr_virtl_biu_trg;
/


Prompt Trigger SIE_13_DOSR_VIRTL_BI_99_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_13_dosr_virtl_bi_99_trg
  before insert
  on sie_13_dosr_virtl
  for each row
begin
  if :new.dnr_ref_prodt is null then
    :new.dnr_ref_prodt := sie_07_sesn_pkg.gva_prodt_en_cours;
  end if;
end sie_13_dosr_virtl_bi_99_trg;
/


Prompt Trigger SIE_13_EMPLA_DOSR_VIRT_BIU_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_13_EMPLA_DOSR_VIRT_BIU_TRG"
  before insert or update
  on sie_13_empla_dosr_virtl
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_13_empla_dosr_virtl_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_13_empla_dosr_virt_biu_trg;
/


Prompt Trigger SIE_13_EMPLA_DOSR_VI_BI_99_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_13_empla_dosr_vi_bi_99_trg
  before insert
  on sie_13_empla_dosr_virtl
  for each row
begin
  if :new.dnr_ref_prodt is null then
    :new.dnr_ref_prodt := sie_07_sesn_pkg.gva_prodt_en_cours;
  end if;
end sie_13_empla_dosr_vi_bi_99_trg;
/


Prompt Trigger SIE_13_EXPOR_APLIC_BI_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_13_EXPOR_APLIC_BI_TRG"
  before insert
  on sie_13_expor_aplic
  for each row
begin
  :new.seqnc := sie_13_expor_aplic_seq.nextval;

  :new.ref_sesn := sie_12_sesn_pkg.obten_sesn ();
end sie_13_expor_aplic_bi_trg;
/


Prompt Trigger SIE_13_EXPOR_PAGE_BI_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_13_EXPOR_PAGE_BI_TRG"
  before insert
  on sie_13_expor_page
  for each row
begin
  :new.seqnc := sie_13_expor_page_seq.nextval;

  :new.ref_sesn := sie_12_sesn_pkg.obten_sesn ();
end sie_13_expor_page_bi_trg;
/


Prompt Trigger SIE_13_FORMT_RESRC_BIU_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_13_FORMT_RESRC_BIU_TRG"
  before insert or update
  on sie_13_formt_resrc
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_13_formt_resrc_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);

  if inserting
  or (updating and :old.code != :new.code) then
    :new.code := upper (:new.code);
  end if;
end sie_13_formt_resrc_biu_trg;
/


Prompt Trigger SIE_13_FORMT_RESRC_BI_99_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_13_formt_resrc_bi_99_trg
  before insert
  on sie_13_formt_resrc
  for each row
begin
  if :new.dnr_ref_prodt is null then
    :new.dnr_ref_prodt := sie_07_sesn_pkg.gva_prodt_en_cours;
  end if;
end sie_13_formt_resrc_bi_99_trg;
/


Prompt Trigger SIE_13_INSTA_PREFR_BIU_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_13_INSTA_PREFR_BIU_TRG"
  before insert or update
  on sie_13_insta_prefr
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_13_insta_prefr_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_13_insta_prefr_biu_trg;
/


Prompt Trigger SIE_13_ITEM_MENU_BIU_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_13_ITEM_MENU_BIU_TRG"
  before insert or update
  on sie_13_item_menu
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_13_item_menu_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);

  if :new.indic_reint_pagnt is null then
    :new.indic_reint_pagnt := 'N';
  end if;

  if :new.indic_reint_page_ir is null then
    :new.indic_reint_page_ir := 'N';
  end if;

  if :new.indic_clear_page_ir is null then
    :new.indic_clear_page_ir := 'N';
  end if;
end sie_13_item_menu_biu_trg;
/


Prompt Trigger SIE_13_ITEM_MENU_BI_99_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_13_item_menu_bi_99_trg
  before insert
  on sie_13_item_menu
  for each row
begin
  if :new.dnr_ref_prodt is null then
    :new.dnr_ref_prodt := sie_07_sesn_pkg.gva_prodt_en_cours;
  end if;
end sie_13_item_menu_bi_99_trg;
/


Prompt Trigger SIE_13_LIEN_CONDT_PI_BI_98_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_13_lien_condt_pi_bi_98_trg
  before insert
  on sie_13_lien_condt_piltb
  for each row
begin
  if :new.dnr_ref_aplic is null then
    :new.dnr_ref_aplic := sie_07_sesn_pkg.gva_aplic_en_cours;
  end if;
end sie_13_lien_condt_pi_bi_98_trg;
/


Prompt Trigger SIE_13_LIEN_CP_BIU_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_13_LIEN_CP_BIU_TRG"
  before insert or update
  on sie_13_lien_condt_piltb
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_13_lien_condt_piltb_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_13_lien_cp_biu_trg;
/


Prompt Trigger SIE_13_LISTE_NAVGT_BIU_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_13_LISTE_NAVGT_BIU_TRG"
  before insert or update
  on sie_13_liste_navgt
  for each row
declare
  vnu_app_apex                            pls_integer;
  vnu_page_apex                           pls_integer;
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_13_liste_navgt_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);

  if inserting
  or (updating and :old.code != :new.code) then
    :new.code := upper (:new.code);
  end if;
end sie_13_liste_navgt_biu_trg;
/


Prompt Trigger SIE_13_LISTE_NAVGT_BI_98_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_13_liste_navgt_bi_98_trg
  before insert
  on sie_13_liste_navgt
  for each row
begin
  if :new.dnr_ref_aplic is null then
    :new.dnr_ref_aplic := sie_07_sesn_pkg.gva_aplic_en_cours;
  end if;
end sie_13_liste_navgt_bi_98_trg;
/


Prompt Trigger SIE_13_MENU_BIU_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_13_MENU_BIU_TRG"
  before insert or update
  on sie_13_menu
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_13_menu_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_13_menu_biu_trg;
/


Prompt Trigger SIE_13_MENU_BI_99_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_13_menu_bi_99_trg
  before insert
  on sie_13_menu
  for each row
begin
  if :new.dnr_ref_prodt is null then
    :new.dnr_ref_prodt := sie_07_sesn_pkg.gva_prodt_en_cours;
  end if;
end sie_13_menu_bi_99_trg;
/


Prompt Trigger SIE_13_MIME_TYPE_BIU_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_13_MIME_TYPE_BIU_TRG"
  before insert or update
  on sie_13_mime_type
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_13_mime_type_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_13_mime_type_biu_trg;
/


Prompt Trigger SIE_13_NAVGT_BIU_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_13_NAVGT_BIU_TRG"
  before insert or update
  on sie_13_navgt
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_13_navgt_seq.nextval;
  end if;

  :new.ref_id_sesn := sie_07_util_pkg.nv ('SESSION');

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_13_navgt_biu_trg;
/


Prompt Trigger SIE_13_NAVGT_ELEMN_BIU_TRG;
/* Formatted on 04/12/2013 11:26:37 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_13_NAVGT_ELEMN_BIU_TRG"
  before insert or update
  on sie_13_navgt_elemn
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_13_navgt_elemn_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_13_navgt_elemn_biu_trg;
/


Prompt Trigger SIE_13_OCURN_RESRC_BIU_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_13_OCURN_RESRC_BIU_TRG"
  before insert or update
  on sie_13_ocurn_resrc
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_13_ocurn_resrc_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_13_ocurn_resrc_biu_trg;
/


Prompt Trigger SIE_13_OCURN_RESRC_BI_99_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_13_ocurn_resrc_bi_99_trg
  before insert
  on sie_13_ocurn_resrc
  for each row
begin
  if :new.dnr_ref_prodt is null then
    :new.dnr_ref_prodt := sie_07_sesn_pkg.gva_prodt_en_cours;
  end if;
end sie_13_ocurn_resrc_bi_99_trg;
/


Prompt Trigger SIE_13_OPERT_BIU_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_13_OPERT_BIU_TRG"
  before insert or update
  on sie_13_opert
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_13_opert_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);

  if inserting
  or (updating and :old.code != :new.code) then
    :new.code := upper (:new.code);
  end if;
end sie_13_opert_biu_trg;
/


Prompt Trigger SIE_13_OPERT_BI_99_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_13_opert_bi_99_trg
  before insert
  on sie_13_opert
  for each row
begin
  if :new.dnr_ref_prodt is null then
    :new.dnr_ref_prodt := sie_07_sesn_pkg.gva_prodt_en_cours;
  end if;
end sie_13_opert_bi_99_trg;
/


Prompt Trigger SIE_13_OPERT_OPTIO_BIU_01_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_13_OPERT_OPTIO_BIU_01_TRG"
  before insert or update
  on sie_13_opert_optio
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_13_opert_optio_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_13_opert_optio_biu_01_trg;
/


Prompt Trigger SIE_13_OPERT_OPTIO_BI_99_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_13_OPERT_OPTIO_BI_99_TRG"
  before insert
  on sie_13_opert_optio
  for each row
begin
  if :new.dnr_ref_prodt is null then
    :new.dnr_ref_prodt := sie_07_sesn_pkg.gva_prodt_en_cours;
  end if;
end sie_13_opert_optio_bi_99_trg;
/


Prompt Trigger SIE_13_PAGE_BIU_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_13_PAGE_BIU_TRG"
  before insert or update
  on sie_13_page
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_13_page_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_13_page_biu_trg;
/


Prompt Trigger SIE_13_PAGE_BI_98_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_13_page_bi_98_trg
  before insert
  on sie_13_page
  for each row
begin
  if :new.dnr_ref_aplic is null then
    :new.dnr_ref_aplic := sie_07_sesn_pkg.gva_aplic_en_cours;
  end if;
end sie_13_page_bi_98_trg;
/


Prompt Trigger SIE_13_PAGE_IR_BIU_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_13_PAGE_IR_BIU_TRG"
  before insert or update
  on sie_13_page_ir
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_13_page_ir_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);

  if inserting then
    if :new.code is null then
      :new.code := :new.seqnc;
    end if;
  end if;
end sie_13_page_ir_biu_trg;
/


Prompt Trigger SIE_13_PAGE_IR_BI_98_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_13_page_ir_bi_98_trg
  before insert
  on sie_13_page_ir
  for each row
begin
  if :new.dnr_ref_aplic is null then
    :new.dnr_ref_aplic := sie_07_sesn_pkg.gva_aplic_en_cours;
  end if;
end sie_13_page_ir_bi_98_trg;
/


Prompt Trigger SIE_13_PAGE_IR_COLN_BIU_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_13_PAGE_IR_COLN_BIU_TRG"
  before insert or update
  on sie_13_page_ir_coln
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_13_page_ir_coln_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_13_page_ir_coln_biu_trg;
/


Prompt Trigger SIE_13_PAGE_IR_COLN_BI_98_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_13_page_ir_coln_bi_98_trg
  before insert
  on sie_13_page_ir_coln
  for each row
begin
  if :new.dnr_ref_aplic is null then
    :new.dnr_ref_aplic := sie_07_sesn_pkg.gva_aplic_en_cours;
  end if;
end sie_13_page_ir_coln_bi_98_trg;
/


Prompt Trigger SIE_13_PAGE_ITEM_AI_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_13_PAGE_ITEM_AI_TRG"
  after insert
  on sie_13_page_item
  for each row
begin
  if not sie_13_condt_piltb_pkg.vbo_en_charg then
    sie_13_condt_piltb_pkg.ajout_lien_cas_lectr_item (:new.seqnc,
                                                      :new.ref_page,
                                                      :new.dnr_ref_aplic);
  end if;
end sie_13_page_item_ai_trg;
/


Prompt Trigger SIE_13_PAGE_ITEM_BIU_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_13_PAGE_ITEM_BIU_TRG"
  before insert or update
  on sie_13_page_item
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_13_page_item_seq.nextval;

    if :new.indic_confr_sauvg is null then
      case :new.type_item
        when 'ITEM' then
          :new.indic_confr_sauvg := 'O';
        when 'BOUTN' then
          :new.indic_confr_sauvg := 'N';
        else
          null;
      end case;
    end if;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_13_page_item_biu_trg;
/


Prompt Trigger SIE_13_PAGE_ITEM_BI_98_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_13_page_item_bi_98_trg
  before insert
  on sie_13_page_item
  for each row
begin
  if :new.dnr_ref_aplic is null then
    :new.dnr_ref_aplic := sie_07_sesn_pkg.gva_aplic_en_cours;
  end if;
end sie_13_page_item_bi_98_trg;
/


Prompt Trigger SIE_13_PAGE_ITEM_LANG_BIU_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_13_PAGE_ITEM_LANG_BIU_TRG"
  before insert or update
  on sie_13_page_item_lang
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_13_page_item_lang_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_13_page_item_lang_biu_trg;
/


Prompt Trigger SIE_13_PAGE_ITEM_LAN_BI_98_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_13_page_item_lan_bi_98_trg
  before insert
  on sie_13_page_item_lang
  for each row
begin
  if :new.dnr_ref_aplic is null then
    :new.dnr_ref_aplic := sie_07_sesn_pkg.gva_aplic_en_cours;
  end if;
end sie_13_page_item_lan_bi_98_trg;
/


Prompt Trigger SIE_13_PAGE_LANG_BIU_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_13_PAGE_LANG_BIU_TRG"
  before insert or update
  on sie_13_page_lang
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_13_page_lang_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_13_page_lang_biu_trg;
/


Prompt Trigger SIE_13_PAGE_LANG_BI_98_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_13_page_lang_bi_98_trg
  before insert
  on sie_13_page_lang
  for each row
begin
  if :new.dnr_ref_aplic is null then
    :new.dnr_ref_aplic := sie_07_sesn_pkg.gva_aplic_en_cours;
  end if;
end sie_13_page_lang_bi_98_trg;
/


Prompt Trigger SIE_13_PAGE_PREFR_NAVG_BIU_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_13_PAGE_PREFR_NAVG_BIU_TRG"
  before insert or update
  on sie_13_page_prefr_navgt
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_13_page_prefr_navgt_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_13_page_prefr_navg_biu_trg;
/


Prompt Trigger SIE_13_PAGE_PREFR_NA_BI_98_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_13_page_prefr_na_bi_98_trg
  before insert
  on sie_13_page_prefr_navgt
  for each row
begin
  if :new.dnr_ref_aplic is null then
    :new.dnr_ref_aplic := sie_07_sesn_pkg.gva_aplic_en_cours;
  end if;
end sie_13_page_prefr_na_bi_98_trg;
/


Prompt Trigger SIE_13_PREFR_BIU_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_13_PREFR_BIU_TRG"
  before insert or update
  on sie_13_prefr
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_13_prefr_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_13_prefr_biu_trg;
/


Prompt Trigger SIE_13_PREFR_BI_98_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_13_prefr_bi_98_trg
  before insert
  on sie_13_prefr
  for each row
begin
  if :new.dnr_ref_aplic is null then
    :new.dnr_ref_aplic := sie_07_sesn_pkg.gva_aplic_en_cours;
  end if;
end sie_13_prefr_bi_98_trg;
/


Prompt Trigger SIE_13_REGN_PILTB_AIUD_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_13_REGN_PILTB_AIUD_TRG"
  after insert or update
  on sie_13_regn_piltb
  for each row
declare
begin
  if inserting then
    sie_09_pile_pkg.empil_rowid ('VALDR_TYPE_REGN_INSER',
                                 :new.rowid);
  elsif updating then
    sie_09_pile_pkg.empil_rowid ('VALDR_TYPE_REGN_UPDAT',
                                 :new.rowid);
  end if;
exception
  when others then
    sie_09_pile_pkg.vider_pile ();
    raise;
end sie_13_regn_piltb_aiud_trg;
/


Prompt Trigger SIE_13_REGN_PILTB_ASIUD_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_13_REGN_PILTB_ASIUD_TRG"
  after insert or update
  on sie_13_regn_piltb
declare
  vro_rowid                               rowid;
  vnu_count                               number (6);
begin
  if inserting then
    sie_09_pile_pkg.mode_depil ('VALDR_TYPE_REGN_INSER');
    vro_rowid := sie_09_pile_pkg.depil_rowid ('VALDR_TYPE_REGN_INSER');
  elsif updating then
    sie_09_pile_pkg.mode_depil ('VALDR_TYPE_REGN_UPDAT');
    vro_rowid := sie_09_pile_pkg.depil_rowid ('VALDR_TYPE_REGN_UPDAT');
  end if;


  while vro_rowid is not null loop
    --traitement ici
    select   count (1)
      into   vnu_count
      from   sie_13_regn_piltb rp
     where   rp.rowid <> vro_rowid
         and exists
               (select   rp2.ref_page
                  from   sie_13_regn_piltb rp2
                 where   rp2.rowid = vro_rowid
                     and rp2.ref_dv_type_regn_piltb = sie_14_domn_valr_pkg.obten_seqnc ('TYPE_REGN_PILTB',
                                                                                        'AIDE_PAGE')
                     and rp.ref_page = rp2.ref_page
                     and rp.ref_dv_type_regn_piltb = rp2.ref_dv_type_regn_piltb);

    if vnu_count > 0 then
      sie_01_err_apex_pkg.lever_err_apex_code ('SAF.000025');
    end if;

    if inserting then
      vro_rowid := sie_09_pile_pkg.depil_rowid ('VALDR_TYPE_REGN_INSER');
    elsif updating then
      vro_rowid := sie_09_pile_pkg.depil_rowid ('VALDR_TYPE_REGN_UPDAT');
    end if;
  end loop;

  if inserting then
    sie_09_pile_pkg.termn_utils_pile ('VALDR_TYPE_REGN_INSER');
  elsif updating then
    sie_09_pile_pkg.termn_utils_pile ('VALDR_TYPE_REGN_UPDAT');
  end if;
exception
  when others then
    sie_09_pile_pkg.vider_pile ();
    raise;
end sie_13_regn_piltb_asiud_trg;
/


Prompt Trigger SIE_13_REGN_PILTB_BIU_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_13_REGN_PILTB_BIU_TRG"
  before insert or update
  on sie_13_regn_piltb
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_13_regn_piltb_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);

  if inserting
  or (updating and :old.code != :new.code) then
    :new.code := upper (:new.code);
  end if;
end sie_13_regn_piltb_biu_trg;
/


Prompt Trigger SIE_13_REGN_PILTB_BI_98_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_13_regn_piltb_bi_98_trg
  before insert
  on sie_13_regn_piltb
  for each row
begin
  if :new.dnr_ref_aplic is null then
    :new.dnr_ref_aplic := sie_07_sesn_pkg.gva_aplic_en_cours;
  end if;
end sie_13_regn_piltb_bi_98_trg;
/


Prompt Trigger SIE_13_REGN_PILTB_BSIUD_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_13_REGN_PILTB_BSIUD_TRG"
  before insert or update
  on sie_13_regn_piltb
declare
begin
  if inserting then
    sie_09_pile_pkg.init_pile ('VALDR_TYPE_REGN_INSER');
  elsif updating then
    sie_09_pile_pkg.init_pile ('VALDR_TYPE_REGN_UPDAT');
  end if;
exception
  when others then
    sie_09_pile_pkg.vider_pile ();
    raise;
end sie_13_regn_piltb_bsiud_trg;
/


Prompt Trigger SIE_13_REGN_PILTB_LANG_BIU_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_13_REGN_PILTB_LANG_BIU_TRG"
  before insert or update
  on sie_13_regn_piltb_lang
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_13_regn_piltb_lang_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_13_regn_piltb_lang_biu_trg;
/


Prompt Trigger SIE_13_REGN_PILTB_LA_BI_98_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_13_regn_piltb_la_bi_98_trg
  before insert
  on sie_13_regn_piltb_lang
  for each row
begin
  if :new.dnr_ref_aplic is null then
    :new.dnr_ref_aplic := sie_07_sesn_pkg.gva_aplic_en_cours;
  end if;
end sie_13_regn_piltb_la_bi_98_trg;
/


Prompt Trigger SIE_13_RESRC_BIU_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_13_RESRC_BIU_TRG"
  before insert or update
  on sie_13_resrc
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_13_resrc_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);

  if inserting
  or (updating and :old.code != :new.code) then
    :new.code := upper (:new.code);
  end if;

  if :new.type_resrc is null then
    :new.type_resrc := 'SIMPL';
  end if;

  if :new.type_resrc = 'SIMPL' and :new.indic_stock_meme_reprt is null then
    :new.indic_stock_meme_reprt := 'O';
  end if;
end sie_13_resrc_biu_trg;
/


Prompt Trigger SIE_13_RESRC_BI_99_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_13_resrc_bi_99_trg
  before insert
  on sie_13_resrc
  for each row
begin
  if :new.dnr_ref_prodt is null then
    :new.dnr_ref_prodt := sie_07_sesn_pkg.gva_prodt_en_cours;
  end if;
end sie_13_resrc_bi_99_trg;
/


Prompt Trigger SIE_13_TYPE_FICHR_BIU_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_13_TYPE_FICHR_BIU_TRG"
  before insert or update
  on sie_13_type_fichr
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_13_type_fichr_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_13_type_fichr_biu_trg;
/


Prompt Trigger SIE_14_DETL_DOMN_VALR_BIU_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_14_DETL_DOMN_VALR_BIU_TRG"
  before insert or update
  on sie_14_detl_domn_valr
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_14_detl_domn_valr_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);

  if inserting
  or (updating and :old.code_valr != :new.code_valr) then
    :new.code_valr := upper (:new.code_valr);
  end if;
end sie_14_detl_domn_valr_biu_trg;
/


Prompt Trigger SIE_14_DETL_DV_BI_99_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_14_detl_dv_bi_99_trg
  before insert
  on sie_14_detl_domn_valr
  for each row
declare
  vnu_dnr_ref_prodt_domn                  number;
begin
  select   dnr_ref_prodt
    into   vnu_dnr_ref_prodt_domn
    from   vd_i_sie_14_domn_valr
   where   seqnc = :new.ref_domn_valr;

  if vnu_dnr_ref_prodt_domn is not null then
    if :new.dnr_ref_prodt is null then
      :new.dnr_ref_prodt := sie_07_sesn_pkg.gva_prodt_en_cours;
    end if;
  end if;
end sie_14_detl_dv_bi_99_trg;
/


Prompt Trigger SIE_14_DOMN_VALR_BIU_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_14_DOMN_VALR_BIU_TRG"
  before insert or update
  on sie_14_domn_valr
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_14_domn_valr_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);

  if inserting
  or (updating and :old.code != :new.code) then
    :new.code := upper (:new.code);
  end if;
end sie_14_domn_valr_biu_trg;
/


Prompt Trigger SIE_14_DOMN_VALR_BI_99_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_14_domn_valr_bi_99_trg
  before insert
  on sie_14_domn_valr
  for each row
begin
  --CARLO
  if :new.ref_domn is null then
    if :new.dnr_ref_prodt is null then
      :new.dnr_ref_prodt := sie_07_sesn_pkg.gva_prodt_en_cours;
    end if;
  end if;
end sie_14_domn_valr_bi_99_trg;
/


Prompt Trigger SIE_14_FORMT_BIU_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_14_FORMT_BIU_TRG"
  before insert or update
  on sie_14_formt
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_14_formt_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_14_formt_biu_trg;
/


Prompt Trigger SIE_14_FORMT_BI_98_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_14_formt_bi_98_trg
  before insert
  on sie_14_formt
  for each row
begin
  if :new.dnr_ref_prodt is null then
    :new.dnr_ref_prodt := sie_07_sesn_pkg.gva_prodt_en_cours;
  end if;
end sie_14_formt_bi_98_trg;
/


Prompt Trigger SIE_14_TYPE_DOMN_VALR_BIU_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_14_TYPE_DOMN_VALR_BIU_TRG"
  before insert or update
  on sie_14_type_domn_valr
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_14_type_domn_valr_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);

  if inserting
  or (updating and :old.code != :new.code) then
    :new.code := upper (:new.code);
  end if;
end sie_14_type_domn_valr_biu_trg;
/


Prompt Trigger SIE_14_TYPE_DV_BI_99_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_14_type_dv_bi_99_trg
  before insert
  on sie_14_type_domn_valr
  for each row
begin
  if :new.dnr_ref_prodt is null then
    :new.dnr_ref_prodt := sie_07_sesn_pkg.gva_prodt_en_cours;
  end if;
end sie_14_type_dv_bi_99_trg;
/


Prompt Trigger SIE_17_ATACH_COURL_ENT_BIU_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_17_atach_courl_ent_biu_trg
  before insert or update
  on sie_17_atach_courl_entra
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_17_atach_courl_entra_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end;
/


Prompt Trigger SIE_17_COMPT_AXIAT_BIU_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_17_COMPT_AXIAT_BIU_TRG"
  before insert or update
  on sie_17_compt_axiat
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_17_compt_axiat_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_17_compt_axiat_biu_trg;
/


Prompt Trigger SIE_17_COMPT_TWILI_BIU_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_17_COMPT_TWILI_BIU_TRG"
  before insert or update
  on sie_17_compt_twili
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_17_compt_twili_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_17_compt_twili_biu_trg;
/


Prompt Trigger SIE_17_COURL_BIU_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_17_COURL_BIU_TRG"
  before insert or update
  on sie_17_courl
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_17_fil_atent_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end;
/


Prompt Trigger SIE_17_COURL_DESTN_BIU_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_17_COURL_DESTN_BIU_TRG"
  before insert or update
  on sie_17_courl_destn
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_17_fil_atent_destn_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end;
/


Prompt Trigger SIE_17_COURL_ENTRA_BIU_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_17_courl_entra_biu_trg
  before insert or update
  on sie_17_courl_entra
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_17_courl_entra_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end;
/


Prompt Trigger SIE_17_PIECE_TELCP_BIU_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_17_PIECE_TELCP_BIU_TRG"
  before insert or update
  on sie_17_piece_telcp_axiat
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_17_piece_telcp_axiat_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);

  if :new.ordre_atach is null then
    :new.ordre_atach := :new.seqnc;
  end if;
end sie_17_piece_telcp_biu_trg;
/


Prompt Trigger SIE_17_PROFL_COURL_BIU_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_17_PROFL_COURL_BIU_TRG"
  before insert or update
  on sie_17_profl_courl
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_17_profl_courl_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_17_profl_courl_biu_trg;
/


Prompt Trigger SIE_17_PROPR_COURL_ENT_BIU_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_17_propr_courl_ent_biu_trg
  before insert or update
  on sie_17_propr_courl_entra
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_17_propr_courl_entra_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end;
/


Prompt Trigger SIE_17_SMS_TWILI_BIU_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_17_SMS_TWILI_BIU_TRG"
  before insert or update
  on sie_17_sms_twili
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_17_sms_twili_seq.nextval;
  end if;

  if inserting and :new.group_sms is null then
    :new.group_sms := :new.seqnc;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_17_sms_twili_biu_trg;
/


Prompt Trigger SIE_17_SMS_TWILI_ENTRA_BIU_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_17_sms_twili_entra_biu_trg
  before insert or update
  on sie_17_sms_twili_entra
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_17_sms_twili_entra_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_17_sms_twili_entra_biu_trg;
/


Prompt Trigger SIE_17_TELCP_AXIAT_BIU_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_17_TELCP_AXIAT_BIU_TRG"
  before insert or update
  on sie_17_telcp_axiat
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_17_telcp_axiat_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_17_telcp_axiat_biu_trg;
/


Prompt Trigger SIE_19_BOUTN_BIU_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_19_BOUTN_BIU_TRG"
  before insert or update
  on sie_19_boutn
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_19_boutn_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_19_boutn_biu_trg;
/


Prompt Trigger SIE_19_CLE_BIU_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_19_CLE_BIU_TRG"
  before insert or update
  on sie_19_cle
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_19_cle_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_19_cle_biu_trg;
/


Prompt Trigger SIE_19_DISPN_FONCT_BIU_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_19_DISPN_FONCT_BIU_TRG"
  before insert or update
  on sie_19_dispn_fonct
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_19_dispn_fonct_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_19_dispn_fonct_biu_trg;
/


Prompt Trigger SIE_19_FONCT_LANG_BIU_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_19_FONCT_LANG_BIU_TRG"
  before insert or update
  on sie_19_fonct_lang
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_19_fonct_lang_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_19_fonct_lang_biu_trg;
/


Prompt Trigger SIE_19_SPECF_FONCT_BIU_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_19_SPECF_FONCT_BIU_TRG"
  before insert or update
  on sie_19_specf_fonct
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_19_specf_fonct_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_19_specf_fonct_biu_trg;
/


Prompt Trigger SIE_20_DEPLM_BIU_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_20_DEPLM_BIU_TRG"
  before insert or update
  on sie_20_deplm
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_20_deplm_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_20_deplm_biu_trg;
/


Prompt Trigger SIE_20_DETL_DOCMN_BIU_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_20_DETL_DOCMN_BIU_TRG"
  before insert or update
  on sie_20_detl_docmn
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_20_detl_docmn_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_20_detl_docmn_biu_trg;
/


Prompt Trigger SIE_20_DOCMN_BIU_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_20_DOCMN_BIU_TRG"
  before insert or update
  on sie_20_docmn
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_20_docmn_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_20_docmn_biu_trg;
/


Prompt Trigger SIE_20_MODL_BIU_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_20_MODL_BIU_TRG"
  before insert or update
  on sie_20_modl
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_20_modl_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_20_modl_biu_trg;
/


Prompt Trigger SIE_20_MODL_EXCEP_BIU_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_20_MODL_EXCEP_BIU_TRG"
  before insert or update
  on sie_20_modl_excep
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_20_modl_excep_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_20_modl_excep_biu_trg;
/


Prompt Trigger SIE_20_MODL_PARMT_BIU_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_20_MODL_PARMT_BIU_TRG"
  before insert or update
  on sie_20_modl_parmt
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_20_modl_parmt_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_20_modl_parmt_biu_trg;
/


Prompt Trigger SIE_20_SECTN_DOCMN_BIU_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_20_SECTN_DOCMN_BIU_TRG"
  before insert or update
  on sie_20_sectn_docmn
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_20_sectn_docmn_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_20_sectn_docmn_biu_trg;
/


Prompt Trigger SIE_21_PLUGN_ARBRE_BIU_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_21_plugn_arbre_biu_trg
  before insert or update
  on sie_21_plugn_arbre
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_21_plugn_arbre_seq.nextval;
  end if;

  if :new.code is null then
    :new.code := :new.seqnc;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_21_plugn_arbre_biu_trg;
/


Prompt Trigger SIE_21_PLUGN_ARBRE_BI_99_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_21_plugn_arbre_bi_99_trg
  before insert
  on sie_21_plugn_arbre
  for each row
begin
  if :new.dnr_ref_prodt is null then
    :new.dnr_ref_prodt := sie_07_sesn_pkg.gva_prodt_en_cours;
  end if;
end sie_21_plugn_arbre_bi_99_trg;
/


Prompt Trigger SIE_21_PLUGN_ARBRE_NOE_BIU_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_21_PLUGN_ARBRE_NOE_BIU_TRG"
  before insert or update
  on sie_21_plugn_arbre_noeud
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_21_plugn_arbre_noeud_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_21_plugn_arbre_noe_biu_trg;
/


Prompt Trigger SIE_21_PLUGN_ARBRE_N_BI_99_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_21_plugn_arbre_n_bi_99_trg
  before insert
  on sie_21_plugn_arbre_noeud
  for each row
begin
  if :new.dnr_ref_prodt is null then
    :new.dnr_ref_prodt := sie_07_sesn_pkg.gva_prodt_en_cours;
  end if;
end sie_21_plugn_arbre_n_bi_99_trg;
/


Prompt Trigger SIE_21_PLUGN_CALND_BIU_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_21_PLUGN_CALND_BIU_TRG"
  before insert or update
  on sie_21_plugn_calnd
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_21_plugn_calnd_seq.nextval;
  end if;

  if :new.code is null then
    :new.code := :new.seqnc;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);

  if inserting
  or updating
 and (:new.heure_debut_norml <> :old.heure_debut_norml
   or :new.heure_fin_norml <> :old.heure_fin_norml
   or (:new.heure_debut_exten <> :old.heure_debut_exten and :new.heure_debut_exten is not null
    or :new.heure_debut_exten is null)
   or (:new.heure_fin_exten <> :old.heure_fin_exten and :new.heure_fin_exten is not null
    or :new.heure_fin_exten is null)) then
    sie_21_plugn_calnd_pkg.valdr_heure (:new.heure_debut_norml,
                                        :new.heure_fin_norml,
                                        :new.heure_debut_exten,
                                        :new.heure_fin_exten);
  end if;
end sie_21_plugn_calnd_biu_trg;
/


Prompt Trigger SIE_21_PLUGN_CALND_BI_99_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_21_plugn_calnd_bi_99_trg
  before insert
  on sie_21_plugn_calnd
  for each row
begin
  if :new.dnr_ref_prodt is null then
    :new.dnr_ref_prodt := sie_07_sesn_pkg.gva_prodt_en_cours;
  end if;
end sie_21_plugn_calnd_bi_99_trg;
/


Prompt Trigger SIE_21_PLUGN_CALND_COU_BIU_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_21_PLUGN_CALND_COU_BIU_TRG"
  before insert
  on sie_21_plugn_calnd_coulr
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_21_plugn_calnd_coulr_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_21_plugn_calnd_cou_biu_trg;
/


Prompt Trigger SIE_21_PLUGN_CALND_TYP_BIU_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_21_PLUGN_CALND_TYP_BIU_TRG"
  before insert or update
  on sie_21_plugn_calnd_type
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_21_plugn_calnd_type_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);

  if inserting and :new.ref_domn is null then
    :new.ref_domn := sie_12_domn_pkg.obten_domn_sesn ();
  end if;
end sie_21_plugn_calnd_typ_biu_trg;
/


Prompt Trigger SIE_21_PLUGN_ITEM_MENU_BIU_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_21_plugn_item_menu_biu_trg
  before insert or update
  on sie_21_plugn_item_menu
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_21_plugn_item_menu_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_21_plugn_item_menu_biu_trg;
/


Prompt Trigger SIE_21_PLUGN_ITEM_ME_BI_99_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_21_plugn_item_me_bi_99_trg
  before insert
  on sie_21_plugn_item_menu
  for each row
begin
  if :new.dnr_ref_prodt is null then
    :new.dnr_ref_prodt := sie_07_sesn_pkg.gva_prodt_en_cours;
  end if;
end sie_21_plugn_item_me_bi_99_trg;
/


Prompt Trigger SIE_21_PLUGN_MENU_BIU_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_21_plugn_menu_biu_trg
  before insert or update
  on sie_21_plugn_menu
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_21_plugn_menu_seq.nextval;
  end if;

  if :new.code is null then
    :new.code := :new.seqnc;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_21_plugn_menu_biu_trg;
/


Prompt Trigger SIE_21_PLUGN_MENU_BI_99_TRG;
/* Formatted on 04/12/2013 11:26:38 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_21_plugn_menu_bi_99_trg
  before insert
  on sie_21_plugn_menu
  for each row
begin
  if :new.dnr_ref_prodt is null then
    :new.dnr_ref_prodt := sie_07_sesn_pkg.gva_prodt_en_cours;
  end if;
end sie_21_plugn_menu_bi_99_trg;
/


Prompt Trigger SIE_23_APLIC_M_R_BIU_TRG;
/* Formatted on 04/12/2013 11:26:39 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_23_APLIC_M_R_BIU_TRG"
  before insert or update
  on sie_23_aplic_modl_rechr
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_23_aplic_modl_rechr_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_23_aplic_m_r_biu_trg;
/


Prompt Trigger SIE_23_DETL_RES_REC_BIU_TRG;
/* Formatted on 04/12/2013 11:26:39 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_23_DETL_RES_REC_BIU_TRG"
  before insert or update
  on sie_23_detl_reslt_rechr
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_23_detl_reslt_rechr_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_23_detl_res_rec_biu_trg;
/


Prompt Trigger SIE_23_D_APLIC_MOD_REC_BIU_TRG;
/* Formatted on 04/12/2013 11:26:39 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_23_D_APLIC_MOD_REC_BIU_TRG"
  before insert or update
  on sie_23_detl_aplic_modl_rechr
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_23_d_aplic_modl_rechr_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_23_d_aplic_mod_rec_biu_trg;
/


Prompt Trigger SIE_23_ENONC_RECHR_BIU_TRG;
/* Formatted on 04/12/2013 11:26:39 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_23_ENONC_RECHR_BIU_TRG"
  before insert or update
  on sie_23_enonc_rechr
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_23_enonc_rechr_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_23_enonc_rechr_biu_trg;
/


Prompt Trigger SIE_23_MODL_RECHR_BIU_TRG;
/* Formatted on 04/12/2013 11:26:39 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_23_MODL_RECHR_BIU_TRG"
  before insert or update
  on sie_23_modl_rechr
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_23_modl_rechr_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_23_modl_rechr_biu_trg;
/


Prompt Trigger SIE_23_PATRN_RECHR_BIU_TRG;
/* Formatted on 04/12/2013 11:26:39 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_23_PATRN_RECHR_BIU_TRG"
  before insert or update
  on sie_23_patrn_rechr
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_23_patrn_rechr_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_23_patrn_rechr_biu_trg;
/


Prompt Trigger SIE_23_PATRN_RECHR_BI_99_TRG;
/* Formatted on 04/12/2013 11:26:39 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_23_patrn_rechr_bi_99_trg
  before insert
  on sie_23_patrn_rechr
  for each row
begin
  if :new.dnr_ref_prodt is null then
    :new.dnr_ref_prodt := sie_07_sesn_pkg.gva_prodt_en_cours;
  end if;
end sie_23_patrn_rechr_bi_99_trg;
/


Prompt Trigger SIE_23_RECHR_BIU_TRG;
/* Formatted on 04/12/2013 11:26:39 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_23_RECHR_BIU_TRG"
  before insert or update
  on sie_23_rechr
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_23_rechr_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_23_rechr_biu_trg;
/


Prompt Trigger SIE_23_RESLT_RECHR_BIU_TRG;
/* Formatted on 04/12/2013 11:26:39 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_23_RESLT_RECHR_BIU_TRG"
  before insert or update
  on sie_23_reslt_rechr
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_23_reslt_rechr_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_23_reslt_rechr_biu_trg;
/


Prompt Trigger SIE_25_CHAMP_BIU_TRG;
/* Formatted on 04/12/2013 11:26:39 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_25_champ_biu_trg
  before insert or update
  on sie_25_champ
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_25_champ_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_25_champ_biu_trg;
/


Prompt Trigger SIE_25_CHA_PUB_TRA_BIU_TRG;
/* Formatted on 04/12/2013 11:26:39 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_25_cha_pub_tra_biu_trg
  before insert or update
  on sie_25_champ_publc_travl
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_25_champ_publc_travl_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_25_cha_pub_tra_biu_trg;
/


Prompt Trigger SIE_25_DOMN_TYPE_PUBLC_BIU_TRG;
/* Formatted on 04/12/2013 11:26:39 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_25_DOMN_TYPE_PUBLC_BIU_TRG"
  before insert or update
  on sie_25_domn_type_publc
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_25_domn_type_publc_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_25_domn_type_publc_biu_trg;
/


Prompt Trigger SIE_25_ELEMN_CONFG_PUB_BIU_TRG;
/* Formatted on 04/12/2013 11:26:39 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_25_ELEMN_CONFG_PUB_BIU_TRG"
  before insert or update
  on sie_25_elemn_confg_publc
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_25_elemn_confg_publc_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_25_elemn_confg_pub_biu_trg;
/


Prompt Trigger SIE_25_ELEMN_CONFG_P_BI_99_TRG;
/* Formatted on 04/12/2013 11:26:39 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_25_elemn_confg_p_bi_99_trg
  before insert
  on sie_25_elemn_confg_publc
  for each row
begin
  if :new.dnr_ref_prodt is null then
    :new.dnr_ref_prodt := sie_07_sesn_pkg.gva_prodt_en_cours;
  end if;
end sie_25_elemn_confg_p_bi_99_trg;
/


Prompt Trigger SIE_25_ENGIN_BIU_TRG;
/* Formatted on 04/12/2013 11:26:39 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_25_ENGIN_BIU_TRG"
  before insert or update
  on sie_25_engin
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_25_engin_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_25_engin_biu_trg;
/


Prompt Trigger SIE_25_ENGIN_VERSN_P_BI_99_TRG;
/* Formatted on 04/12/2013 11:26:39 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_25_engin_versn_p_bi_99_trg
  before insert
  on sie_25_engin_versn_publc
  for each row
begin
  if :new.dnr_ref_prodt is null then
    :new.dnr_ref_prodt := sie_07_sesn_pkg.gva_prodt_en_cours;
  end if;
end sie_25_engin_versn_p_bi_99_trg;
/


Prompt Trigger SIE_25_ENGIN_VER_PUBLC_BIU_TRG;
/* Formatted on 04/12/2013 11:26:39 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_25_ENGIN_VER_PUBLC_BIU_TRG"
  before insert or update
  on sie_25_engin_versn_publc
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_25_engin_versn_publc_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_25_engin_ver_publc_biu_trg;
/


Prompt Trigger SIE_25_GROUP_PUBLC_BIU_TRG;
/* Formatted on 04/12/2013 11:26:39 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_25_GROUP_PUBLC_BIU_TRG"
  before insert or update
  on sie_25_group_publc
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_25_group_publc_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_25_group_publc_biu_trg;
/


Prompt Trigger SIE_25_JOURN_TRAVL_EXE_BIU_TRG;
/* Formatted on 04/12/2013 11:26:39 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_25_JOURN_TRAVL_EXE_BIU_TRG"
  before insert or update
  on sie_25_journ_travl_exect
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_25_journ_travl_exect_seq.nextval;
  end if;
end sie_25_journ_travl_exe_biu_trg;
/


Prompt Trigger SIE_25_OCU_PAR_PUB_TRA_BIU_TRG;
/* Formatted on 04/12/2013 11:26:39 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_25_OCU_PAR_PUB_TRA_BIU_TRG"
  before insert or update
  on sie_25_ocurn_parmt_publc_travl
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_25_ocurn_parmt_pub_tra_seq.nextval;
  end if;
end sie_25_ocu_par_pub_tra_biu_trg;
/


Prompt Trigger SIE_25_PARMT_PUBLC_TRA_BIU_TRG;
/* Formatted on 04/12/2013 11:26:39 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_25_PARMT_PUBLC_TRA_BIU_TRG"
  before insert or update
  on sie_25_parmt_publc_travl
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_25_parmt_publc_travl_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_25_parmt_publc_tra_biu_trg;
/


Prompt Trigger SIE_25_PARMT_TYPE_PUBL_BIU_TRG;
/* Formatted on 04/12/2013 11:26:39 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_25_PARMT_TYPE_PUBL_BIU_TRG"
  before insert or update
  on sie_25_parmt_type_publc
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_25_parmt_type_publc_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_25_parmt_type_publ_biu_trg;
/


Prompt Trigger SIE_25_PARMT_TYPE_P_BI_99_TRG;
/* Formatted on 04/12/2013 11:26:39 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_25_parmt_type_p_bi_99_trg
  before insert
  on sie_25_parmt_type_publc
  for each row
begin
  if :new.dnr_ref_prodt is null then
    :new.dnr_ref_prodt := sie_07_sesn_pkg.gva_prodt_en_cours;
  end if;
end sie_25_parmt_type_p_bi_99_trg;
/


Prompt Trigger SIE_25_PAR_PUB_TRA_EXE_BIU_TRG;
/* Formatted on 04/12/2013 11:26:39 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_25_par_pub_tra_exe_biu_trg
  before insert or update
  on sie_25_parmt_publc_travl_exect
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_25_parmt_publc_travl_e_seq.nextval;
  end if;
end sie_25_par_pub_tra_exe_biu_trg;
/


Prompt Trigger SIE_25_PUBLC_BIU_TRG;
/* Formatted on 04/12/2013 11:26:39 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_25_PUBLC_BIU_TRG"
  before insert or update
  on sie_25_publc
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_25_publc_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_25_publc_biu_trg;
/


Prompt Trigger SIE_25_PUBLC_BI_99_TRG;
/* Formatted on 04/12/2013 11:26:39 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_25_publc_bi_99_trg
  before insert
  on sie_25_publc
  for each row
begin
  if :new.dnr_ref_prodt is null then
    :new.dnr_ref_prodt := sie_07_sesn_pkg.gva_prodt_en_cours;
  end if;
end sie_25_publc_bi_99_trg;
/


Prompt Trigger SIE_25_PUBLC_TRAVL_BIU_TRG;
/* Formatted on 04/12/2013 11:26:39 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_25_PUBLC_TRAVL_BIU_TRG"
  before insert or update
  on sie_25_publc_travl
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_25_publc_travl_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);

  if inserting then
    :new.ref_stat :=
      sie_12_stat_pkg.obten_stat_initl_struc_aplic ('PUBLC_TRAVL',
                                                    'AFW');
  end if;
end sie_25_publc_travl_biu_trg;
/


Prompt Trigger SIE_25_TRAVL_BIU_TRG;
/* Formatted on 04/12/2013 11:26:39 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_25_TRAVL_BIU_TRG"
  before insert or update
  on sie_25_travl
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_25_travl_seq.nextval;
  end if;

  if :new.ref_type_travl is null then
    :new.ref_type_travl := sie_12_domn_pkg.obten_type_travl_deft (:new.ref_domn);
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);

  if inserting then
    :new.ref_stat :=
      sie_12_stat_pkg.obten_stat_initl_struc_aplic ('TRAVL',
                                                    'AFW');
  end if;
end sie_25_travl_biu_trg;
/


Prompt Trigger SIE_25_TYPE_PUBLC_AI_TRG;
/* Formatted on 04/12/2013 11:26:39 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_25_TYPE_PUBLC_AI_TRG"
  after insert
  on sie_25_type_publc
  for each row
begin
  sie_25_type_publc_pkg.alimn_domn_type_publc (:new.seqnc);
end sie_25_type_publc_ai_trg;
/


Prompt Trigger SIE_25_TYPE_PUBLC_BIU_TRG;
/* Formatted on 04/12/2013 11:26:39 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_25_TYPE_PUBLC_BIU_TRG"
  before insert or update
  on sie_25_type_publc
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_25_type_publc_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_25_type_publc_biu_trg;
/


Prompt Trigger SIE_25_TYPE_PUBLC_BI_99_TRG;
/* Formatted on 04/12/2013 11:26:39 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_25_type_publc_bi_99_trg
  before insert
  on sie_25_type_publc
  for each row
begin
  if :new.dnr_ref_prodt is null then
    :new.dnr_ref_prodt := sie_07_sesn_pkg.gva_prodt_en_cours;
  end if;
end sie_25_type_publc_bi_99_trg;
/


Prompt Trigger SIE_25_TYPE_TRAVL_BIU_TRG;
/* Formatted on 04/12/2013 11:26:39 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_25_TYPE_TRAVL_BIU_TRG"
  before insert or update
  on sie_25_type_travl
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_25_type_travl_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_25_type_travl_biu_trg;
/


Prompt Trigger SIE_25_VALR_CHAMP_BIU_TRG;
/* Formatted on 04/12/2013 11:26:39 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_25_valr_champ_biu_trg
  before insert or update
  on sie_25_valr_champ
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_25_valr_champ_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_25_valr_champ_biu_trg;
/


Prompt Trigger SIE_25_VALR_ELEMN_CONF_BIU_TRG;
/* Formatted on 04/12/2013 11:26:39 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_25_VALR_ELEMN_CONF_BIU_TRG"
  before insert or update
  on sie_25_valr_elemn_confg
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_25_valr_elemn_confg_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_25_valr_elemn_conf_biu_trg;
/


Prompt Trigger SIE_25_VERSN_PUBLC_BIU_TRG;
/* Formatted on 04/12/2013 11:26:39 PM (QP5 v5.185.11230.41888) */
create or replace trigger "SIE_25_VERSN_PUBLC_BIU_TRG"
  before insert or update
  on sie_25_versn_publc
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_25_versn_publc_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_25_versn_publc_biu_trg;
/


Prompt Trigger SIE_25_VERSN_PUBLC_BI_99_TRG;
/* Formatted on 04/12/2013 11:26:39 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_25_versn_publc_bi_99_trg
  before insert
  on sie_25_versn_publc
  for each row
begin
  if :new.dnr_ref_prodt is null then
    :new.dnr_ref_prodt := sie_07_sesn_pkg.gva_prodt_en_cours;
  end if;
end sie_25_versn_publc_bi_99_trg;
/


Prompt Trigger SIE_29_CONTR_BIUD_TRG;
/* Formatted on 04/12/2013 11:26:39 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_29_contr_biud_trg
  before insert or update or delete
  on sie_29_contr
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_29_contr_seq.nextval;
  end if;

  if inserting
  or updating then
    :new.code_contr := upper (:new.code_contr);
    sie_07_util_pkg.genr_valr_audit (inserting,
                                     updating,
                                     :new.utils_creat,
                                     :new.date_creat,
                                     :new.utils_modfc,
                                     :new.date_modfc);
  end if;
end sie_29_contr_biud_trg;
/


Prompt Trigger SIE_30_AFECT_ITEM_BIU_TRG;
/* Formatted on 04/12/2013 11:26:39 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_30_afect_item_biu_trg
  before insert or update
  on sie_30_afect_item
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_30_afect_item_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_30_afect_item_biu_trg;
/


Prompt Trigger SIE_30_CARNT_PRODT_BIU_TRG;
/* Formatted on 04/12/2013 11:26:39 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_30_carnt_prodt_biu_trg
  before insert or update
  on sie_30_carnt_aplic
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_30_carnt_prodt_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_30_carnt_prodt_biu_trg;
/


Prompt Trigger SIE_30_CARNT_SPRIN_BIU_TRG;
/* Formatted on 04/12/2013 11:26:39 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_30_carnt_sprin_biu_trg
  before insert or update
  on sie_30_carnt_sprin
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_30_carnt_sprin_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_30_carnt_sprin_biu_trg;
/


Prompt Trigger SIE_30_CARNT_SYSTM_BIU_TRG;
/* Formatted on 04/12/2013 11:26:39 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_30_carnt_systm_biu_trg
  before insert or update
  on sie_30_carnt_prodt
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_30_carnt_systm_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_30_carnt_systm_biu_trg;
/


Prompt Trigger SIE_30_CAS_UTILS_BIU_TRG;
/* Formatted on 04/12/2013 11:26:39 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_30_cas_utils_biu_trg
  before insert or update
  on sie_30_cas_utils
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_30_cas_utils_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);

  if inserting
  or (updating and :old.code != :new.code) then
    :new.code := upper (:new.code);
  end if;
end sie_30_cas_utils_biu_trg;
/


Prompt Trigger SIE_30_EFORT_ITEM_BIU_TRG;
/* Formatted on 04/12/2013 11:26:39 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_30_efort_item_biu_trg
  before insert or update
  on sie_30_efort_item
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_30_efort_item_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_30_efort_item_biu_trg;
/


Prompt Trigger SIE_30_HISTR_EFORT_RES_BIU_TRG;
/* Formatted on 04/12/2013 11:26:39 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_30_histr_efort_res_biu_trg
  before insert or update
  on sie_30_histr_efort_restn
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_30_histr_efort_restn_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_30_histr_efort_res_biu_trg;
/


Prompt Trigger SIE_30_ITEM_CARNT_PROD_BIU_TRG;
/* Formatted on 04/12/2013 11:26:39 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_30_item_carnt_prod_biu_trg
  before insert or update
  on sie_30_item_carnt_prodt
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_30_item_carnt_prodt_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_30_item_carnt_prod_biu_trg;
/


Prompt Trigger SIE_30_ITEM_CARNT_SPRI_BIU_TRG;
/* Formatted on 04/12/2013 11:26:39 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_30_item_carnt_spri_biu_trg
  before insert or update
  on sie_30_item_carnt_sprin
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_30_item_carnt_sprin_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_30_item_carnt_spri_biu_trg;
/


Prompt Trigger SIE_30_PAGE_BIU_TRG;
/* Formatted on 04/12/2013 11:26:39 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_30_page_biu_trg
  before insert or update
  on sie_30_page
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_30_page_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_30_page_biu_trg;
/


Prompt Trigger SIE_30_PAGE_ITEM_BIU_TRG;
/* Formatted on 04/12/2013 11:26:39 PM (QP5 v5.185.11230.41888) */
create or replace trigger sie_30_page_item_biu_trg
  before insert or update
  on sie_30_page_item
  for each row
begin
  if inserting and :new.seqnc is null then
    :new.seqnc := sie_30_page_item_seq.nextval;
  end if;

  sie_07_util_pkg.genr_valr_audit (inserting,
                                   updating,
                                   :new.utils_creat,
                                   :new.date_creat,
                                   :new.utils_modfc,
                                   :new.date_modfc);
end sie_30_page_item_biu_trg;
/


Prompt Trigger VD_SIE_01_MESG_AIDE_IOU_TRG;
/* Formatted on 04/12/2013 11:26:39 PM (QP5 v5.185.11230.41888) */
create or replace trigger vd_sie_01_mesg_aide_iou_trg
  instead of update
  on vd_sie_01_mesg_aide
  for each row
begin
  if :new.type_item in ('RAPRT', 'ITEM', 'BOUTN') then
    update   vd_i_sie_01_mesg_lang ml
       set   ml.mesg = :new.mesg
     where   seqnc = :new.seqnc_mesg_lang;
  elsif :new.type_item = 'PAGE' then
    update   vd_i_sie_13_regn_piltb_lang rpl
       set   rpl.contn = :new.mesg
     where   rpl.seqnc = :new.seqnc_mesg_lang;
  end if;
end vd_sie_01_mesg_aide_iou_trg;
/
