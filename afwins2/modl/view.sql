SET DEFINE OFF;
/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View SIE_29_AQ_APEX_ALIGN_RAPRT;

create or replace force view sie_29_aq_apex_align_raprt
(
  numr_aplic_apex,
  numr_page_apex,
  nom_raprt,
  libl_coln,
  type_don,
  entet_align,
  coln_align
) as
  select   air.flow_id,
           ai.page_id,
           ai.name,
           air.column_label,
           air.column_type,
           air.heading_alignment,
           air.column_alignment
    from   apex_ir ai,
           apex_ir_coln air
   where   ai.id = air.worksheet_id
       and air.heading_alignment != air.column_alignment
       and air.flow_id in (select   a.numr_aplic_apex
                             from   vd_sie_11_aplic a)
  union all
  select   arc.flow_id,
           ar.page_id,
           ar.plug_name,
           arc.column_heading,
           null,
           arc.heading_alignment,
           arc.column_alignment
    from   apex_regn ar,
           apex_regn_coln arc
   where   ar.id = arc.region_id
       and arc.heading_alignment != arc.column_alignment
       and arc.flow_id in (select   a.numr_aplic_apex
                             from   vd_sie_11_aplic a);


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View SIE_29_AQ_APEX_APLIC_RACRC_DCM;

create or replace force view sie_29_aq_apex_aplic_racrc_dcm
(
  numr_aplic_apex,
  nom_racrc
) as
  select   aas.flow_id,
           aas.shortcut_name
    from   apex_aplic_short aas
   where   aas.shortcut_name like '%DELETE_CONFIRM_MSG_%'
       and aas.flow_id in (select   a.numr_aplic_apex
                             from   vd_sie_11_aplic a);


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View SIE_29_AQ_APEX_ITEM_CACHE;

create or replace force view sie_29_aq_apex_item_cache
(
  numr_aplic_apex,
  numr_page_apex,
  nom_regn,
  seqnc_afich,
  nom_item
) as
  select   aip.flow_id,
           ar.page_id,
           ar.plug_name,
           aip.item_sequence,
           aip.name
    from   apex_regn ar,
           apex_item_page aip
   where   ar.page_id <> 0
       and ar.plug_name <> 'Items cachés'
       and ar.id = aip.item_plug_id
       and aip.display_as like '%HIDDEN%' 
	   and aip.flow_id in (select   a.numr_aplic_apex
                             from   vd_sie_11_aplic a);


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View SIE_29_AQ_APEX_ITEM_MAUVS_REGN;

create or replace force view sie_29_aq_apex_item_mauvs_regn
(
  numr_aplic_apex_item,
  numr_page_apex_item,
  seqnc_afich,
  nom_item,
  numr_aplic_apex_regn,
  numr_page_apex_regn,
  nom_regn
) as
  select   aip.flow_id,
           aip.flow_step_id,
           aip.item_sequence,
           aip.name,
           ar.flow_id,
           ar.page_id,
           ar.plug_name nom_regn
    from   apex_regn ar,
           apex_item_page aip
   where   ar.id = aip.item_plug_id
       and ar.flow_id <> aip.flow_id
       and aip.flow_id in (select   a.numr_aplic_apex
                             from   vd_sie_11_aplic a);


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View SIE_29_AQ_APEX_PAGE_AUTOR;

create or replace force view sie_29_aq_apex_page_autor
(
  numr_aplic_apex,
  numr_page_apex,
  nom_autor
) as
  select   ap.flow_id,
           ap.id,
           asa.name
    from   apex_page ap,
           apex_schem_autor asa
   where   asa.id = to_number (ap.required_role)
       and asa.flow_id = ap.flow_id
       and ap.flow_id in (select   a.numr_aplic_apex
                            from   vd_sie_11_aplic a);


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View SIE_29_AQ_APEX_PAGE_SANS_AUTOR;

create or replace force view sie_29_aq_apex_page_sans_autor
(
  numr_aplic_apex,
  numr_page_apex
) as
  select   ap.flow_id,
           ap.id
    from   apex_page ap
   where   ap.required_role is null
       and ap.flow_id in (select   a.numr_aplic_apex
                            from   vd_sie_11_aplic a);


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View SIE_29_AQ_BOUTN_DML_SANS_AUTOR;

create or replace force view sie_29_aq_boutn_dml_sans_autor
(
  numr_aplic_apex,
  numr_page_apex,
  nom_regn,
  seqnc_afich,
  reqt,
  libl,
  actio,
  actio_dml
) as
  select   abp.flow_id,
           ar.page_id,
           ar.plug_name nom_regn,
           abp.button_sequence seqnc_afich,
           abp.button_name reqt,
           abp.button_image_alt libl,
           abp.button_action actio,
           abp.database_action actio_dml
    from   apex_regn ar,
           apex_boutn_page abp
   where   abp.security_scheme is null
       and abp.database_action is not null
       and abp.button_plug_id = ar.id
       and abp.flow_id in (select   a.numr_aplic_apex
                             from   vd_sie_11_aplic a);


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View SIE_29_AQ_RAPRT_MESG_AUCUN_DON;

create or replace force view sie_29_aq_raprt_mesg_aucun_don
(
  numr_aplic_apex,
  numr_page_apex,
  nom_raprt,
  mesg
) as
  select   ai.flow_id,
           ai.page_id,
           ai.name,
           ai.no_data_found_message
    from   apex_ir ai
   where   (ai.no_data_found_message <> '&A_SIE_13_MESG_AUCUN_DON_TROUV.'
         or ai.no_data_found_message is null)
       and ai.flow_id in (select   a.numr_aplic_apex
                            from   vd_i_sie_11_aplic a)
  union
  select   ar.flow_id,
           ar.page_id,
           ar.plug_name,
           ar.plug_query_no_data_found
    from   apex_regn ar
   where   (ar.plug_query_no_data_found <> '&A_SIE_13_MESG_AUCUN_DON_TROUV.'
         or ar.plug_query_no_data_found is null)
       and ar.plug_source_type like '%SQL_QUERY%'
       and ar.flow_id in (select   a.numr_aplic_apex
                            from   vd_i_sie_11_aplic a);


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View SIE_29_AQ_RAPRT_MESG_TROP_DON;

create or replace force view sie_29_aq_raprt_mesg_trop_don
(
  numr_aplic_apex,
  numr_page_apex,
  nom_raprt,
  mesg
) as
  select   ai.flow_id,
           ai.page_id,
           ai.name,
           ai.max_row_count_message
    from   apex_ir ai
   where   (ai.max_row_count_message <> '&A_SIE_13_MESG_TROP_DON_TROUV.'
         or ai.max_row_count_message is null)
       and ai.flow_id in (select   a.numr_aplic_apex
                            from   vd_i_sie_11_aplic a)
  union
  select   ar.flow_id,
           ar.page_id,
           ar.plug_name,
           ar.plug_query_more_data
    from   apex_regn ar
   where   (ar.plug_query_more_data <> '&A_SIE_13_MESG_TROP_DON_TROUV.'
         or ar.plug_query_more_data is null)
       and ar.plug_source_type like '%SQL_QUERY%'
       and ar.flow_id in (select   a.numr_aplic_apex
                            from   vd_i_sie_11_aplic a);


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VDF_SIE_12_MEMBR_STRUC;

