set define off;
prompt Table SIE_01_ATRIB_MODL_COMNC;

create table sie_01_atrib_modl_comnc
(
  seqnc                                   number (10) not null,
  code                                    varchar2 (23 byte) not null,
  nom                                     varchar2 (60 byte) not null,
  descr                                   varchar2 (4000 byte) null,
  ref_modl_comnc                          number (10) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null
);


prompt Table SIE_01_CODE_ERR_ORACL;

create table sie_01_code_err_oracl
(
  seqnc                                   number (10) not null,
  err_code                                number (5) not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_creat                              date not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  libl                                    varchar2 (255 byte) null
);


prompt Table SIE_01_CONFG_EVENM_NOTFB;

create table sie_01_confg_evenm_notfb
(
  seqnc                                   number (10) not null,
  ref_type_comnc                          number (10) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  objet                                   varchar2 (200 byte) null,
  titre_mesg                              varchar2 (60 byte) null,
  mesg_sms                                varchar2 (160 byte) null,
  ref_evenm_notfb                         number (10) not null,
  nom                                     varchar2 (60 byte) not null,
  descr                                   varchar2 (4000 byte) null,
  ref_domn                                number (10) not null,
  ref_compt_twili                         number (10) null,
  ref_profl_courl                         number (10) null,
  indic_deft                              varchar2 (1 byte) default 'N' not null,
  mesg                                    clob null
);


prompt Table SIE_01_DESTN;

create table sie_01_destn
(
  seqnc                                   number (10) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  ref_atrib_struc_aplic                   number (10) not null,
  descr                                   varchar2 (4000 byte) null,
  dnr_ref_prodt                           number (10) not null
);


prompt Table SIE_01_DESTN_CONFG_EVENM_NOTFB;

create table sie_01_destn_confg_evenm_notfb
(
  seqnc                                   number (10) not null,
  ref_dv_natr_destn                       number (10) null,
  ref_confg_evenm_notfb                   number (10) not null,
  ref_destn                               number (10) not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  date_creat                              date not null,
  ref_reslt_destn                         number (10) not null,
  ref_atrib_sa_nom_formt                  number (10) null,
  ref_atrib_sa_adres_destn                number (10) not null
);


prompt Table SIE_01_ELEMN_CONFG_EVENM_NOTFB;

create table sie_01_elemn_confg_evenm_notfb
(
  seqnc                                   number (10) not null,
  ref_confg_evenm_notfb                   number (10) not null,
  code                                    varchar2 (30 byte) not null,
  ident_acces                             varchar2 (4000 byte) not null,
  ident_acces_formt                       varchar2 (4000 byte) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  formt                                   varchar2 (50 byte) null
);


prompt Table SIE_01_EVENM_NOTFB;

create table sie_01_evenm_notfb
(
  seqnc                                   number (10) not null,
  code                                    varchar2 (23 byte) not null,
  nom                                     varchar2 (60 byte) not null,
  descr                                   varchar2 (4000 byte) null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  ref_struc_aplic                         number (10) not null,
  dnr_ref_prodt                           number (10) not null
);


prompt Table SIE_01_HIERC_APLIC;

create table sie_01_hierc_aplic
(
  seqnc                                   number (10) null,
  ref_evenm_notfb                         number (10) not null,
  aplic_prior                             number (10) not null,
  ref_atrib_struc_aplic                   number (10) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  dnr_ref_prodt                           number (10) not null
);


prompt Table SIE_01_LANG;

create table sie_01_lang
(
  seqnc                                   number (10) not null,
  code                                    varchar2 (23 byte) not null,
  nom                                     varchar2 (60 byte) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null
);


prompt Table SIE_01_LANG_LANG;

create table sie_01_lang_lang
(
  seqnc                                   number (10) not null,
  ref_lang                                number (10) not null,
  nom                                     varchar2 (200 byte) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  ref_lang_cible                          number (10) not null
);


prompt Table SIE_01_MESG;

create table sie_01_mesg
(
  seqnc                                   number (10) null,
  numr_mesg                               varchar2 (10 byte) not null,
  ref_prodt                               number (10) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  descr                                   varchar2 (4000 byte) null,
  type_mesg                               varchar2 (1 byte) null,
  dnr_ref_prodt                           number (10) not null
);


prompt Table SIE_01_MESG_ERR_LIE;

create table sie_01_mesg_err_lie
(
  seqnc                                   number (10) null,
  nom_table                               varchar2 (30 byte) null,
  nom_coln                                varchar2 (30 byte) null,
  nom_contr                               varchar2 (30 byte) null,
  page                                    number (10) null,
  comnt                                   varchar2 (4000 byte) null,
  ref_prodt                               number (10) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  type_liais                              number (1) not null,
  ref_mesg                                number (10) not null,
  dnr_ref_prodt                           number (10) not null,
  ref_code_err_oracl                      number (10) not null
);


prompt Table SIE_01_MESG_INFOR;

create table sie_01_mesg_infor
(
  seqnc                                   number (10) not null,
  text_mesg                               varchar2 (4000 byte) not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_creat                              date not null,
  sess_id                                 number null,
  ref_utils                               number (10) null,
  ref_mesg_lang                           number (10) null
);


prompt Table SIE_01_MESG_LANG;

create table sie_01_mesg_lang
(
  seqnc                                   number (10) null,
  mesg                                    varchar2 (4000 byte) null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  ref_mesg                                number (10) not null,
  ref_lang                                number (10) not null,
  dnr_ref_prodt                           number (10) not null
);


prompt Table SIE_01_MESG_TRADC_APEX;

create table sie_01_mesg_tradc_apex
(
  seqnc                                   number (10) not null,
  nom                                     varchar2 (255 byte) not null,
  text                                    varchar2 (4000 byte) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  ref_lang                                number (10) not null,
  ref_prodt                               number (10) not null,
  dnr_ref_prodt                           number (10) not null
);


prompt Table SIE_01_MODL_AFICH_NOTFC;

create table sie_01_modl_afich_notfc
(
  seqnc                                   number (10) not null,
  code                                    varchar2 (23 byte) not null,
  nom                                     varchar2 (60 byte) not null,
  descr                                   varchar2 (4000 byte) null,
  coulr_texte                             varchar2 (7 byte) null,
  tail_texte                              number (2) default 12 null,
  coulr_titre                             varchar2 (7 byte) null,
  tail_titre                              number (2) default 12 null,
  temps_afich                             number (2) default 0 null,
  ref_resrc_icon                          number (10) null,
  ref_formt_resrc_icon                    number (10) null,
  ref_ocurn_resrc_icon                    number (10) null,
  ref_domn                                number (10) null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  ref_type_comnc                          number (10) not null,
  ref_modl_comnc                          number (10) null
);


prompt Table SIE_01_MODL_COMNC;

create table sie_01_modl_comnc
(
  seqnc                                   number (10) not null,
  code                                    varchar2 (23 byte) not null,
  nom                                     varchar2 (60 byte) not null,
  descr                                   varchar2 (4000 byte) null,
  ref_type_comnc                          number (10) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  indic_systm                             varchar2 (1 byte) default 'N' not null,
  ref_domn                                number (10) null
);


prompt Table SIE_01_MODL_MESG_NOTFC;

create table sie_01_modl_mesg_notfc
(
  seqnc                                   number (10) not null,
  code                                    varchar2 (23 byte) not null,
  nom                                     varchar2 (60 byte) not null,
  descr                                   varchar2 (4000 byte) null,
  objet                                   varchar2 (200 byte) null,
  ref_domn                                number (10) null,
  corps_mesg                              clob null
);


prompt Table SIE_01_NOTFC;

create table sie_01_notfc
(
  seqnc                                   number (10) not null,
  code                                    varchar2 (23 byte) not null,
  nom                                     varchar2 (60 byte) not null,
  descr                                   varchar2 (4000 byte) null,
  inden_mesg                              varchar2 (10 byte) not null,
  titre_mesg                              varchar2 (60 byte) not null,
  mesg                                    varchar2 (4000 byte) null,
  ref_modl_afich_notfc                    number (10) not null,
  indic_specf                             varchar2 (1 byte) default 'O' not null,
  indic_afich_uniq                        varchar2 (1 byte) default 'O' not null,
  ref_domn                                number (10) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null
);


prompt Table SIE_01_OCURN_SA_EVENM_NOTFB;

create table sie_01_ocurn_sa_evenm_notfb
(
  seqnc                                   number (16) not null,
  ref_hierc_aplic                         number (10) not null,
  ref_confg_evenm_notfb                   number (10) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  ref_seqnc_struc_aplic                   number (10) not null
);


prompt Table SIE_01_PROPG_EVENM_NOTFB;

create table sie_01_propg_evenm_notfb
(
  seqnc                                   number (10) not null,
  ref_evenm_notfb                         number (10) not null,
  ref_seqnc_struc_aplic                   number (10) not null,
  ref_utils                               number (10) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null
);


prompt Table SIE_01_RESLT_DESTN;

create table sie_01_reslt_destn
(
  seqnc                                   number (10) not null,
  ref_destn                               number (10) not null,
  dnr_ref_prodt                           number (10) not null,
  ident_acces                             varchar2 (4000 byte) not null,
  ident_acces_formt                       varchar2 (4000 byte) not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_creat                              date not null,
  utils_modfc                             varchar2 (123 byte) null,
  date_modfc                              date null,
  nom                                     varchar2 (60 byte) not null,
  ref_struc_aplic_acces                   number (10) not null
);


prompt Table SIE_01_TYPE_COMNC;

create table sie_01_type_comnc
(
  seqnc                                   number (10) not null,
  code                                    varchar2 (23 byte) not null,
  nom                                     varchar2 (60 byte) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null
);


prompt Table SIE_03_CLAS_INTER;

create table sie_03_clas_inter
(
  seqnc                                   number (10) not null,
  code                                    varchar2 (23 byte) not null,
  nom                                     varchar2 (100 byte) not null,
  descr                                   varchar2 (400 byte) null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  ref_prodt                               number (10) not null,
  ref_profl_courl                         number (10) not null,
  indic_avert_autr_uniq                   varchar2 (1 byte) default 'N' not null
);


prompt Table SIE_03_JOURN;

create table sie_03_journ
(
  date_heure                              timestamp (6) default systimestamp null,
  expli                                   varchar2 (4000 byte) null,
  ereur                                   varchar2 (500 byte) null,
  pile_trace                              varchar2 (4000 byte) null,
  travl                                   varchar2 (200 byte) null
);


prompt Table SIE_03_JOURN_STRUC_APLIC;

create table sie_03_journ_struc_aplic
(
  seqnc                                   number (12) not null,
  ref_domn                                number (10) not null,
  struc_aplic                             number (10) not null,
  seqnc_struc_aplic                       number (10) not null,
  date_time                               date not null,
  numr_err                                varchar2 (10 byte) null,
  actio_journ                             varchar2 (200 byte) not null,
  don_nomnl                               varchar2 (200 byte) null,
  reslt                                   varchar2 (500 byte) null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null
);


prompt Table SIE_03_LIEN_CLAS_INTER_UTILS;

create table sie_03_lien_clas_inter_utils
(
  seqnc                                   number (10) not null,
  ref_clas_inter                          number (10) not null,
  ref_utils                               number (10) null,
  date_debut_efect                        date not null,
  date_fin_efect                          date null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  ref_group_utils                         number (10) null
);


prompt Table SIE_03_TRACE_EXECT;

create table sie_03_trace_exect
(
  un                                      varchar2 (4000 byte) null,
  deux                                    varchar2 (4000 byte) null,
  dthr                                    timestamp (9) null,
  utils                                   varchar2 (30 byte) default user null,
  seqnc                                   number (10) null,
  lb                                      clob null,
  who_called_me                           varchar2 (4000 byte) null,
  page                                    number null,
  app                                     number null,
  app_user                                varchar2 (30 byte) null,
  fil                                     number (10) null,
  duree                                   number (20, 3) null,
  bb                                      blob null
);


prompt Table SIE_04_CONTX;

create table sie_04_contx
(
  ref_fil_arian                           number (10) not null,
  contx                                   varchar2 (30 byte) null,
  actio                                   varchar2 (200 byte) null,
  seqnc_contx                             number (10) null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  contx_inter                             varchar2 (30 byte) null,
  actio_inter                             varchar2 (200 byte) null,
  seqnc_contx_inter                       number (10) null,
  indic_ignor                             varchar2 (1 byte) null,
  nom_procd_infor_suplm                   varchar2 (92 byte) null,
  infor_suplm                             varchar2 (4000 byte) null,
  contx_formt                             varchar2 (4000 byte) null
);


