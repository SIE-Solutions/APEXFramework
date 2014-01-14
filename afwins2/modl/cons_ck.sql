SET DEFINE OFF;
Prompt Non-Foreign Key Constraints on Table SIE_01_CONFG_EVENM_NOTFB;
ALTER TABLE SIE_01_CONFG_EVENM_NOTFB ADD (
  CONSTRAINT SIE_01_CONFG_EVENM_NOTFB_CK1
  CHECK (
  ref_profl_courl is not null and ref_compt_twili is null
  or
  ref_profl_courl is null and ref_compt_twili is not null
  or
  ref_profl_courl is null and ref_compt_twili is null
)
  ENABLE VALIDATE,
  CONSTRAINT SIE_01_CONFG_EVENM_NOTFB_CK2
  CHECK ((ref_compt_twili is null and ref_profl_courl is not null) or (
ref_compt_twili is not null and ref_profl_courl is null))
  ENABLE VALIDATE);

Prompt Non-Foreign Key Constraints on Table SIE_01_HIERC_APLIC;
ALTER TABLE SIE_01_HIERC_APLIC ADD (
  CONSTRAINT SIE_01_HIERC_APLIC_CK1
  CHECK (aplic_prior >= 0)
  ENABLE VALIDATE);

Prompt Non-Foreign Key Constraints on Table SIE_01_MESG_INFOR;
ALTER TABLE SIE_01_MESG_INFOR ADD (
  CONSTRAINT SIE_01_MESG_INFOR_CK1
  CHECK ((SESS_ID is not null and REF_UTILS is null) or (SESS_ID is null and 
REF_UTILS is not null))
  ENABLE VALIDATE);

Prompt Non-Foreign Key Constraints on Table SIE_03_LIEN_CLAS_INTER_UTILS;
ALTER TABLE SIE_03_LIEN_CLAS_INTER_UTILS ADD (
  CONSTRAINT SIE_03_LIEN_CLAS_INTER_UTI_CK1
  CHECK ((ref_group_utils is not null  and ref_utils is null )  or  (    
ref_group_utils is null    and    ref_utils is not null  ))
  ENABLE VALIDATE);

Prompt Non-Foreign Key Constraints on Table SIE_04_CONTX_ETEND;
ALTER TABLE SIE_04_CONTX_ETEND ADD (
  CONSTRAINT SIE_04_CONTX_ETEND_CK1
  CHECK (type_alimn in ('A', 'M', 'RM', 'RMA'))
  ENABLE VALIDATE,
  CONSTRAINT SIE_04_CONTX_ETEND_CK2
  CHECK (TYPE_ELEMN in ('I', 'V'))
  ENABLE VALIDATE);

Prompt Non-Foreign Key Constraints on Table SIE_04_FIL_ARIAN;
ALTER TABLE SIE_04_FIL_ARIAN ADD (
  CONSTRAINT SIE_04_FIL_ARIAN_CK1
  CHECK (
(ref_navgt_histr is not null and session_id is null) or
(ref_navgt_histr is null and session_id is not null)
)
  ENABLE VALIDATE);

Prompt Non-Foreign Key Constraints on Table SIE_07_AUDIT_STRUC_APLIC;
ALTER TABLE SIE_07_AUDIT_STRUC_APLIC ADD (
  CONSTRAINT SIE_07_AUDIT_STRUC_APLIC_CK1
  CHECK (natr_audit in ('CRE','MOD','SUP','PER','AFF'))
  ENABLE VALIDATE,
  CONSTRAINT SIE_07_AUDIT_STRUC_APLIC_CK2
  CHECK ((natr_audit in ('CRE','MOD','SUP') and ref_page is null and 
ref_actio_audit is null) or (natr_audit in ('CRE','MOD','SUP')))
  ENABLE VALIDATE,
  CONSTRAINT SIE_07_AUDIT_STRUC_APLIC_CK3
  CHECK ((natr_audit = 'PER' and ref_actio_audit is not null and ref_page is 
null) or natr_audit != 'PER')
  ENABLE VALIDATE,
  CONSTRAINT SIE_07_AUDIT_STRUC_APLIC_CK4
  CHECK ((natr_audit = 'AFF' and ref_actio_audit is null and ref_page is not 
null) or natr_audit != 'AFF')
  ENABLE VALIDATE);