create or replace force view vdf_sie_12_membr_struc
(
  seqnc,
  ref_utils,
  ref_utils_formt,
  date_expir_utils,
  ref_struc_admin,
  ref_respn_struc_admin,
  date_debut_efect,
  date_fin_efect,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   seqnc,
           ref_utils,
           ref_utils_formt,
           date_expir_utils,
           ref_struc_admin,
           ref_respn_struc_admin,
           date_debut_efect,
           date_fin_efect,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc
    from   vd_sie_12_membr_struc
   where   ref_utils = (select   sie_12_utils_pkg.obten_usagr_conct
                          from   vd_i_sie_12_utils
                         where   rownum = 1)
       and date_debut_efect <= sysdate
       and (date_fin_efect is null
         or date_fin_efect > sysdate);


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_01_ATRIB_MODL_COMNC;

create or replace force view vd_i_sie_01_atrib_modl_comnc
(
  seqnc,
  code,
  nom,
  descr,
  ref_modl_comnc,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   "SEQNC",
           "CODE",
           "NOM",
           "DESCR",
           "REF_MODL_COMNC",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC"
    from   sie_01_atrib_modl_comnc;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_01_CODE_ERR_ORACL;

create or replace force view vd_i_sie_01_code_err_oracl
(
  seqnc,
  err_code,
  utils_creat,
  date_creat,
  date_modfc,
  utils_modfc,
  libl
) as
  select   "SEQNC",
           "ERR_CODE",
           "UTILS_CREAT",
           "DATE_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "LIBL"
    from   sie_01_code_err_oracl;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_01_CONFG_EVENM_NOTFB;

create or replace force view vd_i_sie_01_confg_evenm_notfb
(
  seqnc,
  ref_type_comnc,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  objet,
  titre_mesg,
  mesg_sms,
  mesg,
  ref_evenm_notfb,
  nom,
  descr,
  ref_domn,
  ref_compt_twili,
  ref_profl_courl,
  indic_deft
) as
  select   "SEQNC",
           "REF_TYPE_COMNC",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "OBJET",
           "TITRE_MESG",
           "MESG_SMS",
           "MESG",
           "REF_EVENM_NOTFB",
           "NOM",
           "DESCR",
           "REF_DOMN",
           "REF_COMPT_TWILI",
           "REF_PROFL_COURL",
           "INDIC_DEFT"
    from   sie_01_confg_evenm_notfb;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_01_DESTN;

create or replace force view vd_i_sie_01_destn
(
  seqnc,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_atrib_struc_aplic,
  descr,
  dnr_ref_prodt
) as
  select   "SEQNC",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "REF_ATRIB_STRUC_APLIC",
           "DESCR",
           "DNR_REF_PRODT"
    from   sie_01_destn;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_01_DESTN_CONFG_EN;

create or replace force view vd_i_sie_01_destn_confg_en
(
  seqnc,
  ref_dv_natr_destn,
  ref_confg_evenm_notfb,
  ref_destn,
  utils_creat,
  date_modfc,
  utils_modfc,
  date_creat,
  ref_reslt_destn,
  ref_atrib_sa_nom_formt,
  ref_atrib_sa_adres_destn
) as
  select   "SEQNC",
           "REF_DV_NATR_DESTN",
           "REF_CONFG_EVENM_NOTFB",
           "REF_DESTN",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "DATE_CREAT",
           "REF_RESLT_DESTN",
           "REF_ATRIB_SA_NOM_FORMT",
           "REF_ATRIB_SA_ADRES_DESTN"
    from   sie_01_destn_confg_evenm_notfb;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_01_ELEMN_CONFG_EN;

create or replace force view vd_i_sie_01_elemn_confg_en
(
  seqnc,
  ref_confg_evenm_notfb,
  code,
  ident_acces,
  ident_acces_formt,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  formt
) as
  select   "SEQNC",
           "REF_CONFG_EVENM_NOTFB",
           "CODE",
           "IDENT_ACCES",
           "IDENT_ACCES_FORMT",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "FORMT"
    from   sie_01_elemn_confg_evenm_notfb;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_01_EVENM_NOTFB;

create or replace force view vd_i_sie_01_evenm_notfb
(
  seqnc,
  code,
  nom,
  descr,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_struc_aplic,
  dnr_ref_prodt
) as
  select   "SEQNC",
           "CODE",
           "NOM",
           "DESCR",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "REF_STRUC_APLIC",
           "DNR_REF_PRODT"
    from   sie_01_evenm_notfb;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_01_HIERC_APLIC;

create or replace force view vd_i_sie_01_hierc_aplic
(
  seqnc,
  ref_evenm_notfb,
  aplic_prior,
  ref_atrib_struc_aplic,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  dnr_ref_prodt
) as
  select   "SEQNC",
           "REF_EVENM_NOTFB",
           "APLIC_PRIOR",
           "REF_ATRIB_STRUC_APLIC",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "DNR_REF_PRODT"
    from   sie_01_hierc_aplic;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_01_LANG;

create or replace force view vd_i_sie_01_lang
(
  seqnc,
  code,
  nom,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   "SEQNC",
           "CODE",
           "NOM",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC"
    from   sie_01_lang;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_01_LANG_LANG;

create or replace force view vd_i_sie_01_lang_lang
(
  seqnc,
  ref_lang,
  nom,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_lang_cible
) as
  select   "SEQNC",
           "REF_LANG",
           "NOM",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "REF_LANG_CIBLE"
    from   sie_01_lang_lang;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_01_MESG;

create or replace force view vd_i_sie_01_mesg
(
  seqnc,
  numr_mesg,
  ref_prodt,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  descr,
  type_mesg,
  dnr_ref_prodt
) as
  select   "SEQNC",
           "NUMR_MESG",
           "REF_PRODT",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "DESCR",
           "TYPE_MESG",
           "DNR_REF_PRODT"
    from   sie_01_mesg;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_01_MESG_ERR_LIE;

create or replace force view vd_i_sie_01_mesg_err_lie
(
  seqnc,
  nom_table,
  nom_coln,
  nom_contr,
  page,
  comnt,
  ref_prodt,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  type_liais,
  ref_mesg,
  dnr_ref_prodt,
  ref_code_err_oracl
) as
  select   "SEQNC",
           "NOM_TABLE",
           "NOM_COLN",
           "NOM_CONTR",
           "PAGE",
           "COMNT",
           "REF_PRODT",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "TYPE_LIAIS",
           "REF_MESG",
           "DNR_REF_PRODT",
           "REF_CODE_ERR_ORACL"
    from   sie_01_mesg_err_lie;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_01_MESG_INFOR;

create or replace force view vd_i_sie_01_mesg_infor
(
  seqnc,
  text_mesg,
  utils_creat,
  date_creat,
  sess_id,
  ref_utils,
  ref_mesg_lang
) as
  select   "SEQNC",
           "TEXT_MESG",
           "UTILS_CREAT",
           "DATE_CREAT",
           "SESS_ID",
           "REF_UTILS",
           "REF_MESG_LANG"
    from   sie_01_mesg_infor;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_01_MESG_LANG;

create or replace force view vd_i_sie_01_mesg_lang
(
  seqnc,
  mesg,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_lang,
  ref_mesg,
  dnr_ref_prodt
) as
  select   "SEQNC",
           "MESG",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "REF_LANG",
           "REF_MESG",
           "DNR_REF_PRODT"
    from   sie_01_mesg_lang;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_01_MESG_TRADC_APEX;

create or replace force view vd_i_sie_01_mesg_tradc_apex
(
  seqnc,
  nom,
  text,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_lang,
  ref_prodt,
  dnr_ref_prodt
) as
  select   "SEQNC",
           "NOM",
           "TEXT",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "REF_LANG",
           "REF_PRODT",
           "DNR_REF_PRODT"
    from   sie_01_mesg_tradc_apex;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_01_MODL_AFICH_NOTFC;

create or replace force view vd_i_sie_01_modl_afich_notfc
(
  seqnc,
  code,
  nom,
  descr,
  coulr_texte,
  tail_texte,
  coulr_titre,
  tail_titre,
  temps_afich,
  ref_resrc_icon,
  ref_formt_resrc_icon,
  ref_ocurn_resrc_icon,
  ref_domn,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_type_comnc,
  ref_modl_comnc
) as
  select   "SEQNC",
           "CODE",
           "NOM",
           "DESCR",
           "COULR_TEXTE",
           "TAIL_TEXTE",
           "COULR_TITRE",
           "TAIL_TITRE",
           "TEMPS_AFICH",
           "REF_RESRC_ICON",
           "REF_FORMT_RESRC_ICON",
           "REF_OCURN_RESRC_ICON",
           "REF_DOMN",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "REF_TYPE_COMNC",
           "REF_MODL_COMNC"
    from   sie_01_modl_afich_notfc;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_01_MODL_COMNC;

create or replace force view vd_i_sie_01_modl_comnc
(
  seqnc,
  code,
  nom,
  descr,
  ref_type_comnc,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  indic_systm,
  ref_domn
) as
  select   "SEQNC",
           "CODE",
           "NOM",
           "DESCR",
           "REF_TYPE_COMNC",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "INDIC_SYSTM",
           "REF_DOMN"
    from   sie_01_modl_comnc;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_01_MODL_MESG_NOTFC;

create or replace force view vd_i_sie_01_modl_mesg_notfc
(
  seqnc,
  code,
  nom,
  descr,
  objet,
  ref_domn,
  corps_mesg
) as
  select   "SEQNC",
           "CODE",
           "NOM",
           "DESCR",
           "OBJET",
           "REF_DOMN",
           "CORPS_MESG"
    from   sie_01_modl_mesg_notfc;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_01_NOTFC;

create or replace force view vd_i_sie_01_notfc
(
  seqnc,
  code,
  nom,
  descr,
  inden_mesg,
  titre_mesg,
  mesg,
  ref_modl_afich_notfc,
  indic_specf,
  indic_afich_uniq,
  ref_domn,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   "SEQNC",
           "CODE",
           "NOM",
           "DESCR",
           "INDEN_MESG",
           "TITRE_MESG",
           "MESG",
           "REF_MODL_AFICH_NOTFC",
           "INDIC_SPECF",
           "INDIC_AFICH_UNIQ",
           "REF_DOMN",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC"
    from   sie_01_notfc;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_01_OSA_EVENM_NOTFB;

create or replace force view vd_i_sie_01_osa_evenm_notfb
(
  seqnc,
  ref_hierc_aplic,
  ref_confg_evenm_notfb,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_seqnc_struc_aplic
) as
  select   "SEQNC",
           "REF_HIERC_APLIC",
           "REF_CONFG_EVENM_NOTFB",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "REF_SEQNC_STRUC_APLIC"
    from   sie_01_ocurn_sa_evenm_notfb;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_01_RESLT_DESTN;

create or replace force view vd_i_sie_01_reslt_destn
(
  seqnc,
  ref_destn,
  dnr_ref_prodt,
  ident_acces,
  ident_acces_formt,
  utils_creat,
  date_creat,
  utils_modfc,
  date_modfc,
  nom,
  ref_struc_aplic_acces
) as
  select   "SEQNC",
           "REF_DESTN",
           "DNR_REF_PRODT",
           "IDENT_ACCES",
           "IDENT_ACCES_FORMT",
           "UTILS_CREAT",
           "DATE_CREAT",
           "UTILS_MODFC",
           "DATE_MODFC",
           "NOM",
           "REF_STRUC_APLIC_ACCES"
    from   sie_01_reslt_destn;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_01_TYPE_COMNC;

create or replace force view vd_i_sie_01_type_comnc
(
  seqnc,
  code,
  nom,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   "SEQNC",
           "CODE",
           "NOM",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC"
    from   sie_01_type_comnc;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_03_CLAS_INTER;

create or replace force view vd_i_sie_03_clas_inter
(
  seqnc,
  code,
  nom,
  descr,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_prodt,
  ref_profl_courl,
  indic_avert_autr_uniq
) as
  select   "SEQNC",
           "CODE",
           "NOM",
           "DESCR",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "REF_PRODT",
           "REF_PROFL_COURL",
           "INDIC_AVERT_AUTR_UNIQ"
    from   sie_03_clas_inter;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_03_JOURN;

create or replace force view vd_i_sie_03_journ
(
  date_heure,
  expli,
  ereur,
  pile_trace,
  travl
) as
  select   "DATE_HEURE",
           "EXPLI",
           "EREUR",
           "PILE_TRACE",
           "TRAVL"
    from   sie_03_journ;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_03_JOURN_STRUC_APLIC;

create or replace force view vd_i_sie_03_journ_struc_aplic
(
  seqnc,
  ref_domn,
  struc_aplic,
  seqnc_struc_aplic,
  date_time,
  numr_err,
  actio_journ,
  don_nomnl,
  reslt,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   "SEQNC",
           "REF_DOMN",
           "STRUC_APLIC",
           "SEQNC_STRUC_APLIC",
           "DATE_TIME",
           "NUMR_ERR",
           "ACTIO_JOURN",
           "DON_NOMNL",
           "RESLT",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC"
    from   sie_03_journ_struc_aplic;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_03_LIEN_CLAS_INTER_UT;

create or replace force view vd_i_sie_03_lien_clas_inter_ut
(
  seqnc,
  ref_clas_inter,
  ref_utils,
  date_debut_efect,
  date_fin_efect,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_group_utils
) as
  select   "SEQNC",
           "REF_CLAS_INTER",
           "REF_UTILS",
           "DATE_DEBUT_EFECT",
           "DATE_FIN_EFECT",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "REF_GROUP_UTILS"
    from   sie_03_lien_clas_inter_utils;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_04_CONTX;

create or replace force view vd_i_sie_04_contx
(
  ref_fil_arian,
  contx,
  actio,
  seqnc_contx,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  contx_inter,
  actio_inter,
  seqnc_contx_inter,
  indic_ignor,
  nom_procd_infor_suplm,
  infor_suplm,
  contx_formt
) as
  select   "REF_FIL_ARIAN",
           "CONTX",
           "ACTIO",
           "SEQNC_CONTX",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "CONTX_INTER",
           "ACTIO_INTER",
           "SEQNC_CONTX_INTER",
           "INDIC_IGNOR",
           "NOM_PROCD_INFOR_SUPLM",
           "INFOR_SUPLM",
           "CONTX_FORMT"
    from   sie_04_contx;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_04_CONTX_ETEND;

create or replace force view vd_i_sie_04_contx_etend
(
  seqnc,
  ref_contx,
  nom,
  valr_numbr,
  valr_varch,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  page_cible,
  type_alimn,
  type_elemn
) as
  select   "SEQNC",
           "REF_CONTX",
           "NOM",
           "VALR_NUMBR",
           "VALR_VARCH",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "PAGE_CIBLE",
           "TYPE_ALIMN",
           "TYPE_ELEMN"
    from   sie_04_contx_etend;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_04_FIL_ARIAN;

create or replace force view vd_i_sie_04_fil_arian
(
  seqnc,
  page,
  session_id,
  ref_elemn_sup,
  libl,
  timst,
  date_creat,
  utils_creat,
  app_id,
  hash_dernr_url,
  indic_afich,
  ref_navgt_histr,
  aplic
) as
  select   "SEQNC",
           "PAGE",
           "SESSION_ID",
           "REF_ELEMN_SUP",
           "LIBL",
           "TIMST",
           "DATE_CREAT",
           "UTILS_CREAT",
           "APP_ID",
           "HASH_DERNR_URL",
           "INDIC_AFICH",
           "REF_NAVGT_HISTR",
           "APLIC"
    from   sie_04_fil_arian;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_04_FIL_ARIAN_HISTR;

create or replace force view vd_i_sie_04_fil_arian_histr
(
  seqnc,
  page,
  session_id,
  ref_elemn_sup,
  libl,
  timst,
  date_creat,
  utils_creat,
  app_id,
  hash_dernr_url,
  indic_afich,
  ref_navgt_histr,
  aplic
) as
  select   "SEQNC",
           "PAGE",
           "SESSION_ID",
           "REF_ELEMN_SUP",
           "LIBL",
           "TIMST",
           "DATE_CREAT",
           "UTILS_CREAT",
           "APP_ID",
           "HASH_DERNR_URL",
           "INDIC_AFICH",
           "REF_NAVGT_HISTR",
           "APLIC"
    from   sie_04_fil_arian;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_04_NAVGT_HISTR;

create or replace force view vd_i_sie_04_navgt_histr
(
  seqnc,
  ref_utils,
  dnr_libl,
  dnr_url,
  dnr_icon,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   "SEQNC",
           "REF_UTILS",
           "DNR_LIBL",
           "DNR_URL",
           "DNR_ICON",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC"
    from   sie_04_navgt_histr;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_07_AUDIT_STRUC_APLIC;

create or replace force view vd_i_sie_07_audit_struc_aplic
(
  seqnc,
  ref_utils,
  ref_seqnc_struc_aplic,
  dnr_ref_seqnc_sa_formt,
  ref_struc_aplic,
  ref_actio_audit,
  ref_page,
  natr_audit,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_domn
) as
  select   "SEQNC",
           "REF_UTILS",
           "REF_SEQNC_STRUC_APLIC",
           "DNR_REF_SEQNC_SA_FORMT",
           "REF_STRUC_APLIC",
           "REF_ACTIO_AUDIT",
           "REF_PAGE",
           "NATR_AUDIT",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "REF_DOMN"
    from   sie_07_audit_struc_aplic;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_07_ETAT_SESN;

create or replace force view vd_i_sie_07_etat_sesn
(
  seqnc,
  session_id,
  nom,
  valr,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   "SEQNC",
           "SESSION_ID",
           "NOM",
           "VALR",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC"
    from   sie_07_etat_sesn;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_07_INSTA_SEMPH;

create or replace force view vd_i_sie_07_insta_semph
(
  seqnc,
  ref_semph,
  id_sesn,
  date_creat,
  utils_creat,
  indic_seqnc,
  page_perst
) as
  select   "SEQNC",
           "REF_SEMPH",
           "ID_SESN",
           "DATE_CREAT",
           "UTILS_CREAT",
           "INDIC_SEQNC",
           "PAGE_PERST"
    from   sie_07_insta_semph;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_07_SEMPH;

create or replace force view vd_i_sie_07_semph
(
  seqnc,
  code,
  varbl1,
  varbl2,
  varbl3,
  date_creat,
  utils_creat,
  indic_exclu
) as
  select   "SEQNC",
           "CODE",
           "VARBL1",
           "VARBL2",
           "VARBL3",
           "DATE_CREAT",
           "UTILS_CREAT",
           "INDIC_EXCLU"
    from   sie_07_semph;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_07_VALR_AUDIT_STR_APL;

create or replace force view vd_i_sie_07_valr_audit_str_apl
(
  seqnc,
  ref_audit_struc_aplic,
  code,
  valr_formt,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   "SEQNC",
           "REF_AUDIT_STRUC_APLIC",
           "CODE",
           "VALR_FORMT",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC"
    from   sie_07_valr_audit_struc_aplic;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_11_APLIC;

create or replace force view vd_i_sie_11_aplic
(
  seqnc,
  code,
  nom,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  numr_aplic_apex,
  date_dernr_maj_refrn_apex,
  ref_versn,
  indic_aplic_authe,
  ref_aplic_authe,
  ref_page_conxn,
  ref_page_acuei,
  ref_prodt,
  dnr_ref_prodt
) as
  select   seqnc,
           code,
           nom,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           numr_aplic_apex,
           date_dernr_maj_refrn_apex,
           ref_versn,
           indic_aplic_authe,
           ref_aplic_authe,
           ref_page_conxn,
           ref_page_acuei,
           ref_prodt,
           dnr_ref_prodt
    from   sie_11_aplic;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_11_ATRIB_ENTIT;

create or replace force view vd_i_sie_11_atrib_entit
(
  seqnc,
  nom,
  type_don,
  compr_migrt,
  ref_entit,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  dnr_ref_prodt,
  code,
  ref_entit_refrn,
  indic_nouvl_atrib
) as
  select   "SEQNC",
           "NOM",
           "TYPE_DON",
           "COMPR_MIGRT",
           "REF_ENTIT",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "DNR_REF_PRODT",
           "CODE",
           "REF_ENTIT_REFRN",
           "INDIC_NOUVL_ATRIB"
    from   sie_11_atrib_entit;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_11_ENTIT;

create or replace force view vd_i_sie_11_entit
(
  seqnc,
  nom,
  nom_table_tempr,
  nom_table_ereur,
  indic_creer_ocurn,
  indic_modif_ocurn,
  indic_suprm_ocurn,
  ref_versn,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ordre_exect,
  dnr_ref_prodt,
  code,
  indic_force_selct,
  longr_bloc,
  indic_nouvl_entit,
  niv_inclu_migrt,
  confg_inclu_migrt,
  ref_atrib_entit_supr,
  indic_expor_tabl_index,
  indic_suprm_don_prodt
) as
  select   "SEQNC",
           "NOM",
           "NOM_TABLE_TEMPR",
           "NOM_TABLE_EREUR",
           "INDIC_CREER_OCURN",
           "INDIC_MODIF_OCURN",
           "INDIC_SUPRM_OCURN",
           "REF_VERSN",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "ORDRE_EXECT",
           "DNR_REF_PRODT",
           "CODE",
           "INDIC_FORCE_SELCT",
           "LONGR_BLOC",
           "INDIC_NOUVL_ENTIT",
           "NIV_INCLU_MIGRT",
           "CONFG_INCLU_MIGRT",
           "REF_ATRIB_ENTIT_SUPR",
           "INDIC_EXPOR_TABL_INDEX",
           "INDIC_SUPRM_DON_PRODT"
    from   sie_11_entit;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_11_PARMT_AFW;

create or replace force view vd_i_sie_11_parmt_afw
(
  seqnc,
  code,
  valr,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   seqnc,
           code,
           valr,
           utils_creat,
           date_creat,
           utils_modfc,
           date_modfc
    from   sie_11_parmt_afw;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_11_PLUGN;

create or replace force view vd_i_sie_11_plugn
(
  seqnc,
  code_inter,
  nom,
  utils_creat,
  date_modfc,
  utils_modfc,
  date_creat,
  descr,
  ref_versn
) as
  select   "SEQNC",
           "CODE_INTER",
           "NOM",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "DATE_CREAT",
           "DESCR",
           "REF_VERSN"
    from   sie_11_plugn;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_11_PRODT;

create or replace force view vd_i_sie_11_prodt
(
  seqnc,
  code,
  nom,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  procd_expor_metdn,
  tail_tabl_extra,
  indic_extra_tout,
  ref_group_utils_admin,
  dosr_fichr,
  ident_envir,
  ref_versn,
  mesg_tout_droit_resrv,
  jquer_ui_css_scope,
  indic_afich_err_code,
  ref_mesg_sucs,
  ref_mesg_echec,
  ref_mesg_fetch,
  ref_mesg_range_suprm,
  ref_mesg_range_modf,
  ref_mesg_range_inser,
  ref_mesg_aucun_don_trouv,
  ref_mesg_trop_don_trouv,
  ref_mesg_audit_creat,
  ref_mesg_audit_modfc,
  ref_mesg_audit_suprs,
  fonct_obten_base_url,
  ref_aplic_acuei,
  ref_page_acuei,
  ref_aplic_comnt_bogue,
  ref_page_comnt_bogue,
  indic_page_inexs_maj_refrn,
  procd_impre_entet_pdf_ir,
  procd_impre_pied_page_pdf_ir,
  procd_plpdf_coulr,
  compt_genrl
) as
  select   "SEQNC",
           "CODE",
           "NOM",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "PROCD_EXPOR_METDN",
           "TAIL_TABL_EXTRA",
           "INDIC_EXTRA_TOUT",
           "REF_GROUP_UTILS_ADMIN",
           "DOSR_FICHR",
           "IDENT_ENVIR",
           "REF_VERSN",
           "MESG_TOUT_DROIT_RESRV",
           "JQUER_UI_CSS_SCOPE",
           "INDIC_AFICH_ERR_CODE",
           "REF_MESG_SUCS",
           "REF_MESG_ECHEC",
           "REF_MESG_FETCH",
           "REF_MESG_RANGE_SUPRM",
           "REF_MESG_RANGE_MODF",
           "REF_MESG_RANGE_INSER",
           "REF_MESG_AUCUN_DON_TROUV",
           "REF_MESG_TROP_DON_TROUV",
           "REF_MESG_AUDIT_CREAT",
           "REF_MESG_AUDIT_MODFC",
           "REF_MESG_AUDIT_SUPRS",
           "FONCT_OBTEN_BASE_URL",
           "REF_APLIC_ACUEI",
           "REF_PAGE_ACUEI",
           "REF_APLIC_COMNT_BOGUE",
           "REF_PAGE_COMNT_BOGUE",
           "INDIC_PAGE_INEXS_MAJ_REFRN",
           "PROCD_IMPRE_ENTET_PDF_IR",
           "PROCD_IMPRE_PIED_PAGE_PDF_IR",
           "PROCD_PLPDF_COULR",
           "COMPT_GENRL"
    from   sie_11_prodt;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_11_PRODT_LANG;

create or replace force view vd_i_sie_11_prodt_lang
(
  seqnc,
  ref_prodt,
  ref_lang,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   "SEQNC",
           "REF_PRODT",
           "REF_LANG",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC"
    from   sie_11_prodt_lang;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_11_PRODT_RESRC;

create or replace force view vd_i_sie_11_prodt_resrc
(
  seqnc,
  ref_prodt,
  ref_resrc,
  ref_formt,
  ref_condt_exect,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_plugn
) as
  select   "SEQNC",
           "REF_PRODT",
           "REF_RESRC",
           "REF_FORMT",
           "REF_CONDT_EXECT",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "REF_PLUGN"
    from   sie_11_prodt_resrc;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_11_UTILS;

create or replace force view vd_i_sie_11_utils
(
  seqnc,
  ref_prodt,
  ref_utils,
  role,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   "SEQNC",
           "REF_PRODT",
           "REF_UTILS",
           "ROLE",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC"
    from   sie_11_utils;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_11_VERSN;

create or replace force view vd_i_sie_11_versn
(
  seqnc,
  numr_versn_1,
  numr_versn_2,
  numr_versn_3,
  numr_versn_4,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_prodt,
  indic_docmn_verl,
  nom,
  ref_plugn,
  code,
  dnr_ref_prodt,
  ref_aplic,
  dnr_ref_aplic
) as
  select   "SEQNC",
           "NUMR_VERSN_1",
           "NUMR_VERSN_2",
           "NUMR_VERSN_3",
           "NUMR_VERSN_4",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "REF_PRODT",
           "INDIC_DOCMN_VERL",
           "NOM",
           "REF_PLUGN",
           "CODE",
           "DNR_REF_PRODT",
           "REF_APLIC",
           "DNR_REF_APLIC"
    from   sie_11_versn;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_12_ACTIO_AUDIT;

create or replace force view vd_i_sie_12_actio_audit
(
  seqnc,
  ref_struc_aplic,
  dnr_ref_prodt,
  code,
  nom,
  ref_mesg,
  descr,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   "SEQNC",
           "REF_STRUC_APLIC",
           "DNR_REF_PRODT",
           "CODE",
           "NOM",
           "REF_MESG",
           "DESCR",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC"
    from   sie_12_actio_audit;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_12_ARBRE;

create or replace force view vd_i_sie_12_arbre
(
  seqnc,
  noeud_actif,
  ref_sesn,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  indic_rafrc,
  id_apex_regn
) as
  select   "SEQNC",
           "NOEUD_ACTIF",
           "REF_SESN",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "INDIC_RAFRC",
           "ID_APEX_REGN"
    from   sie_12_arbre;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_12_ARBRE_NOEUD;

create or replace force view vd_i_sie_12_arbre_noeud
(
  seqnc,
  ref_arbre,
  noeud_ouver,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   "SEQNC",
           "REF_ARBRE",
           "NOEUD_OUVER",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC"
    from   sie_12_arbre_noeud;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_12_ATRIB_STRUC_APLIC;

create or replace force view vd_i_sie_12_atrib_struc_aplic
(
  seqnc,
  nom_coln,
  nom_fonct,
  ref_dv_natr_infor,
  indic_valid,
  ref_struc_aplic,
  ref_atrib_struc_aplic,
  indic_destn,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  dnr_ref_prodt
) as
  select   "SEQNC",
           "NOM_COLN",
           "NOM_FONCT",
           "REF_DV_NATR_INFOR",
           "INDIC_VALID",
           "REF_STRUC_APLIC",
           "REF_ATRIB_STRUC_APLIC",
           "INDIC_DESTN",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "DNR_REF_PRODT"
    from   sie_12_atrib_struc_aplic;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_12_COMPT_PAYPL;

create or replace force view vd_i_sie_12_compt_paypl
(
  seqnc,
  nom,
  ref_domn,
  url_boutn,
  signt_boutn,
  nom_utils_boutn,
  mot_passe_boutn,
  versn_api_boutn,
  url_retr,
  signt_retr,
  reprt_walt,
  mot_passe_walt,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  procd_redrc_url
) as
  select   "SEQNC",
           "NOM",
           "REF_DOMN",
           "URL_BOUTN",
           "SIGNT_BOUTN",
           "NOM_UTILS_BOUTN",
           "MOT_PASSE_BOUTN",
           "VERSN_API_BOUTN",
           "URL_RETR",
           "SIGNT_RETR",
           "REPRT_WALT",
           "MOT_PASSE_WALT",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "PROCD_REDRC_URL"
    from   sie_12_compt_paypl;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_12_DEFNT_ACCES;

create or replace force view vd_i_sie_12_defnt_acces
(
  seqnc,
  ref_group_utils,
  ref_utils,
  indic_acces,
  indic_modfc,
  indic_suprs,
  indic_creat,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_opert,
  ref_struc_aplic,
  dnr_ref_prodt
) as
  select   "SEQNC",
           "REF_GROUP_UTILS",
           "REF_UTILS",
           "INDIC_ACCES",
           "INDIC_MODFC",
           "INDIC_SUPRS",
           "INDIC_CREAT",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "REF_OPERT",
           "REF_STRUC_APLIC",
           "DNR_REF_PRODT"
    from   sie_12_defnt_acces;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_12_DETL_FORML;

create or replace force view vd_i_sie_12_detl_forml
(
  seqnc,
  enonc,
  ordre_presn,
  ref_forml,
  ref_formt_repns,
  ref_domn_valr,
  ref_seqnc_objet,
  code_objet,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   "SEQNC",
           "ENONC",
           "ORDRE_PRESN",
           "REF_FORML",
           "REF_FORMT_REPNS",
           "REF_DOMN_VALR",
           "REF_SEQNC_OBJET",
           "CODE_OBJET",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC"
    from   sie_12_detl_forml;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_12_DOMN;

create or replace force view vd_i_sie_12_domn
(
  seqnc,
  code,
  nom,
  descr,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  type_travl_deft,
  ref_profl_courl_notfc,
  ref_profl_sms_notfc,
  ref_compt_axiat_deft,
  ref_modl_rechr_deft,
  procd_authe_exter_afw,
  indic_demnd_activ_compt_utils,
  procd_vald_niv_secrt_mot_passe
) as
  select   "SEQNC",
           "CODE",
           "NOM",
           "DESCR",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "TYPE_TRAVL_DEFT",
           "REF_PROFL_COURL_NOTFC",
           "REF_PROFL_SMS_NOTFC",
           "REF_COMPT_AXIAT_DEFT",
           "REF_MODL_RECHR_DEFT",
           "PROCD_AUTHE_EXTER_AFW",
           "INDIC_DEMND_ACTIV_COMPT_UTILS",
           "PROCD_VALD_NIV_SECRT_MOT_PASSE"
    from   sie_12_domn;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_12_DOMN_FONCT;

create or replace force view vd_i_sie_12_domn_fonct
(
  seqnc,
  ref_fonct,
  ref_domn,
  indic_actif,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   seqnc,
           ref_fonct,
           ref_domn,
           indic_actif,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc
    from   sie_12_domn_fonct;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_12_DOMN_UTILS;

create or replace force view vd_i_sie_12_domn_utils
(
  seqnc,
  ref_utils,
  ref_domn,
  date_debut_efect,
  date_fin_efect,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   "SEQNC",
           "REF_UTILS",
           "REF_DOMN",
           "DATE_DEBUT_EFECT",
           "DATE_FIN_EFECT",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC"
    from   sie_12_domn_utils;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_12_EVOLT_STAT;

create or replace force view vd_i_sie_12_evolt_stat
(
  seqnc,
  ref_stat,
  ref_stat_evolt,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  indic_code,
  dnr_ref_prodt
) as
  select   "SEQNC",
           "REF_STAT",
           "REF_STAT_EVOLT",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "INDIC_CODE",
           "DNR_REF_PRODT"
    from   sie_12_evolt_stat;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_12_FAVR;

create or replace force view vd_i_sie_12_favr
(
  seqnc,
  ref_struc_aplic,
  ref_seqnc_struc_aplic,
  ref_utils,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   "SEQNC",
           "REF_STRUC_APLIC",
           "REF_SEQNC_STRUC_APLIC",
           "REF_UTILS",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC"
    from   sie_12_favr;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_12_FONCT;

create or replace force view vd_i_sie_12_fonct
(
  seqnc,
  ref_prodt,
  code,
  nom,
  descr,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  dnr_ref_prodt
) as
  select   seqnc,
           ref_prodt,
           code,
           nom,
           descr,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           dnr_ref_prodt
    from   sie_12_fonct;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_12_FONCT_STRUC_APLIC;

create or replace force view vd_i_sie_12_fonct_struc_aplic
(
  seqnc,
  ref_fonct,
  ref_struc_aplic,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  dnr_ref_prodt
) as
  select   seqnc,
           ref_fonct,
           ref_struc_aplic,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           dnr_ref_prodt
    from   sie_12_fonct_struc_aplic;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_12_FORML;

create or replace force view vd_i_sie_12_forml
(
  seqnc,
  code,
  nom,
  descr,
  ref_sesn,
  objet_refrn,
  ref_seqnc_objet_refrn,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   "SEQNC",
           "CODE",
           "NOM",
           "DESCR",
           "REF_SESN",
           "OBJET_REFRN",
           "REF_SEQNC_OBJET_REFRN",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC"
    from   sie_12_forml;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_12_GROUP_STAT;

create or replace force view vd_i_sie_12_group_stat
(
  seqnc,
  ref_prodt,
  code,
  nom,
  descr,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  dnr_ref_prodt
) as
  select   "SEQNC",
           "REF_PRODT",
           "CODE",
           "NOM",
           "DESCR",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "DNR_REF_PRODT"
    from   sie_12_group_stat;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_12_GROUP_UTILS;

create or replace force view vd_i_sie_12_group_utils
(
  seqnc,
  nom,
  descr,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_prodt,
  code,
  indic_ignor_group_admin,
  indic_systm,
  dnr_ref_prodt,
  ref_domn,
  indic_acces_globl
) as
  select   "SEQNC",
           "NOM",
           "DESCR",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "REF_PRODT",
           "CODE",
           "INDIC_IGNOR_GROUP_ADMIN",
           "INDIC_SYSTM",
           "DNR_REF_PRODT",
           "REF_DOMN",
           "INDIC_ACCES_GLOBL"
    from   sie_12_group_utils;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_12_G_U_OPERT_OPT_DOM;

create or replace force view vd_i_sie_12_g_u_opert_opt_dom
(
  seqnc,
  ref_group_utils,
  ref_opert,
  ref_opert_optio,
  ref_domn,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   seqnc,
           ref_group_utils,
           ref_opert,
           ref_opert_optio,
           ref_domn,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc
    from   sie_12_gr_ut_opert_optio_domn;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_12_HISTR_ACCES;

create or replace force view vd_i_sie_12_histr_acces
(
  seqnc,
  ref_utils,
  date_evenm,
  ref_dv_type_evenm,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  adres_ip,
  ref_utils_pour
) as
  select   "SEQNC",
           "REF_UTILS",
           "DATE_EVENM",
           "REF_DV_TYPE_EVENM",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "ADRES_IP",
           "REF_UTILS_POUR"
    from   sie_12_histr_acces;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_12_LIEN_GROUP_UTILS;

create or replace force view vd_i_sie_12_lien_group_utils
(
  seqnc,
  ref_group,
  ref_utils,
  date_debut_efect,
  date_fin_efect,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_group_utils_lie,
  dnr_ref_prodt,
  ref_domn
) as
  select   seqnc,
           ref_group,
           ref_utils,
           date_debut_efect,
           date_fin_efect,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           ref_group_utils_lie,
           dnr_ref_prodt,
           ref_domn
    from   sie_12_lien_group_utils;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_12_LIEN_STRUC;

create or replace force view vd_i_sie_12_lien_struc
(
  seqnc,
  ref_struc_admin,
  date_debut_efect,
  date_fin_efect,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_struc_lie
) as
  select   "SEQNC",
           "REF_STRUC_ADMIN",
           "DATE_DEBUT_EFECT",
           "DATE_FIN_EFECT",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "REF_STRUC_LIE"
    from   sie_12_lien_struc;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_12_MEMBR_STRUC;

create or replace force view vd_i_sie_12_membr_struc
(
  seqnc,
  ref_utils,
  ref_struc_admin,
  date_debut_efect,
  date_fin_efect,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   "SEQNC",
           "REF_UTILS",
           "REF_STRUC_ADMIN",
           "DATE_DEBUT_EFECT",
           "DATE_FIN_EFECT",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC"
    from   sie_12_membr_struc;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_12_PAYPL_RETR_APLIC;

create or replace force view vd_i_sie_12_paypl_retr_aplic
(
  seqnc,
  ref_sesn,
  numr_apex_aplic,
  numr_apex_page,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_compt_paypl,
  ref_struc_aplic,
  ref_seqnc_struc_aplic
) as
  select   "SEQNC",
           "REF_SESN",
           "NUMR_APEX_APLIC",
           "NUMR_APEX_PAGE",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "REF_COMPT_PAYPL",
           "REF_STRUC_APLIC",
           "REF_SEQNC_STRUC_APLIC"
    from   sie_12_paypl_retr_aplic;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_12_REPNS_FORML;

create or replace force view vd_i_sie_12_repns_forml
(
  seqnc,
  ref_detl_forml,
  valr_un,
  valr_deux,
  valr_autre,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   "SEQNC",
           "REF_DETL_FORML",
           "VALR_UN",
           "VALR_DEUX",
           "VALR_AUTRE",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC"
    from   sie_12_repns_forml;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_12_REQT_INTER_UTILS;

create or replace force view vd_i_sie_12_reqt_inter_utils
(
  seqnc,
  ident,
  ref_utils,
  ref_dv_type_reqt_inter,
  date_debut_efect,
  date_fin_efect,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_domn,
  ref_prodt,
  numr_aplic_apex,
  numr_page_apex,
  date_trait
) as
  select   "SEQNC",
           "IDENT",
           "REF_UTILS",
           "REF_DV_TYPE_REQT_INTER",
           "DATE_DEBUT_EFECT",
           "DATE_FIN_EFECT",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "REF_DOMN",
           "REF_PRODT",
           "NUMR_APLIC_APEX",
           "NUMR_PAGE_APEX",
           "DATE_TRAIT"
    from   sie_12_reqt_inter_utils;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_12_SESN;

create or replace force view vd_i_sie_12_sesn
(
  id_sesn,
  app_user,
  ref_id_sesn,
  ref_lang
) as
  select   "ID_SESN",
           "APP_USER",
           "REF_ID_SESN",
           "REF_LANG"
    from   sie_12_sesn;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_12_STAT;

create or replace force view vd_i_sie_12_stat
(
  seqnc,
  ref_struc_aplic,
  ordre,
  code,
  nom,
  descr,
  date_creat,
  utils_creat,
  date_modfc,
  indic_initl,
  utils_modfc,
  indic_stat_utils,
  ref_group_stat,
  dnr_ref_prodt
) as
  select   "SEQNC",
           "REF_STRUC_APLIC",
           "ORDRE",
           "CODE",
           "NOM",
           "DESCR",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "INDIC_INITL",
           "UTILS_MODFC",
           "INDIC_STAT_UTILS",
           "REF_GROUP_STAT",
           "DNR_REF_PRODT"
    from   sie_12_stat;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_12_STRUC_ADMIN;

create or replace force view vd_i_sie_12_struc_admin
(
  seqnc,
  nom,
  indic_deft,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_type_struc,
  ref_respn,
  debut_efect,
  fin_efect,
  ref_domn
) as
  select   "SEQNC",
           "NOM",
           "INDIC_DEFT",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "REF_TYPE_STRUC",
           "REF_RESPN",
           "DEBUT_EFECT",
           "FIN_EFECT",
           "REF_DOMN"
    from   sie_12_struc_admin;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_12_STRUC_APLIC;

create or replace force view vd_i_sie_12_struc_aplic
(
  seqnc,
  nom,
  descr,
  ref_prodt,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  code,
  ref_mesg_err_suprs,
  indic_extra_tout,
  tail_tabl_extra,
  nom_struc_acces_don,
  ref_page_liste,
  ref_page_forml,
  nom_packg,
  dnr_ref_prodt,
  indic_dispn_docmn,
  nom_schem
) as
  select   "SEQNC",
           "NOM",
           "DESCR",
           "REF_PRODT",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "CODE",
           "REF_MESG_ERR_SUPRS",
           "INDIC_EXTRA_TOUT",
           "TAIL_TABL_EXTRA",
           "NOM_STRUC_ACCES_DON",
           "REF_PAGE_LISTE",
           "REF_PAGE_FORML",
           "NOM_PACKG",
           "DNR_REF_PRODT",
           "INDIC_DISPN_DOCMN",
           nom_schem
    from   sie_12_struc_aplic;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_12_STRUC_APLIC_DESTN;

create or replace force view vd_i_sie_12_struc_aplic_destn
(
  seqnc,
  ref_struc_aplic,
  ref_destn,
  utils_creat,
  date_creat,
  utils_modfc,
  date_modfc
) as
  select   "SEQNC",
           "REF_STRUC_APLIC",
           "REF_DESTN",
           "UTILS_CREAT",
           "DATE_CREAT",
           "UTILS_MODFC",
           "DATE_MODFC"
    from   sie_12_struc_aplic_destn;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_12_STRUC_APLIC_LANG;

create or replace force view vd_i_sie_12_struc_aplic_lang
(
  seqnc,
  ref_struc_aplic,
  adjec_demns,
  nom,
  ref_lang,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  descr,
  dnr_ref_prodt
) as
  select   "SEQNC",
           "REF_STRUC_APLIC",
           "ADJEC_DEMNS",
           "NOM",
           "REF_LANG",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "DESCR",
           "DNR_REF_PRODT"
    from   sie_12_struc_aplic_lang;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_12_STRUC_APLIC_SUIVI;

create or replace force view vd_i_sie_12_struc_aplic_suivi
(
  seqnc,
  ref_struc_aplic,
  ref_suivi,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  nom_persn,
  indic_creat_initl,
  seqnc_presn,
  ref_sucrs_impla
) as
  select   "SEQNC",
           "REF_STRUC_APLIC",
           "REF_SUIVI",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "NOM_PERSN",
           "INDIC_CREAT_INITL",
           "SEQNC_PRESN",
           "REF_SUCRS_IMPLA"
    from   sie_12_struc_aplic_suivi;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_12_TYPE_STRUC;

create or replace force view vd_i_sie_12_type_struc
(
  seqnc,
  code,
  nom,
  descr,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_domn
) as
  select   "SEQNC",
           "CODE",
           "NOM",
           "DESCR",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "REF_DOMN"
    from   sie_12_type_struc;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_12_UTILS;

create or replace force view vd_i_sie_12_utils
(
  seqnc,
  nom,
  prenm,
  code_utils,
  mot_passe,
  date_expir,
  indic_verl,
  indic_chang_mot_passe,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  courl,
  dernr_prodt_acces,
  indic_actif,
  dernr_domn_acces,
  ref_dv_compl_maxm,
  code_utils_base_don
) as
  select   "SEQNC",
           "NOM",
           "PRENM",
           "CODE_UTILS",
           "MOT_PASSE",
           "DATE_EXPIR",
           "INDIC_VERL",
           "INDIC_CHANG_MOT_PASSE",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "COURL",
           "DERNR_PRODT_ACCES",
           "INDIC_ACTIF",
           "DERNR_DOMN_ACCES",
           "REF_DV_COMPL_MAXM",
           "CODE_UTILS_BASE_DON"
    from   sie_12_utils;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_13_CONDT_EXECT;

create or replace force view vd_i_sie_13_condt_exect
(
  seqnc,
  code,
  nom,
  descr,
  enonc_condt_plsql,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   "SEQNC",
           "CODE",
           "NOM",
           "DESCR",
           "ENONC_CONDT_PLSQL",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC"
    from   sie_13_condt_exect;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_13_CONDT_PILTB;

create or replace force view vd_i_sie_13_condt_piltb
(
  seqnc,
  ref_page,
  code,
  nom,
  descr,
  condt,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_page_item_focus,
  dnr_ref_aplic
) as
  select   "SEQNC",
           "REF_PAGE",
           "CODE",
           "NOM",
           "DESCR",
           "CONDT",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "REF_PAGE_ITEM_FOCUS",
           "DNR_REF_APLIC"
    from   sie_13_condt_piltb;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_13_DOSR_VIRTL;

create or replace force view vd_i_sie_13_dosr_virtl
(
  seqnc,
  ref_prodt,
  code,
  nom,
  descr,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  dnr_ref_prodt
) as
  select   "SEQNC",
           "REF_PRODT",
           "CODE",
           "NOM",
           "DESCR",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "DNR_REF_PRODT"
    from   sie_13_dosr_virtl;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_13_EMPLA_DOSR_VIRTL;

create or replace force view vd_i_sie_13_empla_dosr_virtl
(
  seqnc,
  ref_dosr_virtl,
  ref_versn,
  empla,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  dnr_ref_prodt
) as
  select   "SEQNC",
           "REF_DOSR_VIRTL",
           "REF_VERSN",
           "EMPLA",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "DNR_REF_PRODT"
    from   sie_13_empla_dosr_virtl;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_13_EXPOR_APLIC;

create or replace force view vd_i_sie_13_expor_aplic
(
  seqnc,
  ref_sesn,
  ref_aplic,
  indic_maj_refrn,
  numr_aplic_cible
) as
  select   "SEQNC",
           "REF_SESN",
           "REF_APLIC",
           "INDIC_MAJ_REFRN",
           "NUMR_APLIC_CIBLE"
    from   sie_13_expor_aplic;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_13_EXPOR_PAGE;

create or replace force view vd_i_sie_13_expor_page
(
  ref_page,
  ref_sesn,
  seqnc
) as
  select   "REF_PAGE",
           "REF_SESN",
           "SEQNC"
    from   sie_13_expor_page;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_13_FORMT_RESRC;

create or replace force view vd_i_sie_13_formt_resrc
(
  seqnc,
  code,
  ref_prodt,
  descr,
  ref_type_fichr,
  largr,
  hautr,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  nom,
  dnr_ref_prodt
) as
  select   "SEQNC",
           "CODE",
           "REF_PRODT",
           "DESCR",
           "REF_TYPE_FICHR",
           "LARGR",
           "HAUTR",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "NOM",
           "DNR_REF_PRODT"
    from   sie_13_formt_resrc;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_13_INSTA_PREFR;

create or replace force view vd_i_sie_13_insta_prefr
(
  seqnc,
  ref_prefr,
  ref_utils,
  ref_sesn,
  valr,
  ref_struc_aplic,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   "SEQNC",
           "REF_PREFR",
           "REF_UTILS",
           "REF_SESN",
           "VALR",
           "REF_STRUC_APLIC",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC"
    from   sie_13_insta_prefr;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_13_ITEM_MENU;

create or replace force view vd_i_sie_13_item_menu
(
  seqnc,
  code,
  nom,
  descr,
  forml_libl,
  aide_insta,
  titre_aide_insta,
  ordre_presn,
  ref_page,
  icone,
  efacr_cache,
  ref_menu,
  ref_dv_valr_reqst,
  forml_valr_reqst,
  indic_reint_pagnt,
  indic_reint_page_ir,
  indic_clear_page_ir,
  ref_dv_valr_scpc,
  forml_valr_scpc,
  ref_dv_valr_sspc,
  forml_valr_sspc,
  ref_dv_valr_sapc,
  forml_valr_sapc,
  ref_dv_valr_scpi,
  forml_valr_scpi,
  ref_dv_valr_sspi,
  forml_valr_sspi,
  ref_dv_valr_sapi,
  forml_valr_sapi,
  ref_dv_valr_snpi,
  forml_valr_snpi,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  indic_soums_page,
  indic_reint_navgt,
  ref_item_menu,
  dnr_ref_prodt,
  ref_struc_aplic,
  liste_ref_page_activ,
  ref_resrc,
  ref_ocurn_resrc,
  ref_formt_resrc,
  ref_dv_valr_insta_libl,
  ref_dv_valr_url,
  forml_valr_url,
  indic_gerer_sidf,
  ref_aplic,
  ref_dv_valr_insta_condt_afich,
  forml_condt_afich
) as
  select   seqnc,
           code,
           nom,
           descr,
           forml_libl,
           aide_insta,
           titre_aide_insta,
           ordre_presn,
           ref_page,
           icone,
           efacr_cache,
           ref_menu,
           ref_dv_valr_reqst,
           forml_valr_reqst,
           indic_reint_pagnt,
           indic_reint_page_ir,
           indic_clear_page_ir,
           ref_dv_valr_scpc,
           forml_valr_scpc,
           ref_dv_valr_sspc,
           forml_valr_sspc,
           ref_dv_valr_sapc,
           forml_valr_sapc,
           ref_dv_valr_scpi,
           forml_valr_scpi,
           ref_dv_valr_sspi,
           forml_valr_sspi,
           ref_dv_valr_sapi,
           forml_valr_sapi,
           ref_dv_valr_snpi,
           forml_valr_snpi,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           indic_soums_page,
           indic_reint_navgt,
           ref_item_menu,
           dnr_ref_prodt,
           ref_struc_aplic,
           liste_ref_page_activ,
           ref_resrc,
           ref_ocurn_resrc,
           ref_formt_resrc,
           ref_dv_valr_insta_libl,
           ref_dv_valr_url,
           forml_valr_url,
           indic_gerer_sidf,
           ref_aplic,
           ref_dv_valr_insta_condt_afich,
           forml_condt_afich
    from   sie_13_item_menu;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_13_LIEN_CONDT_PILTB;

create or replace force view vd_i_sie_13_lien_condt_piltb
(
  seqnc,
  ref_page_item,
  ref_condt_piltb,
  indic_lectr_seul,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  indic_afich,
  dnr_ref_aplic
) as
  select   "SEQNC",
           "REF_PAGE_ITEM",
           "REF_CONDT_PILTB",
           "INDIC_LECTR_SEUL",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "INDIC_AFICH",
           "DNR_REF_APLIC"
    from   sie_13_lien_condt_piltb;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_13_LISTE_NAVGT;

create or replace force view vd_i_sie_13_liste_navgt
(
  seqnc,
  ref_page,
  libl,
  page,
  sspc,
  sapc,
  sspi,
  sapi,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ordre_presn,
  code,
  indic_reint_sidf,
  aplic,
  dnr_ref_aplic
) as
  select   "SEQNC",
           "REF_PAGE",
           "LIBL",
           "PAGE",
           "SSPC",
           "SAPC",
           "SSPI",
           "SAPI",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "ORDRE_PRESN",
           "CODE",
           "INDIC_REINT_SIDF",
           "APLIC",
           "DNR_REF_APLIC"
    from   sie_13_liste_navgt;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_13_MENU;

create or replace force view vd_i_sie_13_menu
(
  seqnc,
  code,
  nom,
  descr,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_prodt,
  dnr_ref_prodt
) as
  select   "SEQNC",
           "CODE",
           "NOM",
           "DESCR",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "REF_PRODT",
           "DNR_REF_PRODT"
    from   sie_13_menu;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_13_MIME_TYPE;

create or replace force view vd_i_sie_13_mime_type
(
  seqnc,
  ref_type_fichr,
  ext,
  mime_type,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ordre_choix
) as
  select   "SEQNC",
           "REF_TYPE_FICHR",
           "EXT",
           "MIME_TYPE",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "ORDRE_CHOIX"
    from   sie_13_mime_type;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_13_NAVGT;

create or replace force view vd_i_sie_13_navgt
(
  seqnc,
  ref_id_sesn,
  ref_fil_arian,
  indic_extra_total,
  tail_tabl_extra,
  nombr_rang_extra,
  enonc_sql,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  indic_extra_termn,
  apex_repts_id,
  ref_raprt_inter
) as
  select   "SEQNC",
           "REF_ID_SESN",
           "REF_FIL_ARIAN",
           "INDIC_EXTRA_TOTAL",
           "TAIL_TABL_EXTRA",
           "NOMBR_RANG_EXTRA",
           "ENONC_SQL",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "INDIC_EXTRA_TERMN",
           "APEX_REPTS_ID",
           "REF_RAPRT_INTER"
    from   sie_13_navgt;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_13_NAVGT_ELEMN;

create or replace force view vd_i_sie_13_navgt_elemn
(
  seqnc,
  numr_elemn,
  indic_courn,
  seqnc_elemn,
  ref_navgt,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   "SEQNC",
           "NUMR_ELEMN",
           "INDIC_COURN",
           "SEQNC_ELEMN",
           "REF_NAVGT",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC"
    from   sie_13_navgt_elemn;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_13_OCURN_RESRC;

create or replace force view vd_i_sie_13_ocurn_resrc
(
  seqnc,
  ref_resrc,
  ref_formt_resrc,
  ref_mime_type,
  nom_physq,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  cordn_x_debut,
  cordn_y_debut,
  largr_prepn,
  hautr_prepn,
  nom,
  ref_dosr_virtl,
  ref_versn,
  dnr_ref_prodt
) as
  select   "SEQNC",
           "REF_RESRC",
           "REF_FORMT_RESRC",
           "REF_MIME_TYPE",
           "NOM_PHYSQ",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "CORDN_X_DEBUT",
           "CORDN_Y_DEBUT",
           "LARGR_PREPN",
           "HAUTR_PREPN",
           "NOM",
           "REF_DOSR_VIRTL",
           "REF_VERSN",
           "DNR_REF_PRODT"
    from   sie_13_ocurn_resrc;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_13_OPERT;

create or replace force view vd_i_sie_13_opert
(
  seqnc,
  nom,
  descr,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_prodt,
  code,
  dnr_ref_prodt,
  ref_fonct
) as
  select   "SEQNC",
           "NOM",
           "DESCR",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "REF_PRODT",
           "CODE",
           "DNR_REF_PRODT",
           ref_fonct
    from   sie_13_opert;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_13_OPERT_OPTIO;

create or replace force view vd_i_sie_13_opert_optio
(
  seqnc,
  ref_opert,
  code,
  nom,
  descr,
  dnr_ref_prodt,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  prepn
) as
  select   seqnc,
           ref_opert,
           code,
           nom,
           descr,
           dnr_ref_prodt,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           prepn
    from   sie_13_opert_optio;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_13_PAGE;

create or replace force view vd_i_sie_13_page
(
  seqnc,
  numr_apex,
  nom,
  descr,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_struc_aplic,
  indic_prise_charg_sie01,
  indic_prise_charg_sie04,
  ref_mesg_suprs_specf,
  indic_prise_charg_sie19,
  indic_prise_charg_sie13_navgt,
  indic_prise_charg_sie18,
  ref_page_rechr,
  indic_prise_charg_sie14_popup,
  indic_prise_charg_sie13_confr,
  prefx_mesg,
  date_dernr_maj_refrn_apex,
  ref_mesg_sucs_specf,
  ref_mesg_echec_specf,
  ref_mesg_fetch_specf,
  ref_mesg_range_suprm_specf,
  ref_mesg_range_modf_specf,
  ref_mesg_range_inser_specf,
  ref_mesg_aucun_don_trouv,
  ref_mesg_trop_don_trouv,
  ref_aplic,
  dnr_ref_aplic
) as
  select   "SEQNC",
           "NUMR_APEX",
           "NOM",
           "DESCR",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "REF_STRUC_APLIC",
           "INDIC_PRISE_CHARG_SIE01",
           "INDIC_PRISE_CHARG_SIE04",
           "REF_MESG_SUPRS_SPECF",
           "INDIC_PRISE_CHARG_SIE19",
           "INDIC_PRISE_CHARG_SIE13_NAVGT",
           "INDIC_PRISE_CHARG_SIE18",
           "REF_PAGE_RECHR",
           "INDIC_PRISE_CHARG_SIE14_POPUP",
           "INDIC_PRISE_CHARG_SIE13_CONFR",
           "PREFX_MESG",
           "DATE_DERNR_MAJ_REFRN_APEX",
           "REF_MESG_SUCS_SPECF",
           "REF_MESG_ECHEC_SPECF",
           "REF_MESG_FETCH_SPECF",
           "REF_MESG_RANGE_SUPRM_SPECF",
           "REF_MESG_RANGE_MODF_SPECF",
           "REF_MESG_RANGE_INSER_SPECF",
           "REF_MESG_AUCUN_DON_TROUV",
           "REF_MESG_TROP_DON_TROUV",
           "REF_APLIC",
           "DNR_REF_APLIC"
    from   sie_13_page;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_13_PAGE_IR;

create or replace force view vd_i_sie_13_page_ir
(
  seqnc,
  libl_regn,
  id_apex,
  ref_page,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  largr_deft,
  unite_mesr_largr_deft,
  code,
  dnr_ref_aplic,
  indic_forcr_ajust_page,
  nombr_page_largr
) as
  select   "SEQNC",
           "LIBL_REGN",
           "ID_APEX",
           "REF_PAGE",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "LARGR_DEFT",
           "UNITE_MESR_LARGR_DEFT",
           "CODE",
           "DNR_REF_APLIC",
           indic_forcr_ajust_page,
           nombr_page_largr
    from   sie_13_page_ir;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_13_PAGE_IR_COLN;

create or replace force view vd_i_sie_13_page_ir_coln
(
  seqnc,
  ordre_afich,
  libl,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  coln_table,
  ref_page_ir,
  id_apex,
  largr,
  type_largr,
  indic_exprt,
  ref_mesg_aide,
  dnr_ref_aplic
) as
  select   "SEQNC",
           "ORDRE_AFICH",
           "LIBL",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "COLN_TABLE",
           "REF_PAGE_IR",
           "ID_APEX",
           "LARGR",
           "TYPE_LARGR",
           "INDIC_EXPRT",
           "REF_MESG_AIDE",
           "DNR_REF_APLIC"
    from   sie_13_page_ir_coln;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_13_PAGE_ITEM;

create or replace force view vd_i_sie_13_page_item
(
  seqnc,
  ref_page,
  id_apex,
  nom_apex,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  libl,
  indic_creat,
  indic_modfc,
  indic_suprs,
  indic_en_creat,
  indic_en_modfc,
  type_item,
  ref_opert,
  ref_mesg_aide,
  depsm_alias_coln,
  indic_rechr,
  indic_confr_sauvg,
  dnr_ref_aplic
) as
  select   "SEQNC",
           "REF_PAGE",
           "ID_APEX",
           "NOM_APEX",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "LIBL",
           "INDIC_CREAT",
           "INDIC_MODFC",
           "INDIC_SUPRS",
           "INDIC_EN_CREAT",
           "INDIC_EN_MODFC",
           "TYPE_ITEM",
           "REF_OPERT",
           "REF_MESG_AIDE",
           "DEPSM_ALIAS_COLN",
           "INDIC_RECHR",
           "INDIC_CONFR_SAUVG",
           "DNR_REF_APLIC"
    from   sie_13_page_item;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_13_PAGE_ITEM_LANG;

create or replace force view vd_i_sie_13_page_item_lang
(
  seqnc,
  ref_page_item,
  nom,
  ref_lang,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  dnr_ref_aplic
) as
  select   "SEQNC",
           "REF_PAGE_ITEM",
           "NOM",
           "REF_LANG",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "DNR_REF_APLIC"
    from   sie_13_page_item_lang;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_13_PAGE_LANG;

create or replace force view vd_i_sie_13_page_lang
(
  seqnc,
  ref_page,
  nom,
  ref_lang,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  dnr_ref_aplic
) as
  select   "SEQNC",
           "REF_PAGE",
           "NOM",
           "REF_LANG",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "DNR_REF_APLIC"
    from   sie_13_page_lang;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_13_PAGE_PREFR_NAVGT;

create or replace force view vd_i_sie_13_page_prefr_navgt
(
  seqnc,
  ref_page,
  ref_page_ir,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  dnr_ref_aplic
) as
  select   "SEQNC",
           "REF_PAGE",
           "REF_PAGE_IR",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "DNR_REF_APLIC"
    from   sie_13_page_prefr_navgt;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_13_PREFR;

create or replace force view vd_i_sie_13_prefr
(
  seqnc,
  code,
  ref_dv_condt_utils,
  forml_condt_utils,
  ref_dv_condt_sauvg,
  forml_condt_sauvg,
  ref_dv_type_insta,
  indic_contx,
  ref_dv_valr_insta,
  forml_valr_insta,
  descr_comnt,
  ref_item,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  dnr_ref_aplic
) as
  select   "SEQNC",
           "CODE",
           "REF_DV_CONDT_UTILS",
           "FORML_CONDT_UTILS",
           "REF_DV_CONDT_SAUVG",
           "FORML_CONDT_SAUVG",
           "REF_DV_TYPE_INSTA",
           "INDIC_CONTX",
           "REF_DV_VALR_INSTA",
           "FORML_VALR_INSTA",
           "DESCR_COMNT",
           "REF_ITEM",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "DNR_REF_APLIC"
    from   sie_13_prefr;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_13_REGN_PILTB;

create or replace force view vd_i_sie_13_regn_piltb
(
  seqnc,
  code,
  nom,
  descr,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_page,
  ref_dv_type_regn_piltb,
  dnr_ref_aplic
) as
  select   "SEQNC",
           "CODE",
           "NOM",
           "DESCR",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "REF_PAGE",
           "REF_DV_TYPE_REGN_PILTB",
           "DNR_REF_APLIC"
    from   sie_13_regn_piltb;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_13_REGN_PILTB_LANG;

create or replace force view vd_i_sie_13_regn_piltb_lang
(
  seqnc,
  ref_regn_piltb,
  contn,
  ref_lang,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  dnr_ref_aplic
) as
  select   "SEQNC",
           "REF_REGN_PILTB",
           "CONTN",
           "REF_LANG",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "DNR_REF_APLIC"
    from   sie_13_regn_piltb_lang;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_13_RESRC;

create or replace force view vd_i_sie_13_resrc
(
  seqnc,
  code,
  ref_prodt,
  descr,
  ref_type_fichr,
  ref_struc_aplic,
  indic_stock_meme_reprt,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  type_resrc,
  nom,
  nom_physq_comps,
  indic_publc,
  empla_html,
  ref_plugn,
  ref_dosr_virtl,
  dnr_ref_prodt
) as
  select   "SEQNC",
           "CODE",
           "REF_PRODT",
           "DESCR",
           "REF_TYPE_FICHR",
           "REF_STRUC_APLIC",
           "INDIC_STOCK_MEME_REPRT",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "TYPE_RESRC",
           "NOM",
           "NOM_PHYSQ_COMPS",
           "INDIC_PUBLC",
           "EMPLA_HTML",
           "REF_PLUGN",
           "REF_DOSR_VIRTL",
           "DNR_REF_PRODT"
    from   sie_13_resrc;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_13_TYPE_FICHR;

create or replace force view vd_i_sie_13_type_fichr
(
  seqnc,
  code,
  nom,
  descr,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  nom_icon
) as
  select   "SEQNC",
           "CODE",
           "NOM",
           "DESCR",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "NOM_ICON"
    from   sie_13_type_fichr;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_14_DETL_DOMN_VALR;

create or replace force view vd_i_sie_14_detl_domn_valr
(
  seqnc,
  code_valr,
  valr,
  ref_domn_valr,
  seqnc_presn,
  date_debut_efect,
  date_fin_efect,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  valr_court,
  valr_organ,
  dnr_ref_prodt
) as
  select   "SEQNC",
           "CODE_VALR",
           "VALR",
           "REF_DOMN_VALR",
           "SEQNC_PRESN",
           "DATE_DEBUT_EFECT",
           "DATE_FIN_EFECT",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "VALR_COURT",
           "VALR_ORGAN",
           "DNR_REF_PRODT"
    from   sie_14_detl_domn_valr;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_14_DOMN_VALR;

create or replace force view vd_i_sie_14_domn_valr
(
  seqnc,
  code,
  nom,
  descr,
  enonc_sourc,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  type_don,
  ref_formt,
  ref_prodt,
  ref_type_domn_valr,
  indic_systm,
  dnr_ref_prodt,
  ref_domn
) as
  select   "SEQNC",
           "CODE",
           "NOM",
           "DESCR",
           "ENONC_SOURC",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "TYPE_DON",
           "REF_FORMT",
           "REF_PRODT",
           "REF_TYPE_DOMN_VALR",
           "INDIC_SYSTM",
           "DNR_REF_PRODT",
           "REF_DOMN"
    from   sie_14_domn_valr;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_14_FORMT;

create or replace force view vd_i_sie_14_formt
(
  seqnc,
  libl,
  defnt,
  type_don,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  indic_formt_orcl,
  indic_unite_inclu,
  ref_prodt,
  dnr_ref_prodt
) as
  select   "SEQNC",
           "LIBL",
           "DEFNT",
           "TYPE_DON",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "INDIC_FORMT_ORCL",
           "INDIC_UNITE_INCLU",
           "REF_PRODT",
           "DNR_REF_PRODT"
    from   sie_14_formt;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_14_TYPE_DOMN_VALR;

create or replace force view vd_i_sie_14_type_domn_valr
(
  seqnc,
  code,
  nom,
  descr,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_prodt,
  dnr_ref_prodt
) as
  select   "SEQNC",
           "CODE",
           "NOM",
           "DESCR",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "REF_PRODT",
           "DNR_REF_PRODT"
    from   sie_14_type_domn_valr;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_17_COMPT_AXIAT;

create or replace force view vd_i_sie_17_compt_axiat
(
  seqnc,
  code,
  nom,
  descr,
  numr,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_domn,
  ref_profl_courl,
  ref_publc_page_garde
) as
  select   "SEQNC",
           "CODE",
           "NOM",
           "DESCR",
           "NUMR",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "REF_DOMN",
           "REF_PROFL_COURL",
           "REF_PUBLC_PAGE_GARDE"
    from   sie_17_compt_axiat;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_17_COMPT_TWILI;

create or replace force view vd_i_sie_17_compt_twili
(
  seqnc,
  code,
  nom,
  descr,
  acoun_id,
  authe_token,
  reprt_walt,
  mot_passe_walt,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  numr,
  indic_partg,
  ref_domn
) as
  select   "SEQNC",
           "CODE",
           "NOM",
           "DESCR",
           "ACOUN_ID",
           "AUTHE_TOKEN",
           "REPRT_WALT",
           "MOT_PASSE_WALT",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "NUMR",
           "INDIC_PARTG",
           "REF_DOMN"
    from   sie_17_compt_twili;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_17_COURL;

create or replace force view vd_i_sie_17_courl
(
  seqnc,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  servr,
  port,
  domn,
  nom_envoy,
  adres_envoy,
  sujet,
  indic_formt_html,
  authe_methd,
  authe_usagr,
  authe_mdp,
  corps,
  nombr_tentv,
  nombr_tentv_max,
  sens,
  stat_soums
) as
  select   "SEQNC",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "SERVR",
           "PORT",
           "DOMN",
           "NOM_ENVOY",
           "ADRES_ENVOY",
           "SUJET",
           "INDIC_FORMT_HTML",
           "AUTHE_METHD",
           "AUTHE_USAGR",
           "AUTHE_MDP",
           "CORPS",
           "NOMBR_TENTV",
           "NOMBR_TENTV_MAX",
           "SENS",
           "STAT_SOUMS"
    from   sie_17_courl;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_17_COURL_DESTN;

create or replace force view vd_i_sie_17_courl_destn
(
  seqnc,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_fil_atent,
  nom,
  adres,
  type
) as
  select   "SEQNC",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "REF_FIL_ATENT",
           "NOM",
           "ADRES",
           "TYPE"
    from   sie_17_courl_destn;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_17_COURL_PIECE_JOINT;

create or replace force view vd_i_sie_17_courl_piece_joint
(
  seqnc,
  ref_courl,
  mime_type,
  contn,
  tail,
  nom_fichr,
  mode_atach
) as
  select   "SEQNC",
           "REF_COURL",
           "MIME_TYPE",
           "CONTN",
           "TAIL",
           "NOM_FICHR",
           "MODE_ATACH"
    from   sie_17_courl_piece_joint;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_17_PIECE_TELCP_AXIAT;

create or replace force view vd_i_sie_17_piece_telcp_axiat
(
  seqnc,
  ref_telcp_axiat,
  nombr_page,
  ordre_atach,
  contn,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  mime_type,
  nom_fichr
) as
  select   "SEQNC",
           "REF_TELCP_AXIAT",
           "NOMBR_PAGE",
           "ORDRE_ATACH",
           "CONTN",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "MIME_TYPE",
           "NOM_FICHR"
    from   sie_17_piece_telcp_axiat;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_17_PROFL_COURL;

create or replace force view vd_i_sie_17_profl_courl
(
  seqnc,
  servr_sortn,
  port_sortn,
  domn,
  nom_envoy,
  adres_envoy,
  authe_methd_sortn,
  authe_usagr_sortn,
  authe_mdp_sortn,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  code,
  ref_domn,
  nom,
  descr,
  indic_ssl_sortn,
  servr_entra,
  port_entra,
  indic_ssl_entra,
  authe_methd_entra,
  authe_usagr_entra,
  authe_mdp_entra,
  protc_entra
) as
  select   "SEQNC",
           "SERVR_SORTN",
           "PORT_SORTN",
           "DOMN",
           "NOM_ENVOY",
           "ADRES_ENVOY",
           "AUTHE_METHD_SORTN",
           "AUTHE_USAGR_SORTN",
           "AUTHE_MDP_SORTN",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "CODE",
           "REF_DOMN",
           "NOM",
           "DESCR",
           "INDIC_SSL_SORTN",
           "SERVR_ENTRA",
           "PORT_ENTRA",
           "INDIC_SSL_ENTRA",
           "AUTHE_METHD_ENTRA",
           "AUTHE_USAGR_ENTRA",
           "AUTHE_MDP_ENTRA",
           "PROTC_ENTRA"
    from   sie_17_profl_courl;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_17_SMS_TWILI;

create or replace force view vd_i_sie_17_sms_twili
(
  seqnc,
  numr_de,
  numr_a,
  mesg,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  tw_sid,
  tw_status,
  tw_price,
  tw_uri,
  stat_soums,
  date_envoi_difr,
  ref_compt_twili,
  numr_mesg,
  nombr_mesg_totl,
  ref_mesg_precd,
  id_sesn,
  group_sms,
  repns_servr,
  sens
) as
  select   "SEQNC",
           "NUMR_DE",
           "NUMR_A",
           "MESG",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "TW_SID",
           "TW_STATUS",
           "TW_PRICE",
           "TW_URI",
           "STAT_SOUMS",
           "DATE_ENVOI_DIFR",
           "REF_COMPT_TWILI",
           "NUMR_MESG",
           "NOMBR_MESG_TOTL",
           "REF_MESG_PRECD",
           "ID_SESN",
           "GROUP_SMS",
           "REPNS_SERVR",
           "SENS"
    from   sie_17_sms_twili;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_17_SMS_TWILI_ENTRA;

create or replace force view vd_i_sie_17_sms_twili_entra
(
  seqnc,
  tw_recpt_accountsid,
  tw_recpt_apiversion,
  tw_recpt_body,
  tw_recpt_from,
  tw_recpt_fromcity,
  tw_recpt_fromcountry,
  tw_recpt_fromstate,
  tw_recpt_fromzip,
  tw_recpt_smsmessagesid,
  tw_recpt_smssid,
  tw_recpt_smsstatus,
  tw_recpt_to,
  tw_recpt_tocity,
  tw_recpt_tocountry,
  tw_recpt_tostate,
  tw_recpt_tozip,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   "SEQNC",
           "TW_RECPT_ACCOUNTSID",
           "TW_RECPT_APIVERSION",
           "TW_RECPT_BODY",
           "TW_RECPT_FROM",
           "TW_RECPT_FROMCITY",
           "TW_RECPT_FROMCOUNTRY",
           "TW_RECPT_FROMSTATE",
           "TW_RECPT_FROMZIP",
           "TW_RECPT_SMSMESSAGESID",
           "TW_RECPT_SMSSID",
           "TW_RECPT_SMSSTATUS",
           "TW_RECPT_TO",
           "TW_RECPT_TOCITY",
           "TW_RECPT_TOCOUNTRY",
           "TW_RECPT_TOSTATE",
           "TW_RECPT_TOZIP",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC"
    from   sie_17_sms_twili_entra;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_17_TELCP_AXIAT;

create or replace force view vd_i_sie_17_telcp_axiat
(
  seqnc,
  ref_compt_axiat,
  destn_formt,
  numr_destn,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  stat_soums,
  date_envoi_difr,
  objet,
  sens
) as
  select   "SEQNC",
           "REF_COMPT_AXIAT",
           "DESTN_FORMT",
           "NUMR_DESTN",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "STAT_SOUMS",
           "DATE_ENVOI_DIFR",
           "OBJET",
           "SENS"
    from   sie_17_telcp_axiat;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_19_BOUTN;

create or replace force view vd_i_sie_19_boutn
(
  seqnc,
  ref_lang,
  ref_dispn_fonct,
  item_subst,
  id_templ_boutn,
  templ_boutn,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  libl,
  indic_actif,
  ref_dv_type_mesg_aide_contx,
  mesg_aide_contx
) as
  select   "SEQNC",
           "REF_LANG",
           "REF_DISPN_FONCT",
           "ITEM_SUBST",
           "ID_TEMPL_BOUTN",
           "TEMPL_BOUTN",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "LIBL",
           "INDIC_ACTIF",
           "REF_DV_TYPE_MESG_AIDE_CONTX",
           "MESG_AIDE_CONTX"
    from   sie_19_boutn;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_19_CLE;

create or replace force view vd_i_sie_19_cle
(
  seqnc,
  ref_lang,
  indic_shift,
  indic_alt,
  indic_ctrl,
  indic_inter,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  code_keypr,
  code_keydw,
  ref_dispn_fonct,
  indic_actif
) as
  select   "SEQNC",
           "REF_LANG",
           "INDIC_SHIFT",
           "INDIC_ALT",
           "INDIC_CTRL",
           "INDIC_INTER",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "CODE_KEYPR",
           "CODE_KEYDW",
           "REF_DISPN_FONCT",
           "INDIC_ACTIF"
    from   sie_19_cle;


/* Formatted on 6/3/2013 10:08:26 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_19_DISPN_FONCT;

create or replace force view vd_i_sie_19_dispn_fonct
(
  seqnc,
  ref_prodt,
  ref_fonct,
  valr_atrib_1,
  valr_atrib_2,
  valr_atrib_3,
  valr_atrib_4,
  valr_atrib_5,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   "SEQNC",
           "REF_PRODT",
           "REF_FONCT",
           "VALR_ATRIB_1",
           "VALR_ATRIB_2",
           "VALR_ATRIB_3",
           "VALR_ATRIB_4",
           "VALR_ATRIB_5",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC"
    from   sie_19_dispn_fonct;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_19_FONCT;

create or replace force view vd_i_sie_19_fonct
(
  seqnc,
  code,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  titre_atrib1,
  ref_dv_type_atrib1,
  valr_deft_atrib1,
  titre_atrib2,
  titre_atrib3,
  titre_atrib4,
  titre_atrib5,
  ref_dv_type_atrib2,
  ref_dv_type_atrib3,
  ref_dv_type_atrib4,
  ref_dv_type_atrib5,
  valr_deft_atrib2,
  valr_deft_atrib3,
  valr_deft_atrib4,
  valr_deft_atrib5,
  ref_dv_type_actio,
  expre_actio,
  ref_dv_type_expre,
  indic_afect_input_html,
  indic_prevn_actio_deft,
  indic_cle,
  indic_boutn,
  condt_prise_charg
) as
  select   "SEQNC",
           "CODE",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "TITRE_ATRIB1",
           "REF_DV_TYPE_ATRIB1",
           "VALR_DEFT_ATRIB1",
           "TITRE_ATRIB2",
           "TITRE_ATRIB3",
           "TITRE_ATRIB4",
           "TITRE_ATRIB5",
           "REF_DV_TYPE_ATRIB2",
           "REF_DV_TYPE_ATRIB3",
           "REF_DV_TYPE_ATRIB4",
           "REF_DV_TYPE_ATRIB5",
           "VALR_DEFT_ATRIB2",
           "VALR_DEFT_ATRIB3",
           "VALR_DEFT_ATRIB4",
           "VALR_DEFT_ATRIB5",
           "REF_DV_TYPE_ACTIO",
           "EXPRE_ACTIO",
           "REF_DV_TYPE_EXPRE",
           "INDIC_AFECT_INPUT_HTML",
           "INDIC_PREVN_ACTIO_DEFT",
           "INDIC_CLE",
           "INDIC_BOUTN",
           "CONDT_PRISE_CHARG"
    from   sie_19_fonct;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_19_FONCT_LANG;

create or replace force view vd_i_sie_19_fonct_lang
(
  seqnc,
  nom,
  ref_lang,
  descr,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_fonct
) as
  select   "SEQNC",
           "NOM",
           "REF_LANG",
           "DESCR",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "REF_FONCT"
    from   sie_19_fonct_lang;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_19_SPECF_FONCT;

create or replace force view vd_i_sie_19_specf_fonct
(
  seqnc,
  ref_dispn_fonct,
  ref_item,
  ref_page,
  ref_dv_type_subst,
  valr_atrib_1,
  valr_atrib_2,
  valr_atrib_3,
  valr_atrib_4,
  valr_atrib_5,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  dnr_ref_page
) as
  select   "SEQNC",
           "REF_DISPN_FONCT",
           "REF_ITEM",
           "REF_PAGE",
           "REF_DV_TYPE_SUBST",
           "VALR_ATRIB_1",
           "VALR_ATRIB_2",
           "VALR_ATRIB_3",
           "VALR_ATRIB_4",
           "VALR_ATRIB_5",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "DNR_REF_PAGE"
    from   sie_19_specf_fonct;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_20_DEPLM;

create or replace force view vd_i_sie_20_deplm
(
  seqnc,
  nom,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_modl,
  ref_modl_parmt,
  ref_prodt_lang
) as
  select   "SEQNC",
           "NOM",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "REF_MODL",
           "REF_MODL_PARMT",
           "REF_PRODT_LANG"
    from   sie_20_deplm;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_20_DETL_DOCMN;

create or replace force view vd_i_sie_20_detl_docmn
(
  seqnc,
  ref_docmn,
  ref_sectn_docmn,
  ref_detl_docmn,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  valr
) as
  select   "SEQNC",
           "REF_DOCMN",
           "REF_SECTN_DOCMN",
           "REF_DETL_DOCMN",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "VALR"
    from   sie_20_detl_docmn;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_20_DOCMN;

create or replace force view vd_i_sie_20_docmn
(
  seqnc,
  ref_prodt_lang,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_struc_aplic,
  ref_seqnc_struc_aplic
) as
  select   "SEQNC",
           "REF_PRODT_LANG",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "REF_STRUC_APLIC",
           "REF_SEQNC_STRUC_APLIC"
    from   sie_20_docmn;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_20_MODL;

create or replace force view vd_i_sie_20_modl
(
  seqnc,
  ref_versn,
  ref_modl,
  nom_organ,
  numr_surch,
  indic_agreg,
  indic_pipln,
  indic_detrm,
  indic_authid_curnt_utils,
  indic_publc,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  versn_bd_aplic,
  ref_dv_type_modl
) as
  select   "SEQNC",
           "REF_VERSN",
           "REF_MODL",
           "NOM_ORGAN",
           "NUMR_SURCH",
           "INDIC_AGREG",
           "INDIC_PIPLN",
           "INDIC_DETRM",
           "INDIC_AUTHID_CURNT_UTILS",
           "INDIC_PUBLC",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "VERSN_BD_APLIC",
           "REF_DV_TYPE_MODL"
    from   sie_20_modl;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_20_MODL_EXCEP;

create or replace force view vd_i_sie_20_modl_excep
(
  seqnc,
  ref_modl,
  nom_organ,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   "SEQNC",
           "REF_MODL",
           "NOM_ORGAN",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC"
    from   sie_20_modl_excep;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_20_MODL_PARMT;

create or replace force view vd_i_sie_20_modl_parmt
(
  seqnc,
  ref_modl,
  nom_organ,
  postn,
  valr_deft,
  sens,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  indic_publc,
  indic_retr,
  ref_dv_type_don
) as
  select   "SEQNC",
           "REF_MODL",
           "NOM_ORGAN",
           "POSTN",
           "VALR_DEFT",
           "SENS",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "INDIC_PUBLC",
           "INDIC_RETR",
           "REF_DV_TYPE_DON"
    from   sie_20_modl_parmt;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_20_SECTN_DOCMN;

create or replace force view vd_i_sie_20_sectn_docmn
(
  seqnc,
  ref_dv_type_sectn,
  ref_sectn_docmn,
  ref_struc_aplic,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  nom,
  titre,
  descr,
  ref_formt
) as
  select   "SEQNC",
           "REF_DV_TYPE_SECTN",
           "REF_SECTN_DOCMN",
           "REF_STRUC_APLIC",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "NOM",
           "TITRE",
           "DESCR",
           "REF_FORMT"
    from   sie_20_sectn_docmn;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_21_PLUGN_ARBRE;

create or replace force view vd_i_sie_21_plugn_arbre
(
  seqnc,
  enonc_pre_reqt,
  nom_table,
  coln_titre,
  coln_type,
  coln_valr,
  coln_aide_insta,
  coln_lien,
  coln_id,
  coln_id_parnt,
  enonc_condt,
  enonc_condt_comnc_par,
  enonc_trier_par,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  indic_renmr,
  indic_deplc,
  coln_titre_aide_insta,
  largr_regn_arbre,
  hautr_regn_arbre,
  ref_plugn_arbre_noeud,
  indic_comnc_par_racn,
  image_sprit,
  type_icone_noeud,
  ref_formt_resrc,
  ref_resrc_comps,
  obten_json_arbre_nombr_niv,
  obten_json_noeud_nombr_niv,
  code,
  mode_cache,
  dnr_ref_prodt,
  indic_charg_progr,
  indic_flech_aide_insta,
  ref_dv_cursr_aide_insta,
  nom_procd_glisr_elemn_arbre,
  nom_procd_depsr_elemn_arbre,
  indic_comnc_par_coln_parnt_nul,
  ref_prodt
) as
  select   "SEQNC",
           "ENONC_PRE_REQT",
           "NOM_TABLE",
           "COLN_TITRE",
           "COLN_TYPE",
           "COLN_VALR",
           "COLN_AIDE_INSTA",
           "COLN_LIEN",
           "COLN_ID",
           "COLN_ID_PARNT",
           "ENONC_CONDT",
           "ENONC_CONDT_COMNC_PAR",
           "ENONC_TRIER_PAR",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "INDIC_RENMR",
           "INDIC_DEPLC",
           "COLN_TITRE_AIDE_INSTA",
           "LARGR_REGN_ARBRE",
           "HAUTR_REGN_ARBRE",
           "REF_PLUGN_ARBRE_NOEUD",
           "INDIC_COMNC_PAR_RACN",
           "IMAGE_SPRIT",
           "TYPE_ICONE_NOEUD",
           "REF_FORMT_RESRC",
           "REF_RESRC_COMPS",
           "OBTEN_JSON_ARBRE_NOMBR_NIV",
           "OBTEN_JSON_NOEUD_NOMBR_NIV",
           "CODE",
           "MODE_CACHE",
           "DNR_REF_PRODT",
           "INDIC_CHARG_PROGR",
           "INDIC_FLECH_AIDE_INSTA",
           "REF_DV_CURSR_AIDE_INSTA",
           "NOM_PROCD_GLISR_ELEMN_ARBRE",
           "NOM_PROCD_DEPSR_ELEMN_ARBRE",
           "INDIC_COMNC_PAR_COLN_PARNT_NUL",
           ref_prodt
    from   sie_21_plugn_arbre;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_21_PLUGN_ARBRE_NOEUD;

create or replace force view vd_i_sie_21_plugn_arbre_noeud
(
  seqnc,
  code,
  nom,
  descr,
  ref_plugn_arbre,
  indic_selct_noeud,
  indic_ouvri_noeud,
  indic_creer_noeud,
  indic_suprm_noeud,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  indic_fermr_noeud,
  ref_resrc,
  ref_ocurn_resrc,
  dnr_ref_prodt
) as
  select   "SEQNC",
           "CODE",
           "NOM",
           "DESCR",
           "REF_PLUGN_ARBRE",
           "INDIC_SELCT_NOEUD",
           "INDIC_OUVRI_NOEUD",
           "INDIC_CREER_NOEUD",
           "INDIC_SUPRM_NOEUD",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "INDIC_FERMR_NOEUD",
           "REF_RESRC",
           "REF_OCURN_RESRC",
           "DNR_REF_PRODT"
    from   sie_21_plugn_arbre_noeud;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_21_PLUGN_CALND;

create or replace force view vd_i_sie_21_plugn_calnd
(
  seqnc,
  enonc_pre_reqt,
  ref_dv_vue_deft,
  conct_propr_entet_gauch,
  conct_propr_entet_centr,
  conct_propr_entet_droit,
  indic_evenm_modfb,
  nom_table,
  coln_titre,
  coln_descr,
  coln_type,
  coln_aide_insta,
  coln_lien,
  coln_indic_journ_compl,
  coln_date_debut,
  coln_date_fin,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  largr_regn_calnd,
  coln_titre_aide_insta,
  indic_agend,
  agend_nom_table,
  agend_coln_titre,
  coln_valr,
  agend_coln_valr,
  agend_coln_coulr,
  code,
  dnr_ref_prodt,
  coln_agend,
  coln_ident,
  coln_date_journ_compl,
  coln_date_fin_journ_compl,
  nombr_mints_inter,
  heure_debut_norml,
  heure_fin_norml,
  heure_debut_exten,
  heure_fin_exten,
  coln_indic_evenm_modfb,
  ref_prodt
) as
  select   "SEQNC",
           "ENONC_PRE_REQT",
           "REF_DV_VUE_DEFT",
           "CONCT_PROPR_ENTET_GAUCH",
           "CONCT_PROPR_ENTET_CENTR",
           "CONCT_PROPR_ENTET_DROIT",
           "INDIC_EVENM_MODFB",
           "NOM_TABLE",
           "COLN_TITRE",
           "COLN_DESCR",
           "COLN_TYPE",
           "COLN_AIDE_INSTA",
           "COLN_LIEN",
           "COLN_INDIC_JOURN_COMPL",
           "COLN_DATE_DEBUT",
           "COLN_DATE_FIN",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "LARGR_REGN_CALND",
           "COLN_TITRE_AIDE_INSTA",
           "INDIC_AGEND",
           "AGEND_NOM_TABLE",
           "AGEND_COLN_TITRE",
           "COLN_VALR",
           "AGEND_COLN_VALR",
           "AGEND_COLN_COULR",
           "CODE",
           "DNR_REF_PRODT",
           "COLN_AGEND",
           "COLN_IDENT",
           "COLN_DATE_JOURN_COMPL",
           "COLN_DATE_FIN_JOURN_COMPL",
           "NOMBR_MINTS_INTER",
           "HEURE_DEBUT_NORML",
           "HEURE_FIN_NORML",
           "HEURE_DEBUT_EXTEN",
           "HEURE_FIN_EXTEN",
           "COLN_INDIC_EVENM_MODFB",
           ref_prodt
    from   sie_21_plugn_calnd;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_21_PLUGN_CALND_COULR;

create or replace force view vd_i_sie_21_plugn_calnd_coulr
(
  seqnc,
  ordre_presn,
  coulr,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  coulr_text
) as
  select   "SEQNC",
           "ORDRE_PRESN",
           "COULR",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "COULR_TEXT"
    from   sie_21_plugn_calnd_coulr;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_21_PLUGN_CALND_TYPE;

create or replace force view vd_i_sie_21_plugn_calnd_type
(
  seqnc,
  code,
  nom,
  descr,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  coulr_texte,
  coulr_bordr,
  coulr_arier_plan,
  ref_domn
) as
  select   "SEQNC",
           "CODE",
           "NOM",
           "DESCR",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "COULR_TEXTE",
           "COULR_BORDR",
           "COULR_ARIER_PLAN",
           "REF_DOMN"
    from   sie_21_plugn_calnd_type;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_21_PLUGN_ITEM_MENU;

create or replace force view vd_i_sie_21_plugn_item_menu
(
  seqnc,
  ref_item_menu,
  ref_plugn_menu,
  niv_item,
  etend_nombr_coln,
  rang_item,
  coln_item,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  dnr_ref_prodt,
  ref_dv_contn_item_menu,
  ref_dv_align
) as
  select   "SEQNC",
           "REF_ITEM_MENU",
           "REF_PLUGN_MENU",
           "NIV_ITEM",
           "ETEND_NOMBR_COLN",
           "RANG_ITEM",
           "COLN_ITEM",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "DNR_REF_PRODT",
           "REF_DV_CONTN_ITEM_MENU",
           "REF_DV_ALIGN"
    from   sie_21_plugn_item_menu;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_21_PLUGN_MENU;

create or replace force view vd_i_sie_21_plugn_menu
(
  seqnc,
  code,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  dnr_ref_prodt,
  ref_dv_type_menu,
  largr_regn_menu,
  hautr_regn_menu,
  ref_dv_orien_menu,
  ref_dv_coulr_theme,
  ref_dv_coulr_princ,
  ref_menu,
  ref_dv_formt_menu,
  ref_prodt
) as
  select   "SEQNC",
           "CODE",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "DNR_REF_PRODT",
           "REF_DV_TYPE_MENU",
           "LARGR_REGN_MENU",
           "HAUTR_REGN_MENU",
           "REF_DV_ORIEN_MENU",
           "REF_DV_COULR_THEME",
           "REF_DV_COULR_PRINC",
           "REF_MENU",
           "REF_DV_FORMT_MENU",
           ref_prodt
    from   sie_21_plugn_menu;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_23_APLIC_MODL_RECHR;

create or replace force view vd_i_sie_23_aplic_modl_rechr
(
  seqnc,
  ref_modl_rechr,
  ref_struc_aplic_rechr,
  ref_struc_aplic_lien,
  nombr_maxim_reslt,
  utils_creat,
  date_creat,
  utils_modfc,
  date_modfc,
  ref_atrib_struc_aplic_afich
) as
  select   "SEQNC",
           "REF_MODL_RECHR",
           "REF_STRUC_APLIC_RECHR",
           "REF_STRUC_APLIC_LIEN",
           "NOMBR_MAXIM_RESLT",
           "UTILS_CREAT",
           "DATE_CREAT",
           "UTILS_MODFC",
           "DATE_MODFC",
           "REF_ATRIB_STRUC_APLIC_AFICH"
    from   sie_23_aplic_modl_rechr;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_23_DETL_APLIC_MODL_RE;

create or replace force view vd_i_sie_23_detl_aplic_modl_re
(
  seqnc,
  ref_aplic_modl_rechr,
  ref_atrib_struc_aplic,
  ref_patrn_rechr,
  ordre_exect,
  pertn,
  utils_creat,
  date_creat,
  utils_modfc,
  date_modfc
) as
  select   "SEQNC",
           "REF_APLIC_MODL_RECHR",
           "REF_ATRIB_STRUC_APLIC",
           "REF_PATRN_RECHR",
           "ORDRE_EXECT",
           "PERTN",
           "UTILS_CREAT",
           "DATE_CREAT",
           "UTILS_MODFC",
           "DATE_MODFC"
    from   sie_23_detl_aplic_modl_rechr;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_23_DETL_RESLT_RECHR;

create or replace force view vd_i_sie_23_detl_reslt_rechr
(
  seqnc,
  ref_rechr,
  ref_enonc_rechr,
  utils_creat,
  date_creat,
  utils_modfc,
  date_modfc,
  ref_detl_aplic_modl_rechr,
  dnr_pertn,
  ref_seqnc_struc_aplic,
  ref_reslt_rechr
) as
  select   "SEQNC",
           "REF_RECHR",
           "REF_ENONC_RECHR",
           "UTILS_CREAT",
           "DATE_CREAT",
           "UTILS_MODFC",
           "DATE_MODFC",
           "REF_DETL_APLIC_MODL_RECHR",
           "DNR_PERTN",
           "REF_SEQNC_STRUC_APLIC",
           "REF_RESLT_RECHR"
    from   sie_23_detl_reslt_rechr;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_23_ENONC_RECHR;

create or replace force view vd_i_sie_23_enonc_rechr
(
  seqnc,
  ref_rechr,
  mot,
  ordre_apart,
  utils_creat,
  date_creat,
  utils_modfc,
  date_modfc
) as
  select   "SEQNC",
           "REF_RECHR",
           "MOT",
           "ORDRE_APART",
           "UTILS_CREAT",
           "DATE_CREAT",
           "UTILS_MODFC",
           "DATE_MODFC"
    from   sie_23_enonc_rechr;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_23_MODL_RECHR;

create or replace force view vd_i_sie_23_modl_rechr
(
  seqnc,
  code,
  ref_domn,
  nom,
  descr,
  utils_creat,
  date_creat,
  utils_modfc,
  date_modfc,
  ref_prodt,
  dnr_ref_prodt
) as
  select   "SEQNC",
           "CODE",
           "REF_DOMN",
           "NOM",
           "DESCR",
           "UTILS_CREAT",
           "DATE_CREAT",
           "UTILS_MODFC",
           "DATE_MODFC",
           "REF_PRODT",
           "DNR_REF_PRODT"
    from   sie_23_modl_rechr;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_23_PATRN_RECHR;

create or replace force view vd_i_sie_23_patrn_rechr
(
  seqnc,
  code,
  nom,
  descr,
  enonc_plsql_gauch,
  enonc_plsql_droit,
  utils_creat,
  date_creat,
  utils_modfc,
  date_modfc,
  opert,
  ref_prodt,
  dnr_ref_prodt
) as
  select   "SEQNC",
           "CODE",
           "NOM",
           "DESCR",
           "ENONC_PLSQL_GAUCH",
           "ENONC_PLSQL_DROIT",
           "UTILS_CREAT",
           "DATE_CREAT",
           "UTILS_MODFC",
           "DATE_MODFC",
           "OPERT",
           "REF_PRODT",
           "DNR_REF_PRODT"
    from   sie_23_patrn_rechr;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_23_RECHR;

create or replace force view vd_i_sie_23_rechr
(
  seqnc,
  ref_utils,
  date_exect,
  utils_creat,
  date_creat,
  utils_modfc,
  date_modfc,
  ref_modl_rechr
) as
  select   "SEQNC",
           "REF_UTILS",
           "DATE_EXECT",
           "UTILS_CREAT",
           "DATE_CREAT",
           "UTILS_MODFC",
           "DATE_MODFC",
           "REF_MODL_RECHR"
    from   sie_23_rechr;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_23_RESLT_RECHR;

create or replace force view vd_i_sie_23_reslt_rechr
(
  seqnc,
  ref_rechr,
  utils_creat,
  date_creat,
  utils_modfc,
  date_modfc,
  dnr_libl_struc_aplic_html,
  dnr_libl_struc_aplic,
  dnr_pertn,
  dnr_lien,
  dnr_decmp_reslt,
  ref_aplic_modl_rechr,
  dnr_ref_struc_aplic,
  ref_seqnc_struc_aplic
) as
  select   "SEQNC",
           "REF_RECHR",
           "UTILS_CREAT",
           "DATE_CREAT",
           "UTILS_MODFC",
           "DATE_MODFC",
           "DNR_LIBL_STRUC_APLIC_HTML",
           "DNR_LIBL_STRUC_APLIC",
           "DNR_PERTN",
           "DNR_LIEN",
           "DNR_DECMP_RESLT",
           "REF_APLIC_MODL_RECHR",
           "DNR_REF_STRUC_APLIC",
           "REF_SEQNC_STRUC_APLIC"
    from   sie_23_reslt_rechr;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_25_CHAMP;

create or replace force view vd_i_sie_25_champ
(
  seqnc,
  code,
  postn_x,
  postn_y,
  angle_orint,
  ref_formt,
  ref_versn_publc,
  ref_dv_type_champ,
  indic_modif,
  nom,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   "SEQNC",
           "CODE",
           "POSTN_X",
           "POSTN_Y",
           "ANGLE_ORINT",
           "REF_FORMT",
           "REF_VERSN_PUBLC",
           "REF_DV_TYPE_CHAMP",
           "INDIC_MODIF",
           "NOM",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC"
    from   sie_25_champ;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_25_DOMN_TYPE_PUBLC;

create or replace force view vd_i_sie_25_domn_type_publc
(
  seqnc,
  ref_domn,
  ref_type_publc,
  ref_publc,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   "SEQNC",
           "REF_DOMN",
           "REF_TYPE_PUBLC",
           "REF_PUBLC",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC"
    from   sie_25_domn_type_publc;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_25_ELEMN_CONFG_PUBLC;

create or replace force view vd_i_sie_25_elemn_confg_publc
(
  seqnc,
  ref_type_publc,
  code,
  nom,
  descr,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  type_don
) as
  select   "SEQNC",
           "REF_TYPE_PUBLC",
           "CODE",
           "NOM",
           "DESCR",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "TYPE_DON"
    from   sie_25_elemn_confg_publc;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_25_ENGIN;

create or replace force view vd_i_sie_25_engin
(
  seqnc,
  code,
  ref_dv_formt_sort,
  url_servl,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  url_servl_exter
) as
  select   "SEQNC",
           "CODE",
           "REF_DV_FORMT_SORT",
           "URL_SERVL",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "URL_SERVL_EXTER"
    from   sie_25_engin;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_25_ENGIN_VERSN_PUBLC;

create or replace force view vd_i_sie_25_engin_versn_publc
(
  seqnc,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_versn_publc,
  ref_engin,
  iden_acces,
  pdf_fusn
) as
  select   "SEQNC",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "REF_VERSN_PUBLC",
           "REF_ENGIN",
           "IDEN_ACCES",
           "PDF_FUSN"
    from   sie_25_engin_versn_publc;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_25_GROUP_PUBLC;

create or replace force view vd_i_sie_25_group_publc
(
  seqnc,
  code,
  nom,
  descr,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   "SEQNC",
           "CODE",
           "NOM",
           "DESCR",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC"
    from   sie_25_group_publc;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_25_JOURN_TRAVL_EXECT;

create or replace force view vd_i_sie_25_journ_travl_exect
(
  seqnc,
  ref_dv_type_ecrit,
  ref_travl,
  ref_publc_travl,
  date_journ,
  enonc
) as
  select   "SEQNC",
           "REF_DV_TYPE_ECRIT",
           "REF_TRAVL",
           "REF_PUBLC_TRAVL",
           "DATE_JOURN",
           "ENONC"
    from   sie_25_journ_travl_exect;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_25_OCURN_PARMT_PUBLC;

create or replace force view vd_i_sie_25_ocurn_parmt_publc
(
  seqnc,
  valr_date,
  valr_numbr,
  valr_varch,
  ref_parmt_publc_travl
) as
  select   "SEQNC",
           "VALR_DATE",
           "VALR_NUMBR",
           "VALR_VARCH",
           "REF_PARMT_PUBLC_TRAVL"
    from   sie_25_ocurn_parmt_publc_travl;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_25_PARMT_PUBLC_TRAVL;

create or replace force view vd_i_sie_25_parmt_publc_travl
(
  seqnc,
  ref_publc_travl,
  ref_parmt_type_publc,
  valr_varch,
  valr_date,
  valr_numbr,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   "SEQNC",
           "REF_PUBLC_TRAVL",
           "REF_PARMT_TYPE_PUBLC",
           "VALR_VARCH",
           "VALR_DATE",
           "VALR_NUMBR",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC"
    from   sie_25_parmt_publc_travl;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_25_PARMT_TYPE_PUBLC;

create or replace force view vd_i_sie_25_parmt_type_publc
(
  seqnc,
  ref_type_publc,
  ref_engin,
  code,
  nom,
  descr,
  indic_presn_appel,
  indic_fixe,
  valr_deft,
  type_valr_deft,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  type_don,
  ordre_presn,
  cardn
) as
  select   "SEQNC",
           "REF_TYPE_PUBLC",
           "REF_ENGIN",
           "CODE",
           "NOM",
           "DESCR",
           "INDIC_PRESN_APPEL",
           "INDIC_FIXE",
           "VALR_DEFT",
           "TYPE_VALR_DEFT",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "TYPE_DON",
           "ORDRE_PRESN",
           "CARDN"
    from   sie_25_parmt_type_publc;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_25_PAR_PUB_TRA_EXECT;

create or replace force view vd_i_sie_25_par_pub_tra_exect
(
  ref_travl_publc,
  valr_numbr1,
  valr_varch1,
  valr_date1,
  valr_numbr2,
  valr_varch2,
  valr_date2,
  valr_numbr3,
  valr_varch3,
  valr_date3,
  valr_numbr4,
  valr_varch4,
  valr_date4,
  valr_numbr5,
  valr_varch5,
  valr_date6,
  valr_numbr7,
  valr_varch7,
  valr_date7,
  valr_numbr8,
  valr_varch8,
  valr_date8,
  valr_numbr9,
  valr_varch9,
  valr_date9,
  valr_numbr10,
  valr_varch10,
  valr_date10,
  ref_travl,
  seqnc
) as
  select   "REF_TRAVL_PUBLC",
           "VALR_NUMBR1",
           "VALR_VARCH1",
           "VALR_DATE1",
           "VALR_NUMBR2",
           "VALR_VARCH2",
           "VALR_DATE2",
           "VALR_NUMBR3",
           "VALR_VARCH3",
           "VALR_DATE3",
           "VALR_NUMBR4",
           "VALR_VARCH4",
           "VALR_DATE4",
           "VALR_NUMBR5",
           "VALR_VARCH5",
           "VALR_DATE6",
           "VALR_NUMBR7",
           "VALR_VARCH7",
           "VALR_DATE7",
           "VALR_NUMBR8",
           "VALR_VARCH8",
           "VALR_DATE8",
           "VALR_NUMBR9",
           "VALR_VARCH9",
           "VALR_DATE9",
           "VALR_NUMBR10",
           "VALR_VARCH10",
           "VALR_DATE10",
           "REF_TRAVL",
           "SEQNC"
    from   sie_25_parmt_publc_travl_exect;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_25_PUBLC;

create or replace force view vd_i_sie_25_publc
(
  seqnc,
  ref_type_publc,
  code,
  nom,
  descr,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_group_publc
) as
  select   "SEQNC",
           "REF_TYPE_PUBLC",
           "CODE",
           "NOM",
           "DESCR",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "REF_GROUP_PUBLC"
    from   sie_25_publc;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_25_PUBLC_TRAVL;

create or replace force view vd_i_sie_25_publc_travl
(
  seqnc,
  ref_travl,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_stat,
  nom,
  indic_parmt_alimn,
  ref_versn_publc,
  ref_publc
) as
  select   "SEQNC",
           "REF_TRAVL",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "REF_STAT",
           "NOM",
           "INDIC_PARMT_ALIMN",
           "REF_VERSN_PUBLC",
           "REF_PUBLC"
    from   sie_25_publc_travl;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_25_TRAVL;

create or replace force view vd_i_sie_25_travl
(
  seqnc,
  ref_utils,
  indic_imedt,
  nom,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_domn,
  ref_stat,
  ref_type_travl
) as
  select   "SEQNC",
           "REF_UTILS",
           "INDIC_IMEDT",
           "NOM",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "REF_DOMN",
           "REF_STAT",
           "REF_TYPE_TRAVL"
    from   sie_25_travl;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_25_TYPE_PUBLC;

create or replace force view vd_i_sie_25_type_publc
(
  seqnc,
  code,
  nom,
  descr,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_struc_aplic
) as
  select   "SEQNC",
           "CODE",
           "NOM",
           "DESCR",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "REF_STRUC_APLIC"
    from   sie_25_type_publc;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_25_TYPE_TRAVL;

create or replace force view vd_i_sie_25_type_travl
(
  seqnc,
  code,
  nom,
  descr,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_domn
) as
  select   "SEQNC",
           "CODE",
           "NOM",
           "DESCR",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "REF_DOMN"
    from   sie_25_type_travl;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_25_VALR_CHAMP;

create or replace force view vd_i_sie_25_valr_champ
(
  seqnc,
  ref_champ,
  ref_publc_travl,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  valr_nombr,
  valr_date,
  valr_varch
) as
  select   "SEQNC",
           "REF_CHAMP",
           "REF_PUBLC_TRAVL",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "VALR_NOMBR",
           "VALR_DATE",
           "VALR_VARCH"
    from   sie_25_valr_champ;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_25_VALR_ELEMN_CONFG;

create or replace force view vd_i_sie_25_valr_elemn_confg
(
  seqnc,
  ref_elemn_confg_publc,
  date_debut_efect,
  date_fin_efect,
  valr_varch,
  valr_date,
  valr_numbr,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_domn
) as
  select   "SEQNC",
           "REF_ELEMN_CONFG_PUBLC",
           "DATE_DEBUT_EFECT",
           "DATE_FIN_EFECT",
           "VALR_VARCH",
           "VALR_DATE",
           "VALR_NUMBR",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "REF_DOMN"
    from   sie_25_valr_elemn_confg;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_25_VERSN_PUBLC;

create or replace force view vd_i_sie_25_versn_publc
(
  seqnc,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  date_debut_efect,
  date_fin_efect,
  ref_publc,
  code,
  nom,
  descr
) as
  select   "SEQNC",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "DATE_DEBUT_EFECT",
           "DATE_FIN_EFECT",
           "REF_PUBLC",
           "CODE",
           "NOM",
           "DESCR"
    from   sie_25_versn_publc;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_29_CONTR;

create or replace force view vd_i_sie_29_contr
(
  seqnc,
  code_contr,
  nom_struc_acces,
  nom,
  descr,
  niv_gravt,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_prodt,
  dnr_ref_prodt
) as
  select   "SEQNC",
           "CODE_CONTR",
           "NOM_STRUC_ACCES",
           "NOM",
           "DESCR",
           "NIV_GRAVT",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "REF_PRODT",
           "DNR_REF_PRODT"
    from   sie_29_contr;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_29_RESLT_REQUT_AQ;

create or replace force view vd_i_sie_29_reslt_requt_aq
(
  ref_contr,
  id,
  flow_id,
  page_id,
  nom_comps,
  niv_gravt,
  natr
) as
  select   "REF_CONTR",
           "ID",
           "FLOW_ID",
           "PAGE_ID",
           "NOM_COMPS",
           "NIV_GRAVT",
           "NATR"
    from   sie_29_reslt_requt_aq;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_30_AFECT_ITEM;

create or replace force view vd_i_sie_30_afect_item
(
  seqnc,
  ref_item_carnt_prodt,
  ref_utils,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   "SEQNC",
           "REF_ITEM_CARNT_PRODT",
           "REF_UTILS",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC"
    from   sie_30_afect_item;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_30_CARNT_APLIC;

create or replace force view vd_i_sie_30_carnt_aplic
(
  seqnc,
  nom,
  ref_carnt_prodt,
  ref_aplic,
  ref_utils_respn,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  docmn_refrc
) as
  select   "SEQNC",
           "NOM",
           "REF_CARNT_PRODT",
           "REF_APLIC",
           "REF_UTILS_RESPN",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "DOCMN_REFRC"
    from   sie_30_carnt_aplic;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_30_CARNT_PRODT;

create or replace force view vd_i_sie_30_carnt_prodt
(
  seqnc,
  ref_prodt,
  docmn_refrc,
  ref_utils_respn,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   "SEQNC",
           "REF_PRODT",
           "DOCMN_REFRC",
           "REF_UTILS_RESPN",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC"
    from   sie_30_carnt_prodt;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_30_CARNT_SPRIN;

create or replace force view vd_i_sie_30_carnt_sprin
(
  seqnc,
  descr,
  ref_utils_respn,
  ref_carnt_prodt,
  date_debut_prevu,
  date_fin_prevu,
  ref_versn,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   "SEQNC",
           "DESCR",
           "REF_UTILS_RESPN",
           "REF_CARNT_PRODT",
           "DATE_DEBUT_PREVU",
           "DATE_FIN_PREVU",
           "REF_VERSN",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC"
    from   sie_30_carnt_sprin;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_30_CAS_UTILS;

create or replace force view vd_i_sie_30_cas_utils
(
  seqnc,
  code,
  nom,
  descr,
  docmn_refrc,
  ref_carnt_prodt,
  ref_stat,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_utils_respn
) as
  select   "SEQNC",
           "CODE",
           "NOM",
           "DESCR",
           "DOCMN_REFRC",
           "REF_CARNT_PRODT",
           "REF_STAT",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "REF_UTILS_RESPN"
    from   sie_30_cas_utils;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_30_EFORT_ITEM;

create or replace force view vd_i_sie_30_efort_item
(
  seqnc,
  ref_item_carnt_sprin,
  ref_utils,
  comnt,
  date_efort,
  valr,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   "SEQNC",
           "REF_ITEM_CARNT_SPRIN",
           "REF_UTILS",
           "COMNT",
           "DATE_EFORT",
           "VALR",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC"
    from   sie_30_efort_item;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_30_HISTR_EFORT_RESTN;

create or replace force view vd_i_sie_30_histr_efort_restn
(
  seqnc,
  ref_item_carnt_sprin,
  date_heure_saisi,
  efort_restn,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   "SEQNC",
           "REF_ITEM_CARNT_SPRIN",
           "DATE_HEURE_SAISI",
           "EFORT_RESTN",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC"
    from   sie_30_histr_efort_restn;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_30_ITEM_CARNT_PRODT;

create or replace force view vd_i_sie_30_item_carnt_prodt
(
  seqnc,
  nom,
  descr,
  ref_carnt_prodt,
  ref_dv_prior,
  ref_stat,
  ref_dv_tail_reltv,
  ref_cas_utils,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   "SEQNC",
           "NOM",
           "DESCR",
           "REF_CARNT_PRODT",
           "REF_DV_PRIOR",
           "REF_STAT",
           "REF_DV_TAIL_RELTV",
           "REF_CAS_UTILS",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC"
    from   sie_30_item_carnt_prodt;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_30_ITEM_CARNT_SPRIN;

create or replace force view vd_i_sie_30_item_carnt_sprin
(
  seqnc,
  nom,
  descr,
  numr_refrc_docmn,
  ref_item_carnt_prodt,
  ref_carnt_sprin,
  efort_prevu,
  efort_restn,
  ref_dv_prior,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_sie_30_page
) as
  select   "SEQNC",
           "NOM",
           "DESCR",
           "NUMR_REFRC_DOCMN",
           "REF_ITEM_CARNT_PRODT",
           "REF_CARNT_SPRIN",
           "EFORT_PREVU",
           "EFORT_RESTN",
           "REF_DV_PRIOR",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "REF_SIE_30_PAGE"
    from   sie_30_item_carnt_sprin;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_30_PAGE;

create or replace force view vd_i_sie_30_page
(
  seqnc,
  ref_sie_13_page,
  nom,
  numr_apex,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   "SEQNC",
           "REF_SIE_13_PAGE",
           "NOM",
           "NUMR_APEX",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC"
    from   sie_30_page;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_I_SIE_30_PAGE_ITEM;

create or replace force view vd_i_sie_30_page_item
(
  seqnc,
  ref_sie_30_page,
  ref_item_carnt_prodt,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   "SEQNC",
           "REF_SIE_30_PAGE",
           "REF_ITEM_CARNT_PRODT",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC"
    from   sie_30_page_item;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_P12315_SIE_12_STAT;

create or replace force view vd_p12315_sie_12_stat
(
  seqnc,
  ref_struc_aplic,
  ref_group_stat,
  ordre,
  code,
  nom,
  descr,
  date_creat,
  utils_creat,
  date_modfc,
  indic_initl,
  indic_stat_utils
) as
  select   seqnc,
           ref_struc_aplic,
           ref_group_stat,
           ordre,
           code,
           nom,
           descr,
           date_creat,
           utils_creat,
           date_modfc,
           indic_initl,
           indic_stat_utils
    from   vd_i_sie_12_stat;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_01_ATRIB_MODL_COMNC;

create or replace force view vd_sie_01_atrib_modl_comnc
(
  seqnc,
  code,
  nom,
  descr,
  ref_modl_comnc
) as
  select   seqnc,
           code,
           nom,
           descr,
           ref_modl_comnc
    from   vd_i_sie_01_atrib_modl_comnc;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_01_CODE_ERR_ORACL;

create or replace force view vd_sie_01_code_err_oracl
(
  seqnc,
  err_code,
  err_code_formt,
  libl,
  utils_creat,
  date_creat,
  date_modfc,
  utils_modfc
) as
  select   seqnc,
           err_code,
              'ora-'
           || lpad (err_code,
                    5,
                    0)
             err_code_formt,
           libl,
           utils_creat,
           date_creat,
           date_modfc,
           utils_modfc
    from   vd_i_sie_01_code_err_oracl;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_01_CONFG_EVENM_NOTFB;

create or replace force view vd_sie_01_confg_evenm_notfb
(
  seqnc,
  ref_type_comnc,
  ref_type_comnc_code_formt,
  ref_type_comnc_formt,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  objet,
  titre_mesg,
  mesg_sms,
  mesg,
  ref_evenm_notfb,
  nom,
  descr,
  ref_domn,
  ref_compt_twili,
  ref_profl_courl,
  indic_deft
) as
  select   seqnc,
           ref_type_comnc,
           (select   tc.code
              from   sie_01_type_comnc tc
             where   tc.seqnc = ref_type_comnc),
           (select   tc.nom
              from   sie_01_type_comnc tc
             where   tc.seqnc = ref_type_comnc),
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           objet,
           titre_mesg,
           mesg_sms,
           mesg,
           ref_evenm_notfb,
           nom,
           descr,
           ref_domn,
           ref_compt_twili,
           ref_profl_courl,
           indic_deft
    from   vd_i_sie_01_confg_evenm_notfb;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_01_DESTN;

create or replace force view vd_sie_01_destn
(
  seqnc,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_atrib_struc_aplic,
  ref_sa,
  ref_sa_formt,
  ref_sa_prodt,
  descr
) as
  select   seqnc,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           ref_atrib_struc_aplic,
           (select   ref_struc_aplic
              from   vd_i_sie_12_atrib_struc_aplic asa
             where   asa.seqnc = d.ref_atrib_struc_aplic)
             ref_sa,
           (select   sa.nom
              from   vd_i_sie_12_struc_aplic sa,
                     vd_i_sie_12_atrib_struc_aplic asa
             where   asa.seqnc = d.ref_atrib_struc_aplic and sa.seqnc = asa.ref_struc_aplic)
             ref_sa_formt,
           (select   sa.ref_prodt
              from   vd_i_sie_12_struc_aplic sa,
                     vd_i_sie_12_atrib_struc_aplic asa
             where   asa.seqnc = d.ref_atrib_struc_aplic and sa.seqnc = asa.ref_struc_aplic)
             ref_sa_prodt,
           descr
    from   vd_i_sie_01_destn d;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_01_DESTN_CONFG_EN;

create or replace force view vd_sie_01_destn_confg_en
(
  seqnc,
  ref_dv_natr_destn,
  ref_dv_natr_destn_code,
  ref_dv_natr_destn_valr,
  ref_confg_evenm_notfb,
  ref_destn,
  ref_reslt_destn,
  ref_reslt_destn_formt,
  ref_atrib_sa_nom_formt,
  ref_atrib_sa_nom_formt_code,
  ref_atrib_sa_adres_destn,
  ref_atrib_sa_adres_destn_code,
  utils_creat,
  date_modfc,
  utils_modfc,
  date_creat
) as
  select   seqnc,
           ref_dv_natr_destn,
           sie_14_domn_valr_pkg.obten_valr (ref_dv_natr_destn) ref_dv_natr_destn_valr,
           sie_14_domn_valr_pkg.obten_code (ref_dv_natr_destn) ref_dv_natr_destn_code,
           ref_confg_evenm_notfb,
           ref_destn,
           ref_reslt_destn,
           (select   rd.nom
              from   vd_sie_01_reslt_destn rd
             where   rd.seqnc = dc.ref_reslt_destn)
             ref_reslt_destn_formt,
           ref_atrib_sa_nom_formt,
           (select   asa.nom_coln
              from   vd_sie_12_atrib_struc_aplic asa
             where   asa.seqnc = dc.ref_atrib_sa_nom_formt)
             ref_atrib_sa_nom_formt_code,
           ref_atrib_sa_adres_destn,
           (select   asa.nom_coln
              from   vd_sie_12_atrib_struc_aplic asa
             where   asa.seqnc = dc.ref_atrib_sa_adres_destn)
             ref_atrib_sa_adres_destn_code,
           utils_creat,
           date_modfc,
           utils_modfc,
           date_creat
    from   vd_i_sie_01_destn_confg_en dc;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_01_ELEMN_CONFG_EN;

create or replace force view vd_sie_01_elemn_confg_en
(
  seqnc,
  ref_confg_evenm_notfb,
  code,
  elemn_subst_mesg,
  ident_acces,
  ident_acces_formt,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  formt
) as
  select   seqnc,
           ref_confg_evenm_notfb,
           code,
           sie_01_elemn_confg_en_pkg.formt_elemn_subst_mesg (code),
           ident_acces,
           ident_acces_formt,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           formt
    from   vd_i_sie_01_elemn_confg_en;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_01_EVENM_NOTFB;

create or replace force view vd_sie_01_evenm_notfb
(
  seqnc,
  code,
  nom,
  descr,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_struc_aplic,
  ref_struc_aplic_code,
  ref_struc_aplic_formt,
  ref_prodt,
  ref_prodt_formt
) as
  select   seqnc,
           code,
           nom,
           descr,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           ref_struc_aplic,
           (select   code
              from   vd_sie_12_struc_aplic sa
             where   sa.seqnc = en.ref_struc_aplic)
             ref_struc_aplic_code,
           (select   nom
              from   vd_sie_12_struc_aplic sa
             where   sa.seqnc = en.ref_struc_aplic)
             ref_struc_aplic_formt,
           (select   ref_prodt
              from   vd_sie_12_struc_aplic sa
             where   sa.seqnc = en.ref_struc_aplic)
             ref_prodt,
           (select   ref_prodt_formt
              from   vd_sie_12_struc_aplic sa
             where   sa.seqnc = en.ref_struc_aplic)
             ref_prodt_formt
    from   vd_i_sie_01_evenm_notfb en;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_01_HIERC_APLIC;

create or replace force view vd_sie_01_hierc_aplic
(
  seqnc,
  ref_evenm_notfb,
  ref_atrib_struc_aplic,
  aplic_prior,
  ref_sa,
  ref_sa_formt,
  ref_sa_cle_etran,
  ref_sa_cle_etran_formt,
  chemn_reslt
) as
  select   seqnc,
           ref_evenm_notfb,
           ref_atrib_struc_aplic,
           aplic_prior,
           (select   sa.seqnc
              from   vd_i_sie_12_atrib_struc_aplic asa,
                     vd_i_sie_12_struc_aplic sa
             where   sa.seqnc = asa.ref_struc_aplic and asa.seqnc = ha.ref_atrib_struc_aplic)
             ref_sa,
           (select   sa.nom
              from   vd_i_sie_12_atrib_struc_aplic asa,
                     vd_i_sie_12_struc_aplic sa
             where   sa.seqnc = asa.ref_struc_aplic and asa.seqnc = ha.ref_atrib_struc_aplic)
             ref_sa_formt,
           (select   sa.seqnc
              from   vd_i_sie_12_struc_aplic sa,
                     vd_i_sie_12_atrib_struc_aplic asa2,
                     vd_i_sie_12_atrib_struc_aplic asa
             where   sa.seqnc = asa2.ref_struc_aplic
                 and asa2.seqnc = asa.ref_atrib_struc_aplic
                 and asa.seqnc = ha.ref_atrib_struc_aplic)
             ref_sa_cle_etran,
           (select   sa.nom
              from   vd_i_sie_12_struc_aplic sa,
                     vd_i_sie_12_atrib_struc_aplic asa2,
                     vd_i_sie_12_atrib_struc_aplic asa
             where   sa.seqnc = asa2.ref_struc_aplic
                 and asa2.seqnc = asa.ref_atrib_struc_aplic
                 and asa.seqnc = ha.ref_atrib_struc_aplic)
             ref_sa_cle_etran_formt,
           (select   nvl (asa.nom_fonct, asa.nom_coln)
              from   vd_i_sie_12_atrib_struc_aplic asa
             where   asa.seqnc = ha.ref_atrib_struc_aplic)
             chemn_reslt
    from   vd_i_sie_01_hierc_aplic ha;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_01_LANG;

create or replace force view vd_sie_01_lang
(
  seqnc,
  code,
  nom,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   seqnc,
           code,
           nom,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc
    from   vd_i_sie_01_lang;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_01_LANG_LANG;

create or replace force view vd_sie_01_lang_lang
(
  seqnc,
  ref_lang,
  nom,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_lang_cible
) as
  select   seqnc,
           ref_lang,
           nom,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           ref_lang_cible
    from   vd_i_sie_01_lang_lang;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_01_MESG;

create or replace force view vd_sie_01_mesg
(
  seqnc,
  numr_mesg,
  numr_mesg_formt,
  ref_prodt,
  ref_prodt_formt,
  descr,
  type_mesg,
  type_mesg_formt
) as
  select   seqnc,
           numr_mesg,
           (select   mesg
              from   vd_sie_01_mesg_lang ml
             where   ml.ref_mesg = mes.seqnc and ml.ref_lang = sie_07_util_pkg.obten_lang_sesn)
             numr_mesg_formt,
           ref_prodt,
           nvl ( (select   p.code || ' - ' || p.nom
                    from   vd_i_sie_11_prodt p
                   where   p.seqnc = mes.ref_prodt),
                '- Global -')
             ref_prodt_formt,
           descr,
           type_mesg,
           decode (type_mesg,
                   'E', 'Erreur',
                   'A', 'Aide',
                   'W', 'Avertissement',
                   'I', 'Informatif',
                   'C', 'Erreur critique',
                   null)
             type_mesg_formt
    from   vd_i_sie_01_mesg mes;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_01_MESG_AIDE;

create or replace force view vd_sie_01_mesg_aide
(
  seqnc,
  nom,
  libl,
  type_item,
  ref_page,
  numr_mesg,
  mesg,
  ref_lang,
  seqnc_mesg_lang
) as
  select   aap.seqnc,
           aap.nom_apex,
           aap.libl,
           aap.type_item,
           aap.ref_page,
           mes.numr_mesg,
           mel.mesg,
           mel.ref_lang,
           mel.seqnc
    from   vd_i_sie_13_page pa,
           vd_i_sie_13_page_item aap,
           vd_i_sie_11_prodt pro,
           vd_i_sie_11_aplic ap,
           vd_i_sie_01_mesg mes,
           vd_i_sie_01_mesg_lang mel
   where   pa.ref_aplic = ap.seqnc
       and ap.ref_prodt = pro.seqnc
       and aap.ref_page = pa.seqnc
       and aap.ref_mesg_aide = mes.seqnc(+)
       and mel.ref_mesg(+) = mes.seqnc
  union all
  select   irc.seqnc,
           irc.coln_table,
           irc.libl,
           'RAPRT',
           ir.ref_page,
           mes.numr_mesg,
           mel.mesg,
           mel.ref_lang,
           mel.seqnc
    from   vd_i_sie_13_page pa,
           vd_i_sie_13_page_ir ir,
           vd_i_sie_13_page_ir_coln irc,
           vd_i_sie_11_prodt pro,
           vd_i_sie_11_aplic ap,
           vd_i_sie_01_mesg mes,
           vd_i_sie_01_mesg_lang mel
   where   pa.ref_aplic = ap.seqnc
       and ap.ref_prodt = pro.seqnc
       and ir.ref_page = pa.seqnc
       and irc.ref_page_ir = ir.seqnc
       and irc.ref_mesg_aide = mes.seqnc(+)
       and mel.ref_mesg(+) = mes.seqnc
  union all
  select   rpl.seqnc,
           null,
           null,
           'PAGE',
           rp.ref_page,
           rp.nom,
           to_char (rpl.contn),
           rpl.ref_lang,
           rpl.seqnc
    from   vd_i_sie_13_page pa,
           vd_i_sie_11_prodt pro,
           vd_i_sie_11_aplic ap,
           vd_i_sie_13_regn_piltb rp,
           vd_i_sie_13_regn_piltb_lang rpl
   where   pa.ref_aplic = ap.seqnc
       and ap.ref_prodt = pro.seqnc
       and rp.ref_page = pa.seqnc
       and rpl.ref_regn_piltb = rp.seqnc
       and rp.ref_dv_type_regn_piltb = sie_14_domn_valr_pkg.obten_seqnc ('TYPE_REGN_PILTB',
                                                                         'AIDE_PAGE');


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_01_MESG_ERR_LIE;

create or replace force view vd_sie_01_mesg_err_lie
(
  seqnc,
  ref_code_err_oracl,
  ref_code_err_oracl_formt,
  nom_table,
  nom_coln,
  nom_contr,
  page,
  page_formt,
  comnt,
  ref_prodt,
  ref_prodt_formt,
  type_liais,
  ref_mesg,
  ref_numr_mesg
) as
  select   seqnc,
           ref_code_err_oracl,
           (select   err_code
              from   vd_i_sie_01_code_err_oracl ceo
             where   ceo.seqnc = mel.ref_code_err_oracl)
             ref_code_err_oracl_formt,
           nom_table,
           nom_coln,
           nom_contr,
           page,
           -- Ajouter un numéro d'application à la vue pour rendre unique la combinaison page, ref_prodt et aplic.
           page /*(SELECT numr || ' - ' || nom
                   FROM vs_sie_13_page
                  WHERE numr = mel.page AND mel.ref_prodt = seqnc_prodt AND )*/
               page_formt,
           comnt,
           ref_prodt,
           (select   code || ' - ' || nom
              from   vd_i_sie_11_prodt
             where   seqnc = mel.ref_prodt)
             ref_prodt_formt,
           type_liais,
           ref_mesg,
           (select   m.numr_mesg
              from   vd_i_sie_01_mesg m
             where   m.seqnc = mel.ref_mesg)
             ref_numr_mesg
    from   vd_i_sie_01_mesg_err_lie mel;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_01_MESG_INFOR;

create or replace force view vd_sie_01_mesg_infor
(
  seqnc,
  text_mesg,
  utils_creat,
  date_creat,
  sess_id,
  ref_utils,
  ref_mesg_lang
) as
  select   seqnc,
           text_mesg,
           utils_creat,
           date_creat,
           sess_id,
           ref_utils,
           ref_mesg_lang
    from   vd_i_sie_01_mesg_infor
   where   sess_id = sie_07_util_pkg.nv ('APP_SESSION')
        or ref_utils = sie_12_utils_pkg.obten_usagr_conct
  with check option;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_01_MESG_LANG;

create or replace force view vd_sie_01_mesg_lang
(
  seqnc,
  ref_lang,
  ref_lang_formt,
  mesg,
  ref_mesg,
  ref_mesg_formt,
  type_mesg
) as
  select   seqnc,
           ref_lang,
           (select   l.nom
              from   vd_sie_01_lang l
             where   l.seqnc = p.seqnc)
             ref_lang,
           mesg,
           ref_mesg,
           (select   m.numr_mesg
              from   vd_i_sie_01_mesg m
             where   m.seqnc = p.ref_mesg)
             ref_mesg_formt,
           (select   m.type_mesg
              from   vd_i_sie_01_mesg m
             where   m.seqnc = p.ref_mesg)
             type_mesg
    from   vd_i_sie_01_mesg_lang p;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_01_MESG_TRADC_APEX;

create or replace force view vd_sie_01_mesg_tradc_apex
(
  seqnc,
  nom,
  text,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_lang,
  lang,
  ref_lang_formt,
  ref_prodt
) as
  select   seqnc,
           nom,
           text,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           ref_lang,
           (select   lower (l.code)
              from   vd_i_sie_01_lang l
             where   l.seqnc = mta.ref_lang)
             lang,
           (select   l.nom
              from   vd_i_sie_01_lang l
             where   l.seqnc = mta.ref_lang)
             ref_lang_formt,
           ref_prodt
    from   vd_i_sie_01_mesg_tradc_apex mta;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_01_MODL_AFICH_NOTFC;

create or replace force view vd_sie_01_modl_afich_notfc
(
  seqnc,
  code,
  nom,
  descr,
  coulr_texte,
  tail_texte,
  coulr_titre,
  tail_titre,
  temps_afich,
  ref_resrc_icon,
  ref_formt_resrc_icon,
  ref_ocurn_resrc_icon,
  ref_domn,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_type_comnc,
  ref_modl_comnc
) as
  select   seqnc,
           code,
           nom,
           descr,
           coulr_texte,
           tail_texte,
           coulr_titre,
           tail_titre,
           temps_afich,
           ref_resrc_icon,
           ref_formt_resrc_icon,
           ref_ocurn_resrc_icon,
           ref_domn,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           ref_type_comnc,
           ref_modl_comnc
    from   vd_i_sie_01_modl_afich_notfc;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_01_MODL_COMNC;

create or replace force view vd_sie_01_modl_comnc
(
  seqnc,
  code,
  nom,
  descr,
  ref_type_comnc,
  ref_type_comnc_formt,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  indic_systm,
  ref_domn
) as
  select   seqnc,
           code,
           nom,
           descr,
           ref_type_comnc,
           (select   nom
              from   vd_i_sie_01_type_comnc tc
             where   tc.seqnc = mc.ref_type_comnc)
             ref_type_comnc_formt,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           indic_systm,
           ref_domn
    from   vd_i_sie_01_modl_comnc mc;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_01_MODL_MESG_NOTFC;

create or replace force view vd_sie_01_modl_mesg_notfc
(
  seqnc,
  code,
  nom,
  descr,
  objet,
  corps_mesg,
  ref_domn
) as
  (select   seqnc,
            code,
            nom,
            descr,
            objet,
            corps_mesg,
            ref_domn
     from   vd_i_sie_01_modl_mesg_notfc);


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_01_NOTFC;

create or replace force view vd_sie_01_notfc
(
  seqnc,
  code,
  nom,
  descr,
  inden_mesg,
  titre_mesg,
  mesg,
  ref_modl_afich_notfc,
  indic_specf,
  indic_afich_uniq,
  ref_domn,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   seqnc,
           code,
           nom,
           descr,
           inden_mesg,
           titre_mesg,
           mesg,
           ref_modl_afich_notfc,
           indic_specf,
           indic_afich_uniq,
           ref_domn,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc
    from   vd_i_sie_01_notfc;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_01_OSA_EVENM_NOTFB;

create or replace force view vd_sie_01_osa_evenm_notfb
(
  seqnc,
  ref_hierc_aplic,
  ref_confg_evenm_notfb,
  ref_seqnc_struc_aplic,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   seqnc,
           ref_hierc_aplic,
           ref_confg_evenm_notfb,
           ref_seqnc_struc_aplic,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc
    from   vd_i_sie_01_osa_evenm_notfb;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_01_RESLT_DESTN;

create or replace force view vd_sie_01_reslt_destn
(
  seqnc,
  ref_destn,
  dnr_ref_prodt,
  ident_acces,
  ident_acces_formt,
  nom,
  ref_struc_aplic_acces,
  utils_creat,
  date_creat,
  utils_modfc,
  date_modfc
) as
  select   seqnc,
           ref_destn,
           dnr_ref_prodt,
           ident_acces,
           ident_acces_formt,
           nom,
           ref_struc_aplic_acces,
           utils_creat,
           date_creat,
           utils_modfc,
           date_modfc
    from   vd_i_sie_01_reslt_destn;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_01_TYPE_COMNC;

create or replace force view vd_sie_01_type_comnc
(
  seqnc,
  code,
  nom,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   seqnc,
           code,
           nom,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc
    from   vd_i_sie_01_type_comnc;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_03_CLAS_INTER;

create or replace force view vd_sie_03_clas_inter
(
  seqnc,
  code,
  nom,
  descr,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_prodt,
  ref_prodt_formt,
  ref_profl_courl,
  ref_profl_courl_formt,
  indic_avert_autr_uniq
) as
  select   seqnc,
           code,
           nom,
           descr,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           ref_prodt,
           (select   p.code || ' - ' || p.nom
              from   vd_i_sie_11_prodt p
             where   p.seqnc = ci.ref_prodt),
           ref_profl_courl,
           (select   pc.code || ' - ' || pc.servr_sortn
              from   vd_i_sie_17_profl_courl pc
             where   pc.seqnc = ci.ref_profl_courl),
           indic_avert_autr_uniq
    from   vd_i_sie_03_clas_inter ci;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_03_JOURN;

create or replace force view vd_sie_03_journ
(
  date_heure,
  expli,
  ereur,
  pile_trace,
  travl
) as
  select   date_heure,
           expli,
           ereur,
           pile_trace,
           travl
    from   vd_i_sie_03_journ;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_03_JOURN_STRUC_APLIC;

create or replace force view vd_sie_03_journ_struc_aplic
(
  seqnc,
  ref_domn,
  struc_aplic,
  struc_aplic_code,
  seqnc_struc_aplic,
  date_time,
  numr_err,
  actio_journ,
  don_nomnl,
  reslt,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   seqnc,
           ref_domn,
           struc_aplic,
           (select   code
              from   vd_i_sie_12_struc_aplic sa
             where   sa.seqnc = struc_aplic)
             struc_aplic_code,
           seqnc_struc_aplic,
           date_time,
           numr_err,
           actio_journ,
           don_nomnl,
           reslt,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc
    from   vd_i_sie_03_journ_struc_aplic;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_03_LIEN_CLAS_INTER_UTIL;

create or replace force view vd_sie_03_lien_clas_inter_util
(
  seqnc,
  ref_clas_inter,
  ref_utils,
  date_debut_efect,
  date_fin_efect,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_group_utils
) as
  select   seqnc,
           ref_clas_inter,
           ref_utils,
           date_debut_efect,
           date_fin_efect,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           ref_group_utils
    from   vd_i_sie_03_lien_clas_inter_ut;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_04_CONTX;

create or replace force view vd_sie_04_contx
(
  ref_fil_arian,
  contx,
  actio,
  seqnc_contx,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  contx_inter,
  actio_inter,
  seqnc_contx_inter,
  indic_ignor,
  nom_procd_infor_suplm,
  infor_suplm,
  contx_formt
) as
  select   ctx.ref_fil_arian,
           ctx.contx,
           ctx.actio,
           ctx.seqnc_contx,
           ctx.date_creat,
           ctx.utils_creat,
           ctx.date_modfc,
           ctx.utils_modfc,
           ctx.contx_inter,
           ctx.actio_inter,
           ctx.seqnc_contx_inter,
           ctx.indic_ignor,
           ctx.nom_procd_infor_suplm,
           ctx.infor_suplm,
           ctx.contx_formt
    from   vd_i_sie_04_contx ctx
   where   exists
             (select   null
                from   vd_i_sie_04_fil_arian fil
               where   fil.seqnc = ctx.ref_fil_arian);


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_04_CONTX_ETEND;

create or replace force view vd_sie_04_contx_etend
(
  seqnc,
  ref_contx,
  nom,
  valr_numbr,
  valr_varch,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  page_cible,
  type_alimn,
  type_elemn
) as
  select   seqnc,
           ref_contx,
           nom,
           valr_numbr,
           valr_varch,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           page_cible,
           type_alimn,
           type_elemn
    from   vd_i_sie_04_contx_etend etend
   where   exists
             (select   null
                from   vd_i_sie_04_contx contx
               where   contx.ref_fil_arian = etend.ref_contx);


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_04_FIL_ARIAN;

create or replace force view vd_sie_04_fil_arian
(
  seqnc,
  aplic,
  page,
  session_id,
  ref_elemn_sup,
  libl,
  timst,
  app_id,
  hash_dernr_url,
  indic_afich
) as
  select   seqnc,
           aplic,
           page,
           session_id,
           ref_elemn_sup,
           libl,
           timst,
           app_id,
           hash_dernr_url,
           indic_afich
    from   vd_i_sie_04_fil_arian fa
   where   fa.session_id = sie_07_util_pkg.nv ('SESSION');


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_04_NAVGT_HISTR;

create or replace force view vd_sie_04_navgt_histr
(
  seqnc,
  ref_utils,
  dnr_libl,
  dnr_url,
  dnr_icon,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   seqnc,
           ref_utils,
           dnr_libl,
           dnr_url,
           dnr_icon,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc
    from   vd_i_sie_04_navgt_histr;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_07_AUDIT_STRUC_APLIC;

create or replace force view vd_sie_07_audit_struc_aplic
(
  seqnc,
  ref_utils,
  ref_seqnc_struc_aplic,
  dnr_ref_seqnc_sa_formt,
  ref_struc_aplic,
  ref_actio_audit,
  ref_page,
  natr_audit,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_domn
) as
  select   "SEQNC",
           "REF_UTILS",
           "REF_SEQNC_STRUC_APLIC",
           "DNR_REF_SEQNC_SA_FORMT",
           "REF_STRUC_APLIC",
           "REF_ACTIO_AUDIT",
           "REF_PAGE",
           "NATR_AUDIT",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "REF_DOMN"
    from   vd_i_sie_07_audit_struc_aplic;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_07_VALR_AUDIT_STR_APL;

create or replace force view vd_sie_07_valr_audit_str_apl
(
  seqnc,
  ref_audit_struc_aplic,
  code,
  valr_formt,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   "SEQNC",
           "REF_AUDIT_STRUC_APLIC",
           "CODE",
           "VALR_FORMT",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC"
    from   vd_i_sie_07_valr_audit_str_apl;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_11_APLIC;

create or replace force view vd_sie_11_aplic
(
  seqnc,
  code,
  nom,
  nom_formt,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  numr_aplic_apex,
  ref_lang,
  lang_formt,
  date_dernr_maj_refrn_apex,
  ref_versn,
  ref_numr_versn_formt,
  ref_nom_versn,
  indic_aplic_authe,
  ref_aplic_authe,
  ref_page_conxn,
  ref_page_acuei,
  ref_prodt
) as
  select   a.seqnc,
           a.code,
           a.nom,
              a.numr_aplic_apex
           || ' - '
           || a.code
           || ' - '
           || a.nom
           || ' '
           || (select   sie_11_versn_pkg.obten_versn (v.numr_versn_1,
                                                      v.numr_versn_2,
                                                      v.numr_versn_3,
                                                      v.numr_versn_4)
                 from   vd_i_sie_11_versn v
                where   v.seqnc = a.ref_versn)
             nom_formt,
           a.date_creat,
           a.utils_creat,
           a.date_modfc,
           a.utils_modfc,
           a.numr_aplic_apex,
           sie_11_aplic_pkg.obten_lang_deft (a.seqnc) ref_lang,
           sie_11_aplic_pkg.obten_lang_deft_formt (a.seqnc) lang_formt,
           a.date_dernr_maj_refrn_apex,
           a.ref_versn,
           (select   sie_11_versn_pkg.obten_versn (v.numr_versn_1,
                                                   v.numr_versn_2,
                                                   v.numr_versn_3,
                                                   v.numr_versn_4)
              from   vd_i_sie_11_versn v
             where   v.seqnc = a.ref_versn)
             ref_numr_versn_formt,
           (select   v.nom
              from   vd_sie_11_versn v
             where   v.seqnc = a.ref_versn)
             ref_nom_versn,
           a.indic_aplic_authe,
           a.ref_aplic_authe,
           a.ref_page_conxn,
           a.ref_page_acuei,
           a.ref_prodt
    from   vd_i_sie_11_aplic a;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_11_ATRIB_ENTIT;

create or replace force view vd_sie_11_atrib_entit
(
  seqnc,
  nom,
  type_don,
  type_don_formt,
  compr_migrt,
  ref_entit,
  ref_entit_formt,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  code,
  ref_entit_refrn,
  ref_entit_refrn_formt,
  indic_nouvl_atrib_formt
) as
  select   seqnc,
           nom,
           type_don,
           (case type_don when 'V' then 'Varchar2' when 'N' then 'Number' when 'D' then 'Date' end),
           compr_migrt,
           ref_entit,
           (select   nom
              from   vd_i_sie_11_entit e
             where   e.seqnc = ae.ref_entit)
             ref_entit_formt,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           code,
           ref_entit_refrn,
           (select   nom
              from   vd_i_sie_11_entit e
             where   e.seqnc = ae.ref_entit_refrn)
             ref_entit_refrn_formt,
           decode (indic_nouvl_atrib,  'O', 'Oui',  'N', 'Non')
    from   vd_i_sie_11_atrib_entit ae;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_11_ENTIT;

create or replace force view vd_sie_11_entit
(
  seqnc,
  nom,
  nom_table_tempr,
  nom_table_ereur,
  indic_creer_ocurn,
  indic_creer_ocurn_formt,
  indic_modif_ocurn,
  indic_modif_ocurn_formt,
  indic_suprm_ocurn,
  indic_suprm_ocurn_formt,
  indic_force_selct,
  indic_force_selct_formt,
  ref_versn,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ordre_exect,
  longr_bloc,
  indic_nouvl_entit,
  indic_nouvl_entit_formt,
  niv_inclu_migrt,
  niv_inclu_migrt_formt,
  confg_inclu_migrt,
  indic_expor_tabl_index,
  indic_expor_tabl_index_formt,
  indic_suprm_don_prodt,
  indic_suprm_don_prodt_formt
) as
  select   seqnc,
           nom,
           nom_table_tempr,
           nom_table_ereur,
           indic_creer_ocurn,
           case indic_creer_ocurn when 'O' then 'Oui' else 'Non' end indic_creer_ocurn_formt,
           indic_modif_ocurn,
           case indic_modif_ocurn when 'O' then 'Oui' else 'Non' end indic_modif_ocurn_formt,
           indic_suprm_ocurn,
           case indic_suprm_ocurn when 'O' then 'Oui' else 'Non' end indic_suprm_ocurn_formt,
           indic_force_selct,
           case indic_force_selct when 'O' then 'Oui' else 'Non' end indic_force_selct_formt,
           ref_versn,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           ordre_exect,
           longr_bloc,
           indic_nouvl_entit,
           case indic_nouvl_entit when 'O' then 'Oui' else 'Non' end indic_nouvl_entit_formt,
           niv_inclu_migrt,
           case niv_inclu_migrt
             when 'GLOBL' then 'Global'
             when 'PRODT' then 'Produit'
             when 'APLIC' then 'Application'
             when 'CONTX' then 'Selon contexte'
             else null
           end
             niv_inclu_migrt_formt,
           confg_inclu_migrt,
           indic_expor_tabl_index,
           case indic_expor_tabl_index when 'O' then 'Oui' else 'Non' end indic_expor_tabl_index_formt,
           indic_suprm_don_prodt,
           case indic_suprm_don_prodt when 'O' then 'Oui' else 'Non' end indic_suprm_don_prodt_formt
    from   vd_i_sie_11_entit;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_11_PARMT_AFW;

create or replace force view vd_sie_11_parmt_afw
(
  seqnc,
  code,
  valr,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   seqnc,
           code,
           valr,
           utils_creat,
           date_creat,
           utils_modfc,
           date_modfc
    from   vd_i_sie_11_parmt_afw;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_11_PLUGN;

create or replace force view vd_sie_11_plugn
(
  seqnc,
  code_inter,
  nom,
  nom_formt,
  descr,
  ref_versn,
  ref_versn_formt,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   p.seqnc,
           p.code_inter,
           p.nom,
              p.nom
           || ' '
           || (select   sie_11_versn_pkg.obten_versn (v.numr_versn_1,
                                                      v.numr_versn_2,
                                                      v.numr_versn_3,
                                                      v.numr_versn_4)
                 from   vd_i_sie_11_versn v
                where   v.ref_plugn = p.seqnc)
             nom_formt,
           p.descr,
           p.ref_versn,
           (select   sie_11_versn_pkg.obten_numr_versn (v.numr_versn_1,
                                                        v.numr_versn_2,
                                                        v.numr_versn_3,
                                                        v.numr_versn_4)
              from   vd_i_sie_11_versn v
             where   v.ref_plugn = p.seqnc)
             ref_versn_formt,
           p.date_creat,
           p.utils_creat,
           p.date_modfc,
           p.utils_modfc
    from   vd_i_sie_11_plugn p;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_11_PRODT;

create or replace force view vd_sie_11_prodt
(
  seqnc,
  code,
  nom,
  nom_formt,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  procd_expor_metdn,
  tail_tabl_extra,
  indic_extra_tout,
  ref_group_utils_admin,
  dosr_fichr,
  ident_envir,
  ref_versn,
  ref_numr_versn_formt,
  ref_nom_versn,
  mesg_tout_droit_resrv,
  jquer_ui_css_scope,
  indic_afich_err_code,
  ref_mesg_sucs,
  ref_mesg_echec,
  ref_mesg_fetch,
  ref_mesg_range_suprm,
  ref_mesg_range_modf,
  ref_mesg_range_inser,
  ref_mesg_aucun_don_trouv,
  ref_mesg_trop_don_trouv,
  ref_mesg_audit_creat,
  ref_mesg_audit_modfc,
  ref_mesg_audit_suprs,
  fonct_obten_base_url,
  ref_aplic_acuei,
  ref_numr_aplic_acuei,
  ref_page_acuei,
  ref_numr_page_acuei,
  ref_aplic_comnt_bogue,
  ref_numr_aplic_comnt_bogue,
  ref_page_comnt_bogue,
  ref_numr_page_comnt_bogue,
  indic_page_inexs_maj_refrn,
  procd_impre_entet_pdf_ir,
  procd_impre_pied_page_pdf_ir,
  procd_plpdf_coulr,
  compt_genrl
) as
  select   seqnc,
           code,
           nom,
              p.nom
           || ' '
           || (select   sie_11_versn_pkg.obten_versn (v.numr_versn_1,
                                                      v.numr_versn_2,
                                                      v.numr_versn_3,
                                                      v.numr_versn_4)
                 from   vd_i_sie_11_versn v
                where   v.seqnc = p.ref_versn)
             nom_formt,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           procd_expor_metdn,
           tail_tabl_extra,
           indic_extra_tout,
           ref_group_utils_admin,
           dosr_fichr,
           ident_envir,
           ref_versn,
           (select   sie_11_versn_pkg.obten_versn (v.numr_versn_1,
                                                   v.numr_versn_2,
                                                   v.numr_versn_3,
                                                   v.numr_versn_4)
              from   vd_i_sie_11_versn v
             where   v.seqnc = p.ref_versn)
             ref_numr_versn_formt,
           (select   v.nom
              from   vd_sie_11_versn v
             where   v.seqnc = ref_versn)
             ref_nom_versn,
           mesg_tout_droit_resrv,
           jquer_ui_css_scope,
           indic_afich_err_code,
           --sie_11_prodt_pkg.obten_lang_sesn ref_lang,
           --sie_11_prodt_pkg.obten_code_lang_sesn lang_formt,
           ref_mesg_sucs,
           ref_mesg_echec,
           ref_mesg_fetch,
           ref_mesg_range_suprm,
           ref_mesg_range_modf,
           ref_mesg_range_inser,
           ref_mesg_aucun_don_trouv,
           ref_mesg_trop_don_trouv,
           ref_mesg_audit_creat,
           ref_mesg_audit_modfc,
           ref_mesg_audit_suprs,
           fonct_obten_base_url,
           ref_aplic_acuei,
           sie_11_aplic_pkg.obten_numr_apex_aplic (p.ref_aplic_acuei) ref_numr_aplic_acuei,
           ref_page_acuei,
           sie_13_page_pkg.obten_numr_apex_page (p.ref_page_acuei) ref_numr_page_acuei,
           ref_aplic_comnt_bogue,
           sie_11_aplic_pkg.obten_numr_apex_aplic (p.ref_aplic_comnt_bogue) ref_numr_aplic_comnt_bogue,
           ref_page_comnt_bogue,
           sie_13_page_pkg.obten_numr_apex_page (p.ref_page_comnt_bogue) ref_numr_page_comnt_bogue,
           indic_page_inexs_maj_refrn,
           procd_impre_entet_pdf_ir,
           procd_impre_pied_page_pdf_ir,
           procd_plpdf_coulr,
           compt_genrl
    from   vd_i_sie_11_prodt p;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_11_PRODT_LANG;

create or replace force view vd_sie_11_prodt_lang
(
  seqnc,
  ref_prodt,
  ref_lang,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   seqnc,
           ref_prodt,
           ref_lang,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc
    from   vd_i_sie_11_prodt_lang;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_11_PRODT_RESRC;

create or replace force view vd_sie_11_prodt_resrc
(
  seqnc,
  ref_prodt,
  ref_resrc,
  ref_formt,
  ref_condt_exect,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_plugn
) as
  select   seqnc,
           ref_prodt,
           ref_resrc,
           ref_formt,
           ref_condt_exect,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           ref_plugn
    from   vd_i_sie_11_prodt_resrc;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_11_UTILS;

create or replace force view vd_sie_11_utils
(
  seqnc,
  ref_prodt,
  ref_utils,
  role,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   seqnc,
           ref_prodt,
           ref_utils,
           role,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc
    from   vd_i_sie_11_utils;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_11_VERSN;

create or replace force view vd_sie_11_versn
(
  seqnc,
  code,
  nom,
  nom_formt,
  numr_versn_1,
  numr_versn_2,
  numr_versn_3,
  numr_versn_4,
  versn_formt,
  numr_versn_formt,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_prodt,
  ref_plugn,
  indic_docmn_verl,
  ref_aplic
) as
  select   seqnc,
           code,
           nom,
              case when nom is not null then nom || ' ' else null end
           || sie_11_versn_pkg.obten_versn (numr_versn_1,
                                            numr_versn_2,
                                            numr_versn_3,
                                            numr_versn_4),
           numr_versn_1,
           numr_versn_2,
           numr_versn_3,
           numr_versn_4,
           sie_11_versn_pkg.obten_versn (numr_versn_1,
                                         numr_versn_2,
                                         numr_versn_3,
                                         numr_versn_4),
           sie_11_versn_pkg.obten_numr_versn (numr_versn_1,
                                              numr_versn_2,
                                              numr_versn_3,
                                              numr_versn_4),
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           ref_prodt,
           ref_plugn,
           indic_docmn_verl,
           ref_aplic
    from   vd_i_sie_11_versn;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_12_ACTIO_AUDIT;

create or replace force view vd_sie_12_actio_audit
(
  seqnc,
  ref_struc_aplic,
  dnr_ref_prodt,
  code,
  nom,
  ref_mesg,
  descr,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   "SEQNC",
           "REF_STRUC_APLIC",
           "DNR_REF_PRODT",
           "CODE",
           "NOM",
           "REF_MESG",
           "DESCR",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC"
    from   vd_i_sie_12_actio_audit;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_12_ARBRE;

create or replace force view vd_sie_12_arbre
(
  seqnc,
  noeud_actif,
  ref_sesn,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  indic_rafrc,
  id_apex_regn
) as
  select   "SEQNC",
           "NOEUD_ACTIF",
           "REF_SESN",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "INDIC_RAFRC",
           "ID_APEX_REGN"
    from   vd_i_sie_12_arbre;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_12_ARBRE_NOEUD;

create or replace force view vd_sie_12_arbre_noeud
(
  seqnc,
  ref_arbre,
  noeud_ouver,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   seqnc,
           ref_arbre,
           noeud_ouver,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc
    from   vd_i_sie_12_arbre_noeud;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_12_ATRIB_STRUC_APLIC;

create or replace force view vd_sie_12_atrib_struc_aplic
(
  seqnc,
  nom_coln,
  nom_fonct,
  ref_dv_natr_infor,
  ref_dv_natr_infor_code,
  ref_dv_natr_infor_formt,
  indic_valid,
  indic_valid_formt,
  ref_struc_aplic,
  ref_atrib_struc_aplic,
  ref_atrib_struc_aplic_nom_sa,
  ref_atrib_struc_aplic_seqnc_sa,
  indic_destn
) as
  select   seqnc,
           nom_coln,
           nom_fonct,
           ref_dv_natr_infor,
           sie_14_domn_valr_pkg.obten_code (ref_dv_natr_infor),
           sie_14_domn_valr_pkg.obten_valr (ref_dv_natr_infor),
           indic_valid,
           case when indic_valid = 'O' then '' else 'Inexistant dans la structure d''accès' end indic_valid_formt,
           ref_struc_aplic,
           ref_atrib_struc_aplic,
           (select   sa.nom
              from   vd_sie_12_struc_aplic sa,
                     vd_i_sie_12_atrib_struc_aplic asa2
             where   sa.seqnc = asa2.ref_struc_aplic and asa2.seqnc = asa.ref_atrib_struc_aplic)
             ref_atrib_struc_aplic_nom_sa,
           (select   asa2.ref_struc_aplic
              from   vd_i_sie_12_atrib_struc_aplic asa2
             where   asa2.seqnc = asa.ref_atrib_struc_aplic)
             ref_atrib_struc_aplic_seqnc_sa,
           indic_destn
    from   vd_i_sie_12_atrib_struc_aplic asa;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_12_COMPT_PAYPL;

create or replace force view vd_sie_12_compt_paypl
(
  seqnc,
  nom,
  ref_domn,
  url_boutn,
  signt_boutn,
  nom_utils_boutn,
  mot_passe_boutn,
  versn_api_boutn,
  url_retr,
  signt_retr,
  reprt_walt,
  mot_passe_walt,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  procd_redrc_url
) as
  select   "SEQNC",
           "NOM",
           "REF_DOMN",
           "URL_BOUTN",
           "SIGNT_BOUTN",
           "NOM_UTILS_BOUTN",
           "MOT_PASSE_BOUTN",
           "VERSN_API_BOUTN",
           "URL_RETR",
           "SIGNT_RETR",
           "REPRT_WALT",
           "MOT_PASSE_WALT",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "PROCD_REDRC_URL"
    from   vd_i_sie_12_compt_paypl;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_12_DEFNT_ACCES;

create or replace force view vd_sie_12_defnt_acces
(
  seqnc,
  ref_group_utils,
  ref_group_utils_formt,
  ref_utils,
  ref_utils_formt,
  indic_acces,
  indic_acces_formt,
  indic_modfc,
  indic_modfc_formt,
  indic_suprs,
  indic_suprs_formt,
  indic_creat,
  indic_creat_formt,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_opert,
  ref_opert_formt,
  ref_code_opert,
  ref_struc_aplic,
  ref_struc_aplic_formt,
  ref_code_struc_aplic
) as
  select   seqnc,
           ref_group_utils,
           (select   nom
              from   vd_i_sie_12_group_utils
             where   seqnc = dac.ref_group_utils)
             ref_group_utils_formt,
           ref_utils,
           null ref_utils_formt,
           indic_acces,
           sie_14_domn_valr_pkg.obten_valr ('DEFNT_ACCES',
                                            indic_acces)
             indic_acces_formt,
           indic_modfc,
           sie_14_domn_valr_pkg.obten_valr ('DEFNT_ACCES',
                                            indic_modfc)
             indic_modfc_formt,
           indic_suprs,
           sie_14_domn_valr_pkg.obten_valr ('DEFNT_ACCES',
                                            indic_suprs)
             indic_suprs_formt,
           indic_creat,
           sie_14_domn_valr_pkg.obten_valr ('DEFNT_ACCES',
                                            indic_creat)
             indic_creat_formt,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           ref_opert,
           (select   nom
              from   vd_i_sie_13_opert
             where   seqnc = dac.ref_opert)
             ref_opert_formt,
           (select   code
              from   vd_i_sie_13_opert
             where   seqnc = dac.ref_opert)
             ref_code_opert,
           ref_struc_aplic,
           (select   nom
              from   vd_i_sie_12_struc_aplic
             where   seqnc = dac.ref_struc_aplic)
             ref_struc_aplic_formt,
           (select   code
              from   vd_i_sie_12_struc_aplic
             where   seqnc = dac.ref_struc_aplic)
             ref_code_struc_aplic
    from   vd_i_sie_12_defnt_acces dac;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_12_DETL_FORML;

create or replace force view vd_sie_12_detl_forml
(
  seqnc,
  enonc,
  ordre_presn,
  ref_forml,
  ref_formt_repns,
  ref_domn_valr,
  ref_seqnc_objet,
  code_objet,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   "SEQNC",
           "ENONC",
           "ORDRE_PRESN",
           "REF_FORML",
           "REF_FORMT_REPNS",
           "REF_DOMN_VALR",
           "REF_SEQNC_OBJET",
           "CODE_OBJET",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC"
    from   vd_i_sie_12_detl_forml;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_12_DOMN;

create or replace force view vd_sie_12_domn
(
  seqnc,
  code,
  nom,
  nom_formt,
  descr,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  type_travl_deft,
  ref_profl_courl_notfc,
  ref_profl_sms_notfc,
  ref_compt_axiat_deft,
  ref_modl_rechr_deft,
  procd_authe_exter_afw,
  procd_vald_niv_secrt_mot_passe,
  indic_demnd_activ_compt_utils
) as
  select   seqnc,
           code,
           nom,
           code || ' - ' || nom,
           descr,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           type_travl_deft,
           ref_profl_courl_notfc,
           ref_profl_sms_notfc,
           ref_compt_axiat_deft,
           ref_modl_rechr_deft,
           procd_authe_exter_afw,
           procd_vald_niv_secrt_mot_passe,
           indic_demnd_activ_compt_utils
    from   vd_i_sie_12_domn;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_12_DOMN_FONCT;

create or replace force view vd_sie_12_domn_fonct
(
  seqnc,
  ref_fonct,
  ref_fonct_formt,
  ref_domn,
  ref_domn_formt,
  indic_actif,
  indic_actif_formt,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   seqnc,
           ref_fonct,
           (select   f.nom
              from   vd_sie_12_fonct f
             where   f.seqnc = ref_fonct),
           ref_domn,
           sie_12_domn_pkg.obten_code_domn (ref_domn),
           indic_actif,
           case indic_actif
             when 'O' then '<span class="ui-button-icon-primary ui-icon fff-icon-tick"></span>'
             else null
           end,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc
    from   vd_i_sie_12_domn_fonct;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_12_DOMN_UTILS;

create or replace force view vd_sie_12_domn_utils
(
  seqnc,
  ref_utils,
  ref_utils_formt,
  ref_code_utils,
  ref_domn,
  date_debut_efect,
  date_fin_efect,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   seqnc,
           ref_utils,
           (select   nom_formt
              from   vd_sie_12_utils u
             where   u.seqnc = du.ref_utils),
           (select   code_utils
              from   vd_sie_12_utils u
             where   u.seqnc = du.ref_utils),
           ref_domn,
           date_debut_efect,
           date_fin_efect,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc
    from   vd_i_sie_12_domn_utils du;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_12_EVOLT_STAT;

create or replace force view vd_sie_12_evolt_stat
(
  seqnc,
  ref_stat,
  ref_stat_evolt,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  indic_code
) as
  select   seqnc,
           ref_stat,
           ref_stat_evolt,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           indic_code
    from   vd_i_sie_12_evolt_stat;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_12_FAVR;

create or replace force view vd_sie_12_favr
(
  seqnc,
  ref_struc_aplic,
  ref_struc_aplic_formt,
  numr_page,
  ref_seqnc_struc_aplic,
  ref_utils,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   f.seqnc,
           f.ref_struc_aplic,
           sa.code ref_struc_aplic_formt,
           p.numr_apex numr_page,
           f.ref_seqnc_struc_aplic,
           f.ref_utils,
           f.date_creat,
           f.utils_creat,
           f.date_modfc,
           f.utils_modfc
    from   vd_i_sie_12_favr f,
           vd_i_sie_12_struc_aplic sa,
           vd_i_sie_13_page p
   where   f.ref_struc_aplic = sa.seqnc and p.seqnc = sa.ref_page_forml;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_12_FONCT;

create or replace force view vd_sie_12_fonct
(
  seqnc,
  ref_prodt,
  ref_prodt_formt,
  code,
  nom,
  descr,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  dnr_ref_prodt
) as
  select   seqnc,
           ref_prodt,
           sie_11_prodt_pkg.obten_code_prodt (ref_prodt),
           code,
           nom,
           descr,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           dnr_ref_prodt
    from   vd_i_sie_12_fonct;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_12_FONCT_STRUC_APLIC;

create or replace force view vd_sie_12_fonct_struc_aplic
(
  seqnc,
  ref_fonct,
  ref_fonct_formt,
  ref_struc_aplic,
  ref_struc_aplic_formt,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  dnr_ref_prodt
) as
  select   seqnc,
           ref_fonct,
           (select   f.nom
              from   vd_sie_12_fonct f
             where   f.seqnc = ref_fonct),
           ref_struc_aplic,
           sie_12_struc_aplic_pkg.obten_struc_aplic_formt (ref_struc_aplic),
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           dnr_ref_prodt
    from   vd_i_sie_12_fonct_struc_aplic;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_12_FORML;

create or replace force view vd_sie_12_forml
(
  seqnc,
  code,
  nom,
  descr,
  ref_sesn,
  objet_refrn,
  ref_seqnc_objet_refrn,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   "SEQNC",
           "CODE",
           "NOM",
           "DESCR",
           "REF_SESN",
           "OBJET_REFRN",
           "REF_SEQNC_OBJET_REFRN",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC"
    from   vd_i_sie_12_forml;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_12_GROUP_STAT;

create or replace force view vd_sie_12_group_stat
(
  seqnc,
  ref_prodt,
  ref_prodt_formt,
  code,
  nom,
  descr,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   seqnc,
           ref_prodt,
           (select   nom
              from   vd_i_sie_11_prodt p
             where   p.seqnc = gs.ref_prodt)
             ref_prodt_formt,
           code,
           nom,
           descr,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc
    from   vd_i_sie_12_group_stat gs;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_12_GROUP_UTILS;

create or replace force view vd_sie_12_group_utils
(
  seqnc,
  nom,
  descr,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_prodt,
  ref_prodt_formt,
  ref_code_prodt_formt,
  code,
  indic_ignor_group_admin,
  indic_ignor_group_admin_formt,
  indic_systm,
  ref_domn,
  ref_domn_formt,
  indic_acces_globl,
  indic_acces_globl_formt,
  indic_opert_exist_formt,
  indic_struc_aplic_exist_formt,
  indic_group_utils_exist_formt
) as
  select   seqnc,
           nom,
           descr,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           ref_prodt,
           (select   code || ' - ' || nom
              from   vd_i_sie_11_prodt
             where   seqnc = gu.ref_prodt)
             ref_prodt_formt,
           (select   code
              from   vd_i_sie_11_prodt
             where   seqnc = gu.ref_prodt)
             ref_code_prodt_formt,
           code,
           indic_ignor_group_admin,
           case indic_ignor_group_admin
             when 'O' then '<span class="ui-button-icon-primary ui-icon fff-icon-tick"></span>'
             else null
           end
             indic_ignor_group_admin_formt,
           indic_systm,
           ref_domn,
           (select   nom_formt
              from   vd_sie_12_domn
             where   seqnc = gu.ref_domn)
             ref_domn_formt,
           indic_acces_globl,
           case indic_acces_globl
             when 'O' then '<span class="ui-button-icon-primary ui-icon fff-icon-tick"></span>'
             else null
           end
             indic_acces_globl_formt,
           case (select   1
                   from   vd_sie_12_defnt_acces da
                  where   da.ref_group_utils = gu.seqnc and da.ref_opert is not null and rownum < 2)
             when 1 then '<span class="ui-button-icon-primary ui-icon fff-icon-tick"></span>'
             else null
           end
             indic_opert_exist_formt,
           case (select   1
                   from   vd_sie_12_defnt_acces da
                  where   da.ref_group_utils = gu.seqnc and da.ref_struc_aplic is not null and rownum < 2)
             when 1 then '<span class="ui-button-icon-primary ui-icon fff-icon-tick"></span>'
             else null
           end
             indic_struc_aplic_exist_formt,
           case (select   1
                   from   vd_i_sie_12_lien_group_utils lgu
                  where   ref_group = gu.seqnc and ref_group_utils_lie is not null and rownum < 2)
             when 1 then '<span class="ui-button-icon-primary ui-icon fff-icon-tick"></span>'
             else null
           end
             indic_group_utils_exist_formt
    from   vd_i_sie_12_group_utils gu;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_12_GR_UT_OPERT_OPT_DOM;

create or replace force view vd_sie_12_gr_ut_opert_opt_dom
(
  seqnc,
  ref_group_utils,
  ref_group_utils_formt,
  ref_group_utils_code,
  ref_opert,
  ref_opert_formt,
  ref_opert_optio,
  ref_opert_optio_formt,
  ref_domn,
  ref_domn_formt,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   seqnc,
           ref_group_utils,
           sie_12_group_utils_pkg.obten_nom (ref_group_utils),
           sie_12_group_utils_pkg.obten_code (ref_group_utils),
           ref_opert,
           (select   o.nom
              from   vd_sie_13_opert o
             where   o.seqnc = ref_opert),
           ref_opert_optio,
           (select   oo.nom
              from   vd_sie_13_opert_optio oo
             where   oo.seqnc = ref_opert_optio),
           ref_domn,
           sie_12_domn_pkg.obten_code_domn (ref_domn),
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc
    from   vd_i_sie_12_g_u_opert_opt_dom;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_12_HISTR_ACCES;

create or replace force view vd_sie_12_histr_acces
(
  seqnc,
  ref_utils,
  date_evenm,
  ref_dv_type_evenm,
  ref_dv_type_evenm_formt,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  adres_ip,
  ref_utils_pour
) as
  select   seqnc,
           ref_utils,
           date_evenm,
           ref_dv_type_evenm,
           case
             when ref_utils_pour is null then
               sie_14_domn_valr_pkg.obten_valr (ref_dv_type_evenm)
             else
               replace (sie_14_domn_valr_pkg.obten_valr (ref_dv_type_evenm),
                        '%1%',
                        sie_12_utils_pkg.obten_nom_formt_de_utils (ref_utils_pour))
           end
             ref_dv_type_evenm_formt,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           adres_ip,
           ref_utils_pour
    from   vd_i_sie_12_histr_acces;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_12_LIEN_GROUP_UTILS;

create or replace force view vd_sie_12_lien_group_utils
(
  seqnc,
  ref_group,
  ref_group_indic_acces,
  ref_group_domn,
  ref_group_prodt,
  ref_group_indic_non_modfb,
  ref_utils,
  date_debut_efect,
  date_fin_efect,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_group_utils_lie,
  ref_group_utils_lie_formt,
  ref_group_lie_indic_acces,
  ref_group_lie_domn,
  ref_group_lie_prodt,
  dnr_ref_prodt,
  ref_domn
) as
  select   seqnc,
           ref_group,
           (select   indic_acces_globl
              from   vd_i_sie_12_group_utils
             where   seqnc = lgu.ref_group)
             ref_group_indic_acces,
           (select   ref_domn
              from   vd_i_sie_12_group_utils
             where   seqnc = lgu.ref_group)
             ref_group_domn,
           (select   ref_prodt
              from   vd_i_sie_12_group_utils
             where   seqnc = lgu.ref_group)
             ref_group_prodt,
           case sie_12_group_utils_pkg.obten_code (lgu.ref_group)
             when 'SUPER_UTILS' then 'O'
             when 'AUTOR_CONXN_DERV' then 'O'
             else 'N'
           end
             ref_group_indic_non_modfb,
           ref_utils,
           date_debut_efect,
           date_fin_efect,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           ref_group_utils_lie,
           (select   gu.nom
              from   vd_sie_12_group_utils gu
             where   gu.seqnc = lgu.ref_group_utils_lie)
             ref_group_utils_lie_formt,
           (select   indic_acces_globl
              from   vd_i_sie_12_group_utils
             where   seqnc = lgu.ref_group_utils_lie)
             ref_group_lie_indic_acces,
           (select   ref_domn
              from   vd_i_sie_12_group_utils
             where   seqnc = lgu.ref_group_utils_lie)
             ref_group_lie_domn,
           (select   ref_prodt
              from   vd_i_sie_12_group_utils
             where   seqnc = lgu.ref_group_utils_lie)
             ref_group_lie_prodt,
           dnr_ref_prodt,
           ref_domn
    from   vd_i_sie_12_lien_group_utils lgu;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_12_LIEN_STRUC;

create or replace force view vd_sie_12_lien_struc
(
  seqnc,
  ref_struc_admin,
  date_debut_efect,
  date_fin_efect,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_struc_lie
) as
  select   seqnc,
           ref_struc_admin,
           date_debut_efect,
           date_fin_efect,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           ref_struc_lie
    from   vd_i_sie_12_lien_struc;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_12_MEMBR_STRUC;

create or replace force view vd_sie_12_membr_struc
(
  seqnc,
  ref_utils,
  ref_utils_formt,
  date_expir_utils,
  ref_struc_admin,
  ref_respn_struc_admin,
  date_debut_efect,
  date_fin_efect,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   seqnc,
           ref_utils,
           (select   nom || ', ' || prenm
              from   vd_i_sie_12_utils
             where   seqnc = mes.ref_utils)
             ref_utils_formt,
           (select   date_expir
              from   vd_i_sie_12_utils
             where   seqnc = mes.ref_utils)
             date_expir_utils,
           ref_struc_admin,
           (select   ref_respn
              from   vd_i_sie_12_struc_admin
             where   seqnc = mes.ref_struc_admin)
             ref_respn_struc_admin,
           date_debut_efect,
           date_fin_efect,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc
    from   vd_i_sie_12_membr_struc mes;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_12_PAYPL_RETR_APLIC;

create or replace force view vd_sie_12_paypl_retr_aplic
(
  seqnc,
  ref_sesn,
  numr_apex_aplic,
  numr_apex_page,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_compt_paypl,
  ref_struc_aplic,
  ref_seqnc_struc_aplic
) as
  select   "SEQNC",
           "REF_SESN",
           "NUMR_APEX_APLIC",
           "NUMR_APEX_PAGE",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "REF_COMPT_PAYPL",
           "REF_STRUC_APLIC",
           "REF_SEQNC_STRUC_APLIC"
    from   vd_i_sie_12_paypl_retr_aplic;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_12_REPNS_FORML;

create or replace force view vd_sie_12_repns_forml
(
  seqnc,
  ref_detl_forml,
  valr_un,
  valr_deux,
  valr_autre,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   "SEQNC",
           "REF_DETL_FORML",
           "VALR_UN",
           "VALR_DEUX",
           "VALR_AUTRE",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC"
    from   vd_i_sie_12_repns_forml;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_12_REQT_INTER_UTILS;

create or replace force view vd_sie_12_reqt_inter_utils
(
  seqnc,
  ident,
  ref_utils,
  ref_utils_code,
  ref_utils_formt,
  ref_dv_type_reqt_inter,
  ref_dv_type_reqt_inter_code,
  ref_dv_type_reqt_inter_formt,
  date_debut_efect,
  date_fin_efect,
  ref_domn,
  ref_prodt,
  numr_aplic_apex,
  numr_page_apex,
  url_inter,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  date_trait,
  indic_trait_formt
) as
  select   riu.seqnc,
           riu.ident,
           riu.ref_utils,
           (select   u.code_utils
              from   vd_sie_12_utils u
             where   u.seqnc = riu.ref_utils),
           (select   u.nom_formt
              from   vd_sie_12_utils u
             where   u.seqnc = riu.ref_utils),
           riu.ref_dv_type_reqt_inter,
           sie_14_domn_valr_pkg.obten_code (riu.ref_dv_type_reqt_inter),
           sie_14_domn_valr_pkg.obten_valr (riu.ref_dv_type_reqt_inter),
           riu.date_debut_efect,
           riu.date_fin_efect,
           riu.ref_domn,
           riu.ref_prodt,
           riu.numr_aplic_apex,
           riu.numr_page_apex,
           sie_12_reqt_inter_utils_pkg.obten_url_inter_formt_html (riu.seqnc),
           riu.date_creat,
           riu.utils_creat,
           riu.date_modfc,
           riu.utils_modfc,
           riu.date_trait,
           case
             when riu.date_trait is not null then '<span class="ui-button-icon-primary ui-icon fff-icon-tick"></span>'
             else null
           end
             indic_trait_formt
    from   vd_i_sie_12_reqt_inter_utils riu;


/* Formatted on 6/3/2013 10:08:27 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_12_SESN;

create or replace force view vd_sie_12_sesn
(
  id_sesn,
  app_user,
  ref_lang
) as
  select   id_sesn,
           app_user,
           ref_lang
    from   vd_i_sie_12_sesn;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_12_STAT;

create or replace force view vd_sie_12_stat
(
  seqnc,
  ref_struc_aplic,
  ref_struc_aplic_formt,
  ref_group_stat,
  ref_group_stat_formt,
  ordre,
  code,
  nom,
  descr,
  date_creat,
  utils_creat,
  date_modfc,
  indic_initl
) as
  select   seqnc,
           ref_struc_aplic,
           (select   code
              from   vd_i_sie_12_struc_aplic sa
             where   sa.seqnc = s.ref_struc_aplic)
             ref_struc_aplic_formt,
           ref_group_stat,
           (select   code
              from   vd_i_sie_12_group_stat gs
             where   gs.seqnc = s.ref_group_stat)
             ref_group_stat_formt,
           ordre,
           code,
           nom,
           descr,
           date_creat,
           utils_creat,
           date_modfc,
           indic_initl
    from   vd_i_sie_12_stat s;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_12_STRUC_ADMIN;

create or replace force view vd_sie_12_struc_admin
(
  seqnc,
  nom,
  indic_deft,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_type_struc,
  ref_type_struc_formt,
  ref_respn,
  debut_efect,
  fin_efect,
  ref_domn
) as
  select   seqnc,
           nom,
           indic_deft,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           ref_type_struc,
           (select   nom
              from   vd_i_sie_12_type_struc
             where   seqnc = str.ref_type_struc)
             ref_type_struc_formt,
           ref_respn,
           debut_efect,
           fin_efect,
           ref_domn
    from   vd_i_sie_12_struc_admin str;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_12_STRUC_APLIC;

create or replace force view vd_sie_12_struc_aplic
(
  seqnc,
  nom,
  descr,
  ref_prodt,
  ref_prodt_formt,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  code,
  ref_mesg_err_suprs,
  ref_code_mesg_err_suprs,
  indic_extra_tout,
  tail_tabl_extra,
  nom_struc_acces_don,
  ref_page_liste,
  ref_page_forml,
  nom_packg,
  indic_dispn_docmn,
  indic_stat_exist_formt,
  indic_page_liee_exist_formt,
  indic_evenm_notfb_exist_formt,
  indic_atrib_destn_exist_formt,
  nom_schem
) as
  select   sa.seqnc,
           sa.nom,
           sa.descr,
           sa.ref_prodt,
           (select   code || ' - ' || nom
              from   vd_i_sie_11_prodt
             where   seqnc = sa.ref_prodt)
             ref_prodt_formt,
           sa.date_creat,
           sa.utils_creat,
           sa.date_modfc,
           sa.utils_modfc,
           sa.code,
           sa.ref_mesg_err_suprs,
           (select   m.numr_mesg
              from   vd_i_sie_01_mesg m
             where   m.seqnc = sa.ref_mesg_err_suprs)
             ref_code_mesg_err_suprs,
           indic_extra_tout,
           tail_tabl_extra,
           nom_struc_acces_don,
           ref_page_liste,
           ref_page_forml,
           nom_packg,
           indic_dispn_docmn,
           case (select   1
                   from   vd_i_sie_12_stat s
                  where   s.ref_struc_aplic = sa.seqnc and rownum < 2)
             when 1 then '<span class="ui-button-icon-primary ui-icon fff-icon-tick"></span>'
             else null
           end
             indic_stat_exist_formt,
           case (select   1
                   from   vd_i_sie_13_page p
                  where   p.ref_struc_aplic = sa.seqnc and rownum < 2)
             when 1 then '<span class="ui-button-icon-primary ui-icon fff-icon-tick"></span>'
             else null
           end
             indic_page_liee_exist_formt,
           case (select   1
                   from   vd_i_sie_01_evenm_notfb en
                  where   en.ref_struc_aplic = sa.seqnc and rownum < 2)
             when 1 then '<span class="ui-button-icon-primary ui-icon fff-icon-tick"></span>'
             else null
           end
             indic_evenm_notfb_exist_formt,
           case (select   1
                   from   vd_i_sie_12_atrib_struc_aplic asa
                  where   asa.ref_struc_aplic = sa.seqnc and asa.indic_destn = 'O' and rownum < 2)
             when 1 then '<span class="ui-button-icon-primary ui-icon fff-icon-tick"></span>'
             else null
           end
             indic_atrib_destn_exist_formt,
           nom_schem
    from   vd_i_sie_12_struc_aplic sa;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_12_STRUC_APLIC_DESTN;

create or replace force view vd_sie_12_struc_aplic_destn
(
  seqnc,
  ref_struc_aplic,
  ref_struc_aplic_code,
  ref_destn,
  utils_creat,
  date_creat,
  utils_modfc,
  date_modfc
) as
  select   seqnc,
           ref_struc_aplic,
           (select   s.code
              from   vd_i_sie_12_struc_aplic s
             where   s.seqnc = sd.ref_struc_aplic)
             ref_struc_aplic_code,
           ref_destn,
           utils_creat,
           date_creat,
           utils_modfc,
           date_modfc
    from   vd_i_sie_12_struc_aplic_destn sd;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_12_STRUC_APLIC_LANG;

create or replace force view vd_sie_12_struc_aplic_lang
(
  seqnc,
  ref_struc_aplic,
  adjec_demns,
  nom,
  descr,
  ref_lang,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   seqnc,
           ref_struc_aplic,
           adjec_demns,
           nom,
           descr,
           ref_lang,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc
    from   vd_i_sie_12_struc_aplic_lang;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_12_TYPE_STRUC;

create or replace force view vd_sie_12_type_struc
(
  seqnc,
  code,
  nom,
  descr,
  ref_domn,
  ref_domn_formt,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   seqnc,
           code,
           nom,
           descr,
           ref_domn,
           (select   code || ' - ' || nom
              from   vd_i_sie_12_domn
             where   seqnc = tst.ref_domn)
             ref_prodt_formt,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc
    from   vd_i_sie_12_type_struc tst;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_12_UTILS;

create or replace force view vd_sie_12_utils
(
  seqnc,
  nom,
  prenm,
  courl,
  nom_formt,
  nom_formt_comnc,
  code_utils,
  mot_passe,
  date_expir,
  indic_verl,
  indic_verl_formt,
  indic_chang_mot_passe,
  indic_chang_mot_passe_formt,
  indic_actif,
  indic_actif_formt,
  dernr_prodt_acces,
  dernr_domn_acces,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_dv_compl_maxm,
  code_utils_base_don
) as
  select   seqnc,
           nom,
           prenm,
           courl,
           (nom || ', ' || prenm) nom_formt,
           (prenm || ' ' || nom) nom_formt_comnc,
           code_utils,
           mot_passe,
           date_expir,
           indic_verl,
           decode (indic_verl, 'O', '<span class="ui-button-icon-primary ui-icon fff-icon-tick"></span>', null)
             indic_verl_formt,
           indic_chang_mot_passe,
           decode (indic_chang_mot_passe, 'O', 'X', null) indic_chang_mot_passe_formt,
           indic_actif,
           decode (indic_actif, 'O', '<span class="ui-button-icon-primary ui-icon fff-icon-tick"></span>', null)
             indic_actif_formt,
           dernr_prodt_acces,
           dernr_domn_acces,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           ref_dv_compl_maxm,
           code_utils_base_don
    from   vd_i_sie_12_utils;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_13_CONDT_EXECT;

create or replace force view vd_sie_13_condt_exect
(
  seqnc,
  code,
  nom,
  descr,
  enonc_condt_plsql,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   seqnc,
           code,
           nom,
           descr,
           enonc_condt_plsql,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc
    from   vd_i_sie_13_condt_exect;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_13_CONDT_PILTB;

create or replace force view vd_sie_13_condt_piltb
(
  seqnc,
  ref_page,
  ref_page_apex,
  code,
  nom,
  descr,
  condt,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_page_item_focus
) as
  select   seqnc,
           ref_page,
           (select   numr_apex
              from   vd_i_sie_13_page p
             where   p.seqnc = cp.ref_page)
             ref_page_apex,
           code,
           nom,
           descr,
           condt,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           ref_page_item_focus
    from   vd_i_sie_13_condt_piltb cp;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_13_DOSR_VIRTL;

create or replace force view vd_sie_13_dosr_virtl
(
  seqnc,
  ref_prodt,
  code,
  nom,
  descr,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   seqnc,
           ref_prodt,
           code,
           nom,
           descr,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc
    from   vd_i_sie_13_dosr_virtl;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_13_EMPLA_DOSR_VIRTL;

create or replace force view vd_sie_13_empla_dosr_virtl
(
  seqnc,
  ref_dosr_virtl,
  ref_versn,
  empla,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   seqnc,
           ref_dosr_virtl,
           ref_versn,
           empla,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc
    from   vd_i_sie_13_empla_dosr_virtl;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_13_EXPOR_APLIC;

create or replace force view vd_sie_13_expor_aplic
(
  seqnc,
  ref_sesn,
  ref_aplic,
  ref_aplic_formt,
  ref_aplic_code,
  ref_aplic_nom,
  ref_aplic_aplic_authe,
  numr_aplic_courn,
  indic_maj_refrn,
  numr_aplic_cible
) as
  select   seqnc,
           ref_sesn,
           ref_aplic,
           (select   nom_formt
              from   vd_sie_11_aplic a
             where   a.seqnc = ea.ref_aplic)
             ref_aplic_formt,
           sie_11_aplic_pkg.obten_code_aplic (ea.ref_aplic) ref_aplic_code,
           (select   nom
              from   vd_sie_11_aplic a
             where   a.seqnc = ea.ref_aplic)
             ref_aplic_nom,
           (select   ref_aplic_authe
              from   vd_sie_11_aplic a
             where   a.seqnc = ea.ref_aplic)
             ref_aplic_aplic_authe,
           sie_11_aplic_pkg.obten_numr_apex_aplic (ea.ref_aplic) numr_aplic_courn,
           indic_maj_refrn,
           numr_aplic_cible
    from   vd_i_sie_13_expor_aplic ea;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_13_EXPOR_PAGE;

create or replace force view vd_sie_13_expor_page
(
  ref_page,
  ref_sesn,
  numr_apex,
  nom,
  seqnc
) as
  select   ref_page,
           ref_sesn,
           (select   numr_apex
              from   vd_sie_13_page p
             where   p.seqnc = ref_page)
             numr_apex,
           (select   nom
              from   vd_sie_13_page p
             where   p.seqnc = ref_page)
             nom,
           seqnc
    from   vd_i_sie_13_expor_page
   where   ref_sesn = sie_08_url_pkg.obten_sesn
  with check option;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_13_FORMT_RESRC;

create or replace force view vd_sie_13_formt_resrc
(
  seqnc,
  code,
  nom,
  ref_prodt,
  descr,
  ref_type_fichr,
  ref_type_fichr_formt,
  ref_type_fichr_code,
  largr,
  hautr,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   seqnc,
           code,
           nom,
           ref_prodt,
           descr,
           ref_type_fichr,
           (select   nom
              from   vd_i_sie_13_type_fichr
             where   seqnc = ref_type_fichr),
           (select   code
              from   vd_i_sie_13_type_fichr
             where   seqnc = ref_type_fichr),
           largr,
           hautr,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc
    from   vd_i_sie_13_formt_resrc;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_13_INSTA_PREFR;

create or replace force view vd_sie_13_insta_prefr
(
  seqnc,
  ref_prefr,
  ref_utils,
  ref_utils_formt,
  ref_sesn,
  ref_sesn_formt,
  valr,
  ref_struc_aplic,
  ref_struc_aplic_formt,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   seqnc,
           ref_prefr,
           ref_utils,
           (select   code_utils
              from   vd_sie_12_utils u
             where   u.seqnc = ref_utils)
             ref_utils_formt,
           ref_sesn,
           (select   app_user
              from   sie_12_sesn s
             where   s.id_sesn = ref_sesn)
             ref_sesn_formt,
           valr,
           ref_struc_aplic,
           (select   nom
              from   vd_sie_12_struc_aplic tc
             where   tc.seqnc = ref_struc_aplic)
             ref_contx_formt,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc
    from   vd_i_sie_13_insta_prefr;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_13_ITEM_MENU;

create or replace force view vd_sie_13_item_menu
(
  seqnc,
  code,
  nom,
  descr,
  forml_libl,
  forml_libl_formt,
  ref_dv_valr_insta_libl,
  ref_dv_vil_code,
  aide_insta,
  titre_aide_insta,
  ordre_presn,
  ref_page,
  ref_page_formt,
  ref_page_numr_apex,
  ref_prodt_numr_apex_menu,
  ref_page_struc_aplic,
  ref_dv_valr_url,
  forml_valr_url,
  icone,
  efacr_cache,
  ref_menu,
  ref_item_menu,
  ref_item_menu_formt,
  ref_dv_valr_reqst,
  forml_valr_reqst,
  indic_reint_pagnt,
  indic_reint_page_ir,
  indic_clear_page_ir,
  indic_soums_page,
  indic_reint_navgt,
  ref_dv_valr_scpc,
  forml_valr_scpc,
  ref_dv_valr_sspc,
  forml_valr_sspc,
  ref_dv_valr_sapc,
  forml_valr_sapc,
  ref_dv_valr_scpi,
  forml_valr_scpi,
  ref_dv_valr_sspi,
  forml_valr_sspi,
  ref_dv_valr_sapi,
  forml_valr_sapi,
  ref_dv_valr_snpi,
  forml_valr_snpi,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  liste_ref_page_activ,
  ref_aplic,
  ref_code_aplic_formt,
  ref_aplic_formt,
  ref_struc_aplic,
  ref_resrc,
  ref_ocurn_resrc,
  ref_formt_resrc,
  indic_gerer_sidf,
  ref_dv_valr_insta_condt_afich,
  forml_condt_afich
) as
  select   seqnc,
           code,
           nom,
           descr,
           forml_libl,
           case
             when (select   ddv.code_valr
                     from   vd_i_sie_14_detl_domn_valr ddv
                    where   ddv.seqnc = im.ref_dv_valr_insta_libl) in ('ITEM', 'PL/SQL') then
               sie_13_menu_pkg.obten_libl (im.seqnc)
             else
               forml_libl
           end
             forml_libl_formt,
           ref_dv_valr_insta_libl,
           (select   ddv.code_valr
              from   vd_i_sie_14_detl_domn_valr ddv
             where   ddv.seqnc = im.ref_dv_valr_insta_libl)
             ref_dv_vil_code,
           aide_insta,
           titre_aide_insta,
           ordre_presn,
           ref_page,
           (select   p.nom
              from   vd_i_sie_13_page p
             where   p.seqnc = im.ref_page),
           (select   p.numr_apex
              from   vd_i_sie_13_page p
             where   p.seqnc = im.ref_page),
           (select   p.app_id_formt
              from   vd_sie_13_page p
             where   p.seqnc = im.ref_page),
           (select   p.ref_struc_aplic
              from   vd_i_sie_13_page p
             where   p.seqnc = im.ref_page),
           ref_dv_valr_url,
           forml_valr_url,
           icone,
           efacr_cache,
           ref_menu,
           ref_item_menu,
           (select   im2.nom
              from   vd_i_sie_13_item_menu im2
             where   im2.seqnc = im.ref_item_menu),
           ref_dv_valr_reqst,
           forml_valr_reqst,
           indic_reint_pagnt,
           indic_reint_page_ir,
           indic_clear_page_ir,
           indic_soums_page,
           indic_reint_navgt,
           ref_dv_valr_scpc,
           forml_valr_scpc,
           ref_dv_valr_sspc,
           forml_valr_sspc,
           ref_dv_valr_sapc,
           forml_valr_sapc,
           ref_dv_valr_scpi,
           forml_valr_scpi,
           ref_dv_valr_sspi,
           forml_valr_sspi,
           ref_dv_valr_sapi,
           forml_valr_sapi,
           ref_dv_valr_snpi,
           forml_valr_snpi,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           liste_ref_page_activ,
           ref_aplic,
           (select   p.code
              from   vd_i_sie_11_aplic p
             where   p.seqnc = im.ref_aplic)
             ref_code_aplic_formt,
           (select   p.nom_formt
              from   vd_sie_11_aplic p
             where   p.seqnc = im.ref_aplic)
             ref_aplic_formt,
           ref_struc_aplic,
           ref_resrc,
           ref_ocurn_resrc,
           ref_formt_resrc,
           indic_gerer_sidf,
           ref_dv_valr_insta_condt_afich,
           forml_condt_afich
    from   vd_i_sie_13_item_menu im;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_13_LIEN_CONDT_PILTB;

create or replace force view vd_sie_13_lien_condt_piltb
(
  seqnc,
  ref_page_item,
  ref_page_item_formt,
  ref_condt_piltb,
  indic_lectr_seul,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  indic_afich
) as
  select   seqnc,
           ref_page_item,
           (select   nom_apex
              from   vd_i_sie_13_page_item
             where   seqnc = lcp.ref_page_item)
             ref_page_item_formt,
           ref_condt_piltb,
           indic_lectr_seul,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           indic_afich
    from   vd_i_sie_13_lien_condt_piltb lcp;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_13_LISTE_NAVGT;

create or replace force view vd_sie_13_liste_navgt
(
  seqnc,
  ref_page,
  libl,
  aplic,
  page,
  sspc,
  sapc,
  sspi,
  sapi,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ordre_presn,
  code,
  indic_reint_sidf
) as
  select   seqnc,
           ref_page,
           libl,
           aplic,
           page,
           sspc,
           sapc,
           sspi,
           sapi,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           ordre_presn,
           code,
           indic_reint_sidf
    from   vd_i_sie_13_liste_navgt;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_13_MENU;

create or replace force view vd_sie_13_menu
(
  seqnc,
  code,
  nom,
  descr,
  ref_prodt,
  ref_prodt_formt,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   seqnc,
           code,
           nom,
           descr,
           ref_prodt,
           (select   p.code || ' - ' || p.nom
              from   vd_i_sie_11_prodt p
             where   p.seqnc = m.ref_prodt),
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc
    from   vd_i_sie_13_menu m;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_13_MIME_TYPE;

create or replace force view vd_sie_13_mime_type
(
  seqnc,
  ref_type_fichr,
  ext,
  mime_type,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ordre_choix
) as
  select   seqnc,
           ref_type_fichr,
           ext,
           mime_type,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           ordre_choix
    from   vd_i_sie_13_mime_type;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_13_NAVGT;

create or replace force view vd_sie_13_navgt
(
  seqnc,
  ref_id_sesn,
  ref_fil_arian,
  indic_extra_total,
  tail_tabl_extra,
  nombr_rang_extra,
  enonc_sql,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  indic_extra_termn,
  apex_repts_id,
  ref_raprt_inter
) as
  select   seqnc,
           ref_id_sesn,
           ref_fil_arian,
           indic_extra_total,
           tail_tabl_extra,
           nombr_rang_extra,
           enonc_sql,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           indic_extra_termn,
           apex_repts_id,
           ref_raprt_inter
    from   vd_i_sie_13_navgt
   where   ref_id_sesn = sie_07_util_pkg.nv ('SESSION') and ref_fil_arian = sie_04_fil_arian_pkg.obten_fa_courn ()
  with check option;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_13_NAVGT_ELEMN;

create or replace force view vd_sie_13_navgt_elemn
(
  seqnc,
  numr_elemn,
  indic_courn,
  seqnc_elemn,
  ref_navgt,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   seqnc,
           numr_elemn,
           indic_courn,
           seqnc_elemn,
           ref_navgt,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc
    from   vd_i_sie_13_navgt_elemn ne
   where   exists
             (select   1
                from   vd_sie_13_navgt n
               where   n.seqnc = ne.ref_navgt)
  with check option;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_13_OCURN_RESRC;

create or replace force view vd_sie_13_ocurn_resrc
(
  seqnc,
  ref_resrc,
  nom,
  ref_formt_resrc,
  ref_formt_resrc_formt,
  ref_mime_type,
  ref_mime_type_formt,
  nom_physq,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  cordn_x_debut,
  cordn_y_debut,
  largr_prepn,
  hautr_prepn,
  ref_dosr_virtl,
  ref_dosr_virtl_formt,
  ref_versn,
  ref_versn_formt
) as
  select   seqnc,
           ref_resrc,
           nom,
           ref_formt_resrc,
           (select   nom
              from   vd_i_sie_13_formt_resrc fr
             where   fr.seqnc = ocr.ref_formt_resrc),
           ref_mime_type,
           (select   mime_type || ' (' || ext || ')'
              from   vd_i_sie_13_mime_type mt
             where   mt.seqnc = ocr.ref_mime_type),
           nom_physq,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           cordn_x_debut,
           cordn_y_debut,
           largr_prepn,
           hautr_prepn,
           ref_dosr_virtl,
           (select   nom
              from   vd_i_sie_13_dosr_virtl dv
             where   dv.seqnc = ocr.ref_dosr_virtl)
             ref_dosr_virtl_formt,
           ref_versn,
           (select   nom_formt
              from   vd_sie_11_versn v
             where   v.seqnc = ocr.ref_versn)
             ref_versn_formt
    from   vd_i_sie_13_ocurn_resrc ocr;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_13_OPERT;

create or replace force view vd_sie_13_opert
(
  seqnc,
  nom,
  descr,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_prodt,
  ref_prodt_formt,
  code,
  ref_fonct
) as
  select   seqnc,
           nom,
           descr,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           ref_prodt,
           (select   code || ' - ' || nom
              from   vd_i_sie_11_prodt
             where   seqnc = ope.ref_prodt)
             ref_prodt_formt,
           code,
           ref_fonct
    from   vd_i_sie_13_opert ope;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_13_OPERT_OPTIO;

create or replace force view vd_sie_13_opert_optio
(
  seqnc,
  ref_opert,
  ref_opert_formt,
  code,
  nom,
  descr,
  dnr_ref_prodt,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  prepn
) as
  select   seqnc,
           ref_opert,
           (select   o.nom
              from   vd_sie_13_opert o
             where   o.seqnc = ref_opert),
           code,
           nom,
           descr,
           dnr_ref_prodt,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           prepn
    from   vd_i_sie_13_opert_optio;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_13_PAGE;

create or replace force view vd_sie_13_page
(
  seqnc,
  numr_apex,
  nom,
  nom_formt,
  descr,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_aplic,
  app_id_formt,
  ref_struc_aplic,
  ref_struc_aplic_formt,
  indic_prise_charg_sie01,
  indic_prise_charg_sie04,
  ref_mesg_suprs_specf,
  ref_code_mesg_suprs_specf,
  indic_prise_charg_sie19,
  indic_prise_charg_sie13_navgt,
  indic_prise_charg_sie13_confr,
  indic_prise_charg_sie18,
  indic_prise_charg_sie14_popup,
  ref_page_rechr,
  prefx_mesg,
  date_dernr_maj_refrn_apex,
  ref_mesg_sucs_specf,
  ref_mesg_echec_specf,
  ref_mesg_fetch_specf,
  ref_mesg_range_suprm_specf,
  ref_mesg_range_modf_specf,
  ref_mesg_range_inser_specf,
  ref_mesg_aucun_don_trouv,
  ref_mesg_trop_don_trouv,
  liste_fonct
) as
  select   seqnc,
           numr_apex,
           nom,
           numr_apex || ' - ' || nom,
           descr,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           ref_aplic,
           (select   p.numr_aplic_apex
              from   vd_i_sie_11_aplic p
             where   p.seqnc = pag.ref_aplic)
             app_id_formt,
           ref_struc_aplic,
           (select   nom
              from   vd_i_sie_12_struc_aplic
             where   seqnc = pag.ref_struc_aplic)
             ref_struc_aplic_formt,
           indic_prise_charg_sie01,
           indic_prise_charg_sie04,
           ref_mesg_suprs_specf,
           (select   m.numr_mesg
              from   vd_i_sie_01_mesg m
             where   m.seqnc = pag.ref_mesg_suprs_specf)
             ref_code_mesg_suprs_specf,
           indic_prise_charg_sie19,
           indic_prise_charg_sie13_navgt,
           indic_prise_charg_sie13_confr,
           indic_prise_charg_sie18,
           indic_prise_charg_sie14_popup,
           ref_page_rechr,
           prefx_mesg,
           date_dernr_maj_refrn_apex,
           ref_mesg_sucs_specf,
           ref_mesg_echec_specf,
           ref_mesg_fetch_specf,
           ref_mesg_range_suprm_specf,
           ref_mesg_range_modf_specf,
           ref_mesg_range_inser_specf,
           ref_mesg_aucun_don_trouv,
           ref_mesg_trop_don_trouv,
           sie_12_fonct_pkg.obten_liste_fonct (pag.seqnc)
    from   vd_i_sie_13_page pag;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_13_PAGE_IR;

create or replace force view vd_sie_13_page_ir
(
  seqnc,
  libl_regn,
  id_apex,
  ref_page,
  app_id_formt,
  app_page_id_formt,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  largr_deft,
  unite_mesr_largr_deft,
  code,
  indic_forcr_ajust_page,
  nombr_page_largr
) as
  select   seqnc,
           libl_regn,
           id_apex,
           ref_page,
           (select   pag.app_id_formt
              from   vd_sie_13_page pag
             where   pag.seqnc = pir.ref_page)
             app_id_formt,
           (select   pag.numr_apex
              from   vd_sie_13_page pag
             where   pag.seqnc = pir.ref_page)
             app_page_id_formt,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           largr_deft,
           unite_mesr_largr_deft,
           code,
           indic_forcr_ajust_page,
           nombr_page_largr
    from   vd_i_sie_13_page_ir pir;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_13_PAGE_IR_COLN;

create or replace force view vd_sie_13_page_ir_coln
(
  seqnc,
  ref_page_ir,
  ordre_afich,
  libl,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  coln_table,
  id_apex,
  largr,
  type_largr,
  indic_exprt,
  ref_mesg_aide
) as
  select   seqnc,
           ref_page_ir,
           ordre_afich,
           libl,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           coln_table,
           id_apex,
           largr,
           type_largr,
           indic_exprt,
           ref_mesg_aide
    from   vd_i_sie_13_page_ir_coln;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_13_PAGE_ITEM;

create or replace force view vd_sie_13_page_item
(
  seqnc,
  ref_page,
  id_apex,
  nom_apex,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  libl,
  indic_creat,
  indic_modfc,
  indic_suprs,
  indic_en_creat,
  indic_en_modfc,
  type_item,
  ref_opert,
  ref_mesg_aide,
  depsm_alias_coln,
  indic_rechr,
  indic_confr_sauvg
) as
  select   seqnc,
           ref_page,
           id_apex,
           nom_apex,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           libl,
           indic_creat,
           indic_modfc,
           indic_suprs,
           indic_en_creat,
           indic_en_modfc,
           type_item,
           ref_opert,
           ref_mesg_aide,
           depsm_alias_coln,
           indic_rechr,
           indic_confr_sauvg
    from   vd_i_sie_13_page_item pi;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_13_PAGE_ITEM_LANG;

create or replace force view vd_sie_13_page_item_lang
(
  seqnc,
  ref_page_item,
  nom,
  ref_lang,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   seqnc,
           ref_page_item,
           nom,
           ref_lang,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc
    from   vd_i_sie_13_page_item_lang;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_13_PAGE_LANG;

create or replace force view vd_sie_13_page_lang
(
  seqnc,
  ref_page,
  nom,
  ref_lang,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   seqnc,
           ref_page,
           nom,
           ref_lang,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc
    from   vd_i_sie_13_page_lang;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_13_PAGE_PREFR_NAVGT;

create or replace force view vd_sie_13_page_prefr_navgt
(
  seqnc,
  ref_page,
  ref_page_ir,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_page_ir_page_formt,
  ref_page_ir_formt
) as
  select   seqnc,
           ref_page,
           ref_page_ir,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           (select   numr_apex || ' - ' || nom
              from   vd_sie_13_page p
             where   p.seqnc = (select   ref_page
                                  from   vd_sie_13_page_ir pi
                                 where   pi.seqnc = ppn.ref_page_ir))
             ref_page_ir_page_formt,
           (select   libl_regn
              from   vd_sie_13_page_ir pi
             where   pi.seqnc = ppn.ref_page_ir)
             ref_page_ir_formt
    from   vd_i_sie_13_page_prefr_navgt ppn;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_13_PREFR;

create or replace force view vd_sie_13_prefr
(
  seqnc,
  code,
  ref_dv_condt_utils,
  ref_dv_condt_utils_formt,
  ref_dv_condt_utils_organ,
  forml_condt_utils,
  ref_dv_condt_sauvg,
  ref_dv_condt_sauvg_formt,
  ref_dv_condt_sauvg_organ,
  forml_condt_sauvg,
  ref_dv_type_insta,
  ref_dv_type_insta_formt,
  ref_dv_type_insta_organ,
  indic_contx,
  ref_dv_valr_insta,
  ref_dv_valr_insta_formt,
  ref_dv_valr_insta_organ,
  forml_valr_insta,
  descr_comnt,
  ref_item,
  ref_item_formt,
  ref_aplic,
  ref_code_aplic,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   seqnc,
           code,
           ref_dv_condt_utils,
           sie_14_domn_valr_pkg.obten_valr (ref_dv_condt_utils),
           sie_14_domn_valr_pkg.obten_valr_organ (ref_dv_condt_utils),
           forml_condt_utils,
           ref_dv_condt_sauvg,
           sie_14_domn_valr_pkg.obten_valr (ref_dv_condt_sauvg),
           sie_14_domn_valr_pkg.obten_valr_organ (ref_dv_condt_sauvg),
           forml_condt_sauvg,
           ref_dv_type_insta,
           sie_14_domn_valr_pkg.obten_valr (ref_dv_type_insta),
           sie_14_domn_valr_pkg.obten_valr_organ (ref_dv_type_insta),
           indic_contx,
           ref_dv_valr_insta,
           sie_14_domn_valr_pkg.obten_valr (ref_dv_valr_insta),
           sie_14_domn_valr_pkg.obten_valr_organ (ref_dv_valr_insta),
           forml_valr_insta,
           descr_comnt,
           ref_item,
           (select   pi.libl
              from   vd_sie_13_page_item pi
             where   pi.seqnc = pr.ref_item)
             ref_item_formt,
           (select   a.seqnc
              from   vd_sie_13_page p,
                     vd_sie_11_aplic a,
                     vd_sie_13_page_item pi
             where   pi.seqnc = pr.ref_item and pi.ref_page = p.seqnc and p.ref_aplic = a.seqnc)
             ref_aplic,
           (select   a.code
              from   vd_sie_13_page p,
                     vd_sie_11_aplic a,
                     vd_sie_13_page_item pi
             where   pi.seqnc = pr.ref_item and pi.ref_page = p.seqnc and p.ref_aplic = a.seqnc)
             ref_code_aplic,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc
    from   vd_i_sie_13_prefr pr;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_13_REGN_PILTB;

create or replace force view vd_sie_13_regn_piltb
(
  seqnc,
  code,
  nom,
  descr,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_page,
  ref_dv_type_regn_piltb,
  ref_dv_type_regn_piltb_formt
) as
  select   seqnc,
           code,
           nom,
           descr,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           ref_page,
           ref_dv_type_regn_piltb,
           sie_14_domn_valr_pkg.obten_valr (ref_dv_type_regn_piltb)
    from   vd_i_sie_13_regn_piltb;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_13_REGN_PILTB_LANG;

create or replace force view vd_sie_13_regn_piltb_lang
(
  seqnc,
  ref_regn_piltb,
  contn,
  ref_lang,
  ref_lang_formt,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   seqnc,
           ref_regn_piltb,
           contn,
           ref_lang,
           (select   l.nom
              from   vd_sie_01_lang l
             where   l.seqnc = ref_lang)
             ref_lang_formt,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc
    from   vd_i_sie_13_regn_piltb_lang;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_13_RESRC;

create or replace force view vd_sie_13_resrc
(
  seqnc,
  code,
  nom,
  nom_formt,
  nom_physq_comps,
  ref_prodt,
  descr,
  ref_type_fichr,
  ref_type_fichr_formt,
  ref_struc_aplic,
  indic_stock_meme_reprt,
  ref_dosr_virtl,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  type_resrc,
  type_resrc_formt,
  indic_publc,
  empla_html,
  ref_plugn
) as
  select   seqnc,
           code,
           nom,
           case
             when ref_prodt is not null then
               '[Application] ' || nom
             when ref_struc_aplic is not null then
                  '[Structure applicative - '
               || (select   sa.nom
                     from   vd_i_sie_12_struc_aplic sa
                    where   sa.seqnc = r.ref_struc_aplic)
               || '] '
               || nom
             when ref_plugn is not null then
                  '[Plugin - '
               || (select   p.nom
                     from   vd_i_sie_11_plugn p
                    where   p.seqnc = r.ref_plugn)
               || '] '
               || nom
             else
               nom
           end
             nom_formt,
           nom_physq_comps,
           ref_prodt,
           descr,
           ref_type_fichr,
           (select   tf.nom
              from   vd_i_sie_13_type_fichr tf
             where   tf.seqnc = r.ref_type_fichr),
           ref_struc_aplic,
           indic_stock_meme_reprt,
           ref_dosr_virtl,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           type_resrc,
           (select   valr
              from   vd_sie_14_detl_domn_valr ddv
             where   code_valr = type_resrc
                 and ref_code_domn_valr_formt = 'TYPE_RESRC'
                 and ddv.ref_prodt_dv = sie_11_prodt_pkg.obten_prodt_sesn),
           indic_publc,
           empla_html,
           ref_plugn
    from   vd_i_sie_13_resrc r;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_13_TYPE_FICHR;

create or replace force view vd_sie_13_type_fichr
(
  seqnc,
  code,
  nom,
  descr,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  nom_icon
) as
  select   seqnc,
           code,
           nom,
           descr,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           nom_icon
    from   vd_i_sie_13_type_fichr;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_14_DETL_DOMN_VALR;

create or replace force view vd_sie_14_detl_domn_valr
(
  seqnc,
  code_valr,
  valr,
  ref_domn_valr,
  ref_code_domn_valr_formt,
  seqnc_presn,
  date_debut_efect,
  date_fin_efect,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  valr_court,
  valr_organ,
  ref_prodt_dv
) as
  select   seqnc,
           code_valr,
           valr,
           ref_domn_valr,
           (select   code
              from   vd_i_sie_14_domn_valr
             where   seqnc = ref_domn_valr)
             ref_code_domn_valr_formt,
           seqnc_presn,
           date_debut_efect,
           date_fin_efect,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           valr_court,
           valr_organ,
           (select   ref_prodt
              from   vd_i_sie_14_domn_valr
             where   seqnc = ref_domn_valr)
             ref_prodt_dv
    from   vd_i_sie_14_detl_domn_valr;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_14_DOMN_VALR;

create or replace force view vd_sie_14_domn_valr
(
  seqnc,
  code,
  nom,
  descr,
  enonc_sourc,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  type_don,
  type_don_formt,
  ref_formt,
  ref_code_formt_formt,
  ref_prodt,
  ref_prodt_formt,
  ref_type_domn_valr,
  indic_systm,
  ref_domn
) as
  select   seqnc,
           code,
           nom,
           descr,
           enonc_sourc,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           type_don,
           decode (type_don,  'V', 'Alphanumérique',  'N', 'Numérique',  'D', 'Date',  null) type_don_formt,
           ref_formt,
           (select   defnt
              from   vd_sie_14_formt f
             where   f.seqnc = ref_formt)
             ref_code_formt_formt,
           ref_prodt,
           (select   code || ' - ' || nom
              from   vd_i_sie_11_prodt
             where   seqnc = dv.ref_prodt)
             ref_prodt_formt,
           ref_type_domn_valr,
           indic_systm,
           ref_domn
    from   vd_i_sie_14_domn_valr dv;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_14_FORMT;

create or replace force view vd_sie_14_formt
(
  seqnc,
  libl,
  defnt,
  type_don,
  type_don_formt,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_prodt,
  indic_formt_orcl,
  indic_unite_inclu
) as
  select   seqnc,
           libl,
           defnt,
           type_don,
           decode (type_don,
                   'D', 'Date',
                   'NE', 'Numérique entier',
                   'ND', 'Numérique décimal',
                   'V', 'Alphanumérique',
                   null)
             type_don_formt,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           ref_prodt,
           indic_formt_orcl,
           indic_unite_inclu
    from   vd_i_sie_14_formt;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_14_TYPE_DOMN_VALR;

create or replace force view vd_sie_14_type_domn_valr
(
  seqnc,
  code,
  nom,
  descr,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_prodt
) as
  select   seqnc,
           code,
           nom,
           descr,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           ref_prodt
    from   vd_i_sie_14_type_domn_valr;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_17_COMPT_AXIAT;

create or replace force view vd_sie_17_compt_axiat
(
  seqnc,
  code,
  nom,
  descr,
  numr,
  ref_profl_courl,
  ref_profl_formt,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_domn,
  ref_domn_formt,
  ref_publc_page_garde
) as
  select   seqnc,
           code,
           nom,
           descr,
           numr,
           ref_profl_courl,
           (select   pc.nom
              from   vd_i_sie_17_profl_courl pc
             where   pc.seqnc = ca.ref_profl_courl),
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           ref_domn,
           (select   d.nom
              from   vd_i_sie_12_domn d
             where   d.seqnc = ca.ref_domn),
           ref_publc_page_garde
    from   vd_i_sie_17_compt_axiat ca;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_17_COMPT_TWILI;

create or replace force view vd_sie_17_compt_twili
(
  seqnc,
  code,
  nom,
  descr,
  acoun_id,
  authe_token,
  reprt_walt,
  mot_passe_walt,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  numr,
  indic_partg,
  ref_domn
) as
  select   seqnc,
           code,
           nom,
           descr,
           acoun_id,
           authe_token,
           reprt_walt,
           mot_passe_walt,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           numr,
           indic_partg,
           ref_domn
    from   vd_i_sie_17_compt_twili;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_17_COURL;

create or replace force view vd_sie_17_courl
(
  seqnc,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  servr,
  port,
  domn,
  nom_envoy,
  adres_envoy,
  sujet,
  indic_formt_html,
  indic_formt_html_formt,
  authe_methd,
  authe_usagr,
  authe_mdp,
  corps,
  nombr_tentv,
  nombr_tentv_max,
  sens,
  stat_soums,
  stat_soums_formt
) as
  select   seqnc,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           servr,
           port,
           domn,
           nom_envoy,
           adres_envoy,
           sujet,
           indic_formt_html,
           case indic_formt_html when 'O' then 'Oui' when 'N' then 'Non' end indic_formt_html_formt,
           authe_methd,
           authe_usagr,
           authe_mdp,
           corps,
           nombr_tentv,
           nombr_tentv_max,
           sens,
           stat_soums,
           case stat_soums when 'ENVOY' then 'Envoyé' when 'A_ENVOY' then 'À envoyé' end stat_soums_formt
    from   vd_i_sie_17_courl;

/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_17_COURL_DESTN;

create or replace force view vd_sie_17_courl_destn
(
  seqnc,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_fil_atent,
  nom,
  adres,
  type
) as
  select   "SEQNC",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "REF_FIL_ATENT",
           "NOM",
           "ADRES",
           "TYPE"
    from   vd_i_sie_17_courl_destn;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_17_PIECE_TELCP_AXIAT;

create or replace force view vd_sie_17_piece_telcp_axiat
(
  seqnc,
  ref_telcp_axiat,
  nombr_page,
  ordre_atach,
  contn,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  mime_type,
  nom_fichr
) as
  select   seqnc,
           ref_telcp_axiat,
           nombr_page,
           ordre_atach,
           contn,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           mime_type,
           nom_fichr
    from   sie_17_piece_telcp_axiat;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_17_PROFL_COURL;

create or replace force view vd_sie_17_profl_courl
(
  seqnc,
  code,
  servr_sortn,
  port_sortn,
  authe_mdp_sortn,
  authe_methd_sortn,
  authe_usagr_sortn,
  indic_ssl_sortn,
  servr_entra,
  port_entra,
  authe_mdp_entra,
  authe_methd_entra,
  authe_usagr_entra,
  indic_ssl_entra,
  domn,
  nom_envoy,
  adres_envoy,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_domn,
  ref_domn_formt,
  nom,
  descr,
  protc_entra
) as
  select   seqnc,
           code,
           servr_sortn,
           port_sortn,
           authe_mdp_sortn,
           authe_methd_sortn,
           authe_usagr_sortn,
           indic_ssl_sortn,
           servr_entra,
           port_entra,
           authe_mdp_entra,
           authe_methd_entra,
           authe_usagr_entra,
           indic_ssl_entra,
           domn,
           nom_envoy,
           adres_envoy,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           ref_domn,
           (select   d.nom
              from   vd_sie_12_domn d
             where   d.seqnc = pc.ref_domn)
             ref_domn_formt,
           nom,
           descr,
           protc_entra
    from   vd_i_sie_17_profl_courl pc;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_17_SMS_TWILI;

create or replace force view vd_sie_17_sms_twili
(
  seqnc,
  numr_de,
  numr_a,
  mesg,
  repns_servr,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  tw_sid,
  tw_status,
  tw_price,
  tw_uri,
  stat_soums,
  date_envoi_difr,
  ref_compt_twili,
  numr_mesg,
  nombr_mesg_totl,
  ref_mesg_precd,
  group_sms
) as
  select   seqnc,
           numr_de,
           numr_a,
           mesg,
           repns_servr,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           tw_sid,
           tw_status,
           tw_price,
           tw_uri,
           stat_soums,
           date_envoi_difr,
           ref_compt_twili,
           numr_mesg,
           nombr_mesg_totl,
           ref_mesg_precd,
           group_sms
    from   vd_i_sie_17_sms_twili;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_17_SMS_TWILI_ENTRA;

create or replace force view vd_sie_17_sms_twili_entra
(
  seqnc,
  tw_recpt_accountsid,
  tw_recpt_apiversion,
  tw_recpt_body,
  tw_recpt_from,
  tw_recpt_fromcity,
  tw_recpt_fromcountry,
  tw_recpt_fromstate,
  tw_recpt_fromzip,
  tw_recpt_smsmessagesid,
  tw_recpt_smssid,
  tw_recpt_smsstatus,
  tw_recpt_to,
  tw_recpt_tocity,
  tw_recpt_tocountry,
  tw_recpt_tostate,
  tw_recpt_tozip,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   seqnc,
           tw_recpt_accountsid,
           tw_recpt_apiversion,
           tw_recpt_body,
           tw_recpt_from,
           tw_recpt_fromcity,
           tw_recpt_fromcountry,
           tw_recpt_fromstate,
           tw_recpt_fromzip,
           tw_recpt_smsmessagesid,
           tw_recpt_smssid,
           tw_recpt_smsstatus,
           tw_recpt_to,
           tw_recpt_tocity,
           tw_recpt_tocountry,
           tw_recpt_tostate,
           tw_recpt_tozip,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc
    from   vd_i_sie_17_sms_twili_entra;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_17_TELCP_AXIAT;

create or replace force view vd_sie_17_telcp_axiat
(
  seqnc,
  ref_compt_axiat,
  destn_formt,
  numr_destn,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  stat_soums,
  date_envoi_difr,
  objet
) as
  select   seqnc,
           ref_compt_axiat,
           destn_formt,
           numr_destn,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           stat_soums,
           date_envoi_difr,
           objet
    from   vd_i_sie_17_telcp_axiat;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_19_BOUTN;

create or replace force view vd_sie_19_boutn
(
  seqnc,
  ref_lang,
  ref_dispn_fonct,
  item_subst,
  libl,
  id_templ_boutn,
  templ_boutn,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  indic_actif,
  ref_dv_type_mesg_aide_contx,
  ref_code_type_mesg_aide_contx,
  mesg_aide_contx
) as
  select   seqnc,
           ref_lang,
           ref_dispn_fonct,
           item_subst,
           libl,
           id_templ_boutn,
           templ_boutn,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           indic_actif,
           ref_dv_type_mesg_aide_contx,
           sie_14_domn_valr_pkg.obten_code (ref_dv_type_mesg_aide_contx),
           mesg_aide_contx
    from   vd_i_sie_19_boutn;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_19_CLE;

create or replace force view vd_sie_19_cle
(
  seqnc,
  ref_dispn_fonct,
  ref_lang,
  indic_shift,
  indic_alt,
  indic_ctrl,
  indic_inter,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  code_keypr,
  code_keydw,
  indic_actif
) as
  select   seqnc,
           ref_dispn_fonct,
           ref_lang,
           indic_shift,
           indic_alt,
           indic_ctrl,
           indic_inter,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           code_keypr,
           code_keydw,
           indic_actif
    from   vd_i_sie_19_cle;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_19_DISPN_FONCT;

create or replace force view vd_sie_19_dispn_fonct
(
  seqnc,
  ref_prodt,
  ref_fonct,
  valr_atrib_1,
  valr_atrib_2,
  valr_atrib_3,
  valr_atrib_4,
  valr_atrib_5,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   seqnc,
           ref_prodt,
           ref_fonct,
           valr_atrib_1,
           valr_atrib_2,
           valr_atrib_3,
           valr_atrib_4,
           valr_atrib_5,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc
    from   vd_i_sie_19_dispn_fonct;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_19_FONCT;

create or replace force view vd_sie_19_fonct
(
  seqnc,
  code,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  nom_formt,
  descr_formt,
  titre_atrib1,
  titre_atrib2,
  titre_atrib3,
  titre_atrib4,
  titre_atrib5,
  ref_dv_type_atrib1,
  ref_dv_type_atrib1_formt,
  ref_code_type_atrib1_formt,
  ref_dv_type_atrib2,
  ref_dv_type_atrib2_formt,
  ref_code_type_atrib2_formt,
  ref_dv_type_atrib3,
  ref_dv_type_atrib3_formt,
  ref_code_type_atrib3_formt,
  ref_dv_type_atrib4,
  ref_dv_type_atrib4_formt,
  ref_code_type_atrib4_formt,
  ref_dv_type_atrib5,
  ref_dv_type_atrib5_formt,
  ref_code_type_atrib5_formt,
  valr_deft_atrib1,
  valr_deft_atrib2,
  valr_deft_atrib3,
  valr_deft_atrib4,
  valr_deft_atrib5,
  ref_dv_type_actio,
  ref_dv_type_actio_formt,
  ref_code_type_actio_formt,
  expre_actio,
  ref_dv_type_expre,
  ref_dv_type_expre_formt,
  ref_code_type_expre_formt,
  indic_afect_input_html,
  indic_prevn_actio_deft,
  indic_cle,
  indic_boutn,
  condt_prise_charg
) as
  select   seqnc,
           code,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           sie_19_fonct_pkg.obten_nom_lang (seqnc) nom_formt,
           sie_19_fonct_pkg.obten_descr_lang (seqnc) descr_formt,
           titre_atrib1,
           titre_atrib2,
           titre_atrib3,
           titre_atrib4,
           titre_atrib5,
           ref_dv_type_atrib1,
           sie_14_domn_valr_pkg.obten_valr (ref_dv_type_atrib1) ref_dv_type_atrib1_formt,
           sie_14_domn_valr_pkg.obten_code (ref_dv_type_atrib1) ref_code_type_atrib1_formt,
           ref_dv_type_atrib2,
           sie_14_domn_valr_pkg.obten_valr (ref_dv_type_atrib2) ref_dv_type_atrib2_formt,
           sie_14_domn_valr_pkg.obten_code (ref_dv_type_atrib2) ref_code_type_atrib2_formt,
           ref_dv_type_atrib3,
           sie_14_domn_valr_pkg.obten_valr (ref_dv_type_atrib3) ref_dv_type_atrib3_formt,
           sie_14_domn_valr_pkg.obten_code (ref_dv_type_atrib3) ref_code_type_atrib3_formt,
           ref_dv_type_atrib4,
           sie_14_domn_valr_pkg.obten_valr (ref_dv_type_atrib4) ref_dv_type_atrib4_formt,
           sie_14_domn_valr_pkg.obten_code (ref_dv_type_atrib4) ref_code_type_atrib4_formt,
           ref_dv_type_atrib5,
           sie_14_domn_valr_pkg.obten_valr (ref_dv_type_atrib5) ref_dv_type_atrib5_formt,
           sie_14_domn_valr_pkg.obten_code (ref_dv_type_atrib5) ref_code_type_atrib5_formt,
           valr_deft_atrib1,
           valr_deft_atrib2,
           valr_deft_atrib3,
           valr_deft_atrib4,
           valr_deft_atrib5,
           ref_dv_type_actio,
           sie_14_domn_valr_pkg.obten_valr (ref_dv_type_actio) ref_dv_type_actio_formt,
           sie_14_domn_valr_pkg.obten_code (ref_dv_type_actio) ref_code_type_actio_formt,
           expre_actio,
           ref_dv_type_expre,
           sie_14_domn_valr_pkg.obten_valr (ref_dv_type_expre) ref_dv_type_expre_formt,
           sie_14_domn_valr_pkg.obten_code (ref_dv_type_expre) ref_code_type_expre_formt,
           indic_afect_input_html,
           indic_prevn_actio_deft,
           indic_cle,
           indic_boutn,
           condt_prise_charg
    from   vd_i_sie_19_fonct;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_19_FONCT_LANG;

create or replace force view vd_sie_19_fonct_lang
(
  seqnc,
  nom,
  ref_lang,
  ref_lang_formt,
  descr,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_fonct
) as
  select   seqnc,
           nom,
           ref_lang,
           sie_01_lang_pkg.obten_lang_formt (ref_lang),
           descr,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           ref_fonct
    from   vd_i_sie_19_fonct_lang;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_19_SPECF_FONCT;

create or replace force view vd_sie_19_specf_fonct
(
  seqnc,
  ref_dispn_fonct,
  ref_item,
  ref_page,
  ref_dv_type_subst,
  valr_atrib_1,
  valr_atrib_2,
  valr_atrib_3,
  valr_atrib_4,
  valr_atrib_5,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   seqnc,
           ref_dispn_fonct,
           ref_item,
           ref_page,
           ref_dv_type_subst,
           valr_atrib_1,
           valr_atrib_2,
           valr_atrib_3,
           valr_atrib_4,
           valr_atrib_5,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc
    from   vd_i_sie_19_specf_fonct;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_20_DEPLM;

create or replace force view vd_sie_20_deplm
(
  seqnc,
  nom,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_modl,
  ref_modl_parmt,
  ref_prodt_lang
) as
  select   seqnc,
           nom,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           ref_modl,
           ref_modl_parmt,
           ref_prodt_lang
    from   vd_i_sie_20_deplm;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_20_DETL_DOCMN;

create or replace force view vd_sie_20_detl_docmn
(
  seqnc,
  ref_docmn,
  ref_docmn_formt,
  ref_sectn_docmn,
  ref_sectn_docmn_formt,
  ref_detl_docmn,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  valr
) as
  select   seqnc,
           ref_docmn,
           sie_20_docmn_pkg.formt_propr_docmn (dd.ref_docmn),
           ref_sectn_docmn,
           (select   nom
              from   vd_i_sie_20_sectn_docmn sd
             where   sd.seqnc = dd.ref_sectn_docmn),
           ref_detl_docmn,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           valr
    from   vd_i_sie_20_detl_docmn dd;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_20_DOCMN;

create or replace force view vd_sie_20_docmn
(
  seqnc,
  ref_prodt_lang,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_struc_aplic,
  ref_seqnc_struc_aplic,
  ref_dv_type_modl,
  ref_propr
) as
  select   seqnc,
           ref_prodt_lang,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           ref_struc_aplic,
           ref_seqnc_struc_aplic,
           (select   ref_dv_type_modl
              from   vd_i_sie_20_modl m
             where   m.seqnc = ref_seqnc_struc_aplic),
           (select   m.seqnc
              from   vd_sie_20_modl m
             where   m.seqnc = (select   ref_modl
                                  from   vd_sie_20_modl m2
                                 where   m2.seqnc = ref_seqnc_struc_aplic))
    from   vd_i_sie_20_docmn d;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_20_MODL;

create or replace force view vd_sie_20_modl
(
  seqnc,
  ref_dv_type_modl,
  ref_dv_type_modl_formt,
  ref_dv_type_modl_code,
  ref_versn,
  ref_modl,
  ref_modl_formt,
  nom_organ,
  numr_surch,
  indic_agreg,
  indic_agreg_formt,
  indic_pipln,
  indic_pipln_formt,
  indic_detrm,
  indic_detrm_formt,
  indic_authid_curnt_utils,
  indic_authid_curnt_utils_formt,
  indic_publc,
  indic_publc_formt,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  versn_bd_aplic
) as
  select   seqnc,
           ref_dv_type_modl,
           sie_14_domn_valr_pkg.obten_valr (m.ref_dv_type_modl),
           sie_14_domn_valr_pkg.obten_code (m.ref_dv_type_modl),
           ref_versn,
           ref_modl,
           (select   nom_organ
              from   vd_i_sie_20_modl n
             where   n.seqnc = m.ref_modl)
             ref_modl_formt,
           nom_organ,
           numr_surch,
           indic_agreg,
           case indic_agreg when 'O' then 'Oui' else 'Non' end indic_agreg_formt,
           indic_pipln,
           case indic_pipln when 'O' then 'Oui' else 'Non' end indic_pipln_formt,
           indic_detrm,
           case indic_detrm when 'O' then 'Oui' else 'Non' end indic_detrm_formt,
           indic_authid_curnt_utils,
           case indic_authid_curnt_utils when 'O' then 'Oui' else 'Non' end indic_authid_curnt_utils_formt,
           indic_publc,
           case indic_publc when 'O' then 'Oui' else 'Non' end indic_publc_formt,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           versn_bd_aplic
    from   vd_i_sie_20_modl m;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_20_MODL_EXCEP;

create or replace force view vd_sie_20_modl_excep
(
  seqnc,
  ref_modl,
  nom_organ,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   seqnc,
           ref_modl,
           nom_organ,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc
    from   vd_i_sie_20_modl_excep;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_20_MODL_PARMT;

create or replace force view vd_sie_20_modl_parmt
(
  seqnc,
  ref_modl,
  nom_organ,
  ref_dv_type_don,
  ref_dv_type_don_formt,
  postn,
  valr_deft,
  sens,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  indic_publc,
  indic_publc_formt
) as
  select   seqnc,
           ref_modl,
           nom_organ,
           ref_dv_type_don,
           sie_14_domn_valr_pkg.obten_valr (m.ref_dv_type_don),
           postn,
           valr_deft,
           sens,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           indic_publc,
           case indic_publc when 'O' then 'Oui' else 'Non' end indic_publc_formt
    from   vd_i_sie_20_modl_parmt m;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_20_SECTN_DOCMN;

create or replace force view vd_sie_20_sectn_docmn
(
  seqnc,
  ref_dv_type_sectn,
  ref_dv_type_sectn_formt,
  ref_sectn_docmn,
  ref_sectn_docmn_formt,
  ref_struc_aplic,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  nom,
  titre,
  descr,
  ref_formt
) as
  select   seqnc,
           ref_dv_type_sectn,
           sie_14_domn_valr_pkg.obten_valr (sc.ref_dv_type_sectn),
           ref_sectn_docmn,
           (select   nom
              from   vd_i_sie_20_sectn_docmn sc2
             where   sc2.seqnc = sc.ref_sectn_docmn),
           ref_struc_aplic,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           nom,
           titre,
           descr,
           ref_formt
    from   vd_i_sie_20_sectn_docmn sc;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_21_PLUGN_ARBRE;

create or replace force view vd_sie_21_plugn_arbre
(
  seqnc,
  code,
  enonc_pre_reqt,
  nom_table,
  coln_titre,
  coln_type,
  coln_valr,
  coln_aide_insta,
  coln_titre_aide_insta,
  coln_lien,
  coln_id,
  coln_id_parnt,
  enonc_condt,
  indic_comnc_par_racn,
  indic_comnc_par_coln_parnt_nul,
  enonc_condt_comnc_par,
  enonc_trier_par,
  indic_renmr,
  indic_deplc,
  largr_regn_arbre,
  hautr_regn_arbre,
  ref_plugn_arbre_noeud,
  image_sprit,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  type_icone_noeud,
  ref_formt_resrc,
  ref_resrc_comps,
  obten_json_arbre_nombr_niv,
  obten_json_noeud_nombr_niv,
  mode_cache,
  indic_charg_progr,
  nom_procd_glisr_elemn_arbre,
  nom_procd_depsr_elemn_arbre,
  ref_prodt
) as
  select   seqnc,
           code,
           enonc_pre_reqt,
           nom_table,
           coln_titre,
           coln_type,
           coln_valr,
           coln_aide_insta,
           coln_titre_aide_insta,
           coln_lien,
           coln_id,
           coln_id_parnt,
           enonc_condt,
           indic_comnc_par_racn,
           indic_comnc_par_coln_parnt_nul,
           enonc_condt_comnc_par,
           enonc_trier_par,
           indic_renmr,
           indic_deplc,
           largr_regn_arbre,
           hautr_regn_arbre,
           ref_plugn_arbre_noeud,
           image_sprit,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           type_icone_noeud,
           ref_formt_resrc,
           ref_resrc_comps,
           obten_json_arbre_nombr_niv,
           obten_json_noeud_nombr_niv,
           mode_cache,
           indic_charg_progr,
           nom_procd_glisr_elemn_arbre,
           nom_procd_depsr_elemn_arbre,
           ref_prodt
    from   vd_i_sie_21_plugn_arbre;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_21_PLUGN_ARBRE_NOEUD;

create or replace force view vd_sie_21_plugn_arbre_noeud
(
  seqnc,
  code,
  nom,
  descr,
  ref_plugn_arbre,
  indic_selct_noeud,
  indic_selct_noeud_formt,
  indic_ouvri_noeud,
  indic_ouvri_noeud_formt,
  indic_fermr_noeud,
  indic_fermr_noeud_formt,
  indic_creer_noeud,
  indic_creer_noeud_formt,
  indic_suprm_noeud,
  indic_suprm_noeud_formt,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_resrc,
  ref_ocurn_resrc
) as
  select   seqnc,
           code,
           nom,
           descr,
           ref_plugn_arbre,
           indic_selct_noeud,
           (decode (indic_selct_noeud,  'O', 'Oui',  'N', 'Non')) indic_selct_noeud_formt,
           indic_ouvri_noeud,
           (decode (indic_ouvri_noeud,  'O', 'Oui',  'N', 'Non')) indic_ouvri_noeud_formt,
           indic_fermr_noeud,
           (decode (indic_fermr_noeud,  'O', 'Oui',  'N', 'Non')) indic_fermr_noeud_formt,
           indic_creer_noeud,
           (decode (indic_creer_noeud,  'O', 'Oui',  'N', 'Non')) indic_creer_noeud_formt,
           indic_suprm_noeud,
           (decode (indic_suprm_noeud,  'O', 'Oui',  'N', 'Non')) indic_suprm_noeud_formt,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           ref_resrc,
           ref_ocurn_resrc
    from   vd_i_sie_21_plugn_arbre_noeud;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_21_PLUGN_CALND;

create or replace force view vd_sie_21_plugn_calnd
(
  seqnc,
  enonc_pre_reqt,
  ref_dv_vue_deft,
  conct_propr_entet_gauch,
  conct_propr_entet_gauch_formt,
  conct_propr_entet_centr,
  conct_propr_entet_centr_formt,
  conct_propr_entet_droit,
  conct_propr_entet_droit_formt,
  indic_evenm_modfb,
  nom_table,
  coln_titre,
  coln_descr,
  coln_type,
  coln_aide_insta,
  coln_lien,
  coln_indic_journ_compl,
  coln_indic_evenm_modfb,
  coln_date_debut,
  coln_date_fin,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  largr_regn_calnd,
  coln_titre_aide_insta,
  indic_agend,
  agend_nom_table,
  agend_coln_titre,
  coln_valr,
  agend_coln_valr,
  agend_coln_coulr,
  code,
  coln_agend,
  coln_ident,
  coln_date_journ_compl,
  coln_date_fin_journ_compl,
  nombr_mints_inter,
  heure_debut_norml,
  heure_fin_norml,
  heure_debut_exten,
  heure_fin_exten,
  ref_prodt
) as
  select   seqnc,
           enonc_pre_reqt,
           ref_dv_vue_deft,
           conct_propr_entet_gauch,
           sie_21_plugn_calnd_pkg.obten_prop_entet_formt (conct_propr_entet_gauch) conct_propr_entet_gauch_formt,
           conct_propr_entet_centr,
           sie_21_plugn_calnd_pkg.obten_prop_entet_formt (conct_propr_entet_centr) conct_propr_entet_centr_formt,
           conct_propr_entet_droit,
           sie_21_plugn_calnd_pkg.obten_prop_entet_formt (conct_propr_entet_droit) conct_propr_entet_droit_formt,
           indic_evenm_modfb,
           nom_table,
           coln_titre,
           coln_descr,
           coln_type,
           coln_aide_insta,
           coln_lien,
           coln_indic_journ_compl,
           coln_indic_evenm_modfb,
           coln_date_debut,
           coln_date_fin,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           largr_regn_calnd,
           coln_titre_aide_insta,
           indic_agend,
           agend_nom_table,
           agend_coln_titre,
           coln_valr,
           agend_coln_valr,
           agend_coln_coulr,
           code,
           coln_agend,
           coln_ident,
           coln_date_journ_compl,
           coln_date_fin_journ_compl,
           nombr_mints_inter,
           heure_debut_norml,
           heure_fin_norml,
           heure_debut_exten,
           heure_fin_exten,
           ref_prodt
    from   vd_i_sie_21_plugn_calnd;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_21_PLUGN_CALND_COULR;

create or replace force view vd_sie_21_plugn_calnd_coulr
(
  seqnc,
  ordre_presn,
  coulr,
  coulr_text,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   seqnc,
           ordre_presn,
           coulr,
           coulr_text,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc
    from   vd_i_sie_21_plugn_calnd_coulr;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_21_PLUGN_CALND_TYPE;

create or replace force view vd_sie_21_plugn_calnd_type
(
  seqnc,
  code,
  nom,
  descr,
  ref_domn,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  coulr_texte,
  coulr_bordr,
  coulr_arier_plan
) as
  select   seqnc,
           code,
           nom,
           descr,
           ref_domn,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           coulr_texte,
           coulr_bordr,
           coulr_arier_plan
    from   vd_i_sie_21_plugn_calnd_type;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_21_PLUGN_ITEM_MENU;

create or replace force view vd_sie_21_plugn_item_menu
(
  seqnc,
  ref_item_menu,
  ref_item_menu_formt,
  ref_plugn_menu,
  niv_item,
  etend_nombr_coln,
  rang_item,
  coln_item,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  dnr_ref_prodt,
  clas_css_elemn,
  clas_css_racn,
  ref_dv_contn_item_menu,
  ref_dv_contn_item_menu_code,
  ref_dv_contn_im_valr_organ,
  ref_dv_align,
  ref_dv_align_code,
  ref_dv_align_valr_organ
) as
  select   seqnc,
           ref_item_menu,
           (select   nom
              from   vd_i_sie_13_item_menu im
             where   im.seqnc = pim.ref_item_menu)
             ref_item_menu_formt,
           ref_plugn_menu,
           niv_item,
           etend_nombr_coln,
           rang_item,
           coln_item,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           dnr_ref_prodt,
           sie_21_plugn_menu_pkg.obten_clas_css_elemn (pim.seqnc) clas_css_elemn,
           sie_21_plugn_menu_pkg.obten_clas_css_racn (pim.seqnc) clas_css_racn,
           ref_dv_contn_item_menu,
           sie_14_domn_valr_pkg.obten_code (ref_dv_contn_item_menu) ref_dv_contn_item_menu_code,
           sie_14_domn_valr_pkg.obten_valr_organ (ref_dv_contn_item_menu) ref_dv_contn_im_valr_organ,
           ref_dv_align,
           sie_14_domn_valr_pkg.obten_code (ref_dv_align) ref_dv_align_code,
           sie_14_domn_valr_pkg.obten_valr_organ (ref_dv_align) ref_dv_align_valr_organ
    from   vd_i_sie_21_plugn_item_menu pim;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_21_PLUGN_MENU;

create or replace force view vd_sie_21_plugn_menu
(
  seqnc,
  code,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  dnr_ref_prodt,
  ref_dv_type_menu,
  ref_dv_type_menu_code,
  ref_dv_type_menu_formt,
  largr_regn_menu,
  hautr_regn_menu,
  ref_dv_orien_menu,
  ref_dv_orien_menu_code,
  ref_dv_orien_menu_formt,
  ref_dv_coulr_theme,
  ref_dv_coulr_theme_code,
  ref_dv_coulr_theme_formt,
  ref_dv_coulr_princ,
  ref_dv_coulr_princ_code,
  ref_dv_coulr_princ_formt,
  ref_dv_formt_menu,
  ref_dv_formt_menu_code,
  ref_dv_formt_menu_formt,
  ref_menu,
  ref_menu_formt,
  ref_prodt
) as
  select   seqnc,
           code,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           dnr_ref_prodt,
           ref_dv_type_menu,
           sie_14_domn_valr_pkg.obten_code (ref_dv_type_menu) ref_dv_type_menu_code,
           sie_14_domn_valr_pkg.obten_valr (ref_dv_type_menu) ref_dv_type_menu_formt,
           largr_regn_menu,
           hautr_regn_menu,
           ref_dv_orien_menu,
           sie_14_domn_valr_pkg.obten_code (ref_dv_orien_menu) ref_dv_orien_menu_code,
           sie_14_domn_valr_pkg.obten_valr (ref_dv_orien_menu) ref_dv_orien_menu_formt,
           ref_dv_coulr_theme,
           sie_14_domn_valr_pkg.obten_code (ref_dv_coulr_theme) ref_dv_coulr_theme_code,
           sie_14_domn_valr_pkg.obten_valr (ref_dv_coulr_theme) ref_dv_coulr_theme_formt,
           ref_dv_coulr_princ,
           sie_14_domn_valr_pkg.obten_code (ref_dv_coulr_princ) ref_dv_coulr_princ_code,
           sie_14_domn_valr_pkg.obten_valr (ref_dv_coulr_princ) ref_dv_coulr_princ_formt,
           ref_dv_formt_menu,
           sie_14_domn_valr_pkg.obten_code (ref_dv_formt_menu) ref_dv_formt_menu_code,
           sie_14_domn_valr_pkg.obten_valr (ref_dv_formt_menu) ref_dv_formt_menu_formt,
           ref_menu,
           (select   nom
              from   vd_i_sie_13_menu m
             where   m.seqnc = ref_menu)
             ref_menu_formt,
           ref_prodt
    from   vd_i_sie_21_plugn_menu;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_23_APLIC_MODL_RECHR;

create or replace force view vd_sie_23_aplic_modl_rechr
(
  seqnc,
  ref_modl_rechr,
  ref_struc_aplic_rechr,
  ref_struc_aplic_rechr_formt,
  ref_struc_aplic_lien,
  ref_struc_aplic_lien_formt,
  nombr_maxim_reslt,
  utils_creat,
  date_creat,
  utils_modfc,
  date_modfc,
  ref_atrib_struc_aplic_afich,
  ref_atrib_struc_aplic_af_formt
) as
  select   seqnc,
           ref_modl_rechr,
           ref_struc_aplic_rechr,
           (select   sa.nom
              from   vd_i_sie_11_prodt p,
                     vd_i_sie_12_struc_aplic sa
             where   p.seqnc = sa.ref_prodt and sa.seqnc = amr.ref_struc_aplic_rechr),
           ref_struc_aplic_lien,
           (select   sa.nom
              from   vd_i_sie_11_prodt p,
                     vd_i_sie_12_struc_aplic sa
             where   p.seqnc = sa.ref_prodt and sa.seqnc = amr.ref_struc_aplic_lien),
           nombr_maxim_reslt,
           utils_creat,
           date_creat,
           utils_modfc,
           date_modfc,
           ref_atrib_struc_aplic_afich,
           (select   '[ ' || nom_coln || ' ]'
              from   vd_sie_12_atrib_struc_aplic
             where   seqnc = ref_atrib_struc_aplic_afich)
    from   vd_i_sie_23_aplic_modl_rechr amr;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_23_DETL_APLIC_MODL_RE;

create or replace force view vd_sie_23_detl_aplic_modl_re
(
  seqnc,
  ref_aplic_modl_rechr,
  ref_code_struc_aplic_formt,
  ref_atrib_struc_aplic,
  ref_atrib_struc_aplic_formt,
  ref_patrn_rechr,
  ref_patrn_rechr_formt,
  ordre_exect,
  pertn,
  utils_creat,
  date_creat,
  utils_modfc,
  date_modfc
) as
  select   seqnc,
           ref_aplic_modl_rechr,
           (select   sie_12_struc_aplic_pkg.obten_code (amr.ref_struc_aplic_rechr)
              from   vd_sie_23_aplic_modl_rechr amr
             where   amr.seqnc = damr.ref_aplic_modl_rechr)
             ref_code_struc_aplic_formt,
           ref_atrib_struc_aplic,
           (select   asa.nom_coln
              from   vd_sie_12_atrib_struc_aplic asa
             where   asa.seqnc = damr.ref_atrib_struc_aplic),
           ref_patrn_rechr,
           (select   pr.nom
              from   vd_sie_23_patrn_rechr pr
             where   pr.seqnc = damr.ref_patrn_rechr),
           ordre_exect,
           pertn,
           utils_creat,
           date_creat,
           utils_modfc,
           date_modfc
    from   vd_i_sie_23_detl_aplic_modl_re damr;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_23_DETL_RESLT_RECHR;

create or replace force view vd_sie_23_detl_reslt_rechr
(
  seqnc,
  ref_rechr,
  ref_enonc_rechr,
  utils_creat,
  date_creat,
  utils_modfc,
  date_modfc,
  ref_detl_aplic_modl_rechr,
  dnr_pertn,
  ref_seqnc_struc_aplic,
  ref_reslt_rechr
) as
  select   seqnc,
           ref_rechr,
           ref_enonc_rechr,
           utils_creat,
           date_creat,
           utils_modfc,
           date_modfc,
           ref_detl_aplic_modl_rechr,
           dnr_pertn,
           ref_seqnc_struc_aplic,
           ref_reslt_rechr
    from   vd_i_sie_23_detl_reslt_rechr;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_23_ENONC_RECHR;

create or replace force view vd_sie_23_enonc_rechr
(
  seqnc,
  ref_rechr,
  mot,
  ordre_apart,
  utils_creat,
  date_creat,
  utils_modfc,
  date_modfc
) as
  select   seqnc,
           ref_rechr,
           mot,
           ordre_apart,
           utils_creat,
           date_creat,
           utils_modfc,
           date_modfc
    from   vd_i_sie_23_enonc_rechr;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_23_MODL_RECHR;

create or replace force view vd_sie_23_modl_rechr
(
  seqnc,
  code,
  ref_domn,
  nom,
  descr,
  utils_creat,
  date_creat,
  utils_modfc,
  date_modfc,
  ref_prodt,
  dnr_ref_prodt
) as
  select   "SEQNC",
           "CODE",
           "REF_DOMN",
           "NOM",
           "DESCR",
           "UTILS_CREAT",
           "DATE_CREAT",
           "UTILS_MODFC",
           "DATE_MODFC",
           "REF_PRODT",
           "DNR_REF_PRODT"
    from   vd_i_sie_23_modl_rechr;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_23_PATRN_RECHR;

create or replace force view vd_sie_23_patrn_rechr
(
  seqnc,
  code,
  nom,
  descr,
  enonc_plsql_gauch,
  enonc_plsql_droit,
  utils_creat,
  date_creat,
  utils_modfc,
  date_modfc,
  opert,
  ref_prodt,
  dnr_ref_prodt
) as
  select   "SEQNC",
           "CODE",
           "NOM",
           "DESCR",
           "ENONC_PLSQL_GAUCH",
           "ENONC_PLSQL_DROIT",
           "UTILS_CREAT",
           "DATE_CREAT",
           "UTILS_MODFC",
           "DATE_MODFC",
           "OPERT",
           "REF_PRODT",
           "DNR_REF_PRODT"
    from   vd_i_sie_23_patrn_rechr;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_23_RECHR;

create or replace force view vd_sie_23_rechr
(
  seqnc,
  ref_utils,
  date_exect,
  date_exect_formt,
  utils_creat,
  date_creat,
  utils_modfc,
  date_modfc,
  ref_modl_rechr,
  enonc_formt,
  decmp_reslt,
  decmp_reslt_formt
) as
  select   seqnc,
           ref_utils,
           date_exect,
           to_char (trunc (date_exect),
                    'fmDay fmDD fmMonth YYYY'),
           utils_creat,
           date_creat,
           utils_modfc,
           date_modfc,
           ref_modl_rechr,
           sie_23_rechr_pkg.obten_enonc_rechr_formt (seqnc),
           (select   count (1)
              from   vd_i_sie_23_reslt_rechr rr
             where   rr.ref_rechr = r.seqnc),
           (select   to_char (count (1),
                              'fm999g990')
              from   vd_i_sie_23_reslt_rechr rr
             where   rr.ref_rechr = r.seqnc)
    from   vd_i_sie_23_rechr r;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_23_RESLT_RECHR;

create or replace force view vd_sie_23_reslt_rechr
(
  seqnc,
  ref_rechr,
  utils_creat,
  date_creat,
  utils_modfc,
  date_modfc,
  dnr_libl_struc_aplic_html,
  dnr_libl_struc_aplic,
  dnr_pertn,
  dnr_lien,
  dnr_decmp_reslt,
  ref_aplic_modl_rechr,
  dnr_ref_struc_aplic,
  dnr_ref_struc_aplic_formt,
  ref_seqnc_struc_aplic
) as
  select   seqnc,
           ref_rechr,
           utils_creat,
           date_creat,
           utils_modfc,
           date_modfc,
           dnr_libl_struc_aplic_html,
           dnr_libl_struc_aplic,
           dnr_pertn,
           dnr_lien,
           dnr_decmp_reslt,
           ref_aplic_modl_rechr,
           dnr_ref_struc_aplic,
           (select   sa.nom d
              from   vd_sie_12_struc_aplic sa
             where   sa.seqnc = rr.dnr_ref_struc_aplic),
           ref_seqnc_struc_aplic
    from   vd_i_sie_23_reslt_rechr rr;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_25_CHAMP;

create or replace force view vd_sie_25_champ
(
  seqnc,
  code,
  postn_x,
  postn_y,
  angle_orint,
  ref_formt,
  ref_formt_formt,
  ref_versn_publc,
  ref_dv_type_champ,
  ref_dv_type_champ_formt,
  indic_modif,
  nom,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   seqnc,
           code,
           postn_x,
           postn_y,
           angle_orint,
           ref_formt,
           (select   type_don_formt
              from   vd_sie_14_formt
             where   seqnc = ref_formt),
           ref_versn_publc,
           ref_dv_type_champ,
           (select   valr
              from   vd_sie_14_detl_domn_valr
             where   seqnc = ref_dv_type_champ),
           indic_modif,
           nom,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc
    from   vd_i_sie_25_champ;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_25_DOMN_TYPE_PUBLC;

create or replace force view vd_sie_25_domn_type_publc
(
  seqnc,
  ref_domn,
  ref_type_publc,
  ref_type_publc_formt,
  ref_publc,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   seqnc,
           ref_domn,
           ref_type_publc,
           (select   nom
              from   vd_i_sie_25_type_publc
             where   seqnc = ref_type_publc),
           ref_publc,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc
    from   vd_i_sie_25_domn_type_publc;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_25_ELEMN_CONFG_PUBLC;

create or replace force view vd_sie_25_elemn_confg_publc
(
  seqnc,
  ref_type_publc,
  ref_type_publc_formt,
  code,
  nom,
  descr,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  type_don
) as
  select   seqnc,
           ref_type_publc,
           (select   nom
              from   vd_i_sie_25_type_publc
             where   seqnc = ref_type_publc),
           code,
           nom,
           descr,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           type_don
    from   vd_i_sie_25_elemn_confg_publc;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_25_ENGIN;

create or replace force view vd_sie_25_engin
(
  seqnc,
  code,
  ref_dv_formt_sort,
  ref_dv_formt_sort_formt,
  url_servl,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  url_servl_exter
) as
  select   seqnc,
           code,
           ref_dv_formt_sort,
           sie_14_domn_valr_pkg.obten_valr (ref_dv_formt_sort),
           url_servl,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           url_servl_exter
    from   vd_i_sie_25_engin;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_25_ENGIN_VERSN_PUBLC;

create or replace force view vd_sie_25_engin_versn_publc
(
  seqnc,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_versn_publc,
  ref_engin,
  ref_code_engin,
  iden_acces,
  pdf_fusn
) as
  select   seqnc,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           ref_versn_publc,
           ref_engin,
           (select   code
              from   vd_sie_25_engin
             where   seqnc = ref_engin),
           iden_acces,
           pdf_fusn
    from   vd_i_sie_25_engin_versn_publc;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_25_GROUP_PUBLC;

create or replace force view vd_sie_25_group_publc
(
  seqnc,
  code,
  nom,
  descr,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   seqnc,
           code,
           nom,
           descr,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc
    from   vd_i_sie_25_group_publc;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_25_JOURN_TRAVL_EXECT;

create or replace force view vd_sie_25_journ_travl_exect
(
  seqnc,
  ref_dv_type_ecrit,
  ref_travl,
  ref_publc_travl,
  date_journ,
  enonc
) as
  select   seqnc,
           ref_dv_type_ecrit,
           ref_travl,
           ref_publc_travl,
           date_journ,
           enonc
    from   vd_i_sie_25_journ_travl_exect;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_25_OCURN_PARMT_PUBLC;

create or replace force view vd_sie_25_ocurn_parmt_publc
(
  seqnc,
  valr_date,
  valr_numbr,
  valr_varch,
  ref_parmt_publc_travl
) as
  select   "SEQNC",
           "VALR_DATE",
           "VALR_NUMBR",
           "VALR_VARCH",
           "REF_PARMT_PUBLC_TRAVL"
    from   vd_i_sie_25_ocurn_parmt_publc;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_25_PARMT_PUBLC_TRAVL;

create or replace force view vd_sie_25_parmt_publc_travl
(
  seqnc,
  ref_publc_travl,
  ref_parmt_type_publc,
  ref_code_parmt_tp_formt,
  indic_presn_appel,
  ordre_presn,
  valr_varch,
  valr_date,
  valr_numbr,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   seqnc,
           ref_publc_travl,
           ref_parmt_type_publc,
           (select   ptp.code
              from   vd_i_sie_25_parmt_type_publc ptp
             where   ptp.seqnc = ppt.ref_parmt_type_publc),
           (select   ptp.indic_presn_appel
              from   vd_i_sie_25_parmt_type_publc ptp
             where   ptp.seqnc = ppt.ref_parmt_type_publc),
           (select   ptp.ordre_presn
              from   vd_i_sie_25_parmt_type_publc ptp
             where   ptp.seqnc = ppt.ref_parmt_type_publc),
           valr_varch,
           valr_date,
           valr_numbr,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc
    from   vd_i_sie_25_parmt_publc_travl ppt;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_25_PARMT_TYPE_PUBLC;

create or replace force view vd_sie_25_parmt_type_publc
(
  seqnc,
  ref_type_publc,
  ref_type_publc_formt,
  ref_engin,
  ref_engin_formt,
  code,
  nom,
  descr,
  indic_presn_appel,
  indic_presn_appel_formt,
  indic_fixe,
  indic_fixe_formt,
  valr_deft,
  type_valr_deft,
  type_valr_deft_formt,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  type_don,
  type_don_formt,
  ordre_presn,
  cardn,
  cardn_formt
) as
  select   seqnc,
           ref_type_publc,
           (select   nom
              from   vd_i_sie_25_type_publc tp
             where   tp.seqnc = ref_type_publc),
           ref_engin,
           (select   code
              from   vd_i_sie_25_engin e
             where   e.seqnc = ref_engin),
           code,
           nom,
           descr,
           indic_presn_appel,
           case indic_presn_appel when 'O' then 'Oui' else 'Non' end indic_presn_appel_formt,
           indic_fixe,
           case indic_fixe when 'O' then 'Oui' else 'Non' end indic_fixe_formt,
           valr_deft,
           type_valr_deft,
           case type_valr_deft when 'ITEM' then 'Item de page' when 'LITRL' then 'Littéral' else 'PL/SQL' end
             type_valr_deft_formt,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           type_don,
           case type_don when 'D' then 'Date' when 'N' then 'Numérique' else 'Alphanumérique' end type_don_formt,
           ordre_presn,
           cardn,
           case cardn when 'L' then 'Littéral' else 'Vecteur' end cardn_formt
    from   vd_i_sie_25_parmt_type_publc;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_25_PAR_PUB_TRA_EXECT;

create or replace force view vd_sie_25_par_pub_tra_exect
(
  seqnc,
  ref_travl_publc,
  valr_numbr1,
  valr_varch1,
  valr_date1,
  valr_numbr2,
  valr_varch2,
  valr_date2,
  valr_numbr3,
  valr_varch3,
  valr_date3,
  valr_numbr4,
  valr_varch4,
  valr_date4,
  valr_numbr5,
  valr_varch5,
  valr_date6,
  valr_numbr7,
  valr_varch7,
  valr_date7,
  valr_numbr8,
  valr_varch8,
  valr_date8,
  valr_numbr9,
  valr_varch9,
  valr_date9,
  valr_numbr10,
  valr_varch10,
  valr_date10,
  ref_travl
) as
  select   seqnc,
           ref_travl_publc,
           valr_numbr1,
           valr_varch1,
           valr_date1,
           valr_numbr2,
           valr_varch2,
           valr_date2,
           valr_numbr3,
           valr_varch3,
           valr_date3,
           valr_numbr4,
           valr_varch4,
           valr_date4,
           valr_numbr5,
           valr_varch5,
           valr_date6,
           valr_numbr7,
           valr_varch7,
           valr_date7,
           valr_numbr8,
           valr_varch8,
           valr_date8,
           valr_numbr9,
           valr_varch9,
           valr_date9,
           valr_numbr10,
           valr_varch10,
           valr_date10,
           ref_travl
    from   vd_i_sie_25_par_pub_tra_exect;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_25_PUBLC;

create or replace force view vd_sie_25_publc
(
  seqnc,
  ref_type_publc,
  ref_type_publc_fomrt,
  ref_code_type_publc,
  code,
  nom,
  descr,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_group_publc
) as
  select   seqnc,
           ref_type_publc,
           (select   nom
              from   vd_sie_25_type_publc
             where   seqnc = ref_type_publc),
           (select   code
              from   vd_sie_25_type_publc
             where   seqnc = ref_type_publc),
           code,
           nom,
           descr,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           ref_group_publc
    from   vd_i_sie_25_publc;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_25_PUBLC_TRAVL;

create or replace force view vd_sie_25_publc_travl
(
  seqnc,
  ref_versn_publc,
  ref_type_publc,
  ref_code_type_publc,
  ref_code_publc,
  ref_code_type_publc_formt,
  ref_code_publc_formt,
  ref_travl,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_stat,
  ref_stat_formt,
  nom,
  indic_parmt_alimn
) as
  select   seqnc,
           ref_versn_publc,
           (select   tp.seqnc
              from   vd_i_sie_25_type_publc tp,
                     vd_i_sie_25_publc p,
                     vd_i_sie_25_versn_publc vp
             where   tp.seqnc = p.ref_type_publc and vp.seqnc = pt.ref_versn_publc and p.seqnc = vp.ref_publc),
           (select   tp.code
              from   vd_i_sie_25_type_publc tp,
                     vd_i_sie_25_publc p,
                     vd_i_sie_25_versn_publc vp
             where   tp.seqnc = p.ref_type_publc and vp.seqnc = pt.ref_versn_publc and p.seqnc = vp.ref_publc),
           (select   p.code
              from   vd_i_sie_25_publc p,
                     vd_i_sie_25_versn_publc vp
             where   vp.seqnc = pt.ref_versn_publc and p.seqnc = vp.ref_publc),
           (select   tp.nom
              from   vd_i_sie_25_type_publc tp,
                     vd_i_sie_25_publc p,
                     vd_i_sie_25_versn_publc vp
             where   tp.seqnc = p.ref_type_publc and vp.seqnc = pt.ref_versn_publc and p.seqnc = vp.ref_publc),
           (select   p.nom
              from   vd_i_sie_25_publc p,
                     vd_i_sie_25_versn_publc vp
             where   vp.seqnc = pt.ref_versn_publc and p.seqnc = vp.ref_publc),
           ref_travl,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           ref_stat,
           (select   s.nom
              from   vd_i_sie_12_stat s
             where   s.seqnc = pt.ref_stat),
           nom,
           indic_parmt_alimn
    from   vd_i_sie_25_publc_travl pt;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_25_TRAVL;

create or replace force view vd_sie_25_travl
(
  seqnc,
  ref_utils,
  ref_utils_formt,
  indic_imedt,
  indic_imedt_formt,
  nom,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_domn,
  ref_stat,
  ref_stat_formt,
  nombr_elemn,
  ref_type_travl
) as
  select   seqnc,
           ref_utils,
           (select   nom_formt
              from   vd_sie_12_utils
             where   seqnc = ref_utils),
           indic_imedt,
           case indic_imedt when 'O' then 'Oui' else 'Non' end indic_imedt_formt,
           nom,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           ref_domn,
           ref_stat,
           (select   nom
              from   vd_i_sie_12_stat s
             where   s.seqnc = t.ref_stat),
           (select   count (1)
              from   vd_i_sie_25_publc_travl pt
             where   pt.ref_travl = t.seqnc),
           ref_type_travl
    from   vd_i_sie_25_travl t;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_25_TYPE_PUBLC;

create or replace force view vd_sie_25_type_publc
(
  seqnc,
  code,
  nom,
  descr,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_struc_aplic,
  ref_struc_aplic_formt
) as
  select   seqnc,
           code,
           nom,
           descr,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           ref_struc_aplic,
           (select   nom
              from   vd_i_sie_12_struc_aplic sa
             where   tp.ref_struc_aplic = sa.seqnc)
             ref_struc_aplic_formt
    from   vd_i_sie_25_type_publc tp;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_25_TYPE_TRAVL;

create or replace force view vd_sie_25_type_travl
(
  seqnc,
  code,
  nom,
  descr,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_domn
) as
  (select   seqnc,
            code,
            nom,
            descr,
            date_creat,
            utils_creat,
            date_modfc,
            utils_modfc,
            ref_domn
     from   vd_i_sie_25_type_travl);


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_25_VALR_CHAMP;

create or replace force view vd_sie_25_valr_champ
(
  seqnc,
  ref_champ,
  ref_publc_travl,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  valr_nombr,
  valr_date,
  valr_varch
) as
  select   seqnc,
           ref_champ,
           ref_publc_travl,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           valr_nombr,
           valr_date,
           valr_varch
    from   vd_i_sie_25_valr_champ;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_25_VALR_ELEMN_CONFG;

create or replace force view vd_sie_25_valr_elemn_confg
(
  seqnc,
  ref_elemn_confg_publc,
  date_debut_efect,
  date_fin_efect,
  valr_varch,
  valr_date,
  valr_numbr,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_domn,
  ref_domn_formt
) as
  select   seqnc,
           ref_elemn_confg_publc,
           date_debut_efect,
           date_fin_efect,
           valr_varch,
           valr_date,
           valr_numbr,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           ref_domn,
           (select   nom
              from   vd_i_sie_12_domn
             where   seqnc = ref_domn)
    from   vd_i_sie_25_valr_elemn_confg;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_25_VERSN_PUBLC;

create or replace force view vd_sie_25_versn_publc
(
  seqnc,
  code,
  nom,
  descr,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_publc,
  date_debut_efect,
  date_fin_efect
) as
  select   seqnc,
           code,
           nom,
           descr,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           ref_publc,
           date_debut_efect,
           date_fin_efect
    from   vd_i_sie_25_versn_publc;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_29_CONTR;

create or replace force view vd_sie_29_contr
(
  seqnc,
  ref_prodt,
  code_contr,
  nom_struc_acces,
  nom,
  descr,
  niv_gravt,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   "SEQNC",
           "REF_PRODT",
           "CODE_CONTR",
           "NOM_STRUC_ACCES",
           "NOM",
           "DESCR",
           "NIV_GRAVT",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC"
    from   vd_i_sie_29_contr;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_30_AFECT_ITEM;

create or replace force view vd_sie_30_afect_item
(
  seqnc,
  ref_item_carnt_prodt,
  ref_utils,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   "SEQNC",
           "REF_ITEM_CARNT_PRODT",
           "REF_UTILS",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC"
    from   vd_i_sie_30_afect_item;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_30_CARNT_SPRIN;

create or replace force view vd_sie_30_carnt_sprin
(
  seqnc,
  descr,
  ref_utils_respn,
  ref_carnt_prodt,
  date_debut_prevu,
  date_fin_prevu,
  ref_versn,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   "SEQNC",
           "DESCR",
           "REF_UTILS_RESPN",
           "REF_CARNT_PRODT",
           "DATE_DEBUT_PREVU",
           "DATE_FIN_PREVU",
           "REF_VERSN",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC"
    from   vd_i_sie_30_carnt_sprin;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_30_CAS_UTILS;

create or replace force view vd_sie_30_cas_utils
(
  seqnc,
  code,
  nom,
  descr,
  docmn_refrc,
  ref_carnt_prodt,
  ref_stat,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   seqnc,
           code,
           nom,
           descr,
           docmn_refrc,
           ref_carnt_prodt,
           ref_stat,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc
    from   vd_i_sie_30_cas_utils;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_30_EFORT_ITEM;

create or replace force view vd_sie_30_efort_item
(
  seqnc,
  ref_item_carnt_sprin,
  ref_utils,
  comnt,
  date_efort,
  valr,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   "SEQNC",
           "REF_ITEM_CARNT_SPRIN",
           "REF_UTILS",
           "COMNT",
           "DATE_EFORT",
           "VALR",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC"
    from   vd_i_sie_30_efort_item;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_30_HISTR_EFORT_RESTN;

create or replace force view vd_sie_30_histr_efort_restn
(
  seqnc,
  ref_item_carnt_sprin,
  date_heure_saisi,
  efort_restn,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   "SEQNC",
           "REF_ITEM_CARNT_SPRIN",
           "DATE_HEURE_SAISI",
           "EFORT_RESTN",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC"
    from   vd_i_sie_30_histr_efort_restn;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_30_ITEM_CARNT_PRODT;

create or replace force view vd_sie_30_item_carnt_prodt
(
  seqnc,
  nom,
  descr,
  ref_carnt_prodt,
  ref_dv_prior,
  ref_stat,
  ref_dv_tail_reltv,
  ref_cas_utils,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   "SEQNC",
           "NOM",
           "DESCR",
           "REF_CARNT_PRODT",
           "REF_DV_PRIOR",
           "REF_STAT",
           "REF_DV_TAIL_RELTV",
           "REF_CAS_UTILS",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC"
    from   vd_i_sie_30_item_carnt_prodt;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_30_ITEM_CARNT_SPRIN;

create or replace force view vd_sie_30_item_carnt_sprin
(
  seqnc,
  nom,
  descr,
  numr_refrc_docmn,
  ref_item_carnt_prodt,
  ref_carnt_sprin,
  efort_prevu,
  efort_restn,
  ref_dv_prior,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_sie_30_page
) as
  select   "SEQNC",
           "NOM",
           "DESCR",
           "NUMR_REFRC_DOCMN",
           "REF_ITEM_CARNT_PRODT",
           "REF_CARNT_SPRIN",
           "EFORT_PREVU",
           "EFORT_RESTN",
           "REF_DV_PRIOR",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC",
           "REF_SIE_30_PAGE"
    from   vd_i_sie_30_item_carnt_sprin;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_30_PAGE;

create or replace force view vd_sie_30_page
(
  seqnc,
  ref_sie_13_page,
  nom,
  numr_apex,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   "SEQNC",
           "REF_SIE_13_PAGE",
           "NOM",
           "NUMR_APEX",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC"
    from   vd_i_sie_30_page;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VD_SIE_30_PAGE_ITEM;

create or replace force view vd_sie_30_page_item
(
  seqnc,
  ref_sie_30_page,
  ref_item_carnt_prodt,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc
) as
  select   "SEQNC",
           "REF_SIE_30_PAGE",
           "REF_ITEM_CARNT_PRODT",
           "DATE_CREAT",
           "UTILS_CREAT",
           "DATE_MODFC",
           "UTILS_MODFC"
    from   vd_i_sie_30_page_item;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VS_GROUP_LIE_OPERT_VERFC;

create or replace force view vs_group_lie_opert_verfc (seqnc_group) as
  select       distinct (o.ref_group) seqnc_group
        from   sie_12_lien_group_utils o
  connect by   o.ref_group_utils_lie = prior o.ref_group
           and (level != 1
             or (level = 1 and ref_utils is null))
           and o.date_debut_efect <= sysdate
           and (o.date_fin_efect >= sysdate
             or o.date_fin_efect is null)
  start with   o.ref_group_utils_lie in (select   ref_group_utils
                                           from   sie_12_defnt_acces o2,
                                                  sie_13_opert lgu2,
                                                  (select   sie_12_secrt_pkg.obten_opert_en_cours_verfc () code
                                                     from   dual) opert
                                          where   o2.ref_opert = lgu2.seqnc and lgu2.code = opert.code)
  union
  select   distinct (ref_group_utils) seqnc_group
    from   sie_12_defnt_acces o2,
           sie_13_opert lgu2,
           (select   sie_12_secrt_pkg.obten_opert_en_cours_verfc () code
              from   dual) opert
   where   o2.ref_opert = lgu2.seqnc and lgu2.code = opert.code;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VS_GROUP_LIE_UTILS_CONCT;

create or replace force view vs_group_lie_utils_conct
(
  seqnc_group
) as
  select       distinct (ref_group) seqnc_group
        from   sie_12_lien_group_utils lgu
  connect by   lgu.ref_group_utils_lie = prior lgu.ref_group
           and (level != 1
             or (level = 1 and ref_utils is null))
           and lgu.date_debut_efect <= sysdate
           and (lgu.date_fin_efect >= sysdate
             or lgu.date_fin_efect is null)
  start with   lgu.ref_group_utils_lie in
                 (select   distinct ref_group
                    from   sie_12_lien_group_utils lgu2,
                           (select   sie_12_utils_pkg.obten_usagr_conct_sql (sie_07_util_pkg.vd ('APP_USER')) seqnc
                              from   dual) utils
                   where   lgu2.ref_utils = utils.seqnc
                       and lgu2.date_debut_efect <= sysdate
                       and (lgu2.date_fin_efect >= sysdate
                         or lgu2.date_fin_efect is null))
           and lgu.ref_utils is null
           and lgu.date_debut_efect <= sysdate
           and (lgu.date_fin_efect >= sysdate
             or lgu.date_fin_efect is null)
  union
  select   distinct ref_group
    from   sie_12_lien_group_utils lgu2,
           (select   sie_12_utils_pkg.obten_usagr_conct_sql (sie_07_util_pkg.vd ('APP_USER')) seqnc
              from   dual) utils
   where   lgu2.ref_utils = utils.seqnc
       and lgu2.date_debut_efect <= sysdate
       and (lgu2.date_fin_efect >= sysdate
         or lgu2.date_fin_efect is null);


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VS_IX_LOV_UTILS_STRUC_APLIC_01;

create or replace force view vs_ix_lov_utils_struc_aplic_01
(
  nom_struc,
  ref_utils_formt,
  seqnc,
  nom_type_struc,
  code_utils
) as
  select   nom_struc,
           ref_utils_formt,
           seqnc,
           nom_type_struc,
           code_utils
    from   table (sie_16_vue_parmt_pkg.obten_lov_utils_struc_aplic ());


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VS_OPTIO_ENTET_CALND;

create or replace force view vs_optio_entet_calnd
(
  d,
  r,
  o
) as
  select   '[Action] ' || valr d,
           ref_code_domn_valr_formt || ',' || code_valr r,
           1 o
    from   vd_sie_14_detl_domn_valr
   where   ref_code_domn_valr_formt = 'OPTIO_ENTET_CALND'
  union all
  select   '[Vue] ' || valr d,
           ref_code_domn_valr_formt || ',' || code_valr r,
           2 o
    from   vd_sie_14_detl_domn_valr
   where   ref_code_domn_valr_formt = 'VUE_DISPN_CALND'
  union all
  select       '[Espace] ' d,
               ',' || to_char (-rownum) r,
               3 o
        from   dual
  connect by   level < (select   count (*)
                          from   (select   1
                                    from   vd_sie_14_detl_domn_valr
                                   where   ref_code_domn_valr_formt = 'OPTIO_ENTET_CALND'
                                  union all
                                  select   1
                                    from   vd_sie_14_detl_domn_valr
                                   where   ref_code_domn_valr_formt = 'VUE_DISPN_CALND')) -
                       1;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VS_SIE_01_COLN_TABLE;

create or replace force view vs_sie_01_coln_table
(
  seqnc_prodt,
  code_prodt,
  nom_prodt,
  nom_table,
  nom
) as
  select   pro.seqnc,
           pro.code,
           pro.nom,
           atc.table_name,
           atc.column_name
    from   all_tab_columns atc,
           apex_aplic app,
           vd_i_sie_11_prodt pro,
           vd_i_sie_11_aplic ap
   where   atc.owner = app.owner and app.id = ap.numr_aplic_apex and ap.ref_prodt = pro.seqnc;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VS_SIE_01_CONTR;

create or replace force view vs_sie_01_contr
(
  seqnc_prodt,
  code_prodt,
  nom_prodt,
  nom_table,
  nom,
  type,
  schem
) as
  select   pro.seqnc,
           pro.code,
           pro.nom,
           ac.table_name,
           ac.constraint_name,
           decode (constraint_type,
                   'P', 'Clé primaire',
                   'R', 'Clé étrangère',
                   'U', 'Clé unique',
                   'C', 'Contrainte de vérification',
                   constraint_type)
             type,
           ac.owner
    from   all_constraints ac,
           sie_11_prodt pro
   where   ac.constraint_name not like 'BIN$%' and ac.constraint_name not like 'SYS_%';


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VS_SIE_01_TABLE;

create or replace force view vs_sie_01_table
(
  seqnc_prodt,
  code_prodt,
  nom_prodt,
  nom
) as
  select   pro.seqnc,
           pro.code,
           pro.nom,
           tab.table_name
    from   all_tables tab,
           apex_aplic app,
           vd_i_sie_11_prodt pro,
           vd_i_sie_11_aplic ap
   where   tab.owner = app.owner and app.id = ap.numr_aplic_apex and ap.ref_prodt = pro.seqnc;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VS_SIE_07_CONDT_APEX;

create or replace force view vs_sie_07_condt_apex
(
  d,
  r,
  tri
) as
  select   lov_disp_value d,
           lov_return_value r,
           lov_disp_sequence tri
    from   apex_valr_lov detl,
           apex_lov lov
   where   detl.lov_id = lov.id
       and lov_name = 'STANDARD_CONDITION_TYPES'
       and detl.flow_id = sie_07_util_pkg.obten_aplic_tradc_courn (4000)
  with read only;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VS_SIE_13_PAGE;

create or replace force view vs_sie_13_page
(
  seqnc_prodt,
  code_prodt,
  nom_prodt,
  numr_aplic,
  numr,
  nom
) as
  select   pro.seqnc,
           pro.code,
           pro.nom nom_prodt,
           ap.numr_aplic_apex numr_aplic,
           aap.numr_apex,
           aap.nom
    from   vd_i_sie_13_page aap,
           vd_i_sie_11_prodt pro,
           vd_i_sie_11_aplic ap
   where   ap.ref_prodt = pro.seqnc and aap.ref_aplic = ap.seqnc;


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VS_SIE_13_SEQNC_IR_COURN;

create or replace force view vs_sie_13_seqnc_ir_courn (seqnc) as
  select   column_value seqnc
    from   table (sie_13_raprt_inter_cu_pkg.obten_seqnc_raprt_courn);


/* Formatted on 6/3/2013 10:08:28 PM (QP5 v5.185.11230.41888) */
prompt View VS_SIE_14_DOMN_VALR;

create or replace force view vs_sie_14_domn_valr
(
  code,
  ref_prodt,
  code_valr,
  valr
) as
  select   dv.code,
           dv.ref_prodt,
           ddv.code_valr,
           ddv.valr
    from   vd_i_sie_14_domn_valr dv,
           vd_i_sie_14_detl_domn_valr ddv
   where   ddv.ref_domn_valr = dv.seqnc and dv.ref_prodt = sie_11_prodt_pkg.obten_prodt_sesn;


/* Formatted on 6/3/2013 10:08:29 PM (QP5 v5.185.11230.41888) */
prompt View VS_SIE_20_DOCMN;

create or replace force view vs_sie_20_docmn
(
  seqnc,
  ref_prodt_lang,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  ref_struc_aplic,
  ref_struc_aplic_formt,
  ref_seqnc_struc_aplic,
  ref_docmn_formt,
  ref_propr,
  ref_propr_formt,
  ref_dv_type_modl_formt
) as
  select   d.seqnc,
           d.ref_prodt_lang,
           d.date_creat,
           d.utils_creat,
           d.date_modfc,
           d.utils_modfc,
           d.ref_struc_aplic,
           sa.nom ref_struc_aplic_formt,
           d.ref_seqnc_struc_aplic,
           sie_20_docmn_pkg.formt_propr_docmn (d.seqnc) ref_docmn_formt,
           case
             when d.ref_struc_aplic != sie_12_struc_aplic_pkg.obten_seqnc ('MODL_PARMT') then
               d.ref_propr
             else
               (select   ref_modl
                  from   vd_sie_20_modl_parmt
                 where   seqnc = d.ref_seqnc_struc_aplic)
           end,
           case
             when d.ref_struc_aplic != sie_12_struc_aplic_pkg.obten_seqnc ('MODL_PARMT') then
               sie_20_modl_pkg.obten_propr_sous_modl_formt (d.seqnc)
             else
               null
           end,
           case
             when d.ref_struc_aplic != sie_12_struc_aplic_pkg.obten_seqnc ('MODL_PARMT') then
               sie_14_domn_valr_pkg.obten_valr (d.ref_dv_type_modl)
             else
               null
           end
    from   vd_sie_20_docmn d,
           vd_i_sie_12_struc_aplic sa
   where   sa.seqnc = d.ref_struc_aplic;


/* Formatted on 6/3/2013 10:08:29 PM (QP5 v5.185.11230.41888) */
prompt View VS_SIE_20_MODL_ENFAN;

create or replace force view vs_sie_20_modl_enfan
(
  seqnc,
  ref_dv_type_modl,
  ref_versn,
  ref_modl,
  nom_organ,
  numr_surch,
  indic_agreg,
  indic_pipln,
  indic_detrm,
  indic_authid_curnt_utils,
  indic_publc,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  versn_bd_aplic
) as
  select   seqnc,
           ref_dv_type_modl,
           ref_versn,
           ref_modl,
           nom_organ,
           numr_surch,
           indic_agreg,
           indic_pipln,
           indic_detrm,
           indic_authid_curnt_utils,
           indic_publc,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           versn_bd_aplic
    from   vd_i_sie_20_modl
   where   ref_modl is not null;


/* Formatted on 6/3/2013 10:08:29 PM (QP5 v5.185.11230.41888) */
prompt View VS_SIE_20_MODL_PARNT;

create or replace force view vs_sie_20_modl_parnt
(
  seqnc,
  ref_dv_type_modl,
  ref_versn,
  ref_modl,
  nom_organ,
  numr_surch,
  indic_agreg,
  indic_pipln,
  indic_detrm,
  indic_authid_curnt_utils,
  indic_publc,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  versn_bd_aplic
) as
  select   seqnc,
           ref_dv_type_modl,
           ref_versn,
           ref_modl,
           nom_organ,
           numr_surch,
           indic_agreg,
           indic_pipln,
           indic_detrm,
           indic_authid_curnt_utils,
           indic_publc,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           versn_bd_aplic
    from   vd_i_sie_20_modl
   where   ref_modl is null;


/* Formatted on 6/3/2013 10:08:29 PM (QP5 v5.185.11230.41888) */
prompt View VS_SIE_20_RAPRT_FCT_PRC;

create or replace force view vs_sie_20_raprt_fct_prc
(
  numrt,
  seqnc,
  ref_dv_type_modl,
  ref_dv_type_modl_formt,
  ref_versn,
  ref_modl,
  ref_modl_formt,
  nom_organ,
  numr_surch,
  indic_agreg,
  indic_agreg_formt,
  indic_pipln,
  indic_pipln_formt,
  indic_detrm,
  indic_detrm_formt,
  indic_authid_curnt_utils,
  indic_authid_curnt_utils_formt,
  indic_publc,
  indic_publc_formt,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  versn_bd_aplic
) as
  select   null,
           seqnc,
           ref_dv_type_modl,
           ref_dv_type_modl_formt,
           ref_versn,
           ref_modl,
           ref_modl_formt,
           nom_organ,
           numr_surch,
           indic_agreg,
           indic_agreg_formt,
           indic_pipln,
           indic_pipln_formt,
           indic_detrm,
           indic_detrm_formt,
           indic_authid_curnt_utils,
           indic_authid_curnt_utils_formt,
           indic_publc,
           indic_publc_formt,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           versn_bd_aplic
    from   vd_sie_20_modl m
   where   m.ref_dv_type_modl_formt = 'Fonction'
        or m.ref_dv_type_modl_formt = 'Procédure';


/* Formatted on 6/3/2013 10:08:29 PM (QP5 v5.185.11230.41888) */
prompt View VS_SIE_20_RAPRT_FCT_PRC_PARMT;

create or replace force view vs_sie_20_raprt_fct_prc_parmt
(
  seqnc,
  ref_modl,
  nom_organ,
  ref_dv_type_don,
  ref_dv_type_don_formt,
  postn,
  valr_deft,
  sens,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  indic_publc,
  indic_publc_formt,
  indic_retr
) as
  select   seqnc,
           ref_modl,
           nom_organ,
           ref_dv_type_don,
           sie_14_domn_valr_pkg.obten_valr (m.ref_dv_type_don),
           postn,
           valr_deft,
           sens,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           indic_publc,
           case indic_publc when 'O' then 'Oui' else 'Non' end indic_publc_formt,
           indic_retr
    from   vd_i_sie_20_modl_parmt m;


/* Formatted on 6/3/2013 10:08:29 PM (QP5 v5.185.11230.41888) */
prompt View VS_SIE_20_RAPRT_PKG;

create or replace force view vs_sie_20_raprt_pkg
(
  numrt,
  seqnc,
  ref_dv_type_modl,
  ref_dv_type_modl_formt,
  ref_versn,
  ref_modl,
  ref_modl_formt,
  nom_organ,
  numr_surch,
  indic_agreg,
  indic_agreg_formt,
  indic_pipln,
  indic_pipln_formt,
  indic_detrm,
  indic_detrm_formt,
  indic_authid_curnt_utils,
  indic_authid_curnt_utils_formt,
  indic_publc,
  indic_publc_formt,
  date_creat,
  utils_creat,
  date_modfc,
  utils_modfc,
  versn_bd_aplic
) as
  select   null,
           seqnc,
           ref_dv_type_modl,
           ref_dv_type_modl_formt,
           ref_versn,
           ref_modl,
           ref_modl_formt,
           nom_organ,
           numr_surch,
           indic_agreg,
           indic_agreg_formt,
           indic_pipln,
           indic_pipln_formt,
           indic_detrm,
           indic_detrm_formt,
           indic_authid_curnt_utils,
           indic_authid_curnt_utils_formt,
           indic_publc,
           indic_publc_formt,
           date_creat,
           utils_creat,
           date_modfc,
           utils_modfc,
           versn_bd_aplic
    from   vd_sie_20_modl m
   where   m.ref_dv_type_modl_formt = 'Package';


/* Formatted on 6/3/2013 10:08:29 PM (QP5 v5.185.11230.41888) */
prompt View VS_SIE_23_SOMR_RESLT_RECHR;

create or replace force view vs_sie_23_somr_reslt_rechr
(
  nom_formt,
  ref_struc_aplic,
  ref_rechr
) as
  select     sa.nom || ' [décompte ' || count (1) || ', pertinence maximum ' || max (rr.dnr_pertn) || '%]' nom_formt,
             sa.seqnc ref_struc_aplic,
             rr.ref_rechr
      from   vd_sie_23_reslt_rechr rr,
             vd_sie_12_struc_aplic sa
     where   sa.seqnc = rr.dnr_ref_struc_aplic
  group by   sa.nom,
             sa.seqnc,
             rr.ref_rechr;


/* Formatted on 6/3/2013 10:08:29 PM (QP5 v5.185.11230.41888) */
prompt View VS_SIE_25_PAR_PUB_TRA_EXECT;

create or replace force view vs_sie_25_par_pub_tra_exect
(
  ref_travl_publc,
  valr_numbr1,
  valr_varch1,
  valr_date1,
  valr_numbr2,
  valr_varch2,
  valr_date2,
  valr_numbr3,
  valr_varch3,
  valr_date3,
  valr_numbr4,
  valr_varch4,
  valr_date4,
  valr_numbr5,
  valr_varch5,
  valr_date6,
  valr_numbr7,
  valr_varch7,
  valr_date7,
  valr_numbr8,
  valr_varch8,
  valr_date8,
  valr_numbr9,
  valr_varch9,
  valr_date9,
  valr_numbr10,
  valr_varch10,
  valr_date10,
  ref_travl,
  seqnc
) as
  select   ref_travl_publc,
           valr_numbr1,
           valr_varch1,
           valr_date1,
           valr_numbr2,
           valr_varch2,
           valr_date2,
           valr_numbr3,
           valr_varch3,
           valr_date3,
           valr_numbr4,
           valr_varch4,
           valr_date4,
           valr_numbr5,
           valr_varch5,
           valr_date6,
           valr_numbr7,
           valr_varch7,
           valr_date7,
           valr_numbr8,
           valr_varch8,
           valr_date8,
           valr_numbr9,
           valr_varch9,
           valr_date9,
           valr_numbr10,
           valr_varch10,
           valr_date10,
           ref_travl,
           t.seqnc
    from   sie_25_parmt_publc_travl_exect pte,
           (select   sie_25_travl_publc_pkg.obten_travl_exect seqnc
              from   dual) t,
           (select   sie_25_travl_publc_pkg.obten_publc_travl_exect seqncc
              from   dual) pt
   where   pte.ref_travl = t.seqnc
       and (pte.ref_travl_publc = pt.seqncc
         or (pt.seqncc is null
         and sie_12_stat_pkg.obten_stat ('PUBLC_TRAVL',
                                         'ANUL',
                                         'AFW') != sie_25_travl_publc_pkg.obten_stat_publc_travl (pte.ref_travl_publc)));


/* Formatted on 6/3/2013 10:08:29 PM (QP5 v5.185.11230.41888) */
prompt View VS_STAT_PUBLC_TRAVL;

create or replace force view vs_stat_publc_travl
(
  d,
  r
) as
  select     s.nom d,
             s.seqnc r
      from   vd_sie_12_stat s
     where   ref_struc_aplic_formt = 'PUBLC_TRAVL'
  order by   ordre;


/* Formatted on 6/3/2013 10:08:29 PM (QP5 v5.185.11230.41888) */
prompt View VS_VUE_DISPN_CALND;

create or replace force view vs_vue_dispn_calnd
(
  d,
  r
) as
  select   valr d,
           seqnc r
    from   vd_sie_14_detl_domn_valr
   where   ref_code_domn_valr_formt = 'VUE_DISPN_CALND';

 


Prompt Trigger VD_SIE_01_MESG_AIDE_IOU_TRG;
/* Formatted on 6/3/2013 10:11:53 PM (QP5 v5.185.11230.41888) */
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