prompt Table SIE_04_CONTX_ETEND;

create table sie_04_contx_etend
(
  seqnc                                   number (10) not null,
  ref_contx                               number (10) not null,
  nom                                     varchar2 (30 byte) not null,
  valr_numbr                              number (10) null,
  valr_varch                              varchar2 (4000 byte) null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  page_cible                              varchar2 (1 byte) null,
  type_alimn                              varchar2 (3 byte) not null,
  type_elemn                              varchar2 (1 byte) not null
);


prompt Table SIE_04_FIL_ARIAN;

create table sie_04_fil_arian
(
  seqnc                                   number (10) not null,
  page                                    number (10) not null,
  session_id                              number null,
  ref_elemn_sup                           number (10) null,
  libl                                    varchar2 (200 byte) not null,
  timst                                   timestamp (6) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  app_id                                  number null,
  hash_dernr_url                          raw (16) not null,
  indic_afich                             varchar2 (1 byte) not null,
  ref_navgt_histr                         number (10) null,
  aplic                                   number null
);


prompt Table SIE_04_NAVGT_HISTR;

create table sie_04_navgt_histr
(
  seqnc                                   number (10) not null,
  ref_utils                               number (10) not null,
  dnr_libl                                varchar2 (60 byte) not null,
  dnr_url                                 varchar2 (200 byte) not null,
  dnr_icon                                varchar2 (200 byte) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null
);


prompt Table SIE_07_AUDIT_STRUC_APLIC;

create table sie_07_audit_struc_aplic
(
  seqnc                                   number (16) not null,
  ref_utils                               number (10) not null,
  ref_seqnc_struc_aplic                   number (10) not null,
  dnr_ref_seqnc_sa_formt                  varchar2 (4000 byte) not null,
  ref_struc_aplic                         number (10) not null,
  ref_actio_audit                         number (10) null,
  ref_page                                number (10) null,
  natr_audit                              varchar2 (3 byte) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  ref_domn                                number (10) not null
);


prompt Table SIE_07_ETAT_SESN;

create table sie_07_etat_sesn
(
  seqnc                                   number (10) not null,
  session_id                              number not null,
  nom                                     varchar2 (60 byte) not null,
  valr                                    varchar2 (4000 byte) null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null
);


prompt Table SIE_07_INSTA_SEMPH;

create table sie_07_insta_semph
(
  seqnc                                   number (10) not null,
  ref_semph                               number (10) not null,
  id_sesn                                 number null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  indic_seqnc                             varchar2 (1 byte) not null,
  page_perst                              varchar2 (500 byte) null
);


prompt Table SIE_07_SEMPH;

create table sie_07_semph
(
  seqnc                                   number (10) not null,
  code                                    varchar2 (23 byte) not null,
  varbl1                                  varchar2 (200 byte) null,
  varbl2                                  varchar2 (200 byte) null,
  varbl3                                  varchar2 (200 byte) null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  indic_exclu                             varchar2 (1 byte) not null
);


prompt Table SIE_07_VALR_AUDIT_STRUC_APLIC;

create table sie_07_valr_audit_struc_aplic
(
  seqnc                                   number (16) not null,
  ref_audit_struc_aplic                   number (10) not null,
  code                                    varchar2 (30 byte) not null,
  valr_formt                              varchar2 (4000 byte) null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null
);


prompt Table SIE_11_APLIC;

create table sie_11_aplic
(
  seqnc                                   number (10) null,
  code                                    varchar2 (10 byte) null,
  nom                                     varchar2 (60 byte) null,
  date_creat                              date null,
  utils_creat                             varchar2 (123 byte) null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  numr_aplic_apex                         number null,
  date_dernr_maj_refrn_apex               date null,
  ref_versn                               number (10) null,
  indic_aplic_authe                       varchar2 (1 byte) default 'N' null,
  ref_aplic_authe                         number (10) null,
  ref_page_conxn                          number (10) null,
  ref_prodt                               number (10) not null,
  dnr_ref_prodt                           number (10) not null,
  ref_page_acuei                          number (10) null
);


prompt Table SIE_11_ATRIB_ENTIT;

create table sie_11_atrib_entit
(
  seqnc                                   number (10) not null,
  nom                                     varchar2 (60 byte) not null,
  type_don                                varchar2 (5 byte) not null,
  compr_migrt                             varchar2 (23 byte) not null,
  ref_entit                               number (10) not null,
  date_creat                              date null,
  utils_creat                             varchar2 (123 byte) null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  dnr_ref_prodt                           number (10) not null,
  code                                    varchar2 (30 byte) not null,
  ref_entit_refrn                         number (10) null,
  indic_nouvl_atrib                       varchar2 (1 byte) default 'O' not null
);


prompt Table SIE_11_ENTIT;

create table sie_11_entit
(
  seqnc                                   number (10) not null,
  nom                                     varchar2 (60 byte) not null,
  nom_table_tempr                         varchar2 (30 byte) not null,
  nom_table_ereur                         varchar2 (30 byte) not null,
  indic_creer_ocurn                       varchar2 (1 byte) not null,
  indic_modif_ocurn                       varchar2 (1 byte) not null,
  indic_suprm_ocurn                       varchar2 (1 byte) not null,
  ref_versn                               number (10) not null,
  date_creat                              date null,
  utils_creat                             varchar2 (123 byte) null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  ordre_exect                             number (10) default 1 not null,
  dnr_ref_prodt                           number (10) not null,
  code                                    varchar2 (30 byte) not null,
  indic_force_selct                       varchar2 (1 byte) default 'N' null,
  longr_bloc                              number (5) null,
  indic_nouvl_entit                       varchar2 (1 byte) default 'O' not null,
  niv_inclu_migrt                         varchar2 (23 byte) null,
  confg_inclu_migrt                       varchar2 (4000 byte) null,
  ref_atrib_entit_supr                    number (10) null,
  indic_expor_tabl_index                  varchar2 (1 byte) default 'O' null,
  indic_suprm_don_prodt                   varchar2 (1 byte) default 'N' not null
);


prompt Table SIE_11_PARMT_AFW;

create table sie_11_parmt_afw
(
  seqnc                                   number (10) null,
  code                                    varchar2 (30 byte) null,
  valr                                    varchar2 (200 byte) null,
  date_creat                              date null,
  utils_creat                             varchar2 (123 byte) null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null
);


prompt Table SIE_11_PLUGN;

create table sie_11_plugn
(
  seqnc                                   number (10) not null,
  code_inter                              varchar2 (5 byte) not null,
  nom                                     varchar2 (200 byte) not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  date_creat                              date not null,
  descr                                   varchar2 (4000 byte) null,
  ref_versn                               number (10) null
);


prompt Table SIE_11_PRODT;

create table sie_11_prodt
(
  seqnc                                   number (10) not null,
  code                                    varchar2 (10 byte) not null,
  nom                                     varchar2 (60 byte) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  procd_expor_metdn                       varchar2 (100 byte) null,
  tail_tabl_extra                         number (10) default 10 null,
  indic_extra_tout                        varchar2 (1 byte) default 'N' not null,
  ref_group_utils_admin                   number (10) null,
  dosr_fichr                              varchar2 (200 byte) null,
  ident_envir                             varchar2 (60 byte) not null,
  ref_versn                               number (10) null,
  mesg_tout_droit_resrv                   varchar2 (150 byte) null,
  jquer_ui_css_scope                      varchar2 (50 byte) null,
  indic_afich_err_code                    varchar2 (1 byte) default 'O' not null,
  ref_mesg_sucs                           number (10) null,
  ref_mesg_echec                          number (10) null,
  ref_mesg_fetch                          number (10) null,
  ref_mesg_range_suprm                    number (10) null,
  ref_mesg_range_modf                     number (10) null,
  ref_mesg_range_inser                    number (10) null,
  ref_mesg_aucun_don_trouv                number (10) null,
  ref_mesg_trop_don_trouv                 number (10) null,
  ref_mesg_audit_creat                    number (10) null,
  ref_mesg_audit_modfc                    number (10) null,
  ref_mesg_audit_suprs                    number (10) null,
  fonct_obten_base_url                    varchar2 (92 byte) null,
  ref_aplic_acuei                         number (10) null,
  ref_page_acuei                          number (10) null,
  ref_aplic_comnt_bogue                   number (10) null,
  ref_page_comnt_bogue                    number (10) null,
  indic_page_inexs_maj_refrn              varchar2 (1 byte) default 'N' not null,
  procd_impre_entet_pdf_ir                varchar2 (200 byte) null,
  procd_impre_pied_page_pdf_ir            varchar2 (200 byte) null,
  procd_plpdf_coulr                       varchar2 (200 byte) null,
  compt_genrl                             number (6) default 0 null
);


prompt Table SIE_11_PRODT_LANG;

create table sie_11_prodt_lang
(
  seqnc                                   number (10) not null,
  ref_prodt                               number (10) not null,
  ref_lang                                number (10) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null
);


prompt Table SIE_11_PRODT_RESRC;

create table sie_11_prodt_resrc
(
  seqnc                                   number (10) not null,
  ref_prodt                               number (10) null,
  ref_resrc                               number (10) not null,
  ref_formt                               number (10) not null,
  ref_condt_exect                         number (10) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  ref_plugn                               number (10) null
);


prompt Table SIE_11_UTILS;

create table sie_11_utils
(
  seqnc                                   number (10) not null,
  ref_prodt                               number (10) not null,
  ref_utils                               number (10) not null,
  role                                    varchar2 (5 byte) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null
);


prompt Table SIE_11_VERSN;

create table sie_11_versn
(
  seqnc                                   number (10) not null,
  numr_versn_1                            number (2) not null,
  numr_versn_2                            number (2) not null,
  numr_versn_3                            number (2) not null,
  numr_versn_4                            number (2) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  ref_prodt                               number (10) null,
  indic_docmn_verl                        varchar2 (1 byte) default 'O' not null,
  nom                                     varchar2 (30 byte) null,
  ref_plugn                               number (10) null,
  code                                    varchar2 (23 byte) not null,
  dnr_ref_prodt                           number (10) null,
  ref_aplic                               number (10) null,
  dnr_ref_aplic                           number (10) null
);


prompt Table SIE_12_ACTIO_AUDIT;

create table sie_12_actio_audit
(
  seqnc                                   number (10) not null,
  ref_struc_aplic                         number (10) not null,
  dnr_ref_prodt                           number (10) not null,
  code                                    varchar2 (23 byte) not null,
  nom                                     varchar2 (60 byte) not null,
  ref_mesg                                number (10) not null,
  descr                                   varchar2 (4000 byte) null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null
);


prompt Table SIE_12_ARBRE;

create table sie_12_arbre
(
  seqnc                                   number (10) not null,
  noeud_actif                             varchar2 (60 byte) null,
  ref_sesn                                number null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  indic_rafrc                             varchar2 (1 byte) default 'N' null,
  id_apex_regn                            number not null
);


prompt Table SIE_12_ARBRE_NOEUD;

create table sie_12_arbre_noeud
(
  seqnc                                   number (10) not null,
  ref_arbre                               number (10) not null,
  noeud_ouver                             varchar2 (60 byte) null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null
);


prompt Table SIE_12_ATRIB_STRUC_APLIC;

create table sie_12_atrib_struc_aplic
(
  seqnc                                   number (10) not null,
  nom_coln                                varchar2 (50 byte) not null,
  nom_fonct                               varchar2 (50 byte) null,
  ref_dv_natr_infor                       number (10) null,
  indic_valid                             varchar2 (1 byte) default 'O' null,
  ref_struc_aplic                         number (10) not null,
  ref_atrib_struc_aplic                   number (10) null,
  indic_destn                             varchar2 (1 byte) default 'N' null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  dnr_ref_prodt                           number (10) not null
);


prompt Table SIE_12_DEFNT_ACCES;

create table sie_12_defnt_acces
(
  seqnc                                   number (10) not null,
  ref_group_utils                         number (10) null,
  ref_utils                               number (10) null,
  indic_acces                             varchar2 (5 byte) null,
  indic_modfc                             varchar2 (5 byte) null,
  indic_suprs                             varchar2 (5 byte) null,
  indic_creat                             varchar2 (5 byte) null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  ref_opert                               number (10) null,
  ref_struc_aplic                         number (10) null,
  dnr_ref_prodt                           number (10) not null
);