Prompt Non-Foreign Key Constraints on Table SIE_11_PRODT;
ALTER TABLE SIE_11_PRODT ADD (
  CONSTRAINT SIE_11_PRODT_CK1
  CHECK ((INDIC_EXTRA_TOUT = 'N' AND TAIL_TABL_EXTRA is not null) OR 
INDIC_EXTRA_TOUT = 'O')
  ENABLE VALIDATE,
  CONSTRAINT SIE_11_PRODT_CK2
  CHECK (TAIL_TABL_EXTRA > 0)
  ENABLE VALIDATE);

Prompt Non-Foreign Key Constraints on Table SIE_11_PRODT_RESRC;
ALTER TABLE SIE_11_PRODT_RESRC ADD (
  CONSTRAINT SIE_11_PRODT_RESRC_CK1
  CHECK (
(ref_plugn is null or ref_prodt is not null) or
(ref_plugn is not null or ref_prodt is null))
  ENABLE VALIDATE);

Prompt Non-Foreign Key Constraints on Table SIE_11_VERSN;
ALTER TABLE SIE_11_VERSN ADD (
  CONSTRAINT SIE_11_VERSN_CK1
  CHECK (ref_prodt is not null and dnr_ref_prodt is not null and ref_aplic is null and dnr_ref_aplic is null and ref_plugn is null or
          ref_prodt is null and dnr_ref_prodt is null and ref_aplic is not null and dnr_ref_aplic is not null and ref_plugn is null or
          ref_prodt is null and dnr_ref_prodt is null and ref_aplic is null and dnr_ref_aplic is null and ref_plugn is not null)
  ENABLE VALIDATE);

Prompt Non-Foreign Key Constraints on Table SIE_12_DEFNT_ACCES;
ALTER TABLE SIE_12_DEFNT_ACCES ADD (
  CONSTRAINT SIE_12_DEFNT_ACCES_CK1
  CHECK ((    REF_GROUP_UTILS IS NOT NULL    AND       REF_UTILS IS NULL  )  OR  (    REF_GROUP_UTILS IS NULL    AND       REF_UTILS IS NOT NULL  ))
  ENABLE VALIDATE,
  CONSTRAINT SIE_12_DEFNT_ACCES_CK2
  CHECK ((    ref_opert is not null   and   ref_struc_aplic is null  )  
    or  (    ref_opert is null   and   ref_struc_aplic is not null  )  
)
  ENABLE VALIDATE);

Prompt Non-Foreign Key Constraints on Table SIE_12_DOMN_SERVR_LDAP;
ALTER TABLE SIE_12_DOMN_SERVR_LDAP ADD (
  CONSTRAINT SIE_12_DOMN_SERVR_LDAP_CK1
  CHECK (
  date_debut_efect < date_fin_efect or date_fin_efect is null
)
  ENABLE VALIDATE);

Prompt Non-Foreign Key Constraints on Table SIE_12_DOMN_UTILS;
ALTER TABLE SIE_12_DOMN_UTILS ADD (
  CONSTRAINT SIE_12_DOMN_UTILS_CK1
  CHECK (
  date_debut_efect < date_fin_efect or date_fin_efect is null
)
  ENABLE VALIDATE);

Prompt Non-Foreign Key Constraints on Table SIE_12_GROUP_UTILS;
ALTER TABLE SIE_12_GROUP_UTILS ADD (
  CONSTRAINT SIE_12_GROUP_UTILS_CK1
  CHECK (
(ref_domn is not null and ref_prodt is null and dnr_ref_prodt is null)
or
(ref_domn is null and ref_prodt is not null and dnr_ref_prodt is not null)
or
(ref_domn is null and ref_prodt is null and dnr_ref_prodt is null and code = 'SUPER_UTILS')
)
  ENABLE VALIDATE);

Prompt Non-Foreign Key Constraints on Table SIE_12_LIEN_GROUP_UTILS;
ALTER TABLE SIE_12_LIEN_GROUP_UTILS ADD (
  CONSTRAINT SIE_12_LIEN_GROUP_UTILS_CK1
  CHECK (
  (    REF_GROUP_UTILS_LIE IS NOT NULL    AND    REF_UTILS IS NULL )  
  OR  
  (    REF_GROUP_UTILS_LIE IS NULL    AND    REF_UTILS IS NOT NULL )
 )
  ENABLE VALIDATE,
  CONSTRAINT SIE_12_LIEN_GROUP_UTILS_CK2
  CHECK ((dnr_ref_prodt is not null and ref_domn is null)
or
(dnr_ref_prodt is null and ref_domn is not null))
  ENABLE VALIDATE);

Prompt Non-Foreign Key Constraints on Table SIE_12_REQT_INTER_UTILS;
ALTER TABLE SIE_12_REQT_INTER_UTILS ADD (
  CONSTRAINT SIE_12_REQT_INTER_UTILS_CK1
  CHECK (
  date_debut_efect < date_fin_efect or date_fin_efect is null
)
  ENABLE VALIDATE);

Prompt Non-Foreign Key Constraints on Table SIE_12_STAT;
ALTER TABLE SIE_12_STAT ADD (
  CONSTRAINT SIE_12_STAT_CK1
  CHECK ((ref_group_stat is null and ref_struc_aplic is not null) or (
ref_group_stat is not null and ref_struc_aplic is null))
  ENABLE VALIDATE);

Prompt Non-Foreign Key Constraints on Table SIE_12_STRUC_APLIC;
ALTER TABLE SIE_12_STRUC_APLIC ADD (
  CONSTRAINT SIE_12_STRUC_APLIC_CK1
  CHECK ((INDIC_EXTRA_TOUT = 'N' AND TAIL_TABL_EXTRA is not null) OR 
INDIC_EXTRA_TOUT in ('O', 'HE'))
  ENABLE VALIDATE,
  CONSTRAINT SIE_12_STRUC_APLIC_CK2
  CHECK (TAIL_TABL_EXTRA > 0)
  ENABLE VALIDATE,
  CONSTRAINT SIE_12_STRUC_APLIC_CK3
  CHECK (
(indic_dispn_docmn = 'O' and nom_struc_acces_don is not null)
or
(indic_dispn_docmn = 'N'))
  ENABLE VALIDATE);

Prompt Non-Foreign Key Constraints on Table SIE_12_UTILS;
ALTER TABLE SIE_12_UTILS ADD (
  CONSTRAINT SIE_12_UTILS_CK1
  CHECK (
  regexp_like (code_utils,'^[[:alnum:]]+(_[[:alnum:]]+)*$')
)
  ENABLE VALIDATE,
  CONSTRAINT SIE_12_UTILS_CK2
  CHECK (
  courl is null
  or
  regexp_like (courl,'^[[:alnum:]]+((_|\.|\-|)[[:alnum:]]+)*@[[:alnum:]]+(\-|[
[:alnum:]]+)*(\.[[:alnum:]]+){1,2}$')
)
  ENABLE VALIDATE);

Prompt Non-Foreign Key Constraints on Table SIE_13_ITEM_MENU;
ALTER TABLE SIE_13_ITEM_MENU ADD (
  CONSTRAINT SIE_13_ITEM_MENU_CK01
  CHECK ((ref_page is not null and forml_valr_url is null) or (ref_page is 
null and forml_valr_url is not null)
        or (ref_page is null and forml_valr_url is null))
  ENABLE VALIDATE);