prompt Table SIE_12_DOMN;

create table sie_12_domn
(
  seqnc                                   number (10) not null,
  code                                    varchar2 (30 byte) not null,
  nom                                     varchar2 (60 byte) not null,
  descr                                   varchar2 (4000 byte) null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  type_travl_deft                         number (10) null,
  ref_profl_courl_notfc                   number (10) null,
  ref_profl_sms_notfc                     number (10) null,
  ref_compt_axiat_deft                    number (10) null,
  ref_modl_rechr_deft                     number (10) null,
  procd_authe_exter_afw                   varchar2 (92 byte) null,
  indic_demnd_activ_compt_utils           varchar2 (1 byte) default 'N' not null,
  procd_vald_niv_secrt_mot_passe          varchar2 (92 byte) default 'sie_12_mot_passe_pkg.valdr_secrt_mot_passe' null
);


prompt Table SIE_12_DOMN_FONCT;

create table sie_12_domn_fonct
(
  seqnc                                   number (10) null,
  ref_fonct                               number (10) null,
  ref_domn                                number (10) null,
  indic_actif                             varchar2 (1 byte) default 'O' null,
  date_creat                              date null,
  utils_creat                             varchar2 (123 byte) null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null
);


prompt Table SIE_12_DOMN_SERVR_LDAP;

create table sie_12_domn_servr_ldap
(
  seqnc                                   number (10) null,
  ref_domn                                number (10) not null,
  ref_servr_ldap                          number (10) not null,
  date_debut_efect                        date not null,
  date_fin_efect                          date null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null
);


prompt Table SIE_12_DOMN_UTILS;

create table sie_12_domn_utils
(
  seqnc                                   number (10) not null,
  ref_utils                               number (10) not null,
  ref_domn                                number (10) not null,
  date_debut_efect                        date not null,
  date_fin_efect                          date null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null
);


prompt Table SIE_12_EVOLT_STAT;

create table sie_12_evolt_stat
(
  seqnc                                   number (10) null,
  ref_stat                                number (10) not null,
  ref_stat_evolt                          number (10) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  indic_code                              varchar2 (1 byte) not null,
  dnr_ref_prodt                           number (10) not null
);


prompt Table SIE_12_FAVR;

create table sie_12_favr
(
  seqnc                                   number (10) not null,
  ref_struc_aplic                         number (10) not null,
  ref_seqnc_struc_aplic                   number (10) not null,
  ref_utils                               number (10) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null
);


prompt Table SIE_12_FONCT;

create table sie_12_fonct
(
  seqnc                                   number (10) null,
  ref_prodt                               number (10) null,
  code                                    varchar2 (23 byte) null,
  nom                                     varchar2 (60 byte) null,
  descr                                   varchar2 (4000 byte) null,
  date_creat                              date null,
  utils_creat                             varchar2 (123 byte) null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  dnr_ref_prodt                           number (10) null
);


prompt Table SIE_12_FONCT_STRUC_APLIC;

create table sie_12_fonct_struc_aplic
(
  seqnc                                   number (10) null,
  ref_fonct                               number (10) null,
  ref_struc_aplic                         number (10) null,
  dnr_ref_prodt                           number (10) null,
  date_creat                              date null,
  utils_creat                             varchar2 (123 byte) null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null
);


prompt Table SIE_12_GROUP_STAT;

create table sie_12_group_stat
(
  seqnc                                   number (10) not null,
  ref_prodt                               number (10) null,
  code                                    varchar2 (23 byte) not null,
  nom                                     varchar2 (60 byte) not null,
  descr                                   varchar2 (4000 byte) null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  dnr_ref_prodt                           number (10) not null
);


prompt Table SIE_12_GROUP_UTILS;

create table sie_12_group_utils
(
  seqnc                                   number (10) not null,
  nom                                     varchar2 (100 byte) not null,
  descr                                   varchar2 (400 byte) null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  ref_prodt                               number (10) null,
  code                                    varchar2 (29 byte) not null,
  indic_ignor_group_admin                 varchar2 (1 byte) default 'N' not null,
  indic_systm                             varchar2 (1 byte) default 'N' not null,
  dnr_ref_prodt                           number (10) null,
  ref_domn                                number (10) null,
  indic_acces_globl                       varchar2 (1 byte) default 'N' not null,
  ref_fonct                               number (10) null
);


prompt Table SIE_12_GR_UT_OPERT_OPTIO_DOMN;

create table sie_12_gr_ut_opert_optio_domn
(
  seqnc                                   number (10) null,
  ref_group_utils                         number (10) null,
  ref_opert                               number (10) null,
  ref_opert_optio                         number (10) null,
  ref_domn                                number (10) null,
  date_creat                              date null,
  utils_creat                             varchar2 (123 byte) null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null
);


prompt Table SIE_12_HISTR_ACCES;

create table sie_12_histr_acces
(
  seqnc                                   number (10) not null,
  ref_utils                               number (10) not null,
  date_evenm                              date not null,
  ref_dv_type_evenm                       number (10) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  adres_ip                                varchar2 (15 byte) null,
  ref_utils_pour                          number (10) null
);


prompt Table SIE_12_LIEN_GROUP_UTILS;

create table sie_12_lien_group_utils
(
  seqnc                                   number (10) not null,
  ref_group                               number (10) not null,
  ref_utils                               number (10) null,
  date_debut_efect                        date default null not null,
  date_fin_efect                          date null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  ref_group_utils_lie                     number (10) null,
  dnr_ref_prodt                           number (10) null,
  ref_domn                                number (10) null
);


prompt Table SIE_12_LIEN_STRUC;

create table sie_12_lien_struc
(
  seqnc                                   number (10) not null,
  ref_struc_admin                         number (10) not null,
  date_debut_efect                        date not null,
  date_fin_efect                          date null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  ref_struc_lie                           number (10) null
);


prompt Table SIE_12_MEMBR_STRUC;

create table sie_12_membr_struc
(
  seqnc                                   number (10) not null,
  ref_utils                               number (10) not null,
  ref_struc_admin                         number (10) not null,
  date_debut_efect                        date not null,
  date_fin_efect                          date null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null
);


prompt Table SIE_12_REQT_INTER_UTILS;

create table sie_12_reqt_inter_utils
(
  seqnc                                   number (10) null,
  ident                                   raw (16) not null,
  ref_utils                               number (10) not null,
  ref_dv_type_reqt_inter                  number (10) not null,
  date_debut_efect                        date not null,
  date_fin_efect                          date not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  ref_domn                                number (10) not null,
  ref_prodt                               number (10) not null,
  numr_aplic_apex                         number null,
  numr_page_apex                          number null,
  date_trait                              date null,
  procd_persn_url_apres_authe             varchar2 (92 byte) null
);


prompt Table SIE_12_SERVR_LDAP;

create table sie_12_servr_ldap
(
  seqnc                                   number (10) null,
  adres                                   varchar2 (200 byte) not null,
  port                                    number (10) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  base_dn                                 varchar2 (400 byte) null,
  utils_cn                                varchar2 (400 byte) null,
  mot_passe                               varchar2 (50 byte) null
);


prompt Table SIE_12_SESN;

create table sie_12_sesn
(
  id_sesn                                 number null,
  app_user                                varchar2 (30 byte) not null,
  ref_id_sesn                             number null,
  ref_lang                                number (10) null
);


prompt Table SIE_12_STAT;

create table sie_12_stat
(
  seqnc                                   number (10) not null,
  ref_struc_aplic                         number (10) null,
  ordre                                   number (10) not null,
  code                                    varchar2 (23 byte) not null,
  nom                                     varchar2 (60 byte) not null,
  descr                                   varchar2 (4000 byte) null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  indic_initl                             varchar2 (1 byte) default 'N' not null,
  utils_modfc                             varchar2 (123 byte) null,
  indic_stat_utils                        varchar2 (1 byte) default 'O' not null,
  ref_group_stat                          number (10) null,
  dnr_ref_prodt                           number (10) not null
);


prompt Table SIE_12_STRUC_ADMIN;

create table sie_12_struc_admin
(
  seqnc                                   number (10) not null,
  nom                                     varchar2 (60 byte) not null,
  indic_deft                              varchar2 (1 byte) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  ref_type_struc                          number (10) null,
  ref_respn                               number (10) null,
  debut_efect                             date null,
  fin_efect                               date null,
  ref_domn                                number (10) not null
);


prompt Table SIE_12_STRUC_APLIC;

create table sie_12_struc_aplic
(
  seqnc                                   number (10) not null,
  nom                                     varchar2 (100 byte) not null,
  descr                                   varchar2 (200 byte) null,
  ref_prodt                               number (10) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  code                                    varchar2 (23 byte) not null,
  ref_mesg_err_suprs                      number (10) null,
  indic_extra_tout                        varchar2 (2 byte) default 'HE' not null,
  tail_tabl_extra                         number (10) null,
  nom_struc_acces_don                     varchar2 (30 byte) null,
  ref_page_liste                          number (10) null,
  ref_page_forml                          number (10) null,
  nom_packg                               varchar2 (30 byte) null,
  dnr_ref_prodt                           number (10) not null,
  indic_dispn_docmn                       varchar2 (1 byte) default 'N' not null,
  nom_schem                               varchar2 (30 byte) null
);


prompt Table SIE_12_STRUC_APLIC_DESTN;

create table sie_12_struc_aplic_destn
(
  seqnc                                   number (10) not null,
  ref_struc_aplic                         number (10) not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_creat                              date not null,
  utils_modfc                             varchar2 (123 byte) null,
  date_modfc                              date null,
  ref_destn                               number (10) not null
);


prompt Table SIE_12_STRUC_APLIC_LANG;

create table sie_12_struc_aplic_lang
(
  seqnc                                   number (10) not null,
  ref_struc_aplic                         number (10) not null,
  adjec_demns                             varchar2 (10 byte) null,
  nom                                     varchar2 (255 byte) not null,
  ref_lang                                number (10) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  descr                                   varchar2 (4000 byte) null,
  dnr_ref_prodt                           number (10) not null
);


prompt Table SIE_12_STRUC_APLIC_SUIVI;

create table sie_12_struc_aplic_suivi
(
  seqnc                                   number (10) not null,
  ref_struc_aplic                         number (10) not null,
  ref_suivi                               number (10) null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  nom_persn                               varchar2 (60 byte) null,
  indic_creat_initl                       varchar2 (1 byte) not null,
  seqnc_presn                             number (4) null,
  ref_sucrs_impla                         number (10) not null
);


prompt Table SIE_12_TYPE_STRUC;

create table sie_12_type_struc
(
  seqnc                                   number (10) not null,
  code                                    varchar2 (20 byte) not null,
  nom                                     varchar2 (100 byte) not null,
  descr                                   varchar2 (2000 byte) null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  ref_domn                                number (10) not null
);


prompt Table SIE_12_UTILS;

create table sie_12_utils
(
  seqnc                                   number (10) not null,
  nom                                     varchar2 (60 byte) not null,
  prenm                                   varchar2 (60 byte) not null,
  code_utils                              varchar2 (30 byte) not null,
  mot_passe                               raw (2000) null,
  date_expir                              date null,
  indic_verl                              varchar2 (1 byte) not null,
  indic_chang_mot_passe                   varchar2 (1 byte) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  courl                                   varchar2 (200 byte) null,
  dernr_prodt_acces                       varchar2 (23 byte) null,
  indic_actif                             varchar2 (1 byte) default 'N' not null,
  dernr_domn_acces                        varchar2 (23 byte) null,
  ref_dv_compl_maxm                       number (10) null,
  code_utils_base_don                     varchar2 (30 byte) null,
  parmt_authe_exter_afw                   varchar2 (400 byte) null
);


prompt Table SIE_13_CONDT_EXECT;

create table sie_13_condt_exect
(
  seqnc                                   number (10) not null,
  code                                    varchar2 (23 byte) not null,
  nom                                     varchar2 (60 byte) not null,
  descr                                   varchar2 (4000 byte) null,
  enonc_condt_plsql                       varchar2 (4000 byte) null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null
);


prompt Table SIE_13_CONDT_PILTB;