Prompt Non-Foreign Key Constraints on Table SIE_13_PAGE_IR_COLN;
ALTER TABLE SIE_13_PAGE_IR_COLN ADD (
  CONSTRAINT SIE_13_PAGE_IR_COLN_CK1
  CHECK (TYPE_LARGR in ('POINT', 'POURC', 'POUCE', 'RELTF'))
  ENABLE VALIDATE,
  CONSTRAINT SIE_13_PAGE_IR_COLN_CK2
  CHECK (
        type_largr is not null and largr is not null
        or
        type_largr is null and largr is null)
  ENABLE VALIDATE);

Prompt Non-Foreign Key Constraints on Table SIE_13_RESRC;
ALTER TABLE SIE_13_RESRC ADD (
  CONSTRAINT SIE_13_RESRC_CK1
  CHECK (indic_stock_meme_reprt in ('O', 'N'))
  ENABLE VALIDATE,
  CONSTRAINT SIE_13_RESRC_CK2
  CHECK ((indic_stock_meme_reprt = 'O' and ref_dosr_virtl is not null) or 
ref_dosr_virtl is null)
  ENABLE VALIDATE,
  CONSTRAINT SIE_13_RESRC_CK3
  CHECK (type_resrc in ('COMPS', 'SIMPL'))
  ENABLE VALIDATE,
  CONSTRAINT SIE_13_RESRC_CK4
  CHECK (
   (REF_PRODT is not null and REF_STRUC_APLIC is null and REF_PLUGN is null)
   or
   (REF_PRODT is null and REF_STRUC_APLIC is not null and REF_PLUGN is null)
   or
   (REF_PRODT is null and REF_STRUC_APLIC is null and REF_PLUGN is not null)
   )
  ENABLE VALIDATE);

Prompt Non-Foreign Key Constraints on Table SIE_14_DOMN_VALR;
ALTER TABLE SIE_14_DOMN_VALR ADD (
  CONSTRAINT SIE_14_DOMN_VALR_CK1
  CHECK ((   indic_systm = 'O')  or (   indic_systm = 'N'     and 
ref_type_domn_valr is not null))
  ENABLE VALIDATE,
  CONSTRAINT SIE_14_DOMN_VALR_CK2
  CHECK ((REF_PRODT is null and DNR_REF_PRODT is null and REF_DOMN is not null) or  (REF_PRODT is not null and DNR_REF_PRODT is not null and REF_DOMN is null))
  ENABLE VALIDATE);

Prompt Non-Foreign Key Constraints on Table SIE_17_PROFL_COURL;
ALTER TABLE SIE_17_PROFL_COURL ADD (
  CONSTRAINT SIE_17_PROFL_COURL_CK1
  CHECK (protc_entra in ('IMAP', 'POP'))
  DISABLE NOVALIDATE);

Prompt Non-Foreign Key Constraints on Table SIE_19_BOUTN;
ALTER TABLE SIE_19_BOUTN ADD (
  CONSTRAINT SIE_19_BOUTN_CK1
  CHECK ((ID_TEMPL_BOUTN is not null and TEMPL_BOUTN is null)
        or
        (ID_TEMPL_BOUTN is null and TEMPL_BOUTN is not null)
        or
        (ID_TEMPL_BOUTN is null and TEMPL_BOUTN is null)
       )
  ENABLE VALIDATE);

Prompt Non-Foreign Key Constraints on Table SIE_19_CLE;
ALTER TABLE SIE_19_CLE ADD (
  CONSTRAINT SIE_19_CLE_CK1
  CHECK ((CODE_KEYPR is not null and CODE_KEYDW is null) 
        or 
        (CODE_KEYPR is null and CODE_KEYDW is not null)
        or
        (CODE_KEYPR is null and CODE_KEYDW is null)
       )
  ENABLE VALIDATE);

Prompt Non-Foreign Key Constraints on Table SIE_19_FONCT;
ALTER TABLE SIE_19_FONCT ADD (
  CONSTRAINT SIE_19_FONCT_CK1
  CHECK ((REF_DV_TYPE_ATRIB1 is not null and VALR_DEFT_ATRIB1 is not null and 
TITRE_ATRIB1 is not null) or
  (REF_DV_TYPE_ATRIB1 is null and VALR_DEFT_ATRIB1 is null and TITRE_ATRIB1 is 
null))
  ENABLE VALIDATE,
  CONSTRAINT SIE_19_FONCT_CK2
  CHECK ((REF_DV_TYPE_ATRIB2 is not null and VALR_DEFT_ATRIB2 is not null and 
TITRE_ATRIB2 is not null) or
  (REF_DV_TYPE_ATRIB2 is null and VALR_DEFT_ATRIB2 is null and TITRE_ATRIB2 is 
null))
  ENABLE VALIDATE,
  CONSTRAINT SIE_19_FONCT_CK3
  CHECK ((REF_DV_TYPE_ATRIB3 is not null and VALR_DEFT_ATRIB3 is not null and 
TITRE_ATRIB3 is not null) or
  (REF_DV_TYPE_ATRIB3 is null and VALR_DEFT_ATRIB3 is null and TITRE_ATRIB3 is 
null))
  ENABLE VALIDATE,
  CONSTRAINT SIE_19_FONCT_CK4
  CHECK ((REF_DV_TYPE_ATRIB4 is not null and VALR_DEFT_ATRIB4 is not null and 
TITRE_ATRIB4 is not null) or
  (REF_DV_TYPE_ATRIB4 is null and VALR_DEFT_ATRIB4 is null and TITRE_ATRIB4 is 
null))
  ENABLE VALIDATE,
  CONSTRAINT SIE_19_FONCT_CK5
  CHECK ((REF_DV_TYPE_ATRIB5 is not null and VALR_DEFT_ATRIB5 is not null and 
TITRE_ATRIB5 is not null) or
  (REF_DV_TYPE_ATRIB5 is null and VALR_DEFT_ATRIB5 is null and TITRE_ATRIB5 is 
null))
  ENABLE VALIDATE);

Prompt Non-Foreign Key Constraints on Table SIE_19_SPECF_FONCT;
ALTER TABLE SIE_19_SPECF_FONCT ADD (
  CONSTRAINT SIE_19_SPECF_FONCT_CK1
  CHECK ((ref_item is not null and ref_page is null) or (ref_item is null and 
ref_page is not null))
  ENABLE VALIDATE);

Prompt Non-Foreign Key Constraints on Table SIE_20_DEPLM;
ALTER TABLE SIE_20_DEPLM ADD (
  CONSTRAINT SIE_20_DEPLM_CK1
  CHECK (
  (ref_modl is not null and ref_modl_parmt is null)
  or
  (ref_modl is null and ref_modl_parmt is not null)
)
  ENABLE VALIDATE);

Prompt Non-Foreign Key Constraints on Table SIE_21_PLUGN_ARBRE;
ALTER TABLE SIE_21_PLUGN_ARBRE ADD (
  CONSTRAINT SIE_21_PLUGN_ARBRE_CK1
  CHECK (
 (nom_table is not null and
 coln_titre is not null and
 coln_valr is not null and
 coln_id is not null and
 coln_id_parnt is not null
 )
 or
 (nom_table is null and
 coln_titre is null and
 coln_valr is null and
 coln_id is null and
 coln_id_parnt is null)
 )
  ENABLE VALIDATE,
  CONSTRAINT SIE_21_PLUGN_ARBRE_CK2
  CHECK (type_icone_noeud in ('SIMPL', 'COMPS','RESRC'))
  ENABLE VALIDATE,
  CONSTRAINT SIE_21_PLUGN_ARBRE_CK3
  CHECK (mode_cache in ('SESN','UTILS','AUCUN'))
  ENABLE VALIDATE);