create table sie_13_condt_piltb
(
  seqnc                                   number (10) not null,
  ref_page                                number (10) not null,
  code                                    varchar2 (23 byte) not null,
  nom                                     varchar2 (60 byte) not null,
  descr                                   varchar2 (2000 byte) null,
  condt                                   varchar2 (4000 byte) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  ref_page_item_focus                     number (10) null,
  dnr_ref_aplic                           number (10) not null
);


prompt Table SIE_13_DOSR_VIRTL;

create table sie_13_dosr_virtl
(
  seqnc                                   number (10) not null,
  ref_prodt                               number (10) not null,
  code                                    varchar2 (23 byte) not null,
  nom                                     varchar2 (60 byte) not null,
  descr                                   varchar2 (4000 byte) null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  dnr_ref_prodt                           number (10) not null
);


prompt Table SIE_13_EMPLA_DOSR_VIRTL;

create table sie_13_empla_dosr_virtl
(
  seqnc                                   number (10) not null,
  ref_dosr_virtl                          number (10) not null,
  ref_versn                               number (10) not null,
  empla                                   varchar2 (100 byte) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  dnr_ref_prodt                           number (10) not null
);


prompt Table SIE_13_EXPOR_APLIC;

create table sie_13_expor_aplic
(
  seqnc                                   number (10) not null,
  ref_sesn                                number not null,
  ref_aplic                               number (10) not null,
  indic_maj_refrn                         varchar2 (1 byte) default 'N' not null,
  numr_aplic_cible                        number null,
  indic_ajout_aplic_apex                  varchar2 (1 byte) default 'O' not null
);


prompt Table SIE_13_EXPOR_PAGE;

create table sie_13_expor_page
(
  ref_page                                number (10) not null,
  ref_sesn                                number not null,
  seqnc                                   number (10) null
);


prompt Table SIE_13_FORMT_RESRC;

create table sie_13_formt_resrc
(
  seqnc                                   number (10) not null,
  code                                    varchar2 (23 byte) not null,
  ref_prodt                               number (10) not null,
  descr                                   varchar2 (4000 byte) null,
  ref_type_fichr                          number (10) not null,
  largr                                   number (4) null,
  hautr                                   number (4) null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  nom                                     varchar2 (60 byte) not null,
  dnr_ref_prodt                           number (10) not null
);


prompt Table SIE_13_INSTA_PREFR;

create table sie_13_insta_prefr
(
  seqnc                                   number (10) not null,
  ref_prefr                               number (10) not null,
  ref_utils                               number (10) null,
  ref_sesn                                number null,
  valr                                    varchar2 (200 byte) null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  ref_struc_aplic                         number (10) null
);


prompt Table SIE_13_ITEM_MENU;

create table sie_13_item_menu
(
  seqnc                                   number (10) not null,
  code                                    varchar2 (23 byte) not null,
  nom                                     varchar2 (60 byte) not null,
  descr                                   varchar2 (2000 byte) null,
  aide_insta                              varchar2 (2000 byte) null,
  titre_aide_insta                        varchar2 (60 byte) null,
  ordre_presn                             number null,
  ref_page                                number (10) null,
  icone                                   varchar2 (1000 byte) null,
  efacr_cache                             varchar2 (1000 byte) null,
  ref_menu                                number (10) not null,
  ref_dv_valr_reqst                       number (10) null,
  forml_valr_reqst                        varchar2 (4000 byte) null,
  indic_reint_pagnt                       varchar2 (1 byte) default 'N' not null,
  indic_reint_page_ir                     varchar2 (1 byte) default 'N' not null,
  indic_clear_page_ir                     varchar2 (1 byte) default 'N' not null,
  ref_dv_valr_scpc                        number (10) null,
  forml_valr_scpc                         varchar2 (4000 byte) null,
  ref_dv_valr_sspc                        number (10) null,
  forml_valr_sspc                         varchar2 (4000 byte) null,
  ref_dv_valr_sapc                        number (10) null,
  forml_valr_sapc                         varchar2 (4000 byte) null,
  ref_dv_valr_scpi                        number (10) null,
  forml_valr_scpi                         varchar2 (4000 byte) null,
  ref_dv_valr_sspi                        number (10) null,
  forml_valr_sspi                         varchar2 (4000 byte) null,
  ref_dv_valr_sapi                        number (10) null,
  forml_valr_sapi                         varchar2 (4000 byte) null,
  ref_dv_valr_snpi                        number (10) null,
  forml_valr_snpi                         varchar2 (4000 byte) null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  indic_soums_page                        varchar2 (1 byte) default 'N' null,
  indic_reint_navgt                       varchar2 (1 byte) default 'O' null,
  ref_item_menu                           number (10) null,
  dnr_ref_prodt                           number (10) not null,
  ref_struc_aplic                         number (10) null,
  forml_libl                              varchar2 (4000 byte) not null,
  liste_ref_page_activ                    varchar2 (1000 byte) null,
  ref_resrc                               number (10) null,
  ref_ocurn_resrc                         number (10) null,
  ref_formt_resrc                         number (10) null,
  ref_dv_valr_insta_libl                  number (10) null,
  ref_dv_valr_url                         number (10) null,
  forml_valr_url                          varchar2 (4000 byte) null,
  indic_gerer_sidf                        varchar2 (1 byte) default 'N' not null,
  ref_aplic                               number (10) null,
  ref_dv_valr_insta_condt_afich           number (10) null,
  forml_condt_afich                       varchar2 (4000 byte) null
);


prompt Table SIE_13_LIEN_CONDT_PILTB;

create table sie_13_lien_condt_piltb
(
  seqnc                                   number (10) not null,
  ref_page_item                           number (10) not null,
  ref_condt_piltb                         number (10) not null,
  indic_lectr_seul                        varchar2 (1 byte) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  indic_afich                             varchar2 (1 byte) default 'O' not null,
  dnr_ref_aplic                           number (10) not null
);


prompt Table SIE_13_LISTE_NAVGT;

create table sie_13_liste_navgt
(
  seqnc                                   number (10) not null,
  ref_page                                number (10) not null,
  libl                                    varchar2 (30 byte) not null,
  page                                    varchar2 (30 byte) not null,
  sspc                                    varchar2 (30 byte) null,
  sapc                                    varchar2 (30 byte) null,
  sspi                                    varchar2 (30 byte) null,
  sapi                                    varchar2 (30 byte) null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  ordre_presn                             number (3) default 1 not null,
  code                                    varchar2 (23 byte) not null,
  indic_reint_sidf                        varchar2 (1 byte) default 'N' not null,
  dnr_ref_aplic                           number (10) not null,
  aplic                                   varchar2 (30 byte) null,
  css_icone_boots                         varchar2 (400 byte) null
);


prompt Table SIE_13_MENU;

create table sie_13_menu
(
  seqnc                                   number (10) not null,
  code                                    varchar2 (23 byte) not null,
  nom                                     varchar2 (60 byte) not null,
  descr                                   varchar2 (2000 byte) null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  ref_prodt                               number (10) null,
  dnr_ref_prodt                           number (10) not null,
  resrc_aditn                             varchar2 (4000 byte) null
);


prompt Table SIE_13_MIME_TYPE;

create table sie_13_mime_type
(
  seqnc                                   number (10) not null,
  ref_type_fichr                          number (10) null,
  ext                                     varchar2 (10 byte) not null,
  mime_type                               varchar2 (200 byte) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  ordre_choix                             number (2) null
);


prompt Table SIE_13_NAVGT;

create table sie_13_navgt
(
  seqnc                                   number (14) not null,
  ref_id_sesn                             number not null,
  indic_extra_total                       varchar2 (1 byte) not null,
  tail_tabl_extra                         number (10) not null,
  nombr_rang_extra                        number (8) not null,
  enonc_sql                               clob not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  indic_extra_termn                       varchar2 (1 byte) default 'N' not null,
  apex_repts_id                           number null,
  ref_raprt_inter                         number (10) null,
  ref_fil_arian                           number (10) not null
);


prompt Table SIE_13_NAVGT_ELEMN;

create table sie_13_navgt_elemn
(
  seqnc                                   number (10) not null,
  numr_elemn                              number (8) not null,
  indic_courn                             varchar2 (1 byte) not null,
  seqnc_elemn                             number (10) not null,
  ref_navgt                               number (10) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null
);


prompt Table SIE_13_OCURN_RESRC;

create table sie_13_ocurn_resrc
(
  seqnc                                   number (10) not null,
  ref_resrc                               number (10) not null,
  ref_formt_resrc                         number (10) not null,
  ref_mime_type                           number (10) null,
  nom_physq                               varchar2 (300 byte) null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  cordn_x_debut                           number (6) null,
  cordn_y_debut                           number (10) null,
  largr_prepn                             number (3) null,
  hautr_prepn                             number (3) null,
  nom                                     varchar2 (60 byte) null,
  ref_dosr_virtl                          number (10) null,
  ref_versn                               number (10) null,
  dnr_ref_prodt                           number (10) not null
);


prompt Table SIE_13_OPERT;

create table sie_13_opert
(
  seqnc                                   number (10) not null,
  nom                                     varchar2 (100 byte) not null,
  descr                                   varchar2 (400 byte) null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  ref_prodt                               number (10) not null,
  code                                    varchar2 (23 byte) null,
  dnr_ref_prodt                           number (10) not null,
  ref_fonct                               number (10) null
);


prompt Table SIE_13_OPERT_OPTIO;

create table sie_13_opert_optio
(
  seqnc                                   number (10) null,
  ref_opert                               number (10) null,
  code                                    varchar2 (23 byte) null,
  nom                                     varchar2 (60 byte) null,
  descr                                   varchar2 (4000 byte) null,
  dnr_ref_prodt                           number (10) null,
  date_creat                              date null,
  utils_creat                             varchar2 (123 byte) null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  prepn                                   number (3) default null null
);


prompt Table SIE_13_PAGE;

create table sie_13_page
(
  seqnc                                   number (10) not null,
  numr_apex                               number not null,
  nom                                     varchar2 (255 byte) not null,
  descr                                   varchar2 (400 byte) null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  ref_struc_aplic                         number (10) null,
  indic_prise_charg_sie01                 varchar2 (1 byte) default 'O' not null,
  indic_prise_charg_sie04                 varchar2 (1 byte) default 'O' not null,
  ref_mesg_suprs_specf                    number (10) null,
  indic_prise_charg_sie19                 varchar2 (1 byte) default 'O' not null,
  indic_prise_charg_sie13_navgt           varchar2 (1 byte) default 'O' not null,
  indic_prise_charg_sie18                 varchar2 (1 byte) default 'N' not null,
  ref_page_rechr                          number (10) null,
  indic_prise_charg_sie14_popup           varchar2 (1 byte) default 'N' not null,
  indic_prise_charg_sie13_confr           varchar2 (1 byte) default 'N' null,
  prefx_mesg                              varchar2 (3 byte) null,
  date_dernr_maj_refrn_apex               date null,
  ref_mesg_sucs_specf                     number (10) null,
  ref_mesg_echec_specf                    number (10) null,
  ref_mesg_fetch_specf                    number (10) null,
  ref_mesg_range_suprm_specf              number (10) null,
  ref_mesg_range_modf_specf               number (10) null,
  ref_mesg_range_inser_specf              number (10) null,
  ref_mesg_aucun_don_trouv                number (10) null,
  ref_mesg_trop_don_trouv                 number (10) null,
  ref_aplic                               number (10) not null,
  dnr_ref_aplic                           number (10) not null
);


prompt Table SIE_13_PAGE_IR;

create table sie_13_page_ir
(
  seqnc                                   number (10) not null,
  libl_regn                               varchar2 (255 byte) not null,
  id_apex                                 number null,
  ref_page                                number (10) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  largr_deft                              number null,
  unite_mesr_largr_deft                   number (10) null,
  code                                    varchar2 (23 byte) not null,
  dnr_ref_aplic                           number (10) not null,
  indic_forcr_ajust_page                  varchar2 (1 byte) default 'N' not null,
  nombr_page_largr                        number (2) default 1 not null
);


prompt Table SIE_13_PAGE_IR_COLN;

create table sie_13_page_ir_coln
(
  seqnc                                   number (10) not null,
  ordre_afich                             number (3) not null,
  libl                                    varchar2 (4000 byte) null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  coln_table                              varchar2 (30 byte) not null,
  ref_page_ir                             number (10) not null,
  id_apex                                 number not null,
  largr                                   number (5, 2) null,
  type_largr                              varchar2 (5 byte) null,
  indic_exprt                             varchar2 (1 byte) default 'O' not null,
  ref_mesg_aide                           number (10) null,
  dnr_ref_aplic                           number (10) not null
);


prompt Table SIE_13_PAGE_ITEM;

create table sie_13_page_item
(
  seqnc                                   number (10) not null,
  ref_page                                number (10) not null,
  id_apex                                 number not null,
  nom_apex                                varchar2 (500 byte) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  libl                                    varchar2 (500 byte) null,
  indic_creat                             varchar2 (1 byte) null,
  indic_modfc                             varchar2 (1 byte) null,
  indic_suprs                             varchar2 (1 byte) null,
  indic_en_creat                          varchar2 (1 byte) null,
  indic_en_modfc                          varchar2 (1 byte) null,
  type_item                               varchar2 (5 byte) default 'ITEM' not null,
  ref_opert                               number (10) null,
  ref_mesg_aide                           number (10) null,
  depsm_alias_coln                        varchar2 (200 byte) null,
  indic_rechr                             varchar2 (1 byte) default 'N' not null,
  indic_confr_sauvg                       varchar2 (1 byte) null,
  dnr_ref_aplic                           number (10) not null
);


prompt Table SIE_13_PAGE_ITEM_LANG;

create table sie_13_page_item_lang
(
  seqnc                                   number (10) not null,
  ref_page_item                           number (10) not null,
  nom                                     varchar2 (255 byte) not null,
  ref_lang                                number (10) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  dnr_ref_aplic                           number (10) not null
);


prompt Table SIE_13_PAGE_LANG;

create table sie_13_page_lang
(
  seqnc                                   number (10) not null,
  ref_page                                number (10) not null,
  nom                                     varchar2 (255 byte) not null,
  ref_lang                                number (10) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  dnr_ref_aplic                           number (10) not null
);


prompt Table SIE_13_PAGE_PREFR_NAVGT;

create table sie_13_page_prefr_navgt
(
  seqnc                                   number (10) not null,
  ref_page                                number (10) not null,
  ref_page_ir                             number (10) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  dnr_ref_aplic                           number (10) not null
);


prompt Table SIE_13_PREFR;

create table sie_13_prefr
(
  seqnc                                   number (10) not null,
  code                                    varchar2 (23 byte) not null,
  ref_dv_condt_utils                      number (10) not null,
  forml_condt_utils                       varchar2 (4000 byte) null,
  ref_dv_condt_sauvg                      number (10) not null,
  forml_condt_sauvg                       varchar2 (4000 byte) null,
  ref_dv_type_insta                       number (10) not null,
  indic_contx                             varchar2 (1 byte) not null,
  ref_dv_valr_insta                       number (10) not null,
  forml_valr_insta                        varchar2 (4000 byte) null,
  descr_comnt                             varchar2 (4000 byte) null,
  ref_item                                number (10) null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  dnr_ref_aplic                           number (10) not null
);


prompt Table SIE_13_REGN_PILTB;

create table sie_13_regn_piltb
(
  seqnc                                   number (10) not null,
  code                                    varchar2 (23 byte) not null,
  nom                                     varchar2 (60 byte) not null,
  descr                                   varchar2 (4000 byte) null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  ref_page                                number (10) not null,
  ref_dv_type_regn_piltb                  number (10) not null,
  dnr_ref_aplic                           number (10) not null
);


prompt Table SIE_13_REGN_PILTB_LANG;

create table sie_13_regn_piltb_lang
(
  seqnc                                   number (10) not null,
  ref_regn_piltb                          number (10) not null,
  contn                                   clob null,
  ref_lang                                number (10) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  dnr_ref_aplic                           number (10) not null
);


prompt Table SIE_13_RESRC;

create table sie_13_resrc
(
  seqnc                                   number (10) not null,
  code                                    varchar2 (60 byte) null,
  ref_prodt                               number (10) null,
  descr                                   varchar2 (4000 byte) null,
  ref_type_fichr                          number (10) not null,
  ref_struc_aplic                         number (10) null,
  indic_stock_meme_reprt                  varchar2 (1 byte) default 'O' not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  type_resrc                              varchar2 (5 byte) default 'SIMPL' not null,
  nom                                     varchar2 (60 byte) not null,
  nom_physq_comps                         varchar2 (100 byte) null,
  indic_publc                             varchar2 (1 byte) default 'N' not null,
  empla_html                              varchar2 (11 byte) default 'HEADR' not null,
  ref_plugn                               number (10) null,
  ref_dosr_virtl                          number (10) null,
  dnr_ref_prodt                           number (10) not null
);


prompt Table SIE_13_TYPE_FICHR;

create table sie_13_type_fichr
(
  seqnc                                   number (10) not null,
  code                                    varchar2 (23 byte) not null,
  nom                                     varchar2 (60 byte) not null,
  descr                                   varchar2 (4000 byte) null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  nom_icon                                varchar2 (60 byte) null
);


prompt Table SIE_14_DETL_DOMN_VALR;

create table sie_14_detl_domn_valr
(
  seqnc                                   number (10) not null,
  code_valr                               varchar2 (23 byte) not null,
  valr                                    varchar2 (2000 byte) not null,
  ref_domn_valr                           number (10) not null,
  seqnc_presn                             number (3) not null,
  date_debut_efect                        date not null,
  date_fin_efect                          date null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  valr_court                              varchar2 (20 byte) null,
  valr_organ                              varchar2 (4000 byte) null,
  dnr_ref_prodt                           number (10) null
);


prompt Table SIE_14_DOMN_VALR;

create table sie_14_domn_valr
(
  seqnc                                   number (10) not null,
  code                                    varchar2 (23 byte) not null,
  nom                                     varchar2 (60 byte) not null,
  descr                                   varchar2 (2000 byte) null,
  enonc_sourc                             varchar2 (4000 byte) null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  type_don                                varchar2 (1 byte) not null,
  ref_formt                               number (10) null,
  ref_prodt                               number (10) null,
  ref_type_domn_valr                      number (10) null,
  indic_systm                             varchar2 (1 byte) default 'N' not null,
  dnr_ref_prodt                           number (10) null,
  ref_domn                                number (10) null
);


prompt Table SIE_14_FORMT;

create table sie_14_formt
(
  seqnc                                   number (10) not null,
  libl                                    varchar2 (60 byte) not null,
  defnt                                   varchar2 (60 byte) not null,
  type_don                                varchar2 (2 byte) not null,
  date_creat                              date null,
  utils_creat                             varchar2 (123 byte) null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  ref_prodt                               number (10) not null,
  indic_formt_orcl                        varchar2 (1 byte) not null,
  indic_unite_inclu                       varchar2 (1 byte) not null,
  dnr_ref_prodt                           number (10) not null
);


prompt Table SIE_14_TYPE_DOMN_VALR;

create table sie_14_type_domn_valr
(
  seqnc                                   number (10) not null,
  code                                    varchar2 (23 byte) not null,
  nom                                     varchar2 (60 byte) not null,
  descr                                   varchar2 (2000 byte) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  ref_prodt                               number (10) not null,
  dnr_ref_prodt                           number (10) not null
);


prompt Table SIE_17_ATACH_COURL_ENTRA;

create table sie_17_atach_courl_entra
(
  seqnc                                   number (18) not null,
  ref_courl_entra                         number (16) not null,
  nom                                     varchar2 (100 byte) not null,
  contn                                   blob null,
  ref_mime_type                           number (10) null,
  propr                                   varchar2 (4000 byte) null,
  tail                                    number (10) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  numr_piece_corps_mesg                   varchar2 (4 byte) not null
);


prompt Table SIE_17_COMPT_AXIAT;

create table sie_17_compt_axiat
(
  seqnc                                   number (10) not null,
  code                                    varchar2 (23 byte) not null,
  nom                                     varchar2 (60 byte) not null,
  descr                                   varchar2 (4000 byte) null,
  numr                                    number (10) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  ref_domn                                number (10) null,
  ref_profl_courl                         number (10) null,
  ref_publc_page_garde                    number (10) null
);


prompt Table SIE_17_COMPT_TWILI;

create table sie_17_compt_twili
(
  seqnc                                   number (10) not null,
  code                                    varchar2 (23 byte) not null,
  nom                                     varchar2 (60 byte) not null,
  descr                                   varchar2 (4000 byte) null,
  acoun_id                                varchar2 (100 byte) not null,
  authe_token                             varchar2 (100 byte) not null,
  reprt_walt                              varchar2 (500 byte) not null,
  mot_passe_walt                          varchar2 (30 byte) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  numr                                    number (11) not null,
  indic_partg                             varchar2 (1 byte) default 'N' not null,
  ref_domn                                number (10) not null
);


prompt Table SIE_17_COURL;

create table sie_17_courl
(
  seqnc                                   number (10) null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  servr                                   varchar2 (100 byte) not null,
  port                                    number default 25 null,
  domn                                    varchar2 (100 byte) null,
  nom_envoy                               varchar2 (100 byte) not null,
  adres_envoy                             varchar2 (100 byte) not null,
  sujet                                   varchar2 (1000 byte) null,
  indic_formt_html                        varchar2 (1 byte) default 'N' null,
  authe_methd                             varchar2 (23 byte) null,
  authe_usagr                             varchar2 (100 byte) null,
  authe_mdp                               varchar2 (100 byte) null,
  corps                                   clob null,
  nombr_tentv                             number default 0 not null,
  nombr_tentv_max                         number default 5 not null,
  sens                                    varchar2 (5 byte) not null,
  stat_soums                              varchar2 (30 byte) not null
);


prompt Table SIE_17_COURL_DESTN;

create table sie_17_courl_destn
(
  seqnc                                   number (10) null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  ref_fil_atent                           number (10) null,
  nom                                     varchar2 (100 byte) null,
  adres                                   varchar2 (100 byte) null,
  type                                    varchar2 (10 byte) null
);


prompt Table SIE_17_COURL_ENTRA;

create table sie_17_courl_entra
(
  seqnc                                   number (16) not null,
  ref_profl_courl                         number (10) not null,
  date_recpt                              date not null,
  date_courl                              date not null,
  objet                                   varchar2 (4000 byte) null,
  contn_texte_pur                         clob null,
  contn_html                              clob null,
  nom_exped                               varchar2 (500 byte) null,
  courl_exped                             varchar2 (2000 byte) null,
  indic_suprm                             varchar2 (1 byte) not null,
  indic_lu                                varchar2 (1 byte) not null,
  indic_recnt                             varchar2 (1 byte) not null,
  indic_repnd                             varchar2 (1 byte) not null,
  type_contn                              varchar2 (100 byte) not null,
  tail_mesg                               number (10) null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null
);


prompt Table SIE_17_COURL_PIECE_JOINT;

create table sie_17_courl_piece_joint
(
  seqnc                                   number (10) not null,
  ref_courl                               number (10) not null,
  mime_type                               varchar2 (100 byte) not null,
  contn                                   blob not null,
  tail                                    number (12) not null,
  nom_fichr                               varchar2 (500 byte) not null,
  mode_atach                              varchar2 (30 byte) not null
);


prompt Table SIE_17_PIECE_TELCP_AXIAT;

create table sie_17_piece_telcp_axiat
(
  seqnc                                   number (10) not null,
  ref_telcp_axiat                         number (10) not null,
  nombr_page                              number (5) not null,
  ordre_atach                             number (3) not null,
  contn                                   blob null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  mime_type                               varchar2 (100 byte) not null,
  nom_fichr                               varchar2 (100 byte) not null
);


prompt Table SIE_17_PROFL_COURL;

create table sie_17_profl_courl
(
  seqnc                                   number (10) not null,
  domn                                    varchar2 (100 byte) null,
  nom_envoy                               varchar2 (100 byte) not null,
  adres_envoy                             varchar2 (100 byte) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  code                                    varchar2 (23 byte) not null,
  servr_sortn                             varchar2 (100 byte) null,
  port_sortn                              number (5) default 25 null,
  authe_methd_sortn                       varchar2 (23 byte) null,
  authe_usagr_sortn                       varchar2 (100 byte) null,
  authe_mdp_sortn                         varchar2 (100 byte) null,
  ref_domn                                number (10) not null,
  nom                                     varchar2 (60 byte) not null,
  descr                                   varchar2 (4000 byte) null,
  indic_ssl_sortn                         varchar2 (1 byte) default 'N' not null,
  servr_entra                             varchar2 (100 byte) null,
  port_entra                              number (5) null,
  indic_ssl_entra                         varchar2 (1 byte) default 'N' not null,
  authe_methd_entra                       varchar2 (23 byte) null,
  authe_usagr_entra                       varchar2 (100 byte) null,
  authe_mdp_entra                         varchar2 (100 byte) null,
  protc_entra                             varchar2 (5 byte) default 'IMAP' null,
  indic_lire_profl_entra                  varchar2 (1 byte) default 'N' not null,
  indic_lectr_entra_err                   varchar2 (1 byte) default 'N' not null,
  indic_reprs_lectr_entra                 varchar2 (1 byte) default 'N' not null
);


prompt Table SIE_17_PROPR_COURL_ENTRA;

create table sie_17_propr_courl_entra
(
  seqnc                                   number (18) not null,
  ref_courl_entra                         number (16) not null,
  nom                                     varchar2 (100 byte) not null,
  valr                                    varchar2 (4000 byte) null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null
);


prompt Table SIE_17_SMS_TWILI;

create table sie_17_sms_twili
(
  seqnc                                   number (10) not null,
  numr_de                                 number (18) not null,
  numr_a                                  number (18) not null,
  mesg                                    varchar2 (160 char) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  tw_sid                                  varchar2 (100 byte) null,
  tw_status                               varchar2 (50 byte) null,
  tw_price                                number (5, 2) null,
  tw_uri                                  varchar2 (500 byte) null,
  stat_soums                              varchar2 (30 byte) not null,
  date_envoi_difr                         date null,
  ref_compt_twili                         number (10) not null,
  numr_mesg                               number (3) not null,
  nombr_mesg_totl                         number (3) not null,
  ref_mesg_precd                          number (10) null,
  id_sesn                                 number null,
  group_sms                               number (10) null,
  repns_servr                             sys.xmltype null,
  sens                                    varchar2 (5 byte) not null
);


prompt Table SIE_17_SMS_TWILI_ENTRA;

create table sie_17_sms_twili_entra
(
  seqnc                                   number (10) not null,
  tw_recpt_accountsid                     varchar2 (100 byte) null,
  tw_recpt_apiversion                     varchar2 (10 byte) null,
  tw_recpt_body                           varchar2 (200 byte) null,
  tw_recpt_from                           varchar2 (16 byte) null,
  tw_recpt_fromcity                       varchar2 (100 byte) null,
  tw_recpt_fromcountry                    varchar2 (100 byte) null,
  tw_recpt_fromstate                      varchar2 (100 byte) null,
  tw_recpt_fromzip                        varchar2 (100 byte) null,
  tw_recpt_smsmessagesid                  varchar2 (100 byte) null,
  tw_recpt_smssid                         varchar2 (100 byte) null,
  tw_recpt_smsstatus                      varchar2 (30 byte) null,
  tw_recpt_to                             varchar2 (16 byte) null,
  tw_recpt_tocity                         varchar2 (100 byte) null,
  tw_recpt_tocountry                      varchar2 (100 byte) null,
  tw_recpt_tostate                        varchar2 (200 byte) null,
  tw_recpt_tozip                          varchar2 (20 byte) null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null
);


prompt Table SIE_17_TELCP_AXIAT;

create table sie_17_telcp_axiat
(
  seqnc                                   number (10) not null,
  ref_compt_axiat                         number (10) not null,
  destn_formt                             varchar2 (100 byte) not null,
  numr_destn                              number (10) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  stat_soums                              varchar2 (30 byte) not null,
  date_envoi_difr                         date null,
  objet                                   varchar2 (500 byte) null,
  sens                                    varchar2 (5 byte) not null
);


prompt Table SIE_19_BOUTN;

create table sie_19_boutn
(
  seqnc                                   number (10) not null,
  ref_lang                                number (10) not null,
  ref_dispn_fonct                         number (10) not null,
  item_subst                              varchar2 (60 byte) null,
  id_templ_boutn                          number null,
  templ_boutn                             varchar2 (4000 byte) null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  libl                                    varchar2 (200 byte) null,
  indic_actif                             varchar2 (1 byte) default 'O' null,
  ref_dv_type_mesg_aide_contx             number (10) not null,
  mesg_aide_contx                         varchar2 (200 byte) null
);


prompt Table SIE_19_CLE;

create table sie_19_cle
(
  seqnc                                   number (10) not null,
  ref_lang                                number (10) not null,
  indic_shift                             varchar2 (1 byte) default 'N' not null,
  indic_alt                               varchar2 (1 byte) default 'N' not null,
  indic_ctrl                              varchar2 (1 byte) default 'N' not null,
  indic_inter                             varchar2 (1 byte) default 'N' not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  code_keypr                              number (4) null,
  code_keydw                              number (4) null,
  ref_dispn_fonct                         number (10) not null,
  indic_actif                             varchar2 (1 byte) default 'O' null
);


prompt Table SIE_19_DISPN_FONCT;

create table sie_19_dispn_fonct
(
  seqnc                                   number (10) not null,
  ref_prodt                               number (10) not null,
  ref_fonct                               number (10) not null,
  valr_atrib_1                            varchar2 (200 byte) null,
  valr_atrib_2                            varchar2 (200 byte) null,
  valr_atrib_3                            varchar2 (200 byte) null,
  valr_atrib_4                            varchar2 (200 byte) null,
  valr_atrib_5                            varchar2 (200 byte) null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null
);


prompt Table SIE_19_FONCT;

create table sie_19_fonct
(
  seqnc                                   number (10) not null,
  code                                    varchar2 (23 byte) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  titre_atrib1                            varchar2 (60 byte) null,
  ref_dv_type_atrib1                      number (10) null,
  valr_deft_atrib1                        varchar2 (200 byte) null,
  titre_atrib2                            varchar2 (60 byte) null,
  titre_atrib3                            varchar2 (60 byte) null,
  titre_atrib4                            varchar2 (60 byte) null,
  titre_atrib5                            varchar2 (60 byte) null,
  ref_dv_type_atrib2                      number (10) null,
  ref_dv_type_atrib3                      number (10) null,
  ref_dv_type_atrib4                      number (10) null,
  ref_dv_type_atrib5                      number (10) null,
  valr_deft_atrib2                        varchar2 (200 byte) null,
  valr_deft_atrib3                        varchar2 (200 byte) null,
  valr_deft_atrib4                        varchar2 (200 byte) null,
  valr_deft_atrib5                        varchar2 (200 byte) null,
  ref_dv_type_actio                       number (10) null,
  expre_actio                             varchar2 (4000 byte) null,
  ref_dv_type_expre                       number (10) null,
  indic_afect_input_html                  varchar2 (1 byte) default 'O' not null,
  indic_prevn_actio_deft                  varchar2 (1 byte) default 'O' not null,
  indic_cle                               varchar2 (1 byte) default 'O' null,
  indic_boutn                             varchar2 (1 byte) default 'O' null,
  condt_prise_charg                       varchar2 (200 byte) null
);


prompt Table SIE_19_FONCT_LANG;

create table sie_19_fonct_lang
(
  seqnc                                   number (10) not null,
  nom                                     varchar2 (60 byte) not null,
  ref_lang                                number (10) not null,
  descr                                   varchar2 (4000 byte) null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  ref_fonct                               number (10) not null
);


prompt Table SIE_19_SPECF_FONCT;

create table sie_19_specf_fonct
(
  seqnc                                   number (10) not null,
  ref_dispn_fonct                         number (10) not null,
  ref_item                                number (10) null,
  ref_page                                number (10) null,
  ref_dv_type_subst                       number (10) not null,
  valr_atrib_1                            varchar2 (200 byte) null,
  valr_atrib_2                            varchar2 (200 byte) null,
  valr_atrib_3                            varchar2 (200 byte) null,
  valr_atrib_4                            varchar2 (200 byte) null,
  valr_atrib_5                            varchar2 (200 byte) null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  dnr_ref_page                            number (10) null
);


prompt Table SIE_20_DEPLM;

create table sie_20_deplm
(
  seqnc                                   number (10) not null,
  nom                                     varchar2 (60 byte) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  ref_modl                                number (10) null,
  ref_modl_parmt                          number (10) null,
  ref_prodt_lang                          number (10) not null
);


prompt Table SIE_20_DETL_DOCMN;

create table sie_20_detl_docmn
(
  seqnc                                   number (10) not null,
  ref_docmn                               number (10) not null,
  ref_sectn_docmn                         number (10) null,
  ref_detl_docmn                          number (10) null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  valr                                    varchar2 (4000 byte) null
);


prompt Table SIE_20_DOCMN;

create table sie_20_docmn
(
  seqnc                                   number (10) not null,
  ref_prodt_lang                          number (10) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  ref_struc_aplic                         number (10) null,
  ref_seqnc_struc_aplic                   number (10) null
);


prompt Table SIE_20_MODL;

create table sie_20_modl
(
  seqnc                                   number (10) not null,
  ref_dv_type_modl                        number (10) not null,
  ref_versn                               number (10) not null,
  ref_modl                                number (10) null,
  nom_organ                               varchar2 (30 byte) not null,
  numr_surch                              number (2) null,
  indic_agreg                             varchar2 (1 byte) default 'N' not null,
  indic_pipln                             varchar2 (1 byte) default 'N' not null,
  indic_detrm                             varchar2 (1 byte) default 'N' not null,
  indic_authid_curnt_utils                varchar2 (1 byte) default 'N' not null,
  indic_publc                             varchar2 (1 byte) default 'N' not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  versn_bd_aplic                          varchar2 (30 byte) not null
);


prompt Table SIE_20_MODL_EXCEP;

create table sie_20_modl_excep
(
  seqnc                                   number (10) not null,
  ref_modl                                number (10) not null,
  nom_organ                               varchar2 (30 byte) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null
);


prompt Table SIE_20_MODL_PARMT;

create table sie_20_modl_parmt
(
  seqnc                                   number (10) not null,
  ref_modl                                number (10) not null,
  nom_organ                               varchar2 (30 byte) not null,
  ref_dv_type_don                         number (10) not null,
  postn                                   number (3) not null,
  valr_deft                               varchar2 (200 byte) null,
  sens                                    varchar2 (15 byte) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  indic_publc                             varchar2 (1 byte) default 'N' not null,
  indic_retr                              varchar2 (1 byte) default 'N' not null
);


prompt Table SIE_20_SECTN_DOCMN;

create table sie_20_sectn_docmn
(
  seqnc                                   number (10) not null,
  ref_dv_type_sectn                       number (10) not null,
  ref_sectn_docmn                         number (10) null,
  ref_struc_aplic                         number (10) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  nom                                     varchar2 (30 byte) not null,
  titre                                   varchar2 (60 byte) not null,
  descr                                   varchar2 (4000 byte) null,
  ref_formt                               number (10) null
);


prompt Table SIE_21_PLUGN_ARBRE;

create table sie_21_plugn_arbre
(
  seqnc                                   number (10) not null,
  enonc_pre_reqt                          varchar2 (4000 byte) null,
  nom_table                               varchar2 (30 byte) null,
  coln_titre                              varchar2 (30 byte) null,
  coln_type                               varchar2 (30 byte) default null null,
  coln_valr                               varchar2 (30 byte) null,
  coln_aide_insta                         varchar2 (30 byte) null,
  coln_lien                               varchar2 (400 byte) null,
  coln_id                                 varchar2 (30 byte) null,
  coln_id_parnt                           varchar2 (30 byte) null,
  enonc_condt                             varchar2 (400 byte) null,
  enonc_condt_comnc_par                   varchar2 (400 byte) null,
  enonc_trier_par                         varchar2 (400 byte) null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  indic_renmr                             varchar2 (1 byte) default 'N' null,
  indic_deplc                             varchar2 (1 byte) default 'N' null,
  coln_titre_aide_insta                   varchar2 (30 byte) null,
  largr_regn_arbre                        number (10) default 256 not null,
  hautr_regn_arbre                        number (10) default 768 not null,
  ref_plugn_arbre_noeud                   number (10) null,
  indic_comnc_par_racn                    varchar2 (1 byte) default 'O' not null,
  image_sprit                             varchar2 (400 byte) null,
  type_icone_noeud                        varchar2 (5 byte) default 'RESRC' not null,
  ref_formt_resrc                         number (10) null,
  ref_resrc_comps                         number (10) null,
  obten_json_arbre_nombr_niv              number (10) default 2 not null,
  obten_json_noeud_nombr_niv              number (10) default 1 not null,
  mode_cache                              varchar2 (23 byte) default 'SESN' not null,
  dnr_ref_prodt                           number (10) not null,
  code                                    varchar2 (23 byte) not null,
  indic_charg_progr                       varchar2 (1 byte) default 'O' not null,
  indic_flech_aide_insta                  varchar2 (1 byte) default 'N' null,
  ref_dv_cursr_aide_insta                 number (10) null,
  nom_procd_glisr_elemn_arbre             varchar2 (92 byte) null,
  nom_procd_depsr_elemn_arbre             varchar2 (92 byte) null,
  indic_comnc_par_coln_parnt_nul          varchar2 (1 byte) default 'O' null,
  ref_prodt                               number (10) not null
);


prompt Table SIE_21_PLUGN_ARBRE_NOEUD;

create table sie_21_plugn_arbre_noeud
(
  seqnc                                   number (10) not null,
  code                                    varchar2 (35 byte) not null,
  nom                                     varchar2 (60 byte) not null,
  descr                                   varchar2 (2000 byte) null,
  ref_plugn_arbre                         number (10) not null,
  indic_selct_noeud                       varchar2 (1 byte) default 'O' not null,
  indic_ouvri_noeud                       varchar2 (1 byte) default 'O' not null,
  indic_creer_noeud                       varchar2 (1 byte) default 'O' not null,
  indic_suprm_noeud                       varchar2 (1 byte) default 'O' not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  indic_fermr_noeud                       varchar2 (1 byte) default 'O' not null,
  ref_resrc                               number (10) null,
  ref_ocurn_resrc                         number (10) null,
  dnr_ref_prodt                           number (10) not null
);


prompt Table SIE_21_PLUGN_CALND;

create table sie_21_plugn_calnd
(
  seqnc                                   number (10) not null,
  enonc_pre_reqt                          varchar2 (4000 byte) null,
  ref_dv_vue_deft                         number (10) null,
  conct_propr_entet_gauch                 varchar2 (400 byte) null,
  conct_propr_entet_centr                 varchar2 (400 byte) null,
  conct_propr_entet_droit                 varchar2 (400 byte) null,
  indic_evenm_modfb                       varchar2 (1 byte) default 'O' not null,
  nom_table                               varchar2 (30 byte) null,
  coln_titre                              varchar2 (30 byte) null,
  coln_descr                              varchar2 (30 byte) null,
  coln_type                               varchar2 (30 byte) null,
  coln_aide_insta                         varchar2 (30 byte) null,
  coln_lien                               varchar2 (30 byte) null,
  coln_indic_journ_compl                  varchar2 (30 byte) null,
  coln_date_debut                         varchar2 (30 byte) null,
  coln_date_fin                           varchar2 (30 byte) null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  largr_regn_calnd                        number (4) null,
  coln_titre_aide_insta                   varchar2 (30 byte) null,
  indic_agend                             varchar2 (1 byte) default 'N' not null,
  agend_nom_table                         varchar2 (30 byte) null,
  agend_coln_titre                        varchar2 (30 byte) null,
  coln_valr                               varchar2 (30 byte) null,
  agend_coln_valr                         varchar2 (30 byte) null,
  agend_coln_coulr                        varchar2 (30 byte) null,
  code                                    varchar2 (23 byte) default null not null,
  dnr_ref_prodt                           number (10) not null,
  coln_agend                              varchar2 (30 byte) null,
  coln_ident                              varchar2 (30 byte) null,
  coln_date_journ_compl                   varchar2 (30 byte) null,
  coln_date_fin_journ_compl               varchar2 (30 byte) null,
  nombr_mints_inter                       number (4) default 30 not null,
  heure_debut_norml                       varchar2 (10 byte) default 8 not null,
  heure_fin_norml                         varchar2 (10 byte) default 17 not null,
  heure_debut_exten                       varchar2 (10 byte) null,
  heure_fin_exten                         varchar2 (10 byte) null,
  coln_indic_evenm_modfb                  varchar2 (30 byte) default null null,
  ref_prodt                               number (10) not null
);


prompt Table SIE_21_PLUGN_CALND_COULR;

create table sie_21_plugn_calnd_coulr
(
  seqnc                                   number (10) null,
  ordre_presn                             number not null,
  coulr                                   varchar2 (7 byte) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  coulr_text                              varchar2 (7 byte) null
);


prompt Table SIE_21_PLUGN_CALND_TYPE;

create table sie_21_plugn_calnd_type
(
  seqnc                                   number (10) not null,
  code                                    varchar2 (23 byte) not null,
  nom                                     varchar2 (60 byte) not null,
  descr                                   varchar2 (2000 byte) null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  coulr_texte                             varchar2 (7 byte) not null,
  coulr_bordr                             varchar2 (7 byte) not null,
  coulr_arier_plan                        varchar2 (7 byte) not null,
  ref_domn                                number (10) not null
);


prompt Table SIE_21_PLUGN_ITEM_MENU;

create table sie_21_plugn_item_menu
(
  seqnc                                   number (10) not null,
  ref_item_menu                           number (10) not null,
  ref_plugn_menu                          number (10) not null,
  niv_item                                number (3) not null,
  etend_nombr_coln                        number (3) default 1 null,
  rang_item                               number (3) default 1 null,
  coln_item                               number (3) default 1 null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  dnr_ref_prodt                           number (10) not null,
  ref_dv_contn_item_menu                  number (10) null,
  ref_dv_align                            number (10) null
);


prompt Table SIE_21_PLUGN_MENU;

create table sie_21_plugn_menu
(
  seqnc                                   number (10) not null,
  code                                    varchar2 (23 byte) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  dnr_ref_prodt                           number (10) not null,
  ref_dv_type_menu                        number (10) null,
  largr_regn_menu                         number (4) null,
  hautr_regn_menu                         number (4) null,
  ref_dv_orien_menu                       number (10) null,
  ref_dv_coulr_theme                      number (10) null,
  ref_dv_coulr_princ                      number (10) null,
  ref_menu                                number (10) null,
  ref_dv_formt_menu                       number (10) null,
  ref_prodt                               number (10) not null
);


prompt Table SIE_23_APLIC_MODL_RECHR;

create table sie_23_aplic_modl_rechr
(
  seqnc                                   number (10) not null,
  ref_modl_rechr                          number (10) not null,
  ref_struc_aplic_rechr                   number (10) not null,
  ref_struc_aplic_lien                    number (10) null,
  nombr_maxim_reslt                       number (4) not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_creat                              date not null,
  utils_modfc                             varchar2 (123 byte) null,
  date_modfc                              date null,
  ref_atrib_struc_aplic_afich             number (10) null
);


prompt Table SIE_23_DETL_APLIC_MODL_RECHR;

create table sie_23_detl_aplic_modl_rechr
(
  seqnc                                   number (10) not null,
  ref_aplic_modl_rechr                    number (10) not null,
  ref_atrib_struc_aplic                   number (10) not null,
  ref_patrn_rechr                         number (10) not null,
  ordre_exect                             number (3) null,
  pertn                                   number (3) null,
  utils_creat                             varchar2 (123 byte) not null,
  date_creat                              date not null,
  utils_modfc                             varchar2 (123 byte) null,
  date_modfc                              date null
);


prompt Table SIE_23_DETL_RESLT_RECHR;

create table sie_23_detl_reslt_rechr
(
  seqnc                                   number (10) not null,
  ref_rechr                               number (10) not null,
  ref_enonc_rechr                         number (10) not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_creat                              date not null,
  utils_modfc                             varchar2 (123 byte) null,
  date_modfc                              date null,
  ref_detl_aplic_modl_rechr               number (10) not null,
  dnr_pertn                               number (3) null,
  ref_seqnc_struc_aplic                   number (10) not null,
  ref_reslt_rechr                         number (10) null
);


prompt Table SIE_23_ENONC_RECHR;

create table sie_23_enonc_rechr
(
  seqnc                                   number (10) not null,
  ref_rechr                               number (10) not null,
  mot                                     varchar2 (100 byte) not null,
  ordre_apart                             number (3) not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_creat                              date not null,
  utils_modfc                             varchar2 (123 byte) null,
  date_modfc                              date null
);


prompt Table SIE_23_MODL_RECHR;

create table sie_23_modl_rechr
(
  seqnc                                   number (10) not null,
  code                                    varchar2 (23 byte) not null,
  ref_domn                                number (10) not null,
  nom                                     varchar2 (60 byte) not null,
  descr                                   varchar2 (4000 byte) null,
  utils_creat                             varchar2 (123 byte) not null,
  date_creat                              date not null,
  utils_modfc                             varchar2 (123 byte) null,
  date_modfc                              date null,
  ref_prodt                               number (10) not null,
  dnr_ref_prodt                           number (10) not null
);


prompt Table SIE_23_PATRN_RECHR;

create table sie_23_patrn_rechr
(
  seqnc                                   number (10) not null,
  code                                    varchar2 (23 byte) not null,
  nom                                     varchar2 (60 byte) not null,
  descr                                   varchar2 (4000 byte) null,
  enonc_plsql_gauch                       varchar2 (200 byte) not null,
  enonc_plsql_droit                       varchar2 (200 byte) not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_creat                              date not null,
  utils_modfc                             varchar2 (123 byte) null,
  date_modfc                              date null,
  opert                                   varchar2 (23 byte) not null,
  ref_prodt                               number (10) not null,
  dnr_ref_prodt                           number (10) not null
);


prompt Table SIE_23_RECHR;

create table sie_23_rechr
(
  seqnc                                   number (10) not null,
  ref_utils                               number (10) not null,
  date_exect                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_creat                              date not null,
  utils_modfc                             varchar2 (123 byte) null,
  date_modfc                              date null,
  ref_modl_rechr                          number (10) null
);


prompt Table SIE_23_RESLT_RECHR;

create table sie_23_reslt_rechr
(
  seqnc                                   number (10) not null,
  ref_rechr                               number (10) not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_creat                              date not null,
  utils_modfc                             varchar2 (123 byte) null,
  date_modfc                              date null,
  dnr_libl_struc_aplic_html               varchar2 (4000 byte) null,
  dnr_libl_struc_aplic                    varchar2 (1000 byte) null,
  dnr_pertn                               number (5, 2) null,
  dnr_lien                                varchar2 (4000 byte) null,
  dnr_decmp_reslt                         number (4) null,
  ref_aplic_modl_rechr                    number (10) not null,
  dnr_ref_struc_aplic                     number (10) not null,
  ref_seqnc_struc_aplic                   number (10) not null
);


prompt Table SIE_25_CHAMP;

create table sie_25_champ
(
  seqnc                                   number (10) not null,
  code                                    varchar2 (23 byte) null,
  postn_x                                 number (10) null,
  postn_y                                 number (10) null,
  angle_orint                             number (10) null,
  ref_formt                               number (10) null,
  ref_versn_publc                         number (10) null,
  ref_dv_type_champ                       number (10) null,
  indic_modif                             varchar2 (1 byte) default 'N' not null,
  nom                                     varchar2 (60 byte) null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null
);


prompt Table SIE_25_CHAMP_PUBLC_TRAVL;

create table sie_25_champ_publc_travl
(
  seqnc                                   number (10) not null,
  ref_champ                               number (10) not null,
  ref_publc_travl                         number (10) not null,
  contn                                   varchar2 (4000 byte) null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null
);


prompt Table SIE_25_DOMN_TYPE_PUBLC;

create table sie_25_domn_type_publc
(
  seqnc                                   number (10) null,
  ref_domn                                number (10) not null,
  ref_type_publc                          number (10) not null,
  ref_publc                               number (10) null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  note_bas_page                           varchar2 (4000 byte) null
);


prompt Table SIE_25_ELEMN_CONFG_PUBLC;

create table sie_25_elemn_confg_publc
(
  seqnc                                   number (10) null,
  ref_type_publc                          number (10) not null,
  code                                    varchar2 (23 byte) not null,
  nom                                     varchar2 (60 byte) not null,
  descr                                   varchar2 (200 byte) null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  type_don                                varchar2 (1 byte) not null,
  dnr_ref_prodt                           number (10) not null
);


prompt Table SIE_25_ENGIN;

create table sie_25_engin
(
  seqnc                                   number (10) null,
  code                                    varchar2 (23 byte) not null,
  ref_dv_formt_sort                       number (10) not null,
  url_servl                               varchar2 (200 byte) null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  url_servl_exter                         varchar2 (200 byte) null
);


prompt Table SIE_25_ENGIN_VERSN_PUBLC;

create table sie_25_engin_versn_publc
(
  seqnc                                   number (10) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  ref_versn_publc                         number (10) not null,
  ref_engin                               number (10) not null,
  iden_acces                              varchar2 (60 byte) null,
  pdf_fusn                                blob null,
  dnr_ref_prodt                           number (10) not null
);


prompt Table SIE_25_GROUP_PUBLC;

create table sie_25_group_publc
(
  seqnc                                   number (10) null,
  code                                    varchar2 (23 byte) not null,
  nom                                     varchar2 (60 byte) not null,
  descr                                   varchar2 (4000 byte) null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null
);


prompt Table SIE_25_JOURN_TRAVL_EXECT;

create table sie_25_journ_travl_exect
(
  seqnc                                   number (10) null,
  ref_dv_type_ecrit                       number (10) not null,
  ref_travl                               number (10) not null,
  ref_publc_travl                         number (10) not null,
  date_journ                              date not null,
  enonc                                   varchar2 (4000 byte) null
);


prompt Table SIE_25_OCURN_PARMT_PUBLC_TRAVL;

create table sie_25_ocurn_parmt_publc_travl
(
  seqnc                                   number (10) null,
  valr_date                               date null,
  valr_numbr                              number null,
  valr_varch                              varchar2 (4000 byte) null,
  ref_parmt_publc_travl                   number (10) null
);


prompt Table SIE_25_PARMT_PUBLC_TRAVL;

create table sie_25_parmt_publc_travl
(
  seqnc                                   number (10) null,
  ref_publc_travl                         number (10) not null,
  ref_parmt_type_publc                    number (10) not null,
  valr_varch                              varchar2 (4000 byte) null,
  valr_date                               date null,
  valr_numbr                              number null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null
);


prompt Table SIE_25_PARMT_PUBLC_TRAVL_EXECT;

create table sie_25_parmt_publc_travl_exect
(
  ref_travl_publc                         number (10) not null,
  valr_numbr1                             number null,
  valr_varch1                             varchar2 (256 byte) null,
  valr_date1                              date null,
  valr_numbr2                             number null,
  valr_varch2                             varchar2 (256 byte) null,
  valr_date2                              date null,
  valr_numbr3                             number null,
  valr_varch3                             varchar2 (256 byte) null,
  valr_date3                              date null,
  valr_numbr4                             number null,
  valr_varch4                             varchar2 (256 byte) null,
  valr_date4                              date null,
  valr_numbr5                             number null,
  valr_varch5                             varchar2 (256 byte) null,
  valr_date6                              date null,
  valr_numbr7                             number null,
  valr_varch7                             varchar2 (256 byte) null,
  valr_date7                              date null,
  valr_numbr8                             number null,
  valr_varch8                             varchar2 (256 byte) null,
  valr_date8                              date null,
  valr_numbr9                             number null,
  valr_varch9                             varchar2 (256 byte) null,
  valr_date9                              date null,
  valr_numbr10                            number null,
  valr_varch10                            varchar2 (256 byte) null,
  valr_date10                             date null,
  ref_travl                               number (10) not null,
  seqnc                                   number (10) null,
  valr_date5                              date null,
  valr_varch6                             varchar2 (256 byte) null,
  valr_numbr6                             number (10) null
);


prompt Table SIE_25_PARMT_TYPE_PUBLC;

create table sie_25_parmt_type_publc
(
  seqnc                                   number (10) null,
  ref_type_publc                          number (10) null,
  ref_engin                               number (10) null,
  code                                    varchar2 (23 byte) not null,
  nom                                     varchar2 (60 byte) not null,
  descr                                   varchar2 (4000 byte) null,
  indic_presn_appel                       varchar2 (1 byte) default 'N' not null,
  indic_fixe                              varchar2 (1 byte) default 'O' not null,
  valr_deft                               varchar2 (200 byte) null,
  type_valr_deft                          varchar2 (5 byte) default 'LITL' not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  type_don                                varchar2 (1 byte) not null,
  ordre_presn                             number (3) null,
  cardn                                   varchar2 (1 byte) null,
  dnr_ref_prodt                           number (10) not null
);


prompt Table SIE_25_PUBLC;

create table sie_25_publc
(
  seqnc                                   number (10) null,
  ref_type_publc                          number (10) not null,
  code                                    varchar2 (23 byte) not null,
  nom                                     varchar2 (60 byte) not null,
  descr                                   varchar2 (200 byte) null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  ref_group_publc                         number (10) null,
  dnr_ref_prodt                           number (10) not null
);


prompt Table SIE_25_PUBLC_TRAVL;

create table sie_25_publc_travl
(
  seqnc                                   number (10) null,
  ref_publc                               number (10) null,
  ref_travl                               number (10) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  ref_stat                                number (10) not null,
  nom                                     varchar2 (200 byte) not null,
  indic_parmt_alimn                       varchar2 (1 byte) default 'N' null,
  ref_versn_publc                         number (10) null
);


prompt Table SIE_25_TRAVL;

create table sie_25_travl
(
  seqnc                                   number (10) null,
  ref_utils                               number (10) not null,
  indic_imedt                             varchar2 (1 byte) default 'O' not null,
  nom                                     varchar2 (200 byte) null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  ref_domn                                number (10) not null,
  ref_stat                                number (10) not null,
  ref_type_travl                          number (10) not null
);


prompt Table SIE_25_TYPE_PUBLC;

create table sie_25_type_publc
(
  seqnc                                   number (10) null,
  code                                    varchar2 (23 byte) not null,
  nom                                     varchar2 (60 byte) not null,
  descr                                   varchar2 (200 byte) null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  ref_struc_aplic                         number (10) not null,
  dnr_ref_prodt                           number (10) not null
);


prompt Table SIE_25_TYPE_TRAVL;

create table sie_25_type_travl
(
  seqnc                                   number (10) not null,
  code                                    varchar2 (23 byte) not null,
  nom                                     varchar2 (60 byte) not null,
  descr                                   varchar2 (200 byte) null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  ref_domn                                number (10) not null
);


prompt Table SIE_25_VALR_CHAMP;

create table sie_25_valr_champ
(
  seqnc                                   number (10) not null,
  ref_champ                               number (10) not null,
  ref_publc_travl                         number (10) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  valr_nombr                              number (10) null,
  valr_date                               date null,
  valr_varch                              varchar2 (400 byte) null
);


prompt Table SIE_25_VALR_ELEMN_CONFG;

create table sie_25_valr_elemn_confg
(
  seqnc                                   number (10) null,
  ref_elemn_confg_publc                   number (10) not null,
  date_debut_efect                        date not null,
  date_fin_efect                          date null,
  valr_varch                              varchar2 (4000 byte) null,
  valr_date                               date null,
  valr_numbr                              number null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  ref_domn                                number (10) not null
);


prompt Table SIE_25_VERSN_PUBLC;

create table sie_25_versn_publc
(
  seqnc                                   number (10) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  date_debut_efect                        date not null,
  date_fin_efect                          date null,
  ref_publc                               number (10) not null,
  code                                    varchar2 (23 byte) not null,
  nom                                     varchar2 (60 byte) not null,
  descr                                   varchar2 (200 byte) null,
  dnr_ref_prodt                           number (10) not null
);


prompt Table SIE_29_CONTR;

create table sie_29_contr
(
  seqnc                                   number (10) not null,
  code_contr                              varchar2 (23 byte) not null,
  nom_struc_acces                         varchar2 (61 byte) not null,
  nom                                     varchar2 (60 byte) not null,
  descr                                   varchar2 (4000 byte) null,
  niv_gravt                               number (1) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  ref_prodt                               number (10) not null,
  dnr_ref_prodt                           number (10) not null
);


prompt Table SIE_29_RESLT_REQUT_AQ;

create table sie_29_reslt_requt_aq
(
  ref_contr                               number (10) not null,
  id                                      number not null,
  flow_id                                 number not null,
  page_id                                 number not null,
  nom_comps                               varchar2 (500 byte) not null,
  niv_gravt                               number (1) not null,
  natr                                    varchar2 (500 byte) null
);


prompt Table SIE_30_AFECT_ITEM;

create table sie_30_afect_item
(
  seqnc                                   number (10) not null,
  ref_item_carnt_prodt                    number (10) not null,
  ref_utils                               number (10) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null
);


prompt Table SIE_30_CARNT_APLIC;

create table sie_30_carnt_aplic
(
  seqnc                                   number (10) not null,
  nom                                     varchar2 (200 byte) not null,
  ref_carnt_prodt                         number (10) not null,
  ref_aplic                               number (10) not null,
  ref_utils_respn                         number (10) null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  docmn_refrc                             varchar2 (200 byte) null
);


prompt Table SIE_30_CARNT_PRODT;

create table sie_30_carnt_prodt
(
  seqnc                                   number (10) not null,
  ref_prodt                               number (10) not null,
  docmn_refrc                             varchar2 (200 byte) null,
  ref_utils_respn                         number (10) null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null
);


prompt Table SIE_30_CARNT_SPRIN;

create table sie_30_carnt_sprin
(
  seqnc                                   number (10) not null,
  descr                                   varchar2 (4000 byte) null,
  ref_utils_respn                         number (10) null,
  ref_carnt_prodt                         number (10) null,
  date_debut_prevu                        date not null,
  date_fin_prevu                          date not null,
  ref_versn                               number (10) null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null
);


prompt Table SIE_30_CAS_UTILS;

create table sie_30_cas_utils
(
  seqnc                                   number (10) null,
  code                                    varchar2 (23 byte) not null,
  nom                                     varchar2 (200 byte) not null,
  descr                                   varchar2 (4000 byte) null,
  docmn_refrc                             varchar2 (200 byte) null,
  ref_carnt_prodt                         number (10) null,
  ref_stat                                number (10) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  ref_utils_respn                         number (10) null
);


prompt Table SIE_30_EFORT_ITEM;

create table sie_30_efort_item
(
  seqnc                                   number (10) not null,
  ref_item_carnt_sprin                    number (10) not null,
  ref_utils                               number (10) not null,
  comnt                                   varchar2 (4000 byte) null,
  date_efort                              date not null,
  valr                                    number (5, 2) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null
);


prompt Table SIE_30_HISTR_EFORT_RESTN;

create table sie_30_histr_efort_restn
(
  seqnc                                   number (10) not null,
  ref_item_carnt_sprin                    number (10) not null,
  date_heure_saisi                        date not null,
  efort_restn                             number (10, 2) null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null
);


prompt Table SIE_30_ITEM_CARNT_PRODT;

create table sie_30_item_carnt_prodt
(
  seqnc                                   number (10) not null,
  nom                                     varchar2 (200 byte) not null,
  descr                                   varchar2 (4000 byte) null,
  ref_carnt_prodt                         number (10) not null,
  ref_dv_prior                            number (1) null,
  ref_stat                                number (10) null,
  ref_dv_tail_reltv                       number (10) null,
  ref_cas_utils                           number (10) null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null
);


prompt Table SIE_30_ITEM_CARNT_SPRIN;

create table sie_30_item_carnt_sprin
(
  seqnc                                   number (10) not null,
  nom                                     varchar2 (200 byte) not null,
  descr                                   varchar2 (4000 byte) null,
  numr_refrc_docmn                        number (3) null,
  ref_item_carnt_prodt                    number (10) null,
  ref_carnt_sprin                         number (10) not null,
  efort_prevu                             number (10, 2) null,
  efort_restn                             number (10, 2) null,
  ref_dv_prior                            number (10) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null,
  ref_sie_30_page                         number (10) null
);


prompt Table SIE_30_PAGE;

create table sie_30_page
(
  seqnc                                   number (10) not null,
  ref_sie_13_page                         number (10) null,
  nom                                     varchar2 (200 byte) null,
  numr_apex                               number null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null
);


prompt Table SIE_30_PAGE_ITEM;

create table sie_30_page_item
(
  seqnc                                   number (10) not null,
  ref_sie_30_page                         number (10) not null,
  ref_item_carnt_prodt                    number (10) not null,
  date_creat                              date not null,
  utils_creat                             varchar2 (123 byte) not null,
  date_modfc                              date null,
  utils_modfc                             varchar2 (123 byte) null
);


prompt Table TC_SIE_07_SEQNC;

create global temporary table tc_sie_07_seqnc (seqnc number (10) null)
on commit delete rows;