Prompt Non-Foreign Key Constraints on Table SIE_21_PLUGN_ARBRE_NOEUD;
ALTER TABLE SIE_21_PLUGN_ARBRE_NOEUD ADD (
  CONSTRAINT SIE_21_PLUGN_ARBRE_NOEUD_CK2
  CHECK (INDIC_CREER_NOEUD in ('O','N'))
  ENABLE VALIDATE,
  CONSTRAINT SIE_21_PLUGN_ARBRE_NOEUD_CK3
  CHECK (INDIC_OUVRI_NOEUD in ('O','N'))
  ENABLE VALIDATE,
  CONSTRAINT SIE_21_PLUGN_ARBRE_NOEUD_CK4
  CHECK (INDIC_FERMR_NOEUD in ('O','N'))
  ENABLE VALIDATE,
  CONSTRAINT SIE_21_PLUGN_ARBRE_NOEUD_CK5
  CHECK (INDIC_SELCT_NOEUD in ('O','N'))
  ENABLE VALIDATE,
  CONSTRAINT SIE_21_PLUGN_ARBRE_NOEUD_CK6
  CHECK (INDIC_SUPRM_NOEUD in ('O','N'))
  ENABLE VALIDATE,
  CONSTRAINT SIE_21_PLUGN_ARBRE_NOEUD_CK7
  CHECK ((ref_ocurn_resrc is not null and ref_resrc is null) or (
ref_ocurn_resrc is null and ref_resrc is not null))
  DISABLE NOVALIDATE);

Prompt Non-Foreign Key Constraints on Table SIE_21_PLUGN_CALND;
ALTER TABLE SIE_21_PLUGN_CALND ADD (
  CONSTRAINT SIE_21_PLUGN_CALND_CK1
  CHECK (
  nombr_mints_inter <= 1440 
)
  ENABLE VALIDATE);

Prompt Non-Foreign Key Constraints on Table SIE_21_PLUGN_ITEM_MENU;
ALTER TABLE SIE_21_PLUGN_ITEM_MENU ADD (
  CONSTRAINT SIE_21_PLUGN_ITEM_MENU_CK1
  CHECK (
  ref_dv_contn_item_menu is not null and niv_item = 1
  or
  ref_dv_contn_item_menu is null
)
  ENABLE VALIDATE);

Prompt Non-Foreign Key Constraints on Table SIE_23_APLIC_MODL_RECHR;
ALTER TABLE SIE_23_APLIC_MODL_RECHR ADD (
  CONSTRAINT SIE_23_APLIC_MODL_RECHR_CK1
  CHECK (NOMBR_MAXIM_RESLT < 1000)
  ENABLE VALIDATE);

Prompt Non-Foreign Key Constraints on Table SIE_23_DETL_APLIC_MODL_RECHR;
ALTER TABLE SIE_23_DETL_APLIC_MODL_RECHR ADD (
  CONSTRAINT SIE_23_DETL_APLIC_MODL_REC_CK1
  CHECK (PERTN <= 100)
  ENABLE VALIDATE);

Prompt Non-Foreign Key Constraints on Table SIE_25_PARMT_TYPE_PUBLC;
ALTER TABLE SIE_25_PARMT_TYPE_PUBLC ADD (
  CONSTRAINT SIE_25_PARMT_TYPE_PUBLC_CK1
  CHECK (ref_type_publc is not null and ref_engin is null
 or
 ref_type_publc is null and ref_engin is not null)
  ENABLE VALIDATE,
  CONSTRAINT SIE_25_PARMT_TYPE_PUBLC_CK3
  CHECK ((INDIC_PRESN_APPEL = 'N' AND ORDRE_PRESN IS NOT NULL) OR (INDIC_PRESN_APPEL != 'N'))
  ENABLE VALIDATE);

Prompt Non-Foreign Key Constraints on Table SIE_25_VALR_ELEMN_CONFG;
ALTER TABLE SIE_25_VALR_ELEMN_CONFG ADD (
  CONSTRAINT SIE_25_VALR_ELEMN_CONFG_CK1
  CHECK (valr_varch is not null and valr_numbr is null and valr_date is null
 or
 valr_varch is null and valr_numbr is not null and valr_date is null
 or
 valr_varch is null and valr_numbr is null and valr_date is not null)
  ENABLE VALIDATE);