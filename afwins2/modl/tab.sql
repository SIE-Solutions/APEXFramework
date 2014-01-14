SET DEFINE OFF;
Prompt Table SIE_01_ATRIB_MODL_COMNC;
CREATE TABLE SIE_01_ATRIB_MODL_COMNC
(
  SEQNC           NUMBER(10)                        NULL,
  CODE            VARCHAR2(23 BYTE)                 NULL,
  NOM             VARCHAR2(60 BYTE)                 NULL,
  DESCR           VARCHAR2(4000 BYTE)               NULL,
  REF_MODL_COMNC  NUMBER(10)                        NULL,
  DATE_CREAT      DATE                              NULL,
  UTILS_CREAT     VARCHAR2(123 BYTE)                NULL,
  DATE_MODFC      DATE                              NULL,
  UTILS_MODFC     VARCHAR2(123 BYTE)                NULL
);


Prompt Table SIE_01_CODE_ERR_ORACL;
CREATE TABLE SIE_01_CODE_ERR_ORACL
(
  SEQNC        NUMBER(10)                           NULL,
  ERR_CODE     NUMBER(5)                            NULL,
  UTILS_CREAT  VARCHAR2(123 BYTE)                   NULL,
  DATE_CREAT   DATE                                 NULL,
  DATE_MODFC   DATE                                 NULL,
  UTILS_MODFC  VARCHAR2(123 BYTE)                   NULL,
  LIBL         VARCHAR2(255 BYTE)                   NULL
);


Prompt Table SIE_01_CONFG_EVENM_NOTFB;
CREATE TABLE SIE_01_CONFG_EVENM_NOTFB
(
  SEQNC            NUMBER(10)                       NULL,
  REF_TYPE_COMNC   NUMBER(10)                       NULL,
  DATE_CREAT       DATE                             NULL,
  UTILS_CREAT      VARCHAR2(123 BYTE)               NULL,
  DATE_MODFC       DATE                             NULL,
  UTILS_MODFC      VARCHAR2(123 BYTE)               NULL,
  OBJET            VARCHAR2(200 BYTE)               NULL,
  TITRE_MESG       VARCHAR2(60 BYTE)                NULL,
  MESG_SMS         VARCHAR2(160 BYTE)               NULL,
  REF_EVENM_NOTFB  NUMBER(10)                       NULL,
  NOM              VARCHAR2(60 BYTE)                NULL,
  DESCR            VARCHAR2(4000 BYTE)              NULL,
  REF_DOMN         NUMBER(10)                       NULL,
  REF_COMPT_TWILI  NUMBER(10)                       NULL,
  REF_PROFL_COURL  NUMBER(10)                       NULL,
  INDIC_DEFT       VARCHAR2(1 BYTE)             DEFAULT 'N'                       NULL,
  MESG             CLOB                             NULL
);


Prompt Table SIE_01_DESTN;
CREATE TABLE SIE_01_DESTN
(
  SEQNC                  NUMBER(10)                 NULL,
  DATE_CREAT             DATE                       NULL,
  UTILS_CREAT            VARCHAR2(123 BYTE)         NULL,
  DATE_MODFC             DATE                       NULL,
  UTILS_MODFC            VARCHAR2(123 BYTE)         NULL,
  REF_ATRIB_STRUC_APLIC  NUMBER(10)                 NULL,
  DESCR                  VARCHAR2(4000 BYTE)        NULL,
  DNR_REF_PRODT          NUMBER(10)                 NULL
);


Prompt Table SIE_01_DESTN_CONFG_EVENM_NOTFB;
CREATE TABLE SIE_01_DESTN_CONFG_EVENM_NOTFB
(
  SEQNC                     NUMBER(10)              NULL,
  REF_DV_NATR_DESTN         NUMBER(10)              NULL,
  REF_CONFG_EVENM_NOTFB     NUMBER(10)              NULL,
  REF_DESTN                 NUMBER(10)              NULL,
  UTILS_CREAT               VARCHAR2(123 BYTE)      NULL,
  DATE_MODFC                DATE                    NULL,
  UTILS_MODFC               VARCHAR2(123 BYTE)      NULL,
  DATE_CREAT                DATE                    NULL,
  REF_RESLT_DESTN           NUMBER(10)              NULL,
  REF_ATRIB_SA_NOM_FORMT    NUMBER(10)              NULL,
  REF_ATRIB_SA_ADRES_DESTN  NUMBER(10)              NULL
);


Prompt Table SIE_01_ELEMN_CONFG_EVENM_NOTFB;
CREATE TABLE SIE_01_ELEMN_CONFG_EVENM_NOTFB
(
  SEQNC                  NUMBER(10)                 NULL,
  REF_CONFG_EVENM_NOTFB  NUMBER(10)                 NULL,
  CODE                   VARCHAR2(30 BYTE)          NULL,
  IDENT_ACCES            VARCHAR2(4000 BYTE)        NULL,
  IDENT_ACCES_FORMT      VARCHAR2(4000 BYTE)        NULL,
  DATE_CREAT             DATE                       NULL,
  UTILS_CREAT            VARCHAR2(123 BYTE)         NULL,
  DATE_MODFC             DATE                       NULL,
  UTILS_MODFC            VARCHAR2(123 BYTE)         NULL,
  FORMT                  VARCHAR2(50 BYTE)          NULL
);


Prompt Table SIE_01_EVENM_NOTFB;
CREATE TABLE SIE_01_EVENM_NOTFB
(
  SEQNC            NUMBER(10)                       NULL,
  CODE             VARCHAR2(23 BYTE)                NULL,
  NOM              VARCHAR2(60 BYTE)                NULL,
  DESCR            VARCHAR2(4000 BYTE)              NULL,
  DATE_CREAT       DATE                             NULL,
  UTILS_CREAT      VARCHAR2(123 BYTE)               NULL,
  DATE_MODFC       DATE                             NULL,
  UTILS_MODFC      VARCHAR2(123 BYTE)               NULL,
  REF_STRUC_APLIC  NUMBER(10)                       NULL,
  DNR_REF_PRODT    NUMBER(10)                       NULL
);


Prompt Table SIE_01_HIERC_APLIC;
CREATE TABLE SIE_01_HIERC_APLIC
(
  SEQNC                  NUMBER(10)                 NULL,
  REF_EVENM_NOTFB        NUMBER(10)                 NULL,
  APLIC_PRIOR            NUMBER(10)                 NULL,
  REF_ATRIB_STRUC_APLIC  NUMBER(10)                 NULL,
  DATE_CREAT             DATE                       NULL,
  UTILS_CREAT            VARCHAR2(123 BYTE)         NULL,
  DATE_MODFC             DATE                       NULL,
  UTILS_MODFC            VARCHAR2(123 BYTE)         NULL,
  DNR_REF_PRODT          NUMBER(10)                 NULL
);


Prompt Table SIE_01_LANG;
CREATE TABLE SIE_01_LANG
(
  SEQNC        NUMBER(10)                           NULL,
  CODE         VARCHAR2(23 BYTE)                    NULL,
  NOM          VARCHAR2(60 BYTE)                    NULL,
  DATE_CREAT   DATE                                 NULL,
  UTILS_CREAT  VARCHAR2(123 BYTE)                   NULL,
  DATE_MODFC   DATE                                 NULL,
  UTILS_MODFC  VARCHAR2(123 BYTE)                   NULL
);


Prompt Table SIE_01_LANG_LANG;
CREATE TABLE SIE_01_LANG_LANG
(
  SEQNC           NUMBER(10)                        NULL,
  REF_LANG        NUMBER(10)                        NULL,
  NOM             VARCHAR2(200 BYTE)                NULL,
  DATE_CREAT      DATE                              NULL,
  UTILS_CREAT     VARCHAR2(123 BYTE)                NULL,
  DATE_MODFC      DATE                              NULL,
  UTILS_MODFC     VARCHAR2(123 BYTE)                NULL,
  REF_LANG_CIBLE  NUMBER(10)                        NULL
);


Prompt Table SIE_01_MESG;
CREATE TABLE SIE_01_MESG
(
  SEQNC          NUMBER(10)                         NULL,
  NUMR_MESG      VARCHAR2(10 BYTE)                  NULL,
  REF_PRODT      NUMBER(10)                         NULL,
  DATE_CREAT     DATE                               NULL,
  UTILS_CREAT    VARCHAR2(123 BYTE)                 NULL,
  DATE_MODFC     DATE                               NULL,
  UTILS_MODFC    VARCHAR2(123 BYTE)                 NULL,
  DESCR          VARCHAR2(4000 BYTE)                NULL,
  TYPE_MESG      VARCHAR2(1 BYTE)                   NULL,
  DNR_REF_PRODT  NUMBER(10)                         NULL
);


Prompt Table SIE_01_MESG_ERR_LIE;
CREATE TABLE SIE_01_MESG_ERR_LIE
(
  SEQNC               NUMBER(10)                    NULL,
  NOM_TABLE           VARCHAR2(30 BYTE)             NULL,
  NOM_COLN            VARCHAR2(30 BYTE)             NULL,
  NOM_CONTR           VARCHAR2(30 BYTE)             NULL,
  PAGE                NUMBER(10)                    NULL,
  COMNT               VARCHAR2(4000 BYTE)           NULL,
  REF_PRODT           NUMBER(10)                    NULL,
  DATE_CREAT          DATE                          NULL,
  UTILS_CREAT         VARCHAR2(123 BYTE)            NULL,
  DATE_MODFC          DATE                          NULL,
  UTILS_MODFC         VARCHAR2(123 BYTE)            NULL,
  TYPE_LIAIS          NUMBER(1)                     NULL,
  REF_MESG            NUMBER(10)                    NULL,
  DNR_REF_PRODT       NUMBER(10)                    NULL,
  REF_CODE_ERR_ORACL  NUMBER(10)                    NULL
);


Prompt Table SIE_01_MESG_INFOR;
CREATE TABLE SIE_01_MESG_INFOR
(
  SEQNC          NUMBER(10)                         NULL,
  TEXT_MESG      VARCHAR2(4000 BYTE)                NULL,
  UTILS_CREAT    VARCHAR2(123 BYTE)                 NULL,
  DATE_CREAT     DATE                               NULL,
  SESS_ID        NUMBER                             NULL,
  REF_UTILS      NUMBER(10)                         NULL,
  REF_MESG_LANG  NUMBER(10)                         NULL
);


Prompt Table SIE_01_MESG_LANG;
CREATE TABLE SIE_01_MESG_LANG
(
  SEQNC          NUMBER(10)                         NULL,
  MESG           VARCHAR2(4000 BYTE)                NULL,
  DATE_CREAT     DATE                               NULL,
  UTILS_CREAT    VARCHAR2(123 BYTE)                 NULL,
  DATE_MODFC     DATE                               NULL,
  UTILS_MODFC    VARCHAR2(123 BYTE)                 NULL,
  REF_MESG       NUMBER(10)                         NULL,
  REF_LANG       NUMBER(10)                         NULL,
  DNR_REF_PRODT  NUMBER(10)                         NULL
);


Prompt Table SIE_01_MESG_TRADC_APEX;
CREATE TABLE SIE_01_MESG_TRADC_APEX
(
  SEQNC          NUMBER(10)                         NULL,
  NOM            VARCHAR2(255 BYTE)                 NULL,
  TEXT           VARCHAR2(4000 BYTE)                NULL,
  DATE_CREAT     DATE                               NULL,
  UTILS_CREAT    VARCHAR2(123 BYTE)                 NULL,
  DATE_MODFC     DATE                               NULL,
  UTILS_MODFC    VARCHAR2(123 BYTE)                 NULL,
  REF_LANG       NUMBER(10)                         NULL,
  REF_PRODT      NUMBER(10)                         NULL,
  DNR_REF_PRODT  NUMBER(10)                         NULL
);


Prompt Table SIE_01_MODL_AFICH_NOTFC;
CREATE TABLE SIE_01_MODL_AFICH_NOTFC
(
  SEQNC                 NUMBER(10)                  NULL,
  CODE                  VARCHAR2(23 BYTE)           NULL,
  NOM                   VARCHAR2(60 BYTE)           NULL,
  DESCR                 VARCHAR2(4000 BYTE)         NULL,
  COULR_TEXTE           VARCHAR2(7 BYTE)            NULL,
  TAIL_TEXTE            NUMBER(2)               DEFAULT 12                        NULL,
  COULR_TITRE           VARCHAR2(7 BYTE)            NULL,
  TAIL_TITRE            NUMBER(2)               DEFAULT 12                        NULL,
  TEMPS_AFICH           NUMBER(2)               DEFAULT 0                         NULL,
  REF_RESRC_ICON        NUMBER(10)                  NULL,
  REF_FORMT_RESRC_ICON  NUMBER(10)                  NULL,
  REF_OCURN_RESRC_ICON  NUMBER(10)                  NULL,
  REF_DOMN              NUMBER(10)                  NULL,
  DATE_CREAT            DATE                        NULL,
  UTILS_CREAT           VARCHAR2(123 BYTE)          NULL,
  DATE_MODFC            DATE                        NULL,
  UTILS_MODFC           VARCHAR2(123 BYTE)          NULL,
  REF_TYPE_COMNC        NUMBER(10)                  NULL,
  REF_MODL_COMNC        NUMBER(10)                  NULL
);


Prompt Table SIE_01_MODL_COMNC;
CREATE TABLE SIE_01_MODL_COMNC
(
  SEQNC           NUMBER(10)                        NULL,
  CODE            VARCHAR2(23 BYTE)                 NULL,
  NOM             VARCHAR2(60 BYTE)                 NULL,
  DESCR           VARCHAR2(4000 BYTE)               NULL,
  REF_TYPE_COMNC  NUMBER(10)                        NULL,
  DATE_CREAT      DATE                              NULL,
  UTILS_CREAT     VARCHAR2(123 BYTE)                NULL,
  DATE_MODFC      DATE                              NULL,
  UTILS_MODFC     VARCHAR2(123 BYTE)                NULL,
  INDIC_SYSTM     VARCHAR2(1 BYTE)              DEFAULT 'N'                       NULL,
  REF_DOMN        NUMBER(10)                        NULL
);


Prompt Table SIE_01_MODL_MESG_NOTFC;
CREATE TABLE SIE_01_MODL_MESG_NOTFC
(
  SEQNC       NUMBER(10)                            NULL,
  CODE        VARCHAR2(23 BYTE)                     NULL,
  NOM         VARCHAR2(60 BYTE)                     NULL,
  DESCR       VARCHAR2(4000 BYTE)                   NULL,
  OBJET       VARCHAR2(200 BYTE)                    NULL,
  REF_DOMN    NUMBER(10)                            NULL,
  CORPS_MESG  CLOB                                  NULL
);


Prompt Table SIE_01_NOTFC;
CREATE TABLE SIE_01_NOTFC
(
  SEQNC                 NUMBER(10)                  NULL,
  CODE                  VARCHAR2(23 BYTE)           NULL,
  NOM                   VARCHAR2(60 BYTE)           NULL,
  DESCR                 VARCHAR2(4000 BYTE)         NULL,
  INDEN_MESG            VARCHAR2(10 BYTE)           NULL,
  TITRE_MESG            VARCHAR2(60 BYTE)           NULL,
  MESG                  VARCHAR2(4000 BYTE)         NULL,
  REF_MODL_AFICH_NOTFC  NUMBER(10)                  NULL,
  INDIC_SPECF           VARCHAR2(1 BYTE)        DEFAULT 'O'                       NULL,
  INDIC_AFICH_UNIQ      VARCHAR2(1 BYTE)        DEFAULT 'O'                       NULL,
  REF_DOMN              NUMBER(10)                  NULL,
  DATE_CREAT            DATE                        NULL,
  UTILS_CREAT           VARCHAR2(123 BYTE)          NULL,
  DATE_MODFC            DATE                        NULL,
  UTILS_MODFC           VARCHAR2(123 BYTE)          NULL
);


Prompt Table SIE_01_OCURN_SA_EVENM_NOTFB;
CREATE TABLE SIE_01_OCURN_SA_EVENM_NOTFB
(
  SEQNC                  NUMBER(16)                 NULL,
  REF_HIERC_APLIC        NUMBER(10)                 NULL,
  REF_CONFG_EVENM_NOTFB  NUMBER(10)                 NULL,
  DATE_CREAT             DATE                       NULL,
  UTILS_CREAT            VARCHAR2(123 BYTE)         NULL,
  DATE_MODFC             DATE                       NULL,
  UTILS_MODFC            VARCHAR2(123 BYTE)         NULL,
  REF_SEQNC_STRUC_APLIC  NUMBER(10)                 NULL
);


Prompt Table SIE_01_RESLT_DESTN;
CREATE TABLE SIE_01_RESLT_DESTN
(
  SEQNC                  NUMBER(10)                 NULL,
  REF_DESTN              NUMBER(10)                 NULL,
  DNR_REF_PRODT          NUMBER(10)                 NULL,
  IDENT_ACCES            VARCHAR2(4000 BYTE)        NULL,
  IDENT_ACCES_FORMT      VARCHAR2(4000 BYTE)        NULL,
  UTILS_CREAT            VARCHAR2(123 BYTE)         NULL,
  DATE_CREAT             DATE                       NULL,
  UTILS_MODFC            VARCHAR2(123 BYTE)         NULL,
  DATE_MODFC             DATE                       NULL,
  NOM                    VARCHAR2(60 BYTE)          NULL,
  REF_STRUC_APLIC_ACCES  NUMBER(10)                 NULL
);


Prompt Table SIE_01_TYPE_COMNC;
CREATE TABLE SIE_01_TYPE_COMNC
(
  SEQNC        NUMBER(10)                           NULL,
  CODE         VARCHAR2(23 BYTE)                    NULL,
  NOM          VARCHAR2(60 BYTE)                    NULL,
  DATE_CREAT   DATE                                 NULL,
  UTILS_CREAT  VARCHAR2(123 BYTE)                   NULL,
  DATE_MODFC   DATE                                 NULL,
  UTILS_MODFC  VARCHAR2(123 BYTE)                   NULL
);


Prompt Table SIE_03_CLAS_INTER;
CREATE TABLE SIE_03_CLAS_INTER
(
  SEQNC                  NUMBER(10)                 NULL,
  CODE                   VARCHAR2(23 BYTE)          NULL,
  NOM                    VARCHAR2(100 BYTE)         NULL,
  DESCR                  VARCHAR2(400 BYTE)         NULL,
  DATE_CREAT             DATE                       NULL,
  UTILS_CREAT            VARCHAR2(123 BYTE)         NULL,
  DATE_MODFC             DATE                       NULL,
  UTILS_MODFC            VARCHAR2(123 BYTE)         NULL,
  REF_PRODT              NUMBER(10)                 NULL,
  REF_PROFL_COURL        NUMBER(10)                 NULL,
  INDIC_AVERT_AUTR_UNIQ  VARCHAR2(1 BYTE)       DEFAULT 'N'                       NULL
);


Prompt Table SIE_03_JOURN;
CREATE TABLE SIE_03_JOURN
(
  DATE_HEURE  TIMESTAMP(6)                      DEFAULT systimestamp              NULL,
  EXPLI       VARCHAR2(4000 BYTE)                   NULL,
  EREUR       VARCHAR2(500 BYTE)                    NULL,
  PILE_TRACE  VARCHAR2(4000 BYTE)                   NULL,
  TRAVL       VARCHAR2(200 BYTE)                    NULL
);


Prompt Table SIE_03_JOURN_STRUC_APLIC;
CREATE TABLE SIE_03_JOURN_STRUC_APLIC
(
  SEQNC              NUMBER(12)                     NULL,
  REF_DOMN           NUMBER(10)                     NULL,
  STRUC_APLIC        NUMBER(10)                     NULL,
  SEQNC_STRUC_APLIC  NUMBER(10)                     NULL,
  DATE_TIME          DATE                           NULL,
  NUMR_ERR           VARCHAR2(10 BYTE)              NULL,
  ACTIO_JOURN        VARCHAR2(200 BYTE)             NULL,
  DON_NOMNL          VARCHAR2(200 BYTE)             NULL,
  RESLT              VARCHAR2(500 BYTE)             NULL,
  DATE_CREAT         DATE                           NULL,
  UTILS_CREAT        VARCHAR2(123 BYTE)             NULL,
  DATE_MODFC         DATE                           NULL,
  UTILS_MODFC        VARCHAR2(123 BYTE)             NULL
);


Prompt Table SIE_03_LIEN_CLAS_INTER_UTILS;
CREATE TABLE SIE_03_LIEN_CLAS_INTER_UTILS
(
  SEQNC             NUMBER(10)                      NULL,
  REF_CLAS_INTER    NUMBER(10)                      NULL,
  REF_UTILS         NUMBER(10)                      NULL,
  DATE_DEBUT_EFECT  DATE                            NULL,
  DATE_FIN_EFECT    DATE                            NULL,
  DATE_CREAT        DATE                            NULL,
  UTILS_CREAT       VARCHAR2(123 BYTE)              NULL,
  DATE_MODFC        DATE                            NULL,
  UTILS_MODFC       VARCHAR2(123 BYTE)              NULL,
  REF_GROUP_UTILS   NUMBER(10)                      NULL
);


Prompt Table SIE_03_TRACE_EXECT;
CREATE TABLE SIE_03_TRACE_EXECT
(
  UN             VARCHAR2(4000 BYTE)                NULL,
  DEUX           VARCHAR2(4000 BYTE)                NULL,
  DTHR           TIMESTAMP(9)                       NULL,
  UTILS          VARCHAR2(30 BYTE)              DEFAULT user                      NULL,
  SEQNC          NUMBER(10)                         NULL,
  LB             CLOB                               NULL,
  WHO_CALLED_ME  VARCHAR2(4000 BYTE)                NULL,
  PAGE           NUMBER                             NULL,
  APP            NUMBER                             NULL,
  APP_USER       VARCHAR2(30 BYTE)                  NULL,
  FIL            NUMBER(10)                         NULL,
  DUREE          NUMBER(20,3)                       NULL,
  BB             BLOB                               NULL
);


Prompt Table SIE_04_CONTX;
CREATE TABLE SIE_04_CONTX
(
  REF_FIL_ARIAN          NUMBER(10)                 NULL,
  CONTX                  VARCHAR2(30 BYTE)          NULL,
  ACTIO                  VARCHAR2(200 BYTE)         NULL,
  SEQNC_CONTX            NUMBER(10)                 NULL,
  DATE_CREAT             DATE                       NULL,
  UTILS_CREAT            VARCHAR2(123 BYTE)         NULL,
  DATE_MODFC             DATE                       NULL,
  UTILS_MODFC            VARCHAR2(123 BYTE)         NULL,
  CONTX_INTER            VARCHAR2(30 BYTE)          NULL,
  ACTIO_INTER            VARCHAR2(200 BYTE)         NULL,
  SEQNC_CONTX_INTER      NUMBER(10)                 NULL,
  INDIC_IGNOR            VARCHAR2(1 BYTE)           NULL,
  NOM_PROCD_INFOR_SUPLM  VARCHAR2(92 BYTE)          NULL,
  INFOR_SUPLM            VARCHAR2(4000 BYTE)        NULL,
  CONTX_FORMT            VARCHAR2(4000 BYTE)        NULL
);


Prompt Table SIE_04_CONTX_ETEND;
CREATE TABLE SIE_04_CONTX_ETEND
(
  SEQNC        NUMBER(10)                           NULL,
  REF_CONTX    NUMBER(10)                           NULL,
  NOM          VARCHAR2(30 BYTE)                    NULL,
  VALR_NUMBR   NUMBER(10)                           NULL,
  VALR_VARCH   VARCHAR2(4000 BYTE)                  NULL,
  DATE_CREAT   DATE                                 NULL,
  UTILS_CREAT  VARCHAR2(123 BYTE)                   NULL,
  DATE_MODFC   DATE                                 NULL,
  UTILS_MODFC  VARCHAR2(123 BYTE)                   NULL,
  PAGE_CIBLE   VARCHAR2(1 BYTE)                     NULL,
  TYPE_ALIMN   VARCHAR2(3 BYTE)                     NULL,
  TYPE_ELEMN   VARCHAR2(1 BYTE)                     NULL
);


Prompt Table SIE_04_FIL_ARIAN;
CREATE TABLE SIE_04_FIL_ARIAN
(
  SEQNC            NUMBER(10)                       NULL,
  PAGE             NUMBER(10)                       NULL,
  SESSION_ID       NUMBER                           NULL,
  REF_ELEMN_SUP    NUMBER(10)                       NULL,
  LIBL             VARCHAR2(200 BYTE)               NULL,
  TIMST            TIMESTAMP(6)                     NULL,
  DATE_CREAT       DATE                             NULL,
  UTILS_CREAT      VARCHAR2(123 BYTE)               NULL,
  APP_ID           NUMBER                           NULL,
  HASH_DERNR_URL   RAW(16)                          NULL,
  INDIC_AFICH      VARCHAR2(1 BYTE)                 NULL,
  REF_NAVGT_HISTR  NUMBER(10)                       NULL,
  APLIC            NUMBER                           NULL
);


Prompt Table SIE_04_NAVGT_HISTR;
CREATE TABLE SIE_04_NAVGT_HISTR
(
  SEQNC        NUMBER(10)                           NULL,
  REF_UTILS    NUMBER(10)                           NULL,
  DNR_LIBL     VARCHAR2(60 BYTE)                    NULL,
  DNR_URL      VARCHAR2(200 BYTE)                   NULL,
  DNR_ICON     VARCHAR2(200 BYTE)                   NULL,
  DATE_CREAT   DATE                                 NULL,
  UTILS_CREAT  VARCHAR2(123 BYTE)                   NULL,
  DATE_MODFC   DATE                                 NULL,
  UTILS_MODFC  VARCHAR2(123 BYTE)                   NULL
);


Prompt Table SIE_07_AUDIT_STRUC_APLIC;
CREATE TABLE SIE_07_AUDIT_STRUC_APLIC
(
  SEQNC                   NUMBER(16)                NULL,
  REF_UTILS               NUMBER(10)                NULL,
  REF_SEQNC_STRUC_APLIC   NUMBER(10)                NULL,
  DNR_REF_SEQNC_SA_FORMT  VARCHAR2(4000 BYTE)       NULL,
  REF_STRUC_APLIC         NUMBER(10)                NULL,
  REF_ACTIO_AUDIT         NUMBER(10)                NULL,
  REF_PAGE                NUMBER(10)                NULL,
  NATR_AUDIT              VARCHAR2(3 BYTE)          NULL,
  DATE_CREAT              DATE                      NULL,
  UTILS_CREAT             VARCHAR2(123 BYTE)        NULL,
  DATE_MODFC              DATE                      NULL,
  UTILS_MODFC             VARCHAR2(123 BYTE)        NULL,
  REF_DOMN                NUMBER(10)                NULL
);


Prompt Table SIE_07_ETAT_SESN;
CREATE TABLE SIE_07_ETAT_SESN
(
  SEQNC        NUMBER(10)                           NULL,
  SESSION_ID   NUMBER                               NULL,
  NOM          VARCHAR2(60 BYTE)                    NULL,
  VALR         VARCHAR2(4000 BYTE)                  NULL,
  DATE_CREAT   DATE                                 NULL,
  UTILS_CREAT  VARCHAR2(123 BYTE)                   NULL,
  DATE_MODFC   DATE                                 NULL,
  UTILS_MODFC  VARCHAR2(123 BYTE)                   NULL
);


Prompt Table SIE_07_INSTA_SEMPH;
CREATE TABLE SIE_07_INSTA_SEMPH
(
  SEQNC        NUMBER(10)                           NULL,
  REF_SEMPH    NUMBER(10)                           NULL,
  ID_SESN      NUMBER                               NULL,
  DATE_CREAT   DATE                                 NULL,
  UTILS_CREAT  VARCHAR2(123 BYTE)                   NULL,
  INDIC_SEQNC  VARCHAR2(1 BYTE)                     NULL,
  PAGE_PERST   VARCHAR2(500 BYTE)                   NULL
);


Prompt Table SIE_07_SEMPH;
CREATE TABLE SIE_07_SEMPH
(
  SEQNC        NUMBER(10)                           NULL,
  CODE         VARCHAR2(23 BYTE)                    NULL,
  VARBL1       VARCHAR2(200 BYTE)                   NULL,
  VARBL2       VARCHAR2(200 BYTE)                   NULL,
  VARBL3       VARCHAR2(200 BYTE)                   NULL,
  DATE_CREAT   DATE                                 NULL,
  UTILS_CREAT  VARCHAR2(123 BYTE)                   NULL,
  INDIC_EXCLU  VARCHAR2(1 BYTE)                     NULL
);


Prompt Table SIE_07_VALR_AUDIT_STRUC_APLIC;
CREATE TABLE SIE_07_VALR_AUDIT_STRUC_APLIC
(
  SEQNC                  NUMBER(16)                 NULL,
  REF_AUDIT_STRUC_APLIC  NUMBER(10)                 NULL,
  CODE                   VARCHAR2(30 BYTE)          NULL,
  VALR_FORMT             VARCHAR2(4000 BYTE)        NULL,
  DATE_CREAT             DATE                       NULL,
  UTILS_CREAT            VARCHAR2(123 BYTE)         NULL,
  DATE_MODFC             DATE                       NULL,
  UTILS_MODFC            VARCHAR2(123 BYTE)         NULL
);


Prompt Table SIE_11_APLIC;
CREATE TABLE SIE_11_APLIC
(
  SEQNC                      NUMBER(10)             NULL,
  CODE                       VARCHAR2(10 BYTE)      NULL,
  NOM                        VARCHAR2(60 BYTE)      NULL,
  DATE_CREAT                 DATE                   NULL,
  UTILS_CREAT                VARCHAR2(123 BYTE)     NULL,
  DATE_MODFC                 DATE                   NULL,
  UTILS_MODFC                VARCHAR2(123 BYTE)     NULL,
  NUMR_APLIC_APEX            NUMBER                 NULL,
  DATE_DERNR_MAJ_REFRN_APEX  DATE                   NULL,
  REF_VERSN                  NUMBER(10)             NULL,
  INDIC_APLIC_AUTHE          VARCHAR2(1 BYTE)   DEFAULT 'N'                       NULL,
  REF_APLIC_AUTHE            NUMBER(10)             NULL,
  REF_PAGE_CONXN             NUMBER(10)             NULL,
  REF_PRODT                  NUMBER(10)             NULL,
  DNR_REF_PRODT              NUMBER(10)             NULL,
  REF_PAGE_ACUEI             NUMBER(10)             NULL
);


Prompt Table SIE_11_ATRIB_ENTIT;
CREATE TABLE SIE_11_ATRIB_ENTIT
(
  SEQNC              NUMBER(10)                     NULL,
  NOM                VARCHAR2(60 BYTE)              NULL,
  TYPE_DON           VARCHAR2(5 BYTE)               NULL,
  COMPR_MIGRT        VARCHAR2(23 BYTE)              NULL,
  REF_ENTIT          NUMBER(10)                     NULL,
  DATE_CREAT         DATE                           NULL,
  UTILS_CREAT        VARCHAR2(123 BYTE)             NULL,
  DATE_MODFC         DATE                           NULL,
  UTILS_MODFC        VARCHAR2(123 BYTE)             NULL,
  DNR_REF_PRODT      NUMBER(10)                     NULL,
  CODE               VARCHAR2(30 BYTE)              NULL,
  REF_ENTIT_REFRN    NUMBER(10)                     NULL,
  INDIC_NOUVL_ATRIB  VARCHAR2(1 BYTE)           DEFAULT 'O'                       NULL
);


Prompt Table SIE_11_ENTIT;
CREATE TABLE SIE_11_ENTIT
(
  SEQNC                   NUMBER(10)                NULL,
  NOM                     VARCHAR2(60 BYTE)         NULL,
  NOM_TABLE_TEMPR         VARCHAR2(30 BYTE)         NULL,
  NOM_TABLE_EREUR         VARCHAR2(30 BYTE)         NULL,
  INDIC_CREER_OCURN       VARCHAR2(1 BYTE)          NULL,
  INDIC_MODIF_OCURN       VARCHAR2(1 BYTE)          NULL,
  INDIC_SUPRM_OCURN       VARCHAR2(1 BYTE)          NULL,
  REF_VERSN               NUMBER(10)                NULL,
  DATE_CREAT              DATE                      NULL,
  UTILS_CREAT             VARCHAR2(123 BYTE)        NULL,
  DATE_MODFC              DATE                      NULL,
  UTILS_MODFC             VARCHAR2(123 BYTE)        NULL,
  ORDRE_EXECT             NUMBER(10)            DEFAULT 1                         NULL,
  DNR_REF_PRODT           NUMBER(10)                NULL,
  CODE                    VARCHAR2(30 BYTE)         NULL,
  INDIC_FORCE_SELCT       VARCHAR2(1 BYTE)      DEFAULT 'N'                       NULL,
  LONGR_BLOC              NUMBER(5)                 NULL,
  INDIC_NOUVL_ENTIT       VARCHAR2(1 BYTE)      DEFAULT 'O'                       NULL,
  NIV_INCLU_MIGRT         VARCHAR2(23 BYTE)         NULL,
  CONFG_INCLU_MIGRT       VARCHAR2(4000 BYTE)       NULL,
  REF_ATRIB_ENTIT_SUPR    NUMBER(10)                NULL,
  INDIC_EXPOR_TABL_INDEX  VARCHAR2(1 BYTE)      DEFAULT 'O'                       NULL,
  INDIC_SUPRM_DON_PRODT   VARCHAR2(1 BYTE)      DEFAULT 'N'                       NULL
);


Prompt Table SIE_11_PARMT_AFW;
CREATE TABLE SIE_11_PARMT_AFW
(
  SEQNC        NUMBER(10)                           NULL,
  CODE         VARCHAR2(30 BYTE)                    NULL,
  VALR         VARCHAR2(200 BYTE)                   NULL,
  DATE_CREAT   DATE                                 NULL,
  UTILS_CREAT  VARCHAR2(123 BYTE)                   NULL,
  DATE_MODFC   DATE                                 NULL,
  UTILS_MODFC  VARCHAR2(123 BYTE)                   NULL
);


Prompt Table SIE_11_PLUGN;
CREATE TABLE SIE_11_PLUGN
(
  SEQNC        NUMBER(10)                           NULL,
  CODE_INTER   VARCHAR2(5 BYTE)                     NULL,
  NOM          VARCHAR2(200 BYTE)                   NULL,
  UTILS_CREAT  VARCHAR2(123 BYTE)                   NULL,
  DATE_MODFC   DATE                                 NULL,
  UTILS_MODFC  VARCHAR2(123 BYTE)                   NULL,
  DATE_CREAT   DATE                                 NULL,
  DESCR        VARCHAR2(4000 BYTE)                  NULL,
  REF_VERSN    NUMBER(10)                           NULL
);


Prompt Table SIE_11_PRODT;
CREATE TABLE SIE_11_PRODT
(
  SEQNC                         NUMBER(10)          NULL,
  CODE                          VARCHAR2(10 BYTE)     NULL,
  NOM                           VARCHAR2(60 BYTE)     NULL,
  DATE_CREAT                    DATE                NULL,
  UTILS_CREAT                   VARCHAR2(123 BYTE)     NULL,
  DATE_MODFC                    DATE                NULL,
  UTILS_MODFC                   VARCHAR2(123 BYTE)     NULL,
  PROCD_EXPOR_METDN             VARCHAR2(100 BYTE)     NULL,
  TAIL_TABL_EXTRA               NUMBER(10)      DEFAULT 10                        NULL,
  INDIC_EXTRA_TOUT              VARCHAR2(1 BYTE) DEFAULT 'N'     NULL,
  REF_GROUP_UTILS_ADMIN         NUMBER(10)          NULL,
  DOSR_FICHR                    VARCHAR2(200 BYTE)     NULL,
  IDENT_ENVIR                   VARCHAR2(60 BYTE)     NULL,
  REF_VERSN                     NUMBER(10)          NULL,
  MESG_TOUT_DROIT_RESRV         VARCHAR2(150 BYTE)     NULL,
  JQUER_UI_CSS_SCOPE            VARCHAR2(50 BYTE)     NULL,
  INDIC_AFICH_ERR_CODE          VARCHAR2(1 BYTE) DEFAULT 'O'     NULL,
  REF_MESG_SUCS                 NUMBER(10)          NULL,
  REF_MESG_ECHEC                NUMBER(10)          NULL,
  REF_MESG_FETCH                NUMBER(10)          NULL,
  REF_MESG_RANGE_SUPRM          NUMBER(10)          NULL,
  REF_MESG_RANGE_MODF           NUMBER(10)          NULL,
  REF_MESG_RANGE_INSER          NUMBER(10)          NULL,
  REF_MESG_AUCUN_DON_TROUV      NUMBER(10)          NULL,
  REF_MESG_TROP_DON_TROUV       NUMBER(10)          NULL,
  REF_MESG_AUDIT_CREAT          NUMBER(10)          NULL,
  REF_MESG_AUDIT_MODFC          NUMBER(10)          NULL,
  REF_MESG_AUDIT_SUPRS          NUMBER(10)          NULL,
  FONCT_OBTEN_BASE_URL          VARCHAR2(92 BYTE)     NULL,
  REF_APLIC_ACUEI               NUMBER(10)          NULL,
  REF_PAGE_ACUEI                NUMBER(10)          NULL,
  REF_APLIC_COMNT_BOGUE         NUMBER(10)          NULL,
  REF_PAGE_COMNT_BOGUE          NUMBER(10)          NULL,
  INDIC_PAGE_INEXS_MAJ_REFRN    VARCHAR2(1 BYTE) DEFAULT 'N'     NULL,
  PROCD_IMPRE_ENTET_PDF_IR      VARCHAR2(200 BYTE)     NULL,
  PROCD_IMPRE_PIED_PAGE_PDF_IR  VARCHAR2(200 BYTE)     NULL,
  PROCD_PLPDF_COULR             VARCHAR2(200 BYTE)     NULL,
  COMPT_GENRL                   NUMBER(6)       DEFAULT 0                         NULL
);


Prompt Table SIE_11_PRODT_LANG;
CREATE TABLE SIE_11_PRODT_LANG
(
  SEQNC        NUMBER(10)                           NULL,
  REF_PRODT    NUMBER(10)                           NULL,
  REF_LANG     NUMBER(10)                           NULL,
  DATE_CREAT   DATE                                 NULL,
  UTILS_CREAT  VARCHAR2(123 BYTE)                   NULL,
  DATE_MODFC   DATE                                 NULL,
  UTILS_MODFC  VARCHAR2(123 BYTE)                   NULL
);


Prompt Table SIE_11_PRODT_RESRC;
CREATE TABLE SIE_11_PRODT_RESRC
(
  SEQNC            NUMBER(10)                       NULL,
  REF_PRODT        NUMBER(10)                       NULL,
  REF_RESRC        NUMBER(10)                       NULL,
  REF_FORMT        NUMBER(10)                       NULL,
  REF_CONDT_EXECT  NUMBER(10)                       NULL,
  DATE_CREAT       DATE                             NULL,
  UTILS_CREAT      VARCHAR2(123 BYTE)               NULL,
  DATE_MODFC       DATE                             NULL,
  UTILS_MODFC      VARCHAR2(123 BYTE)               NULL,
  REF_PLUGN        NUMBER(10)                       NULL
);


Prompt Table SIE_11_UTILS;
CREATE TABLE SIE_11_UTILS
(
  SEQNC        NUMBER(10)                           NULL,
  REF_PRODT    NUMBER(10)                           NULL,
  REF_UTILS    NUMBER(10)                           NULL,
  ROLE         VARCHAR2(5 BYTE)                     NULL,
  DATE_CREAT   DATE                                 NULL,
  UTILS_CREAT  VARCHAR2(123 BYTE)                   NULL,
  DATE_MODFC   DATE                                 NULL,
  UTILS_MODFC  VARCHAR2(123 BYTE)                   NULL
);


Prompt Table SIE_11_VERSN;
CREATE TABLE SIE_11_VERSN
(
  SEQNC             NUMBER(10)                      NULL,
  NUMR_VERSN_1      NUMBER(2)                       NULL,
  NUMR_VERSN_2      NUMBER(2)                       NULL,
  NUMR_VERSN_3      NUMBER(2)                       NULL,
  NUMR_VERSN_4      NUMBER(2)                       NULL,
  DATE_CREAT        DATE                            NULL,
  UTILS_CREAT       VARCHAR2(123 BYTE)              NULL,
  DATE_MODFC        DATE                            NULL,
  UTILS_MODFC       VARCHAR2(123 BYTE)              NULL,
  REF_PRODT         NUMBER(10)                      NULL,
  INDIC_DOCMN_VERL  VARCHAR2(1 BYTE)            DEFAULT 'O'                       NULL,
  NOM               VARCHAR2(30 BYTE)               NULL,
  REF_PLUGN         NUMBER(10)                      NULL,
  CODE              VARCHAR2(23 BYTE)               NULL,
  DNR_REF_PRODT     NUMBER(10)                      NULL,
  REF_APLIC         NUMBER(10)                      NULL,
  DNR_REF_APLIC     NUMBER(10)                      NULL
);


Prompt Table SIE_12_ACTIO_AUDIT;
CREATE TABLE SIE_12_ACTIO_AUDIT
(
  SEQNC            NUMBER(10)                       NULL,
  REF_STRUC_APLIC  NUMBER(10)                       NULL,
  DNR_REF_PRODT    NUMBER(10)                       NULL,
  CODE             VARCHAR2(23 BYTE)                NULL,
  NOM              VARCHAR2(60 BYTE)                NULL,
  REF_MESG         NUMBER(10)                       NULL,
  DESCR            VARCHAR2(4000 BYTE)              NULL,
  DATE_CREAT       DATE                             NULL,
  UTILS_CREAT      VARCHAR2(123 BYTE)               NULL,
  DATE_MODFC       DATE                             NULL,
  UTILS_MODFC      VARCHAR2(123 BYTE)               NULL
);


Prompt Table SIE_12_ARBRE;
CREATE TABLE SIE_12_ARBRE
(
  SEQNC         NUMBER(10)                          NULL,
  NOEUD_ACTIF   VARCHAR2(60 BYTE)                   NULL,
  REF_SESN      NUMBER                              NULL,
  DATE_CREAT    DATE                                NULL,
  UTILS_CREAT   VARCHAR2(123 BYTE)                  NULL,
  DATE_MODFC    DATE                                NULL,
  UTILS_MODFC   VARCHAR2(123 BYTE)                  NULL,
  INDIC_RAFRC   VARCHAR2(1 BYTE)                DEFAULT 'N'                       NULL,
  ID_APEX_REGN  NUMBER                              NULL
);


Prompt Table SIE_12_ARBRE_NOEUD;
CREATE TABLE SIE_12_ARBRE_NOEUD
(
  SEQNC        NUMBER(10)                           NULL,
  REF_ARBRE    NUMBER(10)                           NULL,
  NOEUD_OUVER  VARCHAR2(60 BYTE)                    NULL,
  DATE_CREAT   DATE                                 NULL,
  UTILS_CREAT  VARCHAR2(123 BYTE)                   NULL,
  DATE_MODFC   DATE                                 NULL,
  UTILS_MODFC  VARCHAR2(123 BYTE)                   NULL
);


Prompt Table SIE_12_ATRIB_STRUC_APLIC;
CREATE TABLE SIE_12_ATRIB_STRUC_APLIC
(
  SEQNC                  NUMBER(10)                 NULL,
  NOM_COLN               VARCHAR2(50 BYTE)          NULL,
  NOM_FONCT              VARCHAR2(50 BYTE)          NULL,
  REF_DV_NATR_INFOR      NUMBER(10)                 NULL,
  INDIC_VALID            VARCHAR2(1 BYTE)       DEFAULT 'O'                       NULL,
  REF_STRUC_APLIC        NUMBER(10)                 NULL,
  REF_ATRIB_STRUC_APLIC  NUMBER(10)                 NULL,
  INDIC_DESTN            VARCHAR2(1 BYTE)       DEFAULT 'N'                       NULL,
  DATE_CREAT             DATE                       NULL,
  UTILS_CREAT            VARCHAR2(123 BYTE)         NULL,
  DATE_MODFC             DATE                       NULL,
  UTILS_MODFC            VARCHAR2(123 BYTE)         NULL,
  DNR_REF_PRODT          NUMBER(10)                 NULL
);


Prompt Table SIE_12_DEFNT_ACCES;
CREATE TABLE SIE_12_DEFNT_ACCES
(
  SEQNC            NUMBER(10)                       NULL,
  REF_GROUP_UTILS  NUMBER(10)                       NULL,
  REF_UTILS        NUMBER(10)                       NULL,
  INDIC_ACCES      VARCHAR2(5 BYTE)                 NULL,
  INDIC_MODFC      VARCHAR2(5 BYTE)                 NULL,
  INDIC_SUPRS      VARCHAR2(5 BYTE)                 NULL,
  INDIC_CREAT      VARCHAR2(5 BYTE)                 NULL,
  DATE_CREAT       DATE                             NULL,
  UTILS_CREAT      VARCHAR2(123 BYTE)               NULL,
  DATE_MODFC       DATE                             NULL,
  UTILS_MODFC      VARCHAR2(123 BYTE)               NULL,
  REF_OPERT        NUMBER(10)                       NULL,
  REF_STRUC_APLIC  NUMBER(10)                       NULL,
  DNR_REF_PRODT    NUMBER(10)                       NULL
);


Prompt Table SIE_12_DOMN;
CREATE TABLE SIE_12_DOMN
(
  SEQNC                           NUMBER(10)        NULL,
  CODE                            VARCHAR2(30 BYTE)     NULL,
  NOM                             VARCHAR2(60 BYTE)     NULL,
  DESCR                           VARCHAR2(4000 BYTE)     NULL,
  DATE_CREAT                      DATE              NULL,
  UTILS_CREAT                     VARCHAR2(123 BYTE)     NULL,
  DATE_MODFC                      DATE              NULL,
  UTILS_MODFC                     VARCHAR2(123 BYTE)     NULL,
  TYPE_TRAVL_DEFT                 NUMBER(10)        NULL,
  REF_PROFL_COURL_NOTFC           NUMBER(10)        NULL,
  REF_PROFL_SMS_NOTFC             NUMBER(10)        NULL,
  REF_COMPT_AXIAT_DEFT            NUMBER(10)        NULL,
  REF_MODL_RECHR_DEFT             NUMBER(10)        NULL,
  PROCD_AUTHE_EXTER_AFW           VARCHAR2(92 BYTE)     NULL,
  INDIC_DEMND_ACTIV_COMPT_UTILS   VARCHAR2(1 BYTE) DEFAULT 'N'     NULL,
  PROCD_VALD_NIV_SECRT_MOT_PASSE  VARCHAR2(92 BYTE) DEFAULT 'sie_12_mot_passe_pkg.valdr_secrt_mot_passe'     NULL
);


Prompt Table SIE_12_DOMN_FONCT;
CREATE TABLE SIE_12_DOMN_FONCT
(
  SEQNC        NUMBER(10)                           NULL,
  REF_FONCT    NUMBER(10)                           NULL,
  REF_DOMN     NUMBER(10)                           NULL,
  INDIC_ACTIF  VARCHAR2(1 BYTE)                 DEFAULT 'O'                       NULL,
  DATE_CREAT   DATE                                 NULL,
  UTILS_CREAT  VARCHAR2(123 BYTE)                   NULL,
  DATE_MODFC   DATE                                 NULL,
  UTILS_MODFC  VARCHAR2(123 BYTE)                   NULL
);


Prompt Table SIE_12_DOMN_SERVR_LDAP;
CREATE TABLE SIE_12_DOMN_SERVR_LDAP
(
  SEQNC             NUMBER(10)                      NULL,
  REF_DOMN          NUMBER(10)                      NULL,
  REF_SERVR_LDAP    NUMBER(10)                      NULL,
  DATE_DEBUT_EFECT  DATE                            NULL,
  DATE_FIN_EFECT    DATE                            NULL,
  DATE_CREAT        DATE                            NULL,
  UTILS_CREAT       VARCHAR2(123 BYTE)              NULL,
  DATE_MODFC        DATE                            NULL,
  UTILS_MODFC       VARCHAR2(123 BYTE)              NULL
);


Prompt Table SIE_12_DOMN_UTILS;
CREATE TABLE SIE_12_DOMN_UTILS
(
  SEQNC             NUMBER(10)                      NULL,
  REF_UTILS         NUMBER(10)                      NULL,
  REF_DOMN          NUMBER(10)                      NULL,
  DATE_DEBUT_EFECT  DATE                            NULL,
  DATE_FIN_EFECT    DATE                            NULL,
  DATE_CREAT        DATE                            NULL,
  UTILS_CREAT       VARCHAR2(123 BYTE)              NULL,
  DATE_MODFC        DATE                            NULL,
  UTILS_MODFC       VARCHAR2(123 BYTE)              NULL
);


Prompt Table SIE_12_EVOLT_STAT;
CREATE TABLE SIE_12_EVOLT_STAT
(
  SEQNC           NUMBER(10)                        NULL,
  REF_STAT        NUMBER(10)                        NULL,
  REF_STAT_EVOLT  NUMBER(10)                        NULL,
  DATE_CREAT      DATE                              NULL,
  UTILS_CREAT     VARCHAR2(123 BYTE)                NULL,
  DATE_MODFC      DATE                              NULL,
  UTILS_MODFC     VARCHAR2(123 BYTE)                NULL,
  INDIC_CODE      VARCHAR2(1 BYTE)                  NULL,
  DNR_REF_PRODT   NUMBER(10)                        NULL
);


Prompt Table SIE_12_FAVR;
CREATE TABLE SIE_12_FAVR
(
  SEQNC                  NUMBER(10)                 NULL,
  REF_STRUC_APLIC        NUMBER(10)                 NULL,
  REF_SEQNC_STRUC_APLIC  NUMBER(10)                 NULL,
  REF_UTILS              NUMBER(10)                 NULL,
  DATE_CREAT             DATE                       NULL,
  UTILS_CREAT            VARCHAR2(123 BYTE)         NULL,
  DATE_MODFC             DATE                       NULL,
  UTILS_MODFC            VARCHAR2(123 BYTE)         NULL
);


Prompt Table SIE_12_FONCT;
CREATE TABLE SIE_12_FONCT
(
  SEQNC          NUMBER(10)                         NULL,
  REF_PRODT      NUMBER(10)                         NULL,
  CODE           VARCHAR2(23 BYTE)                  NULL,
  NOM            VARCHAR2(60 BYTE)                  NULL,
  DESCR          VARCHAR2(4000 BYTE)                NULL,
  DATE_CREAT     DATE                               NULL,
  UTILS_CREAT    VARCHAR2(123 BYTE)                 NULL,
  DATE_MODFC     DATE                               NULL,
  UTILS_MODFC    VARCHAR2(123 BYTE)                 NULL,
  DNR_REF_PRODT  NUMBER(10)                         NULL
);


Prompt Table SIE_12_FONCT_STRUC_APLIC;
CREATE TABLE SIE_12_FONCT_STRUC_APLIC
(
  SEQNC            NUMBER(10)                       NULL,
  REF_FONCT        NUMBER(10)                       NULL,
  REF_STRUC_APLIC  NUMBER(10)                       NULL,
  DNR_REF_PRODT    NUMBER(10)                       NULL,
  DATE_CREAT       DATE                             NULL,
  UTILS_CREAT      VARCHAR2(123 BYTE)               NULL,
  DATE_MODFC       DATE                             NULL,
  UTILS_MODFC      VARCHAR2(123 BYTE)               NULL
);


Prompt Table SIE_12_GROUP_STAT;
CREATE TABLE SIE_12_GROUP_STAT
(
  SEQNC          NUMBER(10)                         NULL,
  REF_PRODT      NUMBER(10)                         NULL,
  CODE           VARCHAR2(23 BYTE)                  NULL,
  NOM            VARCHAR2(60 BYTE)                  NULL,
  DESCR          VARCHAR2(4000 BYTE)                NULL,
  DATE_CREAT     DATE                               NULL,
  UTILS_CREAT    VARCHAR2(123 BYTE)                 NULL,
  DATE_MODFC     DATE                               NULL,
  UTILS_MODFC    VARCHAR2(123 BYTE)                 NULL,
  DNR_REF_PRODT  NUMBER(10)                         NULL
);


Prompt Table SIE_12_GROUP_UTILS;
CREATE TABLE SIE_12_GROUP_UTILS
(
  SEQNC                    NUMBER(10)               NULL,
  NOM                      VARCHAR2(100 BYTE)       NULL,
  DESCR                    VARCHAR2(400 BYTE)       NULL,
  DATE_CREAT               DATE                     NULL,
  UTILS_CREAT              VARCHAR2(123 BYTE)       NULL,
  DATE_MODFC               DATE                     NULL,
  UTILS_MODFC              VARCHAR2(123 BYTE)       NULL,
  REF_PRODT                NUMBER(10)               NULL,
  CODE                     VARCHAR2(29 BYTE)        NULL,
  INDIC_IGNOR_GROUP_ADMIN  VARCHAR2(1 BYTE)     DEFAULT 'N'                       NULL,
  INDIC_SYSTM              VARCHAR2(1 BYTE)     DEFAULT 'N'                       NULL,
  DNR_REF_PRODT            NUMBER(10)               NULL,
  REF_DOMN                 NUMBER(10)               NULL,
  INDIC_ACCES_GLOBL        VARCHAR2(1 BYTE)     DEFAULT 'N'                       NULL,
  REF_FONCT                NUMBER(10)               NULL
);


Prompt Table SIE_12_GR_UT_OPERT_OPTIO_DOMN;
CREATE TABLE SIE_12_GR_UT_OPERT_OPTIO_DOMN
(
  SEQNC            NUMBER(10)                       NULL,
  REF_GROUP_UTILS  NUMBER(10)                       NULL,
  REF_OPERT        NUMBER(10)                       NULL,
  REF_OPERT_OPTIO  NUMBER(10)                       NULL,
  REF_DOMN         NUMBER(10)                       NULL,
  DATE_CREAT       DATE                             NULL,
  UTILS_CREAT      VARCHAR2(123 BYTE)               NULL,
  DATE_MODFC       DATE                             NULL,
  UTILS_MODFC      VARCHAR2(123 BYTE)               NULL
);


Prompt Table SIE_12_HISTR_ACCES;
CREATE TABLE SIE_12_HISTR_ACCES
(
  SEQNC              NUMBER(10)                     NULL,
  REF_UTILS          NUMBER(10)                     NULL,
  DATE_EVENM         DATE                           NULL,
  REF_DV_TYPE_EVENM  NUMBER(10)                     NULL,
  DATE_CREAT         DATE                           NULL,
  UTILS_CREAT        VARCHAR2(123 BYTE)             NULL,
  DATE_MODFC         DATE                           NULL,
  UTILS_MODFC        VARCHAR2(123 BYTE)             NULL,
  ADRES_IP           VARCHAR2(15 BYTE)              NULL,
  REF_UTILS_POUR     NUMBER(10)                     NULL
);


Prompt Table SIE_12_LIEN_GROUP_UTILS;
CREATE TABLE SIE_12_LIEN_GROUP_UTILS
(
  SEQNC                NUMBER(10)                   NULL,
  REF_GROUP            NUMBER(10)                   NULL,
  REF_UTILS            NUMBER(10)                   NULL,
  DATE_DEBUT_EFECT     DATE                     DEFAULT NULL                      NULL,
  DATE_FIN_EFECT       DATE                         NULL,
  DATE_CREAT           DATE                         NULL,
  UTILS_CREAT          VARCHAR2(123 BYTE)           NULL,
  DATE_MODFC           DATE                         NULL,
  UTILS_MODFC          VARCHAR2(123 BYTE)           NULL,
  REF_GROUP_UTILS_LIE  NUMBER(10)                   NULL,
  DNR_REF_PRODT        NUMBER(10)                   NULL,
  REF_DOMN             NUMBER(10)                   NULL
);


Prompt Table SIE_12_LIEN_STRUC;
CREATE TABLE SIE_12_LIEN_STRUC
(
  SEQNC             NUMBER(10)                      NULL,
  REF_STRUC_ADMIN   NUMBER(10)                      NULL,
  DATE_DEBUT_EFECT  DATE                            NULL,
  DATE_FIN_EFECT    DATE                            NULL,
  DATE_CREAT        DATE                            NULL,
  UTILS_CREAT       VARCHAR2(123 BYTE)              NULL,
  DATE_MODFC        DATE                            NULL,
  UTILS_MODFC       VARCHAR2(123 BYTE)              NULL,
  REF_STRUC_LIE     NUMBER(10)                      NULL
);


Prompt Table SIE_12_MEMBR_STRUC;
CREATE TABLE SIE_12_MEMBR_STRUC
(
  SEQNC             NUMBER(10)                      NULL,
  REF_UTILS         NUMBER(10)                      NULL,
  REF_STRUC_ADMIN   NUMBER(10)                      NULL,
  DATE_DEBUT_EFECT  DATE                            NULL,
  DATE_FIN_EFECT    DATE                            NULL,
  DATE_CREAT        DATE                            NULL,
  UTILS_CREAT       VARCHAR2(123 BYTE)              NULL,
  DATE_MODFC        DATE                            NULL,
  UTILS_MODFC       VARCHAR2(123 BYTE)              NULL
);


Prompt Table SIE_12_REQT_INTER_UTILS;
CREATE TABLE SIE_12_REQT_INTER_UTILS
(
  SEQNC                        NUMBER(10)           NULL,
  IDENT                        RAW(16)              NULL,
  REF_UTILS                    NUMBER(10)           NULL,
  REF_DV_TYPE_REQT_INTER       NUMBER(10)           NULL,
  DATE_DEBUT_EFECT             DATE                 NULL,
  DATE_FIN_EFECT               DATE                 NULL,
  DATE_CREAT                   DATE                 NULL,
  UTILS_CREAT                  VARCHAR2(123 BYTE)     NULL,
  DATE_MODFC                   DATE                 NULL,
  UTILS_MODFC                  VARCHAR2(123 BYTE)     NULL,
  REF_DOMN                     NUMBER(10)           NULL,
  REF_PRODT                    NUMBER(10)           NULL,
  NUMR_APLIC_APEX              NUMBER               NULL,
  NUMR_PAGE_APEX               NUMBER               NULL,
  DATE_TRAIT                   DATE                 NULL,
  PROCD_PERSN_URL_APRES_AUTHE  VARCHAR2(92 BYTE)     NULL
);


Prompt Table SIE_12_SERVR_LDAP;
CREATE TABLE SIE_12_SERVR_LDAP
(
  SEQNC        NUMBER(10)                           NULL,
  ADRES        VARCHAR2(200 BYTE)                   NULL,
  PORT         NUMBER(10)                           NULL,
  DATE_CREAT   DATE                                 NULL,
  UTILS_CREAT  VARCHAR2(123 BYTE)                   NULL,
  DATE_MODFC   DATE                                 NULL,
  UTILS_MODFC  VARCHAR2(123 BYTE)                   NULL,
  BASE_DN      VARCHAR2(400 BYTE)                   NULL,
  UTILS_CN     VARCHAR2(400 BYTE)                   NULL,
  MOT_PASSE    VARCHAR2(50 BYTE)                    NULL
);


Prompt Table SIE_12_SESN;
CREATE TABLE SIE_12_SESN
(
  ID_SESN      NUMBER                               NULL,
  APP_USER     VARCHAR2(30 BYTE)                    NULL,
  REF_ID_SESN  NUMBER                               NULL,
  REF_LANG     NUMBER(10)                           NULL
);


Prompt Table SIE_12_STAT;
CREATE TABLE SIE_12_STAT
(
  SEQNC             NUMBER(10)                      NULL,
  REF_STRUC_APLIC   NUMBER(10)                      NULL,
  ORDRE             NUMBER(10)                      NULL,
  CODE              VARCHAR2(23 BYTE)               NULL,
  NOM               VARCHAR2(60 BYTE)               NULL,
  DESCR             VARCHAR2(4000 BYTE)             NULL,
  DATE_CREAT        DATE                            NULL,
  UTILS_CREAT       VARCHAR2(123 BYTE)              NULL,
  DATE_MODFC        DATE                            NULL,
  INDIC_INITL       VARCHAR2(1 BYTE)            DEFAULT 'N'                       NULL,
  UTILS_MODFC       VARCHAR2(123 BYTE)              NULL,
  INDIC_STAT_UTILS  VARCHAR2(1 BYTE)            DEFAULT 'O'                       NULL,
  REF_GROUP_STAT    NUMBER(10)                      NULL,
  DNR_REF_PRODT     NUMBER(10)                      NULL
);


Prompt Table SIE_12_STRUC_ADMIN;
CREATE TABLE SIE_12_STRUC_ADMIN
(
  SEQNC           NUMBER(10)                        NULL,
  NOM             VARCHAR2(60 BYTE)                 NULL,
  INDIC_DEFT      VARCHAR2(1 BYTE)                  NULL,
  DATE_CREAT      DATE                              NULL,
  UTILS_CREAT     VARCHAR2(123 BYTE)                NULL,
  DATE_MODFC      DATE                              NULL,
  UTILS_MODFC     VARCHAR2(123 BYTE)                NULL,
  REF_TYPE_STRUC  NUMBER(10)                        NULL,
  REF_RESPN       NUMBER(10)                        NULL,
  DEBUT_EFECT     DATE                              NULL,
  FIN_EFECT       DATE                              NULL,
  REF_DOMN        NUMBER(10)                        NULL
);


Prompt Table SIE_12_STRUC_APLIC;
CREATE TABLE SIE_12_STRUC_APLIC
(
  SEQNC                NUMBER(10)                   NULL,
  NOM                  VARCHAR2(100 BYTE)           NULL,
  DESCR                VARCHAR2(200 BYTE)           NULL,
  REF_PRODT            NUMBER(10)                   NULL,
  DATE_CREAT           DATE                         NULL,
  UTILS_CREAT          VARCHAR2(123 BYTE)           NULL,
  DATE_MODFC           DATE                         NULL,
  UTILS_MODFC          VARCHAR2(123 BYTE)           NULL,
  CODE                 VARCHAR2(23 BYTE)            NULL,
  REF_MESG_ERR_SUPRS   NUMBER(10)                   NULL,
  INDIC_EXTRA_TOUT     VARCHAR2(2 BYTE)         DEFAULT 'HE'                      NULL,
  TAIL_TABL_EXTRA      NUMBER(10)                   NULL,
  NOM_STRUC_ACCES_DON  VARCHAR2(30 BYTE)            NULL,
  REF_PAGE_LISTE       NUMBER(10)                   NULL,
  REF_PAGE_FORML       NUMBER(10)                   NULL,
  NOM_PACKG            VARCHAR2(30 BYTE)            NULL,
  DNR_REF_PRODT        NUMBER(10)                   NULL,
  INDIC_DISPN_DOCMN    VARCHAR2(1 BYTE)         DEFAULT 'N'                       NULL,
  NOM_SCHEM            VARCHAR2(30 BYTE)            NULL
);


Prompt Table SIE_12_STRUC_APLIC_DESTN;
CREATE TABLE SIE_12_STRUC_APLIC_DESTN
(
  SEQNC            NUMBER(10)                       NULL,
  REF_STRUC_APLIC  NUMBER(10)                       NULL,
  UTILS_CREAT      VARCHAR2(123 BYTE)               NULL,
  DATE_CREAT       DATE                             NULL,
  UTILS_MODFC      VARCHAR2(123 BYTE)               NULL,
  DATE_MODFC       DATE                             NULL,
  REF_DESTN        NUMBER(10)                       NULL
);


Prompt Table SIE_12_STRUC_APLIC_LANG;
CREATE TABLE SIE_12_STRUC_APLIC_LANG
(
  SEQNC            NUMBER(10)                       NULL,
  REF_STRUC_APLIC  NUMBER(10)                       NULL,
  ADJEC_DEMNS      VARCHAR2(10 BYTE)                NULL,
  NOM              VARCHAR2(255 BYTE)               NULL,
  REF_LANG         NUMBER(10)                       NULL,
  DATE_CREAT       DATE                             NULL,
  UTILS_CREAT      VARCHAR2(123 BYTE)               NULL,
  DATE_MODFC       DATE                             NULL,
  UTILS_MODFC      VARCHAR2(123 BYTE)               NULL,
  DESCR            VARCHAR2(4000 BYTE)              NULL,
  DNR_REF_PRODT    NUMBER(10)                       NULL
);


Prompt Table SIE_12_STRUC_APLIC_SUIVI;
CREATE TABLE SIE_12_STRUC_APLIC_SUIVI
(
  SEQNC              NUMBER(10)                     NULL,
  REF_STRUC_APLIC    NUMBER(10)                     NULL,
  REF_SUIVI          NUMBER(10)                     NULL,
  DATE_CREAT         DATE                           NULL,
  UTILS_CREAT        VARCHAR2(123 BYTE)             NULL,
  DATE_MODFC         DATE                           NULL,
  UTILS_MODFC        VARCHAR2(123 BYTE)             NULL,
  NOM_PERSN          VARCHAR2(60 BYTE)              NULL,
  INDIC_CREAT_INITL  VARCHAR2(1 BYTE)               NULL,
  SEQNC_PRESN        NUMBER(4)                      NULL,
  REF_SUCRS_IMPLA    NUMBER(10)                     NULL
);


Prompt Table SIE_12_TYPE_STRUC;
CREATE TABLE SIE_12_TYPE_STRUC
(
  SEQNC        NUMBER(10)                           NULL,
  CODE         VARCHAR2(20 BYTE)                    NULL,
  NOM          VARCHAR2(100 BYTE)                   NULL,
  DESCR        VARCHAR2(2000 BYTE)                  NULL,
  DATE_CREAT   DATE                                 NULL,
  UTILS_CREAT  VARCHAR2(123 BYTE)                   NULL,
  DATE_MODFC   DATE                                 NULL,
  UTILS_MODFC  VARCHAR2(123 BYTE)                   NULL,
  REF_DOMN     NUMBER(10)                           NULL
);


Prompt Table SIE_12_UTILS;
CREATE TABLE SIE_12_UTILS
(
  SEQNC                  NUMBER(10)                 NULL,
  NOM                    VARCHAR2(60 BYTE)          NULL,
  PRENM                  VARCHAR2(60 BYTE)          NULL,
  CODE_UTILS             VARCHAR2(30 BYTE)          NULL,
  MOT_PASSE              RAW(2000)                  NULL,
  DATE_EXPIR             DATE                       NULL,
  INDIC_VERL             VARCHAR2(1 BYTE)           NULL,
  INDIC_CHANG_MOT_PASSE  VARCHAR2(1 BYTE)           NULL,
  DATE_CREAT             DATE                       NULL,
  UTILS_CREAT            VARCHAR2(123 BYTE)         NULL,
  DATE_MODFC             DATE                       NULL,
  UTILS_MODFC            VARCHAR2(123 BYTE)         NULL,
  COURL                  VARCHAR2(200 BYTE)         NULL,
  DERNR_PRODT_ACCES      VARCHAR2(23 BYTE)          NULL,
  INDIC_ACTIF            VARCHAR2(1 BYTE)       DEFAULT 'N'                       NULL,
  DERNR_DOMN_ACCES       VARCHAR2(23 BYTE)          NULL,
  REF_DV_COMPL_MAXM      NUMBER(10)                 NULL,
  CODE_UTILS_BASE_DON    VARCHAR2(30 BYTE)          NULL,
  PARMT_AUTHE_EXTER_AFW  VARCHAR2(400 BYTE)         NULL
);


Prompt Table SIE_13_CONDT_EXECT;
CREATE TABLE SIE_13_CONDT_EXECT
(
  SEQNC              NUMBER(10)                     NULL,
  CODE               VARCHAR2(23 BYTE)              NULL,
  NOM                VARCHAR2(60 BYTE)              NULL,
  DESCR              VARCHAR2(4000 BYTE)            NULL,
  ENONC_CONDT_PLSQL  VARCHAR2(4000 BYTE)            NULL,
  DATE_CREAT         DATE                           NULL,
  UTILS_CREAT        VARCHAR2(123 BYTE)             NULL,
  DATE_MODFC         DATE                           NULL,
  UTILS_MODFC        VARCHAR2(123 BYTE)             NULL
);


Prompt Table SIE_13_CONDT_PILTB;
CREATE TABLE SIE_13_CONDT_PILTB
(
  SEQNC                NUMBER(10)                   NULL,
  REF_PAGE             NUMBER(10)                   NULL,
  CODE                 VARCHAR2(23 BYTE)            NULL,
  NOM                  VARCHAR2(60 BYTE)            NULL,
  DESCR                VARCHAR2(2000 BYTE)          NULL,
  CONDT                VARCHAR2(4000 BYTE)          NULL,
  DATE_CREAT           DATE                         NULL,
  UTILS_CREAT          VARCHAR2(123 BYTE)           NULL,
  DATE_MODFC           DATE                         NULL,
  UTILS_MODFC          VARCHAR2(123 BYTE)           NULL,
  REF_PAGE_ITEM_FOCUS  NUMBER(10)                   NULL,
  DNR_REF_APLIC        NUMBER(10)                   NULL
);


Prompt Table SIE_13_DOSR_VIRTL;
CREATE TABLE SIE_13_DOSR_VIRTL
(
  SEQNC          NUMBER(10)                         NULL,
  REF_PRODT      NUMBER(10)                         NULL,
  CODE           VARCHAR2(23 BYTE)                  NULL,
  NOM            VARCHAR2(60 BYTE)                  NULL,
  DESCR          VARCHAR2(4000 BYTE)                NULL,
  DATE_CREAT     DATE                               NULL,
  UTILS_CREAT    VARCHAR2(123 BYTE)                 NULL,
  DATE_MODFC     DATE                               NULL,
  UTILS_MODFC    VARCHAR2(123 BYTE)                 NULL,
  DNR_REF_PRODT  NUMBER(10)                         NULL
);


Prompt Table SIE_13_EMPLA_DOSR_VIRTL;
CREATE TABLE SIE_13_EMPLA_DOSR_VIRTL
(
  SEQNC           NUMBER(10)                        NULL,
  REF_DOSR_VIRTL  NUMBER(10)                        NULL,
  REF_VERSN       NUMBER(10)                        NULL,
  EMPLA           VARCHAR2(100 BYTE)                NULL,
  DATE_CREAT      DATE                              NULL,
  UTILS_CREAT     VARCHAR2(123 BYTE)                NULL,
  DATE_MODFC      DATE                              NULL,
  UTILS_MODFC     VARCHAR2(123 BYTE)                NULL,
  DNR_REF_PRODT   NUMBER(10)                        NULL
);


Prompt Table SIE_13_EXPOR_APLIC;
CREATE TABLE SIE_13_EXPOR_APLIC
(
  SEQNC                   NUMBER(10)                NULL,
  REF_SESN                NUMBER                    NULL,
  REF_APLIC               NUMBER(10)                NULL,
  INDIC_MAJ_REFRN         VARCHAR2(1 BYTE)      DEFAULT 'N'                       NULL,
  NUMR_APLIC_CIBLE        NUMBER                    NULL,
  INDIC_AJOUT_APLIC_APEX  VARCHAR2(1 BYTE)      DEFAULT 'O'                       NULL
);


Prompt Table SIE_13_EXPOR_PAGE;
CREATE TABLE SIE_13_EXPOR_PAGE
(
  REF_PAGE  NUMBER(10)                              NULL,
  REF_SESN  NUMBER                                  NULL,
  SEQNC     NUMBER(10)                              NULL
);


Prompt Table SIE_13_FORMT_RESRC;
CREATE TABLE SIE_13_FORMT_RESRC
(
  SEQNC           NUMBER(10)                        NULL,
  CODE            VARCHAR2(23 BYTE)                 NULL,
  REF_PRODT       NUMBER(10)                        NULL,
  DESCR           VARCHAR2(4000 BYTE)               NULL,
  REF_TYPE_FICHR  NUMBER(10)                        NULL,
  LARGR           NUMBER(4)                         NULL,
  HAUTR           NUMBER(4)                         NULL,
  DATE_CREAT      DATE                              NULL,
  UTILS_CREAT     VARCHAR2(123 BYTE)                NULL,
  DATE_MODFC      DATE                              NULL,
  UTILS_MODFC     VARCHAR2(123 BYTE)                NULL,
  NOM             VARCHAR2(60 BYTE)                 NULL,
  DNR_REF_PRODT   NUMBER(10)                        NULL
);


Prompt Table SIE_13_INSTA_PREFR;
CREATE TABLE SIE_13_INSTA_PREFR
(
  SEQNC            NUMBER(10)                       NULL,
  REF_PREFR        NUMBER(10)                       NULL,
  REF_UTILS        NUMBER(10)                       NULL,
  REF_SESN         NUMBER                           NULL,
  VALR             VARCHAR2(200 BYTE)               NULL,
  DATE_CREAT       DATE                             NULL,
  UTILS_CREAT      VARCHAR2(123 BYTE)               NULL,
  DATE_MODFC       DATE                             NULL,
  UTILS_MODFC      VARCHAR2(123 BYTE)               NULL,
  REF_STRUC_APLIC  NUMBER(10)                       NULL
);


Prompt Table SIE_13_ITEM_MENU;
CREATE TABLE SIE_13_ITEM_MENU
(
  SEQNC                          NUMBER(10)         NULL,
  CODE                           VARCHAR2(23 BYTE)     NULL,
  NOM                            VARCHAR2(60 BYTE)     NULL,
  DESCR                          VARCHAR2(2000 BYTE)     NULL,
  AIDE_INSTA                     VARCHAR2(2000 BYTE)     NULL,
  TITRE_AIDE_INSTA               VARCHAR2(60 BYTE)     NULL,
  ORDRE_PRESN                    NUMBER             NULL,
  REF_PAGE                       NUMBER(10)         NULL,
  ICONE                          VARCHAR2(1000 BYTE)     NULL,
  EFACR_CACHE                    VARCHAR2(1000 BYTE)     NULL,
  REF_MENU                       NUMBER(10)         NULL,
  REF_DV_VALR_REQST              NUMBER(10)         NULL,
  FORML_VALR_REQST               VARCHAR2(4000 BYTE)     NULL,
  INDIC_REINT_PAGNT              VARCHAR2(1 BYTE) DEFAULT 'N'     NULL,
  INDIC_REINT_PAGE_IR            VARCHAR2(1 BYTE) DEFAULT 'N'     NULL,
  INDIC_CLEAR_PAGE_IR            VARCHAR2(1 BYTE) DEFAULT 'N'     NULL,
  REF_DV_VALR_SCPC               NUMBER(10)         NULL,
  FORML_VALR_SCPC                VARCHAR2(4000 BYTE)     NULL,
  REF_DV_VALR_SSPC               NUMBER(10)         NULL,
  FORML_VALR_SSPC                VARCHAR2(4000 BYTE)     NULL,
  REF_DV_VALR_SAPC               NUMBER(10)         NULL,
  FORML_VALR_SAPC                VARCHAR2(4000 BYTE)     NULL,
  REF_DV_VALR_SCPI               NUMBER(10)         NULL,
  FORML_VALR_SCPI                VARCHAR2(4000 BYTE)     NULL,
  REF_DV_VALR_SSPI               NUMBER(10)         NULL,
  FORML_VALR_SSPI                VARCHAR2(4000 BYTE)     NULL,
  REF_DV_VALR_SAPI               NUMBER(10)         NULL,
  FORML_VALR_SAPI                VARCHAR2(4000 BYTE)     NULL,
  REF_DV_VALR_SNPI               NUMBER(10)         NULL,
  FORML_VALR_SNPI                VARCHAR2(4000 BYTE)     NULL,
  DATE_CREAT                     DATE               NULL,
  UTILS_CREAT                    VARCHAR2(123 BYTE)     NULL,
  DATE_MODFC                     DATE               NULL,
  UTILS_MODFC                    VARCHAR2(123 BYTE)     NULL,
  INDIC_SOUMS_PAGE               VARCHAR2(1 BYTE) DEFAULT 'N'     NULL,
  INDIC_REINT_NAVGT              VARCHAR2(1 BYTE) DEFAULT 'O'     NULL,
  REF_ITEM_MENU                  NUMBER(10)         NULL,
  DNR_REF_PRODT                  NUMBER(10)         NULL,
  REF_STRUC_APLIC                NUMBER(10)         NULL,
  FORML_LIBL                     VARCHAR2(4000 BYTE)     NULL,
  LISTE_REF_PAGE_ACTIV           VARCHAR2(1000 BYTE)     NULL,
  REF_RESRC                      NUMBER(10)         NULL,
  REF_OCURN_RESRC                NUMBER(10)         NULL,
  REF_FORMT_RESRC                NUMBER(10)         NULL,
  REF_DV_VALR_INSTA_LIBL         NUMBER(10)         NULL,
  REF_DV_VALR_URL                NUMBER(10)         NULL,
  FORML_VALR_URL                 VARCHAR2(4000 BYTE)     NULL,
  INDIC_GERER_SIDF               VARCHAR2(1 BYTE) DEFAULT 'N'     NULL,
  REF_APLIC                      NUMBER(10)         NULL,
  REF_DV_VALR_INSTA_CONDT_AFICH  NUMBER(10)         NULL,
  FORML_CONDT_AFICH              VARCHAR2(4000 BYTE)     NULL
);


Prompt Table SIE_13_LIEN_CONDT_PILTB;
CREATE TABLE SIE_13_LIEN_CONDT_PILTB
(
  SEQNC             NUMBER(10)                      NULL,
  REF_PAGE_ITEM     NUMBER(10)                      NULL,
  REF_CONDT_PILTB   NUMBER(10)                      NULL,
  INDIC_LECTR_SEUL  VARCHAR2(1 BYTE)                NULL,
  DATE_CREAT        DATE                            NULL,
  UTILS_CREAT       VARCHAR2(123 BYTE)              NULL,
  DATE_MODFC        DATE                            NULL,
  UTILS_MODFC       VARCHAR2(123 BYTE)              NULL,
  INDIC_AFICH       VARCHAR2(1 BYTE)            DEFAULT 'O'                       NULL,
  DNR_REF_APLIC     NUMBER(10)                      NULL
);


Prompt Table SIE_13_LISTE_NAVGT;
CREATE TABLE SIE_13_LISTE_NAVGT
(
  SEQNC             NUMBER(10)                      NULL,
  REF_PAGE          NUMBER(10)                      NULL,
  LIBL              VARCHAR2(30 BYTE)               NULL,
  PAGE              VARCHAR2(30 BYTE)               NULL,
  SSPC              VARCHAR2(30 BYTE)               NULL,
  SAPC              VARCHAR2(30 BYTE)               NULL,
  SSPI              VARCHAR2(30 BYTE)               NULL,
  SAPI              VARCHAR2(30 BYTE)               NULL,
  DATE_CREAT        DATE                            NULL,
  UTILS_CREAT       VARCHAR2(123 BYTE)              NULL,
  DATE_MODFC        DATE                            NULL,
  UTILS_MODFC       VARCHAR2(123 BYTE)              NULL,
  ORDRE_PRESN       NUMBER(3)                   DEFAULT 1                         NULL,
  CODE              VARCHAR2(23 BYTE)               NULL,
  INDIC_REINT_SIDF  VARCHAR2(1 BYTE)            DEFAULT 'N'                       NULL,
  DNR_REF_APLIC     NUMBER(10)                      NULL,
  APLIC             VARCHAR2(30 BYTE)               NULL,
  CSS_ICONE_BOOTS   VARCHAR2(400 BYTE)              NULL
);


Prompt Table SIE_13_MENU;
CREATE TABLE SIE_13_MENU
(
  SEQNC          NUMBER(10)                         NULL,
  CODE           VARCHAR2(23 BYTE)                  NULL,
  NOM            VARCHAR2(60 BYTE)                  NULL,
  DESCR          VARCHAR2(2000 BYTE)                NULL,
  DATE_CREAT     DATE                               NULL,
  UTILS_CREAT    VARCHAR2(123 BYTE)                 NULL,
  DATE_MODFC     DATE                               NULL,
  UTILS_MODFC    VARCHAR2(123 BYTE)                 NULL,
  REF_PRODT      NUMBER(10)                         NULL,
  DNR_REF_PRODT  NUMBER(10)                         NULL,
  RESRC_ADITN    VARCHAR2(4000 BYTE)                NULL
);


Prompt Table SIE_13_MIME_TYPE;
CREATE TABLE SIE_13_MIME_TYPE
(
  SEQNC           NUMBER(10)                        NULL,
  REF_TYPE_FICHR  NUMBER(10)                        NULL,
  EXT             VARCHAR2(10 BYTE)                 NULL,
  MIME_TYPE       VARCHAR2(200 BYTE)                NULL,
  DATE_CREAT      DATE                              NULL,
  UTILS_CREAT     VARCHAR2(123 BYTE)                NULL,
  DATE_MODFC      DATE                              NULL,
  UTILS_MODFC     VARCHAR2(123 BYTE)                NULL,
  ORDRE_CHOIX     NUMBER(2)                         NULL
);


Prompt Table SIE_13_NAVGT;
CREATE TABLE SIE_13_NAVGT
(
  SEQNC              NUMBER(14)                     NULL,
  REF_ID_SESN        NUMBER                         NULL,
  INDIC_EXTRA_TOTAL  VARCHAR2(1 BYTE)               NULL,
  TAIL_TABL_EXTRA    NUMBER(10)                     NULL,
  NOMBR_RANG_EXTRA   NUMBER(8)                      NULL,
  ENONC_SQL          CLOB                           NULL,
  DATE_CREAT         DATE                           NULL,
  UTILS_CREAT        VARCHAR2(123 BYTE)             NULL,
  DATE_MODFC         DATE                           NULL,
  UTILS_MODFC        VARCHAR2(123 BYTE)             NULL,
  INDIC_EXTRA_TERMN  VARCHAR2(1 BYTE)           DEFAULT 'N'                       NULL,
  APEX_REPTS_ID      NUMBER                         NULL,
  REF_RAPRT_INTER    NUMBER(10)                     NULL,
  REF_FIL_ARIAN      NUMBER(10)                     NULL
);


Prompt Table SIE_13_NAVGT_ELEMN;
CREATE TABLE SIE_13_NAVGT_ELEMN
(
  SEQNC        NUMBER(10)                           NULL,
  NUMR_ELEMN   NUMBER(8)                            NULL,
  INDIC_COURN  VARCHAR2(1 BYTE)                     NULL,
  SEQNC_ELEMN  NUMBER(10)                           NULL,
  REF_NAVGT    NUMBER(10)                           NULL,
  DATE_CREAT   DATE                                 NULL,
  UTILS_CREAT  VARCHAR2(123 BYTE)                   NULL,
  DATE_MODFC   DATE                                 NULL,
  UTILS_MODFC  VARCHAR2(123 BYTE)                   NULL
);


Prompt Table SIE_13_OCURN_RESRC;
CREATE TABLE SIE_13_OCURN_RESRC
(
  SEQNC            NUMBER(10)                       NULL,
  REF_RESRC        NUMBER(10)                       NULL,
  REF_FORMT_RESRC  NUMBER(10)                       NULL,
  REF_MIME_TYPE    NUMBER(10)                       NULL,
  NOM_PHYSQ        VARCHAR2(300 BYTE)               NULL,
  DATE_CREAT       DATE                             NULL,
  UTILS_CREAT      VARCHAR2(123 BYTE)               NULL,
  DATE_MODFC       DATE                             NULL,
  UTILS_MODFC      VARCHAR2(123 BYTE)               NULL,
  CORDN_X_DEBUT    NUMBER(6)                        NULL,
  CORDN_Y_DEBUT    NUMBER(10)                       NULL,
  LARGR_PREPN      NUMBER(3)                        NULL,
  HAUTR_PREPN      NUMBER(3)                        NULL,
  NOM              VARCHAR2(60 BYTE)                NULL,
  REF_DOSR_VIRTL   NUMBER(10)                       NULL,
  REF_VERSN        NUMBER(10)                       NULL,
  DNR_REF_PRODT    NUMBER(10)                       NULL
);


Prompt Table SIE_13_OPERT;
CREATE TABLE SIE_13_OPERT
(
  SEQNC          NUMBER(10)                         NULL,
  NOM            VARCHAR2(100 BYTE)                 NULL,
  DESCR          VARCHAR2(400 BYTE)                 NULL,
  DATE_CREAT     DATE                               NULL,
  UTILS_CREAT    VARCHAR2(123 BYTE)                 NULL,
  DATE_MODFC     DATE                               NULL,
  UTILS_MODFC    VARCHAR2(123 BYTE)                 NULL,
  REF_PRODT      NUMBER(10)                         NULL,
  CODE           VARCHAR2(23 BYTE)                  NULL,
  DNR_REF_PRODT  NUMBER(10)                         NULL,
  REF_FONCT      NUMBER(10)                         NULL
);


Prompt Table SIE_13_OPERT_OPTIO;
CREATE TABLE SIE_13_OPERT_OPTIO
(
  SEQNC          NUMBER(10)                         NULL,
  REF_OPERT      NUMBER(10)                         NULL,
  CODE           VARCHAR2(23 BYTE)                  NULL,
  NOM            VARCHAR2(60 BYTE)                  NULL,
  DESCR          VARCHAR2(4000 BYTE)                NULL,
  DNR_REF_PRODT  NUMBER(10)                         NULL,
  DATE_CREAT     DATE                               NULL,
  UTILS_CREAT    VARCHAR2(123 BYTE)                 NULL,
  DATE_MODFC     DATE                               NULL,
  UTILS_MODFC    VARCHAR2(123 BYTE)                 NULL,
  PREPN          NUMBER(3)                      DEFAULT NULL                      NULL
);


Prompt Table SIE_13_PAGE;
CREATE TABLE SIE_13_PAGE
(
  SEQNC                          NUMBER(10)         NULL,
  NUMR_APEX                      NUMBER             NULL,
  NOM                            VARCHAR2(255 BYTE)     NULL,
  DESCR                          VARCHAR2(400 BYTE)     NULL,
  DATE_CREAT                     DATE               NULL,
  UTILS_CREAT                    VARCHAR2(123 BYTE)     NULL,
  DATE_MODFC                     DATE               NULL,
  UTILS_MODFC                    VARCHAR2(123 BYTE)     NULL,
  REF_STRUC_APLIC                NUMBER(10)         NULL,
  INDIC_PRISE_CHARG_SIE01        VARCHAR2(1 BYTE) DEFAULT 'O'     NULL,
  INDIC_PRISE_CHARG_SIE04        VARCHAR2(1 BYTE) DEFAULT 'O'     NULL,
  REF_MESG_SUPRS_SPECF           NUMBER(10)         NULL,
  INDIC_PRISE_CHARG_SIE19        VARCHAR2(1 BYTE) DEFAULT 'O'     NULL,
  INDIC_PRISE_CHARG_SIE13_NAVGT  VARCHAR2(1 BYTE) DEFAULT 'O'     NULL,
  INDIC_PRISE_CHARG_SIE18        VARCHAR2(1 BYTE) DEFAULT 'N'     NULL,
  REF_PAGE_RECHR                 NUMBER(10)         NULL,
  INDIC_PRISE_CHARG_SIE14_POPUP  VARCHAR2(1 BYTE) DEFAULT 'N'     NULL,
  INDIC_PRISE_CHARG_SIE13_CONFR  VARCHAR2(1 BYTE) DEFAULT 'N'     NULL,
  PREFX_MESG                     VARCHAR2(3 BYTE)     NULL,
  DATE_DERNR_MAJ_REFRN_APEX      DATE               NULL,
  REF_MESG_SUCS_SPECF            NUMBER(10)         NULL,
  REF_MESG_ECHEC_SPECF           NUMBER(10)         NULL,
  REF_MESG_FETCH_SPECF           NUMBER(10)         NULL,
  REF_MESG_RANGE_SUPRM_SPECF     NUMBER(10)         NULL,
  REF_MESG_RANGE_MODF_SPECF      NUMBER(10)         NULL,
  REF_MESG_RANGE_INSER_SPECF     NUMBER(10)         NULL,
  REF_MESG_AUCUN_DON_TROUV       NUMBER(10)         NULL,
  REF_MESG_TROP_DON_TROUV        NUMBER(10)         NULL,
  REF_APLIC                      NUMBER(10)         NULL,
  DNR_REF_APLIC                  NUMBER(10)         NULL
);


Prompt Table SIE_13_PAGE_IR;
CREATE TABLE SIE_13_PAGE_IR
(
  SEQNC                   NUMBER(10)                NULL,
  LIBL_REGN               VARCHAR2(255 BYTE)        NULL,
  ID_APEX                 NUMBER                    NULL,
  REF_PAGE                NUMBER(10)                NULL,
  DATE_CREAT              DATE                      NULL,
  UTILS_CREAT             VARCHAR2(123 BYTE)        NULL,
  DATE_MODFC              DATE                      NULL,
  UTILS_MODFC             VARCHAR2(123 BYTE)        NULL,
  LARGR_DEFT              NUMBER                    NULL,
  UNITE_MESR_LARGR_DEFT   NUMBER(10)                NULL,
  CODE                    VARCHAR2(23 BYTE)         NULL,
  DNR_REF_APLIC           NUMBER(10)                NULL,
  INDIC_FORCR_AJUST_PAGE  VARCHAR2(1 BYTE)      DEFAULT 'N'                       NULL,
  NOMBR_PAGE_LARGR        NUMBER(2)             DEFAULT 1                         NULL
);


Prompt Table SIE_13_PAGE_IR_COLN;
CREATE TABLE SIE_13_PAGE_IR_COLN
(
  SEQNC          NUMBER(10)                         NULL,
  ORDRE_AFICH    NUMBER(3)                          NULL,
  LIBL           VARCHAR2(4000 BYTE)                NULL,
  DATE_CREAT     DATE                               NULL,
  UTILS_CREAT    VARCHAR2(123 BYTE)                 NULL,
  DATE_MODFC     DATE                               NULL,
  UTILS_MODFC    VARCHAR2(123 BYTE)                 NULL,
  COLN_TABLE     VARCHAR2(30 BYTE)                  NULL,
  REF_PAGE_IR    NUMBER(10)                         NULL,
  ID_APEX        NUMBER                             NULL,
  LARGR          NUMBER(5,2)                        NULL,
  TYPE_LARGR     VARCHAR2(5 BYTE)                   NULL,
  INDIC_EXPRT    VARCHAR2(1 BYTE)               DEFAULT 'O'                       NULL,
  REF_MESG_AIDE  NUMBER(10)                         NULL,
  DNR_REF_APLIC  NUMBER(10)                         NULL
);


Prompt Table SIE_13_PAGE_ITEM;
CREATE TABLE SIE_13_PAGE_ITEM
(
  SEQNC              NUMBER(10)                     NULL,
  REF_PAGE           NUMBER(10)                     NULL,
  ID_APEX            NUMBER                         NULL,
  NOM_APEX           VARCHAR2(500 BYTE)             NULL,
  DATE_CREAT         DATE                           NULL,
  UTILS_CREAT        VARCHAR2(123 BYTE)             NULL,
  DATE_MODFC         DATE                           NULL,
  UTILS_MODFC        VARCHAR2(123 BYTE)             NULL,
  LIBL               VARCHAR2(500 BYTE)             NULL,
  INDIC_CREAT        VARCHAR2(1 BYTE)               NULL,
  INDIC_MODFC        VARCHAR2(1 BYTE)               NULL,
  INDIC_SUPRS        VARCHAR2(1 BYTE)               NULL,
  INDIC_EN_CREAT     VARCHAR2(1 BYTE)               NULL,
  INDIC_EN_MODFC     VARCHAR2(1 BYTE)               NULL,
  TYPE_ITEM          VARCHAR2(5 BYTE)           DEFAULT 'ITEM'                    NULL,
  REF_OPERT          NUMBER(10)                     NULL,
  REF_MESG_AIDE      NUMBER(10)                     NULL,
  DEPSM_ALIAS_COLN   VARCHAR2(200 BYTE)             NULL,
  INDIC_RECHR        VARCHAR2(1 BYTE)           DEFAULT 'N'                       NULL,
  INDIC_CONFR_SAUVG  VARCHAR2(1 BYTE)               NULL,
  DNR_REF_APLIC      NUMBER(10)                     NULL
);


Prompt Table SIE_13_PAGE_ITEM_LANG;
CREATE TABLE SIE_13_PAGE_ITEM_LANG
(
  SEQNC          NUMBER(10)                         NULL,
  REF_PAGE_ITEM  NUMBER(10)                         NULL,
  NOM            VARCHAR2(255 BYTE)                 NULL,
  REF_LANG       NUMBER(10)                         NULL,
  DATE_CREAT     DATE                               NULL,
  UTILS_CREAT    VARCHAR2(123 BYTE)                 NULL,
  DATE_MODFC     DATE                               NULL,
  UTILS_MODFC    VARCHAR2(123 BYTE)                 NULL,
  DNR_REF_APLIC  NUMBER(10)                         NULL
);


Prompt Table SIE_13_PAGE_LANG;
CREATE TABLE SIE_13_PAGE_LANG
(
  SEQNC          NUMBER(10)                         NULL,
  REF_PAGE       NUMBER(10)                         NULL,
  NOM            VARCHAR2(255 BYTE)                 NULL,
  REF_LANG       NUMBER(10)                         NULL,
  DATE_CREAT     DATE                               NULL,
  UTILS_CREAT    VARCHAR2(123 BYTE)                 NULL,
  DATE_MODFC     DATE                               NULL,
  UTILS_MODFC    VARCHAR2(123 BYTE)                 NULL,
  DNR_REF_APLIC  NUMBER(10)                         NULL
);


Prompt Table SIE_13_PAGE_PREFR_NAVGT;
CREATE TABLE SIE_13_PAGE_PREFR_NAVGT
(
  SEQNC          NUMBER(10)                         NULL,
  REF_PAGE       NUMBER(10)                         NULL,
  REF_PAGE_IR    NUMBER(10)                         NULL,
  DATE_CREAT     DATE                               NULL,
  UTILS_CREAT    VARCHAR2(123 BYTE)                 NULL,
  DATE_MODFC     DATE                               NULL,
  UTILS_MODFC    VARCHAR2(123 BYTE)                 NULL,
  DNR_REF_APLIC  NUMBER(10)                         NULL
);


Prompt Table SIE_13_PREFR;
CREATE TABLE SIE_13_PREFR
(
  SEQNC               NUMBER(10)                    NULL,
  CODE                VARCHAR2(23 BYTE)             NULL,
  REF_DV_CONDT_UTILS  NUMBER(10)                    NULL,
  FORML_CONDT_UTILS   VARCHAR2(4000 BYTE)           NULL,
  REF_DV_CONDT_SAUVG  NUMBER(10)                    NULL,
  FORML_CONDT_SAUVG   VARCHAR2(4000 BYTE)           NULL,
  REF_DV_TYPE_INSTA   NUMBER(10)                    NULL,
  INDIC_CONTX         VARCHAR2(1 BYTE)              NULL,
  REF_DV_VALR_INSTA   NUMBER(10)                    NULL,
  FORML_VALR_INSTA    VARCHAR2(4000 BYTE)           NULL,
  DESCR_COMNT         VARCHAR2(4000 BYTE)           NULL,
  REF_ITEM            NUMBER(10)                    NULL,
  DATE_CREAT          DATE                          NULL,
  UTILS_CREAT         VARCHAR2(123 BYTE)            NULL,
  DATE_MODFC          DATE                          NULL,
  UTILS_MODFC         VARCHAR2(123 BYTE)            NULL,
  DNR_REF_APLIC       NUMBER(10)                    NULL
);


Prompt Table SIE_13_REGN_PILTB;
CREATE TABLE SIE_13_REGN_PILTB
(
  SEQNC                   NUMBER(10)                NULL,
  CODE                    VARCHAR2(23 BYTE)         NULL,
  NOM                     VARCHAR2(60 BYTE)         NULL,
  DESCR                   VARCHAR2(4000 BYTE)       NULL,
  DATE_CREAT              DATE                      NULL,
  UTILS_CREAT             VARCHAR2(123 BYTE)        NULL,
  DATE_MODFC              DATE                      NULL,
  UTILS_MODFC             VARCHAR2(123 BYTE)        NULL,
  REF_PAGE                NUMBER(10)                NULL,
  REF_DV_TYPE_REGN_PILTB  NUMBER(10)                NULL,
  DNR_REF_APLIC           NUMBER(10)                NULL
);


Prompt Table SIE_13_REGN_PILTB_LANG;
CREATE TABLE SIE_13_REGN_PILTB_LANG
(
  SEQNC           NUMBER(10)                        NULL,
  REF_REGN_PILTB  NUMBER(10)                        NULL,
  CONTN           CLOB                              NULL,
  REF_LANG        NUMBER(10)                        NULL,
  DATE_CREAT      DATE                              NULL,
  UTILS_CREAT     VARCHAR2(123 BYTE)                NULL,
  DATE_MODFC      DATE                              NULL,
  UTILS_MODFC     VARCHAR2(123 BYTE)                NULL,
  DNR_REF_APLIC   NUMBER(10)                        NULL
);


Prompt Table SIE_13_RESRC;
CREATE TABLE SIE_13_RESRC
(
  SEQNC                   NUMBER(10)                NULL,
  CODE                    VARCHAR2(60 BYTE)         NULL,
  REF_PRODT               NUMBER(10)                NULL,
  DESCR                   VARCHAR2(4000 BYTE)       NULL,
  REF_TYPE_FICHR          NUMBER(10)                NULL,
  REF_STRUC_APLIC         NUMBER(10)                NULL,
  INDIC_STOCK_MEME_REPRT  VARCHAR2(1 BYTE)      DEFAULT 'O'                       NULL,
  DATE_CREAT              DATE                      NULL,
  UTILS_CREAT             VARCHAR2(123 BYTE)        NULL,
  DATE_MODFC              DATE                      NULL,
  UTILS_MODFC             VARCHAR2(123 BYTE)        NULL,
  TYPE_RESRC              VARCHAR2(5 BYTE)      DEFAULT 'SIMPL'                   NULL,
  NOM                     VARCHAR2(60 BYTE)         NULL,
  NOM_PHYSQ_COMPS         VARCHAR2(100 BYTE)        NULL,
  INDIC_PUBLC             VARCHAR2(1 BYTE)      DEFAULT 'N'                       NULL,
  EMPLA_HTML              VARCHAR2(11 BYTE)     DEFAULT 'HEADR'                   NULL,
  REF_PLUGN               NUMBER(10)                NULL,
  REF_DOSR_VIRTL          NUMBER(10)                NULL,
  DNR_REF_PRODT           NUMBER(10)                NULL
);


Prompt Table SIE_13_TYPE_FICHR;
CREATE TABLE SIE_13_TYPE_FICHR
(
  SEQNC        NUMBER(10)                           NULL,
  CODE         VARCHAR2(23 BYTE)                    NULL,
  NOM          VARCHAR2(60 BYTE)                    NULL,
  DESCR        VARCHAR2(4000 BYTE)                  NULL,
  DATE_CREAT   DATE                                 NULL,
  UTILS_CREAT  VARCHAR2(123 BYTE)                   NULL,
  DATE_MODFC   DATE                                 NULL,
  UTILS_MODFC  VARCHAR2(123 BYTE)                   NULL,
  NOM_ICON     VARCHAR2(60 BYTE)                    NULL
);


Prompt Table SIE_14_DETL_DOMN_VALR;
CREATE TABLE SIE_14_DETL_DOMN_VALR
(
  SEQNC             NUMBER(10)                      NULL,
  CODE_VALR         VARCHAR2(23 BYTE)               NULL,
  VALR              VARCHAR2(2000 BYTE)             NULL,
  REF_DOMN_VALR     NUMBER(10)                      NULL,
  SEQNC_PRESN       NUMBER(3)                       NULL,
  DATE_DEBUT_EFECT  DATE                            NULL,
  DATE_FIN_EFECT    DATE                            NULL,
  DATE_CREAT        DATE                            NULL,
  UTILS_CREAT       VARCHAR2(123 BYTE)              NULL,
  DATE_MODFC        DATE                            NULL,
  UTILS_MODFC       VARCHAR2(123 BYTE)              NULL,
  VALR_COURT        VARCHAR2(20 BYTE)               NULL,
  VALR_ORGAN        VARCHAR2(4000 BYTE)             NULL,
  DNR_REF_PRODT     NUMBER(10)                      NULL
);


Prompt Table SIE_14_DOMN_VALR;
CREATE TABLE SIE_14_DOMN_VALR
(
  SEQNC               NUMBER(10)                    NULL,
  CODE                VARCHAR2(23 BYTE)             NULL,
  NOM                 VARCHAR2(60 BYTE)             NULL,
  DESCR               VARCHAR2(2000 BYTE)           NULL,
  ENONC_SOURC         VARCHAR2(4000 BYTE)           NULL,
  DATE_CREAT          DATE                          NULL,
  UTILS_CREAT         VARCHAR2(123 BYTE)            NULL,
  DATE_MODFC          DATE                          NULL,
  UTILS_MODFC         VARCHAR2(123 BYTE)            NULL,
  TYPE_DON            VARCHAR2(1 BYTE)              NULL,
  REF_FORMT           NUMBER(10)                    NULL,
  REF_PRODT           NUMBER(10)                    NULL,
  REF_TYPE_DOMN_VALR  NUMBER(10)                    NULL,
  INDIC_SYSTM         VARCHAR2(1 BYTE)          DEFAULT 'N'                       NULL,
  DNR_REF_PRODT       NUMBER(10)                    NULL,
  REF_DOMN            NUMBER(10)                    NULL
);


Prompt Table SIE_14_FORMT;
CREATE TABLE SIE_14_FORMT
(
  SEQNC              NUMBER(10)                     NULL,
  LIBL               VARCHAR2(60 BYTE)              NULL,
  DEFNT              VARCHAR2(60 BYTE)              NULL,
  TYPE_DON           VARCHAR2(2 BYTE)               NULL,
  DATE_CREAT         DATE                           NULL,
  UTILS_CREAT        VARCHAR2(123 BYTE)             NULL,
  DATE_MODFC         DATE                           NULL,
  UTILS_MODFC        VARCHAR2(123 BYTE)             NULL,
  REF_PRODT          NUMBER(10)                     NULL,
  INDIC_FORMT_ORCL   VARCHAR2(1 BYTE)               NULL,
  INDIC_UNITE_INCLU  VARCHAR2(1 BYTE)               NULL,
  DNR_REF_PRODT      NUMBER(10)                     NULL
);


Prompt Table SIE_14_TYPE_DOMN_VALR;
CREATE TABLE SIE_14_TYPE_DOMN_VALR
(
  SEQNC          NUMBER(10)                         NULL,
  CODE           VARCHAR2(23 BYTE)                  NULL,
  NOM            VARCHAR2(60 BYTE)                  NULL,
  DESCR          VARCHAR2(2000 BYTE)                NULL,
  DATE_CREAT     DATE                               NULL,
  UTILS_CREAT    VARCHAR2(123 BYTE)                 NULL,
  DATE_MODFC     DATE                               NULL,
  UTILS_MODFC    VARCHAR2(123 BYTE)                 NULL,
  REF_PRODT      NUMBER(10)                         NULL,
  DNR_REF_PRODT  NUMBER(10)                         NULL
);


Prompt Table SIE_17_ATACH_COURL_ENTRA;
CREATE TABLE SIE_17_ATACH_COURL_ENTRA
(
  SEQNC                  NUMBER(18)                 NULL,
  REF_COURL_ENTRA        NUMBER(16)                 NULL,
  NOM                    VARCHAR2(100 BYTE)         NULL,
  CONTN                  BLOB                       NULL,
  REF_MIME_TYPE          NUMBER(10)                 NULL,
  PROPR                  VARCHAR2(4000 BYTE)        NULL,
  TAIL                   NUMBER(10)                 NULL,
  DATE_CREAT             DATE                       NULL,
  UTILS_CREAT            VARCHAR2(123 BYTE)         NULL,
  DATE_MODFC             DATE                       NULL,
  UTILS_MODFC            VARCHAR2(123 BYTE)         NULL,
  NUMR_PIECE_CORPS_MESG  VARCHAR2(4 BYTE)           NULL
);


Prompt Table SIE_17_COMPT_AXIAT;
CREATE TABLE SIE_17_COMPT_AXIAT
(
  SEQNC                 NUMBER(10)                  NULL,
  CODE                  VARCHAR2(23 BYTE)           NULL,
  NOM                   VARCHAR2(60 BYTE)           NULL,
  DESCR                 VARCHAR2(4000 BYTE)         NULL,
  NUMR                  NUMBER(10)                  NULL,
  DATE_CREAT            DATE                        NULL,
  UTILS_CREAT           VARCHAR2(123 BYTE)          NULL,
  DATE_MODFC            DATE                        NULL,
  UTILS_MODFC           VARCHAR2(123 BYTE)          NULL,
  REF_DOMN              NUMBER(10)                  NULL,
  REF_PROFL_COURL       NUMBER(10)                  NULL,
  REF_PUBLC_PAGE_GARDE  NUMBER(10)                  NULL
);


Prompt Table SIE_17_COMPT_TWILI;
CREATE TABLE SIE_17_COMPT_TWILI
(
  SEQNC           NUMBER(10)                        NULL,
  CODE            VARCHAR2(23 BYTE)                 NULL,
  NOM             VARCHAR2(60 BYTE)                 NULL,
  DESCR           VARCHAR2(4000 BYTE)               NULL,
  ACOUN_ID        VARCHAR2(100 BYTE)                NULL,
  AUTHE_TOKEN     VARCHAR2(100 BYTE)                NULL,
  REPRT_WALT      VARCHAR2(500 BYTE)                NULL,
  MOT_PASSE_WALT  VARCHAR2(30 BYTE)                 NULL,
  DATE_CREAT      DATE                              NULL,
  UTILS_CREAT     VARCHAR2(123 BYTE)                NULL,
  DATE_MODFC      DATE                              NULL,
  UTILS_MODFC     VARCHAR2(123 BYTE)                NULL,
  NUMR            NUMBER(11)                        NULL,
  INDIC_PARTG     VARCHAR2(1 BYTE)              DEFAULT 'N'                       NULL,
  REF_DOMN        NUMBER(10)                        NULL
);


Prompt Table SIE_17_COURL;
CREATE TABLE SIE_17_COURL
(
  SEQNC             NUMBER(10)                      NULL,
  DATE_CREAT        DATE                            NULL,
  UTILS_CREAT       VARCHAR2(123 BYTE)              NULL,
  DATE_MODFC        DATE                            NULL,
  UTILS_MODFC       VARCHAR2(123 BYTE)              NULL,
  SERVR             VARCHAR2(100 BYTE)              NULL,
  PORT              NUMBER                      DEFAULT 25                        NULL,
  DOMN              VARCHAR2(100 BYTE)              NULL,
  NOM_ENVOY         VARCHAR2(100 BYTE)              NULL,
  ADRES_ENVOY       VARCHAR2(100 BYTE)              NULL,
  SUJET             VARCHAR2(1000 BYTE)             NULL,
  INDIC_FORMT_HTML  VARCHAR2(1 BYTE)            DEFAULT 'N'                       NULL,
  AUTHE_METHD       VARCHAR2(23 BYTE)               NULL,
  AUTHE_USAGR       VARCHAR2(100 BYTE)              NULL,
  AUTHE_MDP         VARCHAR2(100 BYTE)              NULL,
  CORPS             CLOB                            NULL,
  NOMBR_TENTV       NUMBER                      DEFAULT 0                         NULL,
  NOMBR_TENTV_MAX   NUMBER                      DEFAULT 5                         NULL,
  SENS              VARCHAR2(5 BYTE)                NULL,
  STAT_SOUMS        VARCHAR2(30 BYTE)               NULL
);


Prompt Table SIE_17_COURL_DESTN;
CREATE TABLE SIE_17_COURL_DESTN
(
  SEQNC          NUMBER(10)                         NULL,
  DATE_CREAT     DATE                               NULL,
  UTILS_CREAT    VARCHAR2(123 BYTE)                 NULL,
  DATE_MODFC     DATE                               NULL,
  UTILS_MODFC    VARCHAR2(123 BYTE)                 NULL,
  REF_FIL_ATENT  NUMBER(10)                         NULL,
  NOM            VARCHAR2(100 BYTE)                 NULL,
  ADRES          VARCHAR2(100 BYTE)                 NULL,
  TYPE           VARCHAR2(10 BYTE)                  NULL
);


Prompt Table SIE_17_COURL_ENTRA;
CREATE TABLE SIE_17_COURL_ENTRA
(
  SEQNC            NUMBER(16)                       NULL,
  REF_PROFL_COURL  NUMBER(10)                       NULL,
  DATE_RECPT       DATE                             NULL,
  DATE_COURL       DATE                             NULL,
  OBJET            VARCHAR2(4000 BYTE)              NULL,
  CONTN_TEXTE_PUR  CLOB                             NULL,
  CONTN_HTML       CLOB                             NULL,
  NOM_EXPED        VARCHAR2(500 BYTE)               NULL,
  COURL_EXPED      VARCHAR2(2000 BYTE)              NULL,
  INDIC_SUPRM      VARCHAR2(1 BYTE)                 NULL,
  INDIC_LU         VARCHAR2(1 BYTE)                 NULL,
  INDIC_RECNT      VARCHAR2(1 BYTE)                 NULL,
  INDIC_REPND      VARCHAR2(1 BYTE)                 NULL,
  TYPE_CONTN       VARCHAR2(100 BYTE)               NULL,
  TAIL_MESG        NUMBER(10)                       NULL,
  DATE_CREAT       DATE                             NULL,
  UTILS_CREAT      VARCHAR2(123 BYTE)               NULL,
  DATE_MODFC       DATE                             NULL,
  UTILS_MODFC      VARCHAR2(123 BYTE)               NULL
);


Prompt Table SIE_17_COURL_PIECE_JOINT;
CREATE TABLE SIE_17_COURL_PIECE_JOINT
(
  SEQNC       NUMBER(10)                            NULL,
  REF_COURL   NUMBER(10)                            NULL,
  MIME_TYPE   VARCHAR2(100 BYTE)                    NULL,
  CONTN       BLOB                                  NULL,
  TAIL        NUMBER(12)                            NULL,
  NOM_FICHR   VARCHAR2(500 BYTE)                    NULL,
  MODE_ATACH  VARCHAR2(30 BYTE)                     NULL
);


Prompt Table SIE_17_PIECE_TELCP_AXIAT;
CREATE TABLE SIE_17_PIECE_TELCP_AXIAT
(
  SEQNC            NUMBER(10)                       NULL,
  REF_TELCP_AXIAT  NUMBER(10)                       NULL,
  NOMBR_PAGE       NUMBER(5)                        NULL,
  ORDRE_ATACH      NUMBER(3)                        NULL,
  CONTN            BLOB                             NULL,
  DATE_CREAT       DATE                             NULL,
  UTILS_CREAT      VARCHAR2(123 BYTE)               NULL,
  DATE_MODFC       DATE                             NULL,
  UTILS_MODFC      VARCHAR2(123 BYTE)               NULL,
  MIME_TYPE        VARCHAR2(100 BYTE)               NULL,
  NOM_FICHR        VARCHAR2(100 BYTE)               NULL
);


Prompt Table SIE_17_PROFL_COURL;
CREATE TABLE SIE_17_PROFL_COURL
(
  SEQNC                    NUMBER(10)               NULL,
  DOMN                     VARCHAR2(100 BYTE)       NULL,
  NOM_ENVOY                VARCHAR2(100 BYTE)       NULL,
  ADRES_ENVOY              VARCHAR2(100 BYTE)       NULL,
  DATE_CREAT               DATE                     NULL,
  UTILS_CREAT              VARCHAR2(123 BYTE)       NULL,
  DATE_MODFC               DATE                     NULL,
  UTILS_MODFC              VARCHAR2(123 BYTE)       NULL,
  CODE                     VARCHAR2(23 BYTE)        NULL,
  SERVR_SORTN              VARCHAR2(100 BYTE)       NULL,
  PORT_SORTN               NUMBER(5)            DEFAULT 25                        NULL,
  AUTHE_METHD_SORTN        VARCHAR2(23 BYTE)        NULL,
  AUTHE_USAGR_SORTN        VARCHAR2(100 BYTE)       NULL,
  AUTHE_MDP_SORTN          VARCHAR2(100 BYTE)       NULL,
  REF_DOMN                 NUMBER(10)               NULL,
  NOM                      VARCHAR2(60 BYTE)        NULL,
  DESCR                    VARCHAR2(4000 BYTE)      NULL,
  INDIC_SSL_SORTN          VARCHAR2(1 BYTE)     DEFAULT 'N'                       NULL,
  SERVR_ENTRA              VARCHAR2(100 BYTE)       NULL,
  PORT_ENTRA               NUMBER(5)                NULL,
  INDIC_SSL_ENTRA          VARCHAR2(1 BYTE)     DEFAULT 'N'                       NULL,
  AUTHE_METHD_ENTRA        VARCHAR2(23 BYTE)        NULL,
  AUTHE_USAGR_ENTRA        VARCHAR2(100 BYTE)       NULL,
  AUTHE_MDP_ENTRA          VARCHAR2(100 BYTE)       NULL,
  PROTC_ENTRA              VARCHAR2(5 BYTE)     DEFAULT 'IMAP'                    NULL,
  INDIC_LIRE_PROFL_ENTRA   VARCHAR2(1 BYTE)     DEFAULT 'N'                       NULL,
  INDIC_LECTR_ENTRA_ERR    VARCHAR2(1 BYTE)     DEFAULT 'N'                       NULL,
  INDIC_REPRS_LECTR_ENTRA  VARCHAR2(1 BYTE)     DEFAULT 'N'                       NULL
);


Prompt Table SIE_17_PROPR_COURL_ENTRA;
CREATE TABLE SIE_17_PROPR_COURL_ENTRA
(
  SEQNC            NUMBER(18)                       NULL,
  REF_COURL_ENTRA  NUMBER(16)                       NULL,
  NOM              VARCHAR2(100 BYTE)               NULL,
  VALR             VARCHAR2(4000 BYTE)              NULL,
  DATE_CREAT       DATE                             NULL,
  UTILS_CREAT      VARCHAR2(123 BYTE)               NULL,
  DATE_MODFC       DATE                             NULL,
  UTILS_MODFC      VARCHAR2(123 BYTE)               NULL
);


Prompt Table SIE_17_SMS_TWILI;
CREATE TABLE SIE_17_SMS_TWILI
(
  SEQNC            NUMBER(10)                       NULL,
  NUMR_DE          NUMBER(18)                       NULL,
  NUMR_A           NUMBER(18)                       NULL,
  MESG             VARCHAR2(160 CHAR)               NULL,
  DATE_CREAT       DATE                             NULL,
  UTILS_CREAT      VARCHAR2(123 BYTE)               NULL,
  DATE_MODFC       DATE                             NULL,
  UTILS_MODFC      VARCHAR2(123 BYTE)               NULL,
  TW_SID           VARCHAR2(100 BYTE)               NULL,
  TW_STATUS        VARCHAR2(50 BYTE)                NULL,
  TW_PRICE         NUMBER(5,2)                      NULL,
  TW_URI           VARCHAR2(500 BYTE)               NULL,
  STAT_SOUMS       VARCHAR2(30 BYTE)                NULL,
  DATE_ENVOI_DIFR  DATE                             NULL,
  REF_COMPT_TWILI  NUMBER(10)                       NULL,
  NUMR_MESG        NUMBER(3)                        NULL,
  NOMBR_MESG_TOTL  NUMBER(3)                        NULL,
  REF_MESG_PRECD   NUMBER(10)                       NULL,
  ID_SESN          NUMBER                           NULL,
  GROUP_SMS        NUMBER(10)                       NULL,
  REPNS_SERVR      SYS.XMLTYPE                      NULL,
  SENS             VARCHAR2(5 BYTE)                 NULL
);


Prompt Table SIE_17_SMS_TWILI_ENTRA;
CREATE TABLE SIE_17_SMS_TWILI_ENTRA
(
  SEQNC                   NUMBER(10)                NULL,
  TW_RECPT_ACCOUNTSID     VARCHAR2(100 BYTE)        NULL,
  TW_RECPT_APIVERSION     VARCHAR2(10 BYTE)         NULL,
  TW_RECPT_BODY           VARCHAR2(200 BYTE)        NULL,
  TW_RECPT_FROM           VARCHAR2(16 BYTE)         NULL,
  TW_RECPT_FROMCITY       VARCHAR2(100 BYTE)        NULL,
  TW_RECPT_FROMCOUNTRY    VARCHAR2(100 BYTE)        NULL,
  TW_RECPT_FROMSTATE      VARCHAR2(100 BYTE)        NULL,
  TW_RECPT_FROMZIP        VARCHAR2(100 BYTE)        NULL,
  TW_RECPT_SMSMESSAGESID  VARCHAR2(100 BYTE)        NULL,
  TW_RECPT_SMSSID         VARCHAR2(100 BYTE)        NULL,
  TW_RECPT_SMSSTATUS      VARCHAR2(30 BYTE)         NULL,
  TW_RECPT_TO             VARCHAR2(16 BYTE)         NULL,
  TW_RECPT_TOCITY         VARCHAR2(100 BYTE)        NULL,
  TW_RECPT_TOCOUNTRY      VARCHAR2(100 BYTE)        NULL,
  TW_RECPT_TOSTATE        VARCHAR2(200 BYTE)        NULL,
  TW_RECPT_TOZIP          VARCHAR2(20 BYTE)         NULL,
  DATE_CREAT              DATE                      NULL,
  UTILS_CREAT             VARCHAR2(123 BYTE)        NULL,
  DATE_MODFC              DATE                      NULL,
  UTILS_MODFC             VARCHAR2(123 BYTE)        NULL
);


Prompt Table SIE_17_TELCP_AXIAT;
CREATE TABLE SIE_17_TELCP_AXIAT
(
  SEQNC            NUMBER(10)                       NULL,
  REF_COMPT_AXIAT  NUMBER(10)                       NULL,
  DESTN_FORMT      VARCHAR2(100 BYTE)               NULL,
  NUMR_DESTN       NUMBER(10)                       NULL,
  DATE_CREAT       DATE                             NULL,
  UTILS_CREAT      VARCHAR2(123 BYTE)               NULL,
  DATE_MODFC       DATE                             NULL,
  UTILS_MODFC      VARCHAR2(123 BYTE)               NULL,
  STAT_SOUMS       VARCHAR2(30 BYTE)                NULL,
  DATE_ENVOI_DIFR  DATE                             NULL,
  OBJET            VARCHAR2(500 BYTE)               NULL,
  SENS             VARCHAR2(5 BYTE)                 NULL
);


Prompt Table SIE_19_BOUTN;
CREATE TABLE SIE_19_BOUTN
(
  SEQNC                        NUMBER(10)           NULL,
  REF_LANG                     NUMBER(10)           NULL,
  REF_DISPN_FONCT              NUMBER(10)           NULL,
  ITEM_SUBST                   VARCHAR2(60 BYTE)     NULL,
  ID_TEMPL_BOUTN               NUMBER               NULL,
  TEMPL_BOUTN                  VARCHAR2(4000 BYTE)     NULL,
  DATE_CREAT                   DATE                 NULL,
  UTILS_CREAT                  VARCHAR2(123 BYTE)     NULL,
  DATE_MODFC                   DATE                 NULL,
  UTILS_MODFC                  VARCHAR2(123 BYTE)     NULL,
  LIBL                         VARCHAR2(200 BYTE)     NULL,
  INDIC_ACTIF                  VARCHAR2(1 BYTE) DEFAULT 'O'     NULL,
  REF_DV_TYPE_MESG_AIDE_CONTX  NUMBER(10)           NULL,
  MESG_AIDE_CONTX              VARCHAR2(200 BYTE)     NULL
);


Prompt Table SIE_19_CLE;
CREATE TABLE SIE_19_CLE
(
  SEQNC            NUMBER(10)                       NULL,
  REF_LANG         NUMBER(10)                       NULL,
  INDIC_SHIFT      VARCHAR2(1 BYTE)             DEFAULT 'N'                       NULL,
  INDIC_ALT        VARCHAR2(1 BYTE)             DEFAULT 'N'                       NULL,
  INDIC_CTRL       VARCHAR2(1 BYTE)             DEFAULT 'N'                       NULL,
  INDIC_INTER      VARCHAR2(1 BYTE)             DEFAULT 'N'                       NULL,
  DATE_CREAT       DATE                             NULL,
  UTILS_CREAT      VARCHAR2(123 BYTE)               NULL,
  DATE_MODFC       DATE                             NULL,
  UTILS_MODFC      VARCHAR2(123 BYTE)               NULL,
  CODE_KEYPR       NUMBER(4)                        NULL,
  CODE_KEYDW       NUMBER(4)                        NULL,
  REF_DISPN_FONCT  NUMBER(10)                       NULL,
  INDIC_ACTIF      VARCHAR2(1 BYTE)             DEFAULT 'O'                       NULL
);


Prompt Table SIE_19_DISPN_FONCT;
CREATE TABLE SIE_19_DISPN_FONCT
(
  SEQNC         NUMBER(10)                          NULL,
  REF_PRODT     NUMBER(10)                          NULL,
  REF_FONCT     NUMBER(10)                          NULL,
  VALR_ATRIB_1  VARCHAR2(200 BYTE)                  NULL,
  VALR_ATRIB_2  VARCHAR2(200 BYTE)                  NULL,
  VALR_ATRIB_3  VARCHAR2(200 BYTE)                  NULL,
  VALR_ATRIB_4  VARCHAR2(200 BYTE)                  NULL,
  VALR_ATRIB_5  VARCHAR2(200 BYTE)                  NULL,
  DATE_CREAT    DATE                                NULL,
  UTILS_CREAT   VARCHAR2(123 BYTE)                  NULL,
  DATE_MODFC    DATE                                NULL,
  UTILS_MODFC   VARCHAR2(123 BYTE)                  NULL
);


Prompt Table SIE_19_FONCT;
CREATE TABLE SIE_19_FONCT
(
  SEQNC                   NUMBER(10)                NULL,
  CODE                    VARCHAR2(23 BYTE)         NULL,
  DATE_CREAT              DATE                      NULL,
  UTILS_CREAT             VARCHAR2(123 BYTE)        NULL,
  DATE_MODFC              DATE                      NULL,
  UTILS_MODFC             VARCHAR2(123 BYTE)        NULL,
  TITRE_ATRIB1            VARCHAR2(60 BYTE)         NULL,
  REF_DV_TYPE_ATRIB1      NUMBER(10)                NULL,
  VALR_DEFT_ATRIB1        VARCHAR2(200 BYTE)        NULL,
  TITRE_ATRIB2            VARCHAR2(60 BYTE)         NULL,
  TITRE_ATRIB3            VARCHAR2(60 BYTE)         NULL,
  TITRE_ATRIB4            VARCHAR2(60 BYTE)         NULL,
  TITRE_ATRIB5            VARCHAR2(60 BYTE)         NULL,
  REF_DV_TYPE_ATRIB2      NUMBER(10)                NULL,
  REF_DV_TYPE_ATRIB3      NUMBER(10)                NULL,
  REF_DV_TYPE_ATRIB4      NUMBER(10)                NULL,
  REF_DV_TYPE_ATRIB5      NUMBER(10)                NULL,
  VALR_DEFT_ATRIB2        VARCHAR2(200 BYTE)        NULL,
  VALR_DEFT_ATRIB3        VARCHAR2(200 BYTE)        NULL,
  VALR_DEFT_ATRIB4        VARCHAR2(200 BYTE)        NULL,
  VALR_DEFT_ATRIB5        VARCHAR2(200 BYTE)        NULL,
  REF_DV_TYPE_ACTIO       NUMBER(10)                NULL,
  EXPRE_ACTIO             VARCHAR2(4000 BYTE)       NULL,
  REF_DV_TYPE_EXPRE       NUMBER(10)                NULL,
  INDIC_AFECT_INPUT_HTML  VARCHAR2(1 BYTE)      DEFAULT 'O'                       NULL,
  INDIC_PREVN_ACTIO_DEFT  VARCHAR2(1 BYTE)      DEFAULT 'O'                       NULL,
  INDIC_CLE               VARCHAR2(1 BYTE)      DEFAULT 'O'                       NULL,
  INDIC_BOUTN             VARCHAR2(1 BYTE)      DEFAULT 'O'                       NULL,
  CONDT_PRISE_CHARG       VARCHAR2(200 BYTE)        NULL
);


Prompt Table SIE_19_FONCT_LANG;
CREATE TABLE SIE_19_FONCT_LANG
(
  SEQNC        NUMBER(10)                           NULL,
  NOM          VARCHAR2(60 BYTE)                    NULL,
  REF_LANG     NUMBER(10)                           NULL,
  DESCR        VARCHAR2(4000 BYTE)                  NULL,
  DATE_CREAT   DATE                                 NULL,
  UTILS_CREAT  VARCHAR2(123 BYTE)                   NULL,
  DATE_MODFC   DATE                                 NULL,
  UTILS_MODFC  VARCHAR2(123 BYTE)                   NULL,
  REF_FONCT    NUMBER(10)                           NULL
);


Prompt Table SIE_19_SPECF_FONCT;
CREATE TABLE SIE_19_SPECF_FONCT
(
  SEQNC              NUMBER(10)                     NULL,
  REF_DISPN_FONCT    NUMBER(10)                     NULL,
  REF_ITEM           NUMBER(10)                     NULL,
  REF_PAGE           NUMBER(10)                     NULL,
  REF_DV_TYPE_SUBST  NUMBER(10)                     NULL,
  VALR_ATRIB_1       VARCHAR2(200 BYTE)             NULL,
  VALR_ATRIB_2       VARCHAR2(200 BYTE)             NULL,
  VALR_ATRIB_3       VARCHAR2(200 BYTE)             NULL,
  VALR_ATRIB_4       VARCHAR2(200 BYTE)             NULL,
  VALR_ATRIB_5       VARCHAR2(200 BYTE)             NULL,
  DATE_CREAT         DATE                           NULL,
  UTILS_CREAT        VARCHAR2(123 BYTE)             NULL,
  DATE_MODFC         DATE                           NULL,
  UTILS_MODFC        VARCHAR2(123 BYTE)             NULL,
  DNR_REF_PAGE       NUMBER(10)                     NULL
);


Prompt Table SIE_20_DEPLM;
CREATE TABLE SIE_20_DEPLM
(
  SEQNC           NUMBER(10)                        NULL,
  NOM             VARCHAR2(60 BYTE)                 NULL,
  DATE_CREAT      DATE                              NULL,
  UTILS_CREAT     VARCHAR2(123 BYTE)                NULL,
  DATE_MODFC      DATE                              NULL,
  UTILS_MODFC     VARCHAR2(123 BYTE)                NULL,
  REF_MODL        NUMBER(10)                        NULL,
  REF_MODL_PARMT  NUMBER(10)                        NULL,
  REF_PRODT_LANG  NUMBER(10)                        NULL
);


Prompt Table SIE_20_DETL_DOCMN;
CREATE TABLE SIE_20_DETL_DOCMN
(
  SEQNC            NUMBER(10)                       NULL,
  REF_DOCMN        NUMBER(10)                       NULL,
  REF_SECTN_DOCMN  NUMBER(10)                       NULL,
  REF_DETL_DOCMN   NUMBER(10)                       NULL,
  DATE_CREAT       DATE                             NULL,
  UTILS_CREAT      VARCHAR2(123 BYTE)               NULL,
  DATE_MODFC       DATE                             NULL,
  UTILS_MODFC      VARCHAR2(123 BYTE)               NULL,
  VALR             VARCHAR2(4000 BYTE)              NULL
);


Prompt Table SIE_20_DOCMN;
CREATE TABLE SIE_20_DOCMN
(
  SEQNC                  NUMBER(10)                 NULL,
  REF_PRODT_LANG         NUMBER(10)                 NULL,
  DATE_CREAT             DATE                       NULL,
  UTILS_CREAT            VARCHAR2(123 BYTE)         NULL,
  DATE_MODFC             DATE                       NULL,
  UTILS_MODFC            VARCHAR2(123 BYTE)         NULL,
  REF_STRUC_APLIC        NUMBER(10)                 NULL,
  REF_SEQNC_STRUC_APLIC  NUMBER(10)                 NULL
);


Prompt Table SIE_20_MODL;
CREATE TABLE SIE_20_MODL
(
  SEQNC                     NUMBER(10)              NULL,
  REF_DV_TYPE_MODL          NUMBER(10)              NULL,
  REF_VERSN                 NUMBER(10)              NULL,
  REF_MODL                  NUMBER(10)              NULL,
  NOM_ORGAN                 VARCHAR2(30 BYTE)       NULL,
  NUMR_SURCH                NUMBER(2)               NULL,
  INDIC_AGREG               VARCHAR2(1 BYTE)    DEFAULT 'N'                       NULL,
  INDIC_PIPLN               VARCHAR2(1 BYTE)    DEFAULT 'N'                       NULL,
  INDIC_DETRM               VARCHAR2(1 BYTE)    DEFAULT 'N'                       NULL,
  INDIC_AUTHID_CURNT_UTILS  VARCHAR2(1 BYTE)    DEFAULT 'N'                       NULL,
  INDIC_PUBLC               VARCHAR2(1 BYTE)    DEFAULT 'N'                       NULL,
  DATE_CREAT                DATE                    NULL,
  UTILS_CREAT               VARCHAR2(123 BYTE)      NULL,
  DATE_MODFC                DATE                    NULL,
  UTILS_MODFC               VARCHAR2(123 BYTE)      NULL,
  VERSN_BD_APLIC            VARCHAR2(30 BYTE)       NULL
);


Prompt Table SIE_20_MODL_EXCEP;
CREATE TABLE SIE_20_MODL_EXCEP
(
  SEQNC        NUMBER(10)                           NULL,
  REF_MODL     NUMBER(10)                           NULL,
  NOM_ORGAN    VARCHAR2(30 BYTE)                    NULL,
  DATE_CREAT   DATE                                 NULL,
  UTILS_CREAT  VARCHAR2(123 BYTE)                   NULL,
  DATE_MODFC   DATE                                 NULL,
  UTILS_MODFC  VARCHAR2(123 BYTE)                   NULL
);


Prompt Table SIE_20_MODL_PARMT;
CREATE TABLE SIE_20_MODL_PARMT
(
  SEQNC            NUMBER(10)                       NULL,
  REF_MODL         NUMBER(10)                       NULL,
  NOM_ORGAN        VARCHAR2(30 BYTE)                NULL,
  REF_DV_TYPE_DON  NUMBER(10)                       NULL,
  POSTN            NUMBER(3)                        NULL,
  VALR_DEFT        VARCHAR2(200 BYTE)               NULL,
  SENS             VARCHAR2(15 BYTE)                NULL,
  DATE_CREAT       DATE                             NULL,
  UTILS_CREAT      VARCHAR2(123 BYTE)               NULL,
  DATE_MODFC       DATE                             NULL,
  UTILS_MODFC      VARCHAR2(123 BYTE)               NULL,
  INDIC_PUBLC      VARCHAR2(1 BYTE)             DEFAULT 'N'                       NULL,
  INDIC_RETR       VARCHAR2(1 BYTE)             DEFAULT 'N'                       NULL
);


Prompt Table SIE_20_SECTN_DOCMN;
CREATE TABLE SIE_20_SECTN_DOCMN
(
  SEQNC              NUMBER(10)                     NULL,
  REF_DV_TYPE_SECTN  NUMBER(10)                     NULL,
  REF_SECTN_DOCMN    NUMBER(10)                     NULL,
  REF_STRUC_APLIC    NUMBER(10)                     NULL,
  DATE_CREAT         DATE                           NULL,
  UTILS_CREAT        VARCHAR2(123 BYTE)             NULL,
  DATE_MODFC         DATE                           NULL,
  UTILS_MODFC        VARCHAR2(123 BYTE)             NULL,
  NOM                VARCHAR2(30 BYTE)              NULL,
  TITRE              VARCHAR2(60 BYTE)              NULL,
  DESCR              VARCHAR2(4000 BYTE)            NULL,
  REF_FORMT          NUMBER(10)                     NULL
);


Prompt Table SIE_21_PLUGN_ARBRE;
CREATE TABLE SIE_21_PLUGN_ARBRE
(
  SEQNC                           NUMBER(10)        NULL,
  ENONC_PRE_REQT                  VARCHAR2(4000 BYTE)     NULL,
  NOM_TABLE                       VARCHAR2(30 BYTE)     NULL,
  COLN_TITRE                      VARCHAR2(30 BYTE)     NULL,
  COLN_TYPE                       VARCHAR2(30 BYTE) DEFAULT NULL     NULL,
  COLN_VALR                       VARCHAR2(30 BYTE)     NULL,
  COLN_AIDE_INSTA                 VARCHAR2(30 BYTE)     NULL,
  COLN_LIEN                       VARCHAR2(400 BYTE)     NULL,
  COLN_ID                         VARCHAR2(30 BYTE)     NULL,
  COLN_ID_PARNT                   VARCHAR2(30 BYTE)     NULL,
  ENONC_CONDT                     VARCHAR2(400 BYTE)     NULL,
  ENONC_CONDT_COMNC_PAR           VARCHAR2(400 BYTE)     NULL,
  ENONC_TRIER_PAR                 VARCHAR2(400 BYTE)     NULL,
  DATE_CREAT                      DATE              NULL,
  UTILS_CREAT                     VARCHAR2(123 BYTE)     NULL,
  DATE_MODFC                      DATE              NULL,
  UTILS_MODFC                     VARCHAR2(123 BYTE)     NULL,
  INDIC_RENMR                     VARCHAR2(1 BYTE) DEFAULT 'N'     NULL,
  INDIC_DEPLC                     VARCHAR2(1 BYTE) DEFAULT 'N'     NULL,
  COLN_TITRE_AIDE_INSTA           VARCHAR2(30 BYTE)     NULL,
  LARGR_REGN_ARBRE                NUMBER(10)    DEFAULT 256                       NULL,
  HAUTR_REGN_ARBRE                NUMBER(10)    DEFAULT 768                       NULL,
  REF_PLUGN_ARBRE_NOEUD           NUMBER(10)        NULL,
  INDIC_COMNC_PAR_RACN            VARCHAR2(1 BYTE) DEFAULT 'O'     NULL,
  IMAGE_SPRIT                     VARCHAR2(400 BYTE)     NULL,
  TYPE_ICONE_NOEUD                VARCHAR2(5 BYTE) DEFAULT 'RESRC'     NULL,
  REF_FORMT_RESRC                 NUMBER(10)        NULL,
  REF_RESRC_COMPS                 NUMBER(10)        NULL,
  OBTEN_JSON_ARBRE_NOMBR_NIV      NUMBER(10)    DEFAULT 2                         NULL,
  OBTEN_JSON_NOEUD_NOMBR_NIV      NUMBER(10)    DEFAULT 1                         NULL,
  MODE_CACHE                      VARCHAR2(23 BYTE) DEFAULT 'SESN'     NULL,
  DNR_REF_PRODT                   NUMBER(10)        NULL,
  CODE                            VARCHAR2(23 BYTE)     NULL,
  INDIC_CHARG_PROGR               VARCHAR2(1 BYTE) DEFAULT 'O'     NULL,
  INDIC_FLECH_AIDE_INSTA          VARCHAR2(1 BYTE) DEFAULT 'N'     NULL,
  REF_DV_CURSR_AIDE_INSTA         NUMBER(10)        NULL,
  NOM_PROCD_GLISR_ELEMN_ARBRE     VARCHAR2(92 BYTE)     NULL,
  NOM_PROCD_DEPSR_ELEMN_ARBRE     VARCHAR2(92 BYTE)     NULL,
  INDIC_COMNC_PAR_COLN_PARNT_NUL  VARCHAR2(1 BYTE) DEFAULT 'O'     NULL,
  REF_PRODT                       NUMBER(10)        NULL
);


Prompt Table SIE_21_PLUGN_ARBRE_NOEUD;
CREATE TABLE SIE_21_PLUGN_ARBRE_NOEUD
(
  SEQNC              NUMBER(10)                     NULL,
  CODE               VARCHAR2(35 BYTE)              NULL,
  NOM                VARCHAR2(60 BYTE)              NULL,
  DESCR              VARCHAR2(2000 BYTE)            NULL,
  REF_PLUGN_ARBRE    NUMBER(10)                     NULL,
  INDIC_SELCT_NOEUD  VARCHAR2(1 BYTE)           DEFAULT 'O'                       NULL,
  INDIC_OUVRI_NOEUD  VARCHAR2(1 BYTE)           DEFAULT 'O'                       NULL,
  INDIC_CREER_NOEUD  VARCHAR2(1 BYTE)           DEFAULT 'O'                       NULL,
  INDIC_SUPRM_NOEUD  VARCHAR2(1 BYTE)           DEFAULT 'O'                       NULL,
  DATE_CREAT         DATE                           NULL,
  UTILS_CREAT        VARCHAR2(123 BYTE)             NULL,
  DATE_MODFC         DATE                           NULL,
  UTILS_MODFC        VARCHAR2(123 BYTE)             NULL,
  INDIC_FERMR_NOEUD  VARCHAR2(1 BYTE)           DEFAULT 'O'                       NULL,
  REF_RESRC          NUMBER(10)                     NULL,
  REF_OCURN_RESRC    NUMBER(10)                     NULL,
  DNR_REF_PRODT      NUMBER(10)                     NULL
);


Prompt Table SIE_21_PLUGN_CALND;
CREATE TABLE SIE_21_PLUGN_CALND
(
  SEQNC                      NUMBER(10)             NULL,
  ENONC_PRE_REQT             VARCHAR2(4000 BYTE)     NULL,
  REF_DV_VUE_DEFT            NUMBER(10)             NULL,
  CONCT_PROPR_ENTET_GAUCH    VARCHAR2(400 BYTE)     NULL,
  CONCT_PROPR_ENTET_CENTR    VARCHAR2(400 BYTE)     NULL,
  CONCT_PROPR_ENTET_DROIT    VARCHAR2(400 BYTE)     NULL,
  INDIC_EVENM_MODFB          VARCHAR2(1 BYTE)   DEFAULT 'O'                       NULL,
  NOM_TABLE                  VARCHAR2(30 BYTE)      NULL,
  COLN_TITRE                 VARCHAR2(30 BYTE)      NULL,
  COLN_DESCR                 VARCHAR2(30 BYTE)      NULL,
  COLN_TYPE                  VARCHAR2(30 BYTE)      NULL,
  COLN_AIDE_INSTA            VARCHAR2(30 BYTE)      NULL,
  COLN_LIEN                  VARCHAR2(30 BYTE)      NULL,
  COLN_INDIC_JOURN_COMPL     VARCHAR2(30 BYTE)      NULL,
  COLN_DATE_DEBUT            VARCHAR2(30 BYTE)      NULL,
  COLN_DATE_FIN              VARCHAR2(30 BYTE)      NULL,
  DATE_CREAT                 DATE                   NULL,
  UTILS_CREAT                VARCHAR2(123 BYTE)     NULL,
  DATE_MODFC                 DATE                   NULL,
  UTILS_MODFC                VARCHAR2(123 BYTE)     NULL,
  LARGR_REGN_CALND           NUMBER(4)              NULL,
  COLN_TITRE_AIDE_INSTA      VARCHAR2(30 BYTE)      NULL,
  INDIC_AGEND                VARCHAR2(1 BYTE)   DEFAULT 'N'                       NULL,
  AGEND_NOM_TABLE            VARCHAR2(30 BYTE)      NULL,
  AGEND_COLN_TITRE           VARCHAR2(30 BYTE)      NULL,
  COLN_VALR                  VARCHAR2(30 BYTE)      NULL,
  AGEND_COLN_VALR            VARCHAR2(30 BYTE)      NULL,
  AGEND_COLN_COULR           VARCHAR2(30 BYTE)      NULL,
  CODE                       VARCHAR2(23 BYTE)  DEFAULT NULL                      NULL,
  DNR_REF_PRODT              NUMBER(10)             NULL,
  COLN_AGEND                 VARCHAR2(30 BYTE)      NULL,
  COLN_IDENT                 VARCHAR2(30 BYTE)      NULL,
  COLN_DATE_JOURN_COMPL      VARCHAR2(30 BYTE)      NULL,
  COLN_DATE_FIN_JOURN_COMPL  VARCHAR2(30 BYTE)      NULL,
  NOMBR_MINTS_INTER          NUMBER(4)          DEFAULT 30                        NULL,
  HEURE_DEBUT_NORML          VARCHAR2(10 BYTE)  DEFAULT 8                         NULL,
  HEURE_FIN_NORML            VARCHAR2(10 BYTE)  DEFAULT 17                        NULL,
  HEURE_DEBUT_EXTEN          VARCHAR2(10 BYTE)      NULL,
  HEURE_FIN_EXTEN            VARCHAR2(10 BYTE)      NULL,
  COLN_INDIC_EVENM_MODFB     VARCHAR2(30 BYTE)  DEFAULT NULL                      NULL,
  REF_PRODT                  NUMBER(10)             NULL
);


Prompt Table SIE_21_PLUGN_CALND_COULR;
CREATE TABLE SIE_21_PLUGN_CALND_COULR
(
  SEQNC        NUMBER(10)                           NULL,
  ORDRE_PRESN  NUMBER                               NULL,
  COULR        VARCHAR2(7 BYTE)                     NULL,
  DATE_CREAT   DATE                                 NULL,
  UTILS_CREAT  VARCHAR2(123 BYTE)                   NULL,
  DATE_MODFC   DATE                                 NULL,
  UTILS_MODFC  VARCHAR2(123 BYTE)                   NULL,
  COULR_TEXT   VARCHAR2(7 BYTE)                     NULL
);


Prompt Table SIE_21_PLUGN_CALND_TYPE;
CREATE TABLE SIE_21_PLUGN_CALND_TYPE
(
  SEQNC             NUMBER(10)                      NULL,
  CODE              VARCHAR2(23 BYTE)               NULL,
  NOM               VARCHAR2(60 BYTE)               NULL,
  DESCR             VARCHAR2(2000 BYTE)             NULL,
  DATE_CREAT        DATE                            NULL,
  UTILS_CREAT       VARCHAR2(123 BYTE)              NULL,
  DATE_MODFC        DATE                            NULL,
  UTILS_MODFC       VARCHAR2(123 BYTE)              NULL,
  COULR_TEXTE       VARCHAR2(7 BYTE)                NULL,
  COULR_BORDR       VARCHAR2(7 BYTE)                NULL,
  COULR_ARIER_PLAN  VARCHAR2(7 BYTE)                NULL,
  REF_DOMN          NUMBER(10)                      NULL
);


Prompt Table SIE_21_PLUGN_ITEM_MENU;
CREATE TABLE SIE_21_PLUGN_ITEM_MENU
(
  SEQNC                   NUMBER(10)                NULL,
  REF_ITEM_MENU           NUMBER(10)                NULL,
  REF_PLUGN_MENU          NUMBER(10)                NULL,
  NIV_ITEM                NUMBER(3)                 NULL,
  ETEND_NOMBR_COLN        NUMBER(3)             DEFAULT 1                         NULL,
  RANG_ITEM               NUMBER(3)             DEFAULT 1                         NULL,
  COLN_ITEM               NUMBER(3)             DEFAULT 1                         NULL,
  DATE_CREAT              DATE                      NULL,
  UTILS_CREAT             VARCHAR2(123 BYTE)        NULL,
  DATE_MODFC              DATE                      NULL,
  UTILS_MODFC             VARCHAR2(123 BYTE)        NULL,
  DNR_REF_PRODT           NUMBER(10)                NULL,
  REF_DV_CONTN_ITEM_MENU  NUMBER(10)                NULL,
  REF_DV_ALIGN            NUMBER(10)                NULL
);


Prompt Table SIE_21_PLUGN_MENU;
CREATE TABLE SIE_21_PLUGN_MENU
(
  SEQNC               NUMBER(10)                    NULL,
  CODE                VARCHAR2(23 BYTE)             NULL,
  DATE_CREAT          DATE                          NULL,
  UTILS_CREAT         VARCHAR2(123 BYTE)            NULL,
  DATE_MODFC          DATE                          NULL,
  UTILS_MODFC         VARCHAR2(123 BYTE)            NULL,
  DNR_REF_PRODT       NUMBER(10)                    NULL,
  REF_DV_TYPE_MENU    NUMBER(10)                    NULL,
  LARGR_REGN_MENU     NUMBER(4)                     NULL,
  HAUTR_REGN_MENU     NUMBER(4)                     NULL,
  REF_DV_ORIEN_MENU   NUMBER(10)                    NULL,
  REF_DV_COULR_THEME  NUMBER(10)                    NULL,
  REF_DV_COULR_PRINC  NUMBER(10)                    NULL,
  REF_MENU            NUMBER(10)                    NULL,
  REF_DV_FORMT_MENU   NUMBER(10)                    NULL,
  REF_PRODT           NUMBER(10)                    NULL
);


Prompt Table SIE_23_APLIC_MODL_RECHR;
CREATE TABLE SIE_23_APLIC_MODL_RECHR
(
  SEQNC                        NUMBER(10)           NULL,
  REF_MODL_RECHR               NUMBER(10)           NULL,
  REF_STRUC_APLIC_RECHR        NUMBER(10)           NULL,
  REF_STRUC_APLIC_LIEN         NUMBER(10)           NULL,
  NOMBR_MAXIM_RESLT            NUMBER(4)            NULL,
  UTILS_CREAT                  VARCHAR2(123 BYTE)     NULL,
  DATE_CREAT                   DATE                 NULL,
  UTILS_MODFC                  VARCHAR2(123 BYTE)     NULL,
  DATE_MODFC                   DATE                 NULL,
  REF_ATRIB_STRUC_APLIC_AFICH  NUMBER(10)           NULL
);


Prompt Table SIE_23_DETL_APLIC_MODL_RECHR;
CREATE TABLE SIE_23_DETL_APLIC_MODL_RECHR
(
  SEQNC                  NUMBER(10)                 NULL,
  REF_APLIC_MODL_RECHR   NUMBER(10)                 NULL,
  REF_ATRIB_STRUC_APLIC  NUMBER(10)                 NULL,
  REF_PATRN_RECHR        NUMBER(10)                 NULL,
  ORDRE_EXECT            NUMBER(3)                  NULL,
  PERTN                  NUMBER(3)                  NULL,
  UTILS_CREAT            VARCHAR2(123 BYTE)         NULL,
  DATE_CREAT             DATE                       NULL,
  UTILS_MODFC            VARCHAR2(123 BYTE)         NULL,
  DATE_MODFC             DATE                       NULL
);


Prompt Table SIE_23_DETL_RESLT_RECHR;
CREATE TABLE SIE_23_DETL_RESLT_RECHR
(
  SEQNC                      NUMBER(10)             NULL,
  REF_RECHR                  NUMBER(10)             NULL,
  REF_ENONC_RECHR            NUMBER(10)             NULL,
  UTILS_CREAT                VARCHAR2(123 BYTE)     NULL,
  DATE_CREAT                 DATE                   NULL,
  UTILS_MODFC                VARCHAR2(123 BYTE)     NULL,
  DATE_MODFC                 DATE                   NULL,
  REF_DETL_APLIC_MODL_RECHR  NUMBER(10)             NULL,
  DNR_PERTN                  NUMBER(3)              NULL,
  REF_SEQNC_STRUC_APLIC      NUMBER(10)             NULL,
  REF_RESLT_RECHR            NUMBER(10)             NULL
);


Prompt Table SIE_23_ENONC_RECHR;
CREATE TABLE SIE_23_ENONC_RECHR
(
  SEQNC        NUMBER(10)                           NULL,
  REF_RECHR    NUMBER(10)                           NULL,
  MOT          VARCHAR2(100 BYTE)                   NULL,
  ORDRE_APART  NUMBER(3)                            NULL,
  UTILS_CREAT  VARCHAR2(123 BYTE)                   NULL,
  DATE_CREAT   DATE                                 NULL,
  UTILS_MODFC  VARCHAR2(123 BYTE)                   NULL,
  DATE_MODFC   DATE                                 NULL
);


Prompt Table SIE_23_MODL_RECHR;
CREATE TABLE SIE_23_MODL_RECHR
(
  SEQNC          NUMBER(10)                         NULL,
  CODE           VARCHAR2(23 BYTE)                  NULL,
  REF_DOMN       NUMBER(10)                         NULL,
  NOM            VARCHAR2(60 BYTE)                  NULL,
  DESCR          VARCHAR2(4000 BYTE)                NULL,
  UTILS_CREAT    VARCHAR2(123 BYTE)                 NULL,
  DATE_CREAT     DATE                               NULL,
  UTILS_MODFC    VARCHAR2(123 BYTE)                 NULL,
  DATE_MODFC     DATE                               NULL,
  REF_PRODT      NUMBER(10)                         NULL,
  DNR_REF_PRODT  NUMBER(10)                         NULL
);


Prompt Table SIE_23_PATRN_RECHR;
CREATE TABLE SIE_23_PATRN_RECHR
(
  SEQNC              NUMBER(10)                     NULL,
  CODE               VARCHAR2(23 BYTE)              NULL,
  NOM                VARCHAR2(60 BYTE)              NULL,
  DESCR              VARCHAR2(4000 BYTE)            NULL,
  ENONC_PLSQL_GAUCH  VARCHAR2(200 BYTE)             NULL,
  ENONC_PLSQL_DROIT  VARCHAR2(200 BYTE)             NULL,
  UTILS_CREAT        VARCHAR2(123 BYTE)             NULL,
  DATE_CREAT         DATE                           NULL,
  UTILS_MODFC        VARCHAR2(123 BYTE)             NULL,
  DATE_MODFC         DATE                           NULL,
  OPERT              VARCHAR2(23 BYTE)              NULL,
  REF_PRODT          NUMBER(10)                     NULL,
  DNR_REF_PRODT      NUMBER(10)                     NULL
);


Prompt Table SIE_23_RECHR;
CREATE TABLE SIE_23_RECHR
(
  SEQNC           NUMBER(10)                        NULL,
  REF_UTILS       NUMBER(10)                        NULL,
  DATE_EXECT      DATE                              NULL,
  UTILS_CREAT     VARCHAR2(123 BYTE)                NULL,
  DATE_CREAT      DATE                              NULL,
  UTILS_MODFC     VARCHAR2(123 BYTE)                NULL,
  DATE_MODFC      DATE                              NULL,
  REF_MODL_RECHR  NUMBER(10)                        NULL
);


Prompt Table SIE_23_RESLT_RECHR;
CREATE TABLE SIE_23_RESLT_RECHR
(
  SEQNC                      NUMBER(10)             NULL,
  REF_RECHR                  NUMBER(10)             NULL,
  UTILS_CREAT                VARCHAR2(123 BYTE)     NULL,
  DATE_CREAT                 DATE                   NULL,
  UTILS_MODFC                VARCHAR2(123 BYTE)     NULL,
  DATE_MODFC                 DATE                   NULL,
  DNR_LIBL_STRUC_APLIC_HTML  VARCHAR2(4000 BYTE)     NULL,
  DNR_LIBL_STRUC_APLIC       VARCHAR2(1000 BYTE)     NULL,
  DNR_PERTN                  NUMBER(5,2)            NULL,
  DNR_LIEN                   VARCHAR2(4000 BYTE)     NULL,
  DNR_DECMP_RESLT            NUMBER(4)              NULL,
  REF_APLIC_MODL_RECHR       NUMBER(10)             NULL,
  DNR_REF_STRUC_APLIC        NUMBER(10)             NULL,
  REF_SEQNC_STRUC_APLIC      NUMBER(10)             NULL
);


Prompt Table SIE_25_CHAMP;
CREATE TABLE SIE_25_CHAMP
(
  SEQNC              NUMBER(10)                     NULL,
  CODE               VARCHAR2(23 BYTE)              NULL,
  POSTN_X            NUMBER(10)                     NULL,
  POSTN_Y            NUMBER(10)                     NULL,
  ANGLE_ORINT        NUMBER(10)                     NULL,
  REF_FORMT          NUMBER(10)                     NULL,
  REF_VERSN_PUBLC    NUMBER(10)                     NULL,
  REF_DV_TYPE_CHAMP  NUMBER(10)                     NULL,
  INDIC_MODIF        VARCHAR2(1 BYTE)           DEFAULT 'N'                       NULL,
  NOM                VARCHAR2(60 BYTE)              NULL,
  DATE_CREAT         DATE                           NULL,
  UTILS_CREAT        VARCHAR2(123 BYTE)             NULL,
  DATE_MODFC         DATE                           NULL,
  UTILS_MODFC        VARCHAR2(123 BYTE)             NULL
);


Prompt Table SIE_25_CHAMP_PUBLC_TRAVL;
CREATE TABLE SIE_25_CHAMP_PUBLC_TRAVL
(
  SEQNC            NUMBER(10)                       NULL,
  REF_CHAMP        NUMBER(10)                       NULL,
  REF_PUBLC_TRAVL  NUMBER(10)                       NULL,
  CONTN            VARCHAR2(4000 BYTE)              NULL,
  DATE_CREAT       DATE                             NULL,
  UTILS_CREAT      VARCHAR2(123 BYTE)               NULL,
  DATE_MODFC       DATE                             NULL,
  UTILS_MODFC      VARCHAR2(123 BYTE)               NULL
);


Prompt Table SIE_25_DOMN_TYPE_PUBLC;
CREATE TABLE SIE_25_DOMN_TYPE_PUBLC
(
  SEQNC           NUMBER(10)                        NULL,
  REF_DOMN        NUMBER(10)                        NULL,
  REF_TYPE_PUBLC  NUMBER(10)                        NULL,
  REF_PUBLC       NUMBER(10)                        NULL,
  DATE_CREAT      DATE                              NULL,
  UTILS_CREAT     VARCHAR2(123 BYTE)                NULL,
  DATE_MODFC      DATE                              NULL,
  UTILS_MODFC     VARCHAR2(123 BYTE)                NULL
);


Prompt Table SIE_25_ELEMN_CONFG_PUBLC;
CREATE TABLE SIE_25_ELEMN_CONFG_PUBLC
(
  SEQNC           NUMBER(10)                        NULL,
  REF_TYPE_PUBLC  NUMBER(10)                        NULL,
  CODE            VARCHAR2(23 BYTE)                 NULL,
  NOM             VARCHAR2(60 BYTE)                 NULL,
  DESCR           VARCHAR2(200 BYTE)                NULL,
  DATE_CREAT      DATE                              NULL,
  UTILS_CREAT     VARCHAR2(123 BYTE)                NULL,
  DATE_MODFC      DATE                              NULL,
  UTILS_MODFC     VARCHAR2(123 BYTE)                NULL,
  TYPE_DON        VARCHAR2(1 BYTE)                  NULL,
  DNR_REF_PRODT   NUMBER(10)                        NULL
);


Prompt Table SIE_25_ENGIN;
CREATE TABLE SIE_25_ENGIN
(
  SEQNC              NUMBER(10)                     NULL,
  CODE               VARCHAR2(23 BYTE)              NULL,
  REF_DV_FORMT_SORT  NUMBER(10)                     NULL,
  URL_SERVL          VARCHAR2(200 BYTE)             NULL,
  DATE_CREAT         DATE                           NULL,
  UTILS_CREAT        VARCHAR2(123 BYTE)             NULL,
  DATE_MODFC         DATE                           NULL,
  UTILS_MODFC        VARCHAR2(123 BYTE)             NULL,
  URL_SERVL_EXTER    VARCHAR2(200 BYTE)             NULL
);


Prompt Table SIE_25_ENGIN_VERSN_PUBLC;
CREATE TABLE SIE_25_ENGIN_VERSN_PUBLC
(
  SEQNC            NUMBER(10)                       NULL,
  DATE_CREAT       DATE                             NULL,
  UTILS_CREAT      VARCHAR2(123 BYTE)               NULL,
  DATE_MODFC       DATE                             NULL,
  UTILS_MODFC      VARCHAR2(123 BYTE)               NULL,
  REF_VERSN_PUBLC  NUMBER(10)                       NULL,
  REF_ENGIN        NUMBER(10)                       NULL,
  IDEN_ACCES       VARCHAR2(60 BYTE)                NULL,
  PDF_FUSN         BLOB                             NULL,
  DNR_REF_PRODT    NUMBER(10)                       NULL
);


Prompt Table SIE_25_GROUP_PUBLC;
CREATE TABLE SIE_25_GROUP_PUBLC
(
  SEQNC        NUMBER(10)                           NULL,
  CODE         VARCHAR2(23 BYTE)                    NULL,
  NOM          VARCHAR2(60 BYTE)                    NULL,
  DESCR        VARCHAR2(4000 BYTE)                  NULL,
  DATE_CREAT   DATE                                 NULL,
  UTILS_CREAT  VARCHAR2(123 BYTE)                   NULL,
  DATE_MODFC   DATE                                 NULL,
  UTILS_MODFC  VARCHAR2(123 BYTE)                   NULL
);


Prompt Table SIE_25_JOURN_TRAVL_EXECT;
CREATE TABLE SIE_25_JOURN_TRAVL_EXECT
(
  SEQNC              NUMBER(10)                     NULL,
  REF_DV_TYPE_ECRIT  NUMBER(10)                     NULL,
  REF_TRAVL          NUMBER(10)                     NULL,
  REF_PUBLC_TRAVL    NUMBER(10)                     NULL,
  DATE_JOURN         DATE                           NULL,
  ENONC              VARCHAR2(4000 BYTE)            NULL
);


Prompt Table SIE_25_OCURN_PARMT_PUBLC_TRAVL;
CREATE TABLE SIE_25_OCURN_PARMT_PUBLC_TRAVL
(
  SEQNC                  NUMBER(10)                 NULL,
  VALR_DATE              DATE                       NULL,
  VALR_NUMBR             NUMBER                     NULL,
  VALR_VARCH             VARCHAR2(4000 BYTE)        NULL,
  REF_PARMT_PUBLC_TRAVL  NUMBER(10)                 NULL
);


Prompt Table SIE_25_PARMT_PUBLC_TRAVL;
CREATE TABLE SIE_25_PARMT_PUBLC_TRAVL
(
  SEQNC                 NUMBER(10)                  NULL,
  REF_PUBLC_TRAVL       NUMBER(10)                  NULL,
  REF_PARMT_TYPE_PUBLC  NUMBER(10)                  NULL,
  VALR_VARCH            VARCHAR2(4000 BYTE)         NULL,
  VALR_DATE             DATE                        NULL,
  VALR_NUMBR            NUMBER                      NULL,
  DATE_CREAT            DATE                        NULL,
  UTILS_CREAT           VARCHAR2(123 BYTE)          NULL,
  DATE_MODFC            DATE                        NULL,
  UTILS_MODFC           VARCHAR2(123 BYTE)          NULL
);


Prompt Table SIE_25_PARMT_PUBLC_TRAVL_EXECT;
CREATE TABLE SIE_25_PARMT_PUBLC_TRAVL_EXECT
(
  REF_TRAVL_PUBLC  NUMBER(10)                       NULL,
  VALR_NUMBR1      NUMBER                           NULL,
  VALR_VARCH1      VARCHAR2(256 BYTE)               NULL,
  VALR_DATE1       DATE                             NULL,
  VALR_NUMBR2      NUMBER                           NULL,
  VALR_VARCH2      VARCHAR2(256 BYTE)               NULL,
  VALR_DATE2       DATE                             NULL,
  VALR_NUMBR3      NUMBER                           NULL,
  VALR_VARCH3      VARCHAR2(256 BYTE)               NULL,
  VALR_DATE3       DATE                             NULL,
  VALR_NUMBR4      NUMBER                           NULL,
  VALR_VARCH4      VARCHAR2(256 BYTE)               NULL,
  VALR_DATE4       DATE                             NULL,
  VALR_NUMBR5      NUMBER                           NULL,
  VALR_VARCH5      VARCHAR2(256 BYTE)               NULL,
  VALR_DATE6       DATE                             NULL,
  VALR_NUMBR7      NUMBER                           NULL,
  VALR_VARCH7      VARCHAR2(256 BYTE)               NULL,
  VALR_DATE7       DATE                             NULL,
  VALR_NUMBR8      NUMBER                           NULL,
  VALR_VARCH8      VARCHAR2(256 BYTE)               NULL,
  VALR_DATE8       DATE                             NULL,
  VALR_NUMBR9      NUMBER                           NULL,
  VALR_VARCH9      VARCHAR2(256 BYTE)               NULL,
  VALR_DATE9       DATE                             NULL,
  VALR_NUMBR10     NUMBER                           NULL,
  VALR_VARCH10     VARCHAR2(256 BYTE)               NULL,
  VALR_DATE10      DATE                             NULL,
  REF_TRAVL        NUMBER(10)                       NULL,
  SEQNC            NUMBER(10)                       NULL,
  VALR_DATE5       DATE                             NULL,
  VALR_VARCH6      VARCHAR2(256 BYTE)               NULL,
  VALR_NUMBR6      NUMBER(10)                       NULL
);


Prompt Table SIE_25_PARMT_TYPE_PUBLC;
CREATE TABLE SIE_25_PARMT_TYPE_PUBLC
(
  SEQNC              NUMBER(10)                     NULL,
  REF_TYPE_PUBLC     NUMBER(10)                     NULL,
  REF_ENGIN          NUMBER(10)                     NULL,
  CODE               VARCHAR2(23 BYTE)              NULL,
  NOM                VARCHAR2(60 BYTE)              NULL,
  DESCR              VARCHAR2(4000 BYTE)            NULL,
  INDIC_PRESN_APPEL  VARCHAR2(1 BYTE)           DEFAULT 'N'                       NULL,
  INDIC_FIXE         VARCHAR2(1 BYTE)           DEFAULT 'O'                       NULL,
  VALR_DEFT          VARCHAR2(200 BYTE)             NULL,
  TYPE_VALR_DEFT     VARCHAR2(5 BYTE)           DEFAULT 'LITL'                    NULL,
  DATE_CREAT         DATE                           NULL,
  UTILS_CREAT        VARCHAR2(123 BYTE)             NULL,
  DATE_MODFC         DATE                           NULL,
  UTILS_MODFC        VARCHAR2(123 BYTE)             NULL,
  TYPE_DON           VARCHAR2(1 BYTE)               NULL,
  ORDRE_PRESN        NUMBER(3)                      NULL,
  CARDN              VARCHAR2(1 BYTE)               NULL,
  DNR_REF_PRODT      NUMBER(10)                     NULL
);


Prompt Table SIE_25_PUBLC;
CREATE TABLE SIE_25_PUBLC
(
  SEQNC            NUMBER(10)                       NULL,
  REF_TYPE_PUBLC   NUMBER(10)                       NULL,
  CODE             VARCHAR2(23 BYTE)                NULL,
  NOM              VARCHAR2(60 BYTE)                NULL,
  DESCR            VARCHAR2(200 BYTE)               NULL,
  DATE_CREAT       DATE                             NULL,
  UTILS_CREAT      VARCHAR2(123 BYTE)               NULL,
  DATE_MODFC       DATE                             NULL,
  UTILS_MODFC      VARCHAR2(123 BYTE)               NULL,
  REF_GROUP_PUBLC  NUMBER(10)                       NULL,
  DNR_REF_PRODT    NUMBER(10)                       NULL
);


Prompt Table SIE_25_PUBLC_TRAVL;
CREATE TABLE SIE_25_PUBLC_TRAVL
(
  SEQNC              NUMBER(10)                     NULL,
  REF_PUBLC          NUMBER(10)                     NULL,
  REF_TRAVL          NUMBER(10)                     NULL,
  DATE_CREAT         DATE                           NULL,
  UTILS_CREAT        VARCHAR2(123 BYTE)             NULL,
  DATE_MODFC         DATE                           NULL,
  UTILS_MODFC        VARCHAR2(123 BYTE)             NULL,
  REF_STAT           NUMBER(10)                     NULL,
  NOM                VARCHAR2(200 BYTE)             NULL,
  INDIC_PARMT_ALIMN  VARCHAR2(1 BYTE)           DEFAULT 'N'                       NULL,
  REF_VERSN_PUBLC    NUMBER(10)                     NULL
);


Prompt Table SIE_25_TRAVL;
CREATE TABLE SIE_25_TRAVL
(
  SEQNC           NUMBER(10)                        NULL,
  REF_UTILS       NUMBER(10)                        NULL,
  INDIC_IMEDT     VARCHAR2(1 BYTE)              DEFAULT 'O'                       NULL,
  NOM             VARCHAR2(200 BYTE)                NULL,
  DATE_CREAT      DATE                              NULL,
  UTILS_CREAT     VARCHAR2(123 BYTE)                NULL,
  DATE_MODFC      DATE                              NULL,
  UTILS_MODFC     VARCHAR2(123 BYTE)                NULL,
  REF_DOMN        NUMBER(10)                        NULL,
  REF_STAT        NUMBER(10)                        NULL,
  REF_TYPE_TRAVL  NUMBER(10)                        NULL
);


Prompt Table SIE_25_TYPE_PUBLC;
CREATE TABLE SIE_25_TYPE_PUBLC
(
  SEQNC            NUMBER(10)                       NULL,
  CODE             VARCHAR2(23 BYTE)                NULL,
  NOM              VARCHAR2(60 BYTE)                NULL,
  DESCR            VARCHAR2(200 BYTE)               NULL,
  DATE_CREAT       DATE                             NULL,
  UTILS_CREAT      VARCHAR2(123 BYTE)               NULL,
  DATE_MODFC       DATE                             NULL,
  UTILS_MODFC      VARCHAR2(123 BYTE)               NULL,
  REF_STRUC_APLIC  NUMBER(10)                       NULL,
  DNR_REF_PRODT    NUMBER(10)                       NULL
);


Prompt Table SIE_25_TYPE_TRAVL;
CREATE TABLE SIE_25_TYPE_TRAVL
(
  SEQNC        NUMBER(10)                           NULL,
  CODE         VARCHAR2(23 BYTE)                    NULL,
  NOM          VARCHAR2(60 BYTE)                    NULL,
  DESCR        VARCHAR2(200 BYTE)                   NULL,
  DATE_CREAT   DATE                                 NULL,
  UTILS_CREAT  VARCHAR2(123 BYTE)                   NULL,
  DATE_MODFC   DATE                                 NULL,
  UTILS_MODFC  VARCHAR2(123 BYTE)                   NULL,
  REF_DOMN     NUMBER(10)                           NULL
);


Prompt Table SIE_25_VALR_CHAMP;
CREATE TABLE SIE_25_VALR_CHAMP
(
  SEQNC            NUMBER(10)                       NULL,
  REF_CHAMP        NUMBER(10)                       NULL,
  REF_PUBLC_TRAVL  NUMBER(10)                       NULL,
  DATE_CREAT       DATE                             NULL,
  UTILS_CREAT      VARCHAR2(123 BYTE)               NULL,
  DATE_MODFC       DATE                             NULL,
  UTILS_MODFC      VARCHAR2(123 BYTE)               NULL,
  VALR_NOMBR       NUMBER(10)                       NULL,
  VALR_DATE        DATE                             NULL,
  VALR_VARCH       VARCHAR2(400 BYTE)               NULL
);


Prompt Table SIE_25_VALR_ELEMN_CONFG;
CREATE TABLE SIE_25_VALR_ELEMN_CONFG
(
  SEQNC                  NUMBER(10)                 NULL,
  REF_ELEMN_CONFG_PUBLC  NUMBER(10)                 NULL,
  DATE_DEBUT_EFECT       DATE                       NULL,
  DATE_FIN_EFECT         DATE                       NULL,
  VALR_VARCH             VARCHAR2(4000 BYTE)        NULL,
  VALR_DATE              DATE                       NULL,
  VALR_NUMBR             NUMBER                     NULL,
  DATE_CREAT             DATE                       NULL,
  UTILS_CREAT            VARCHAR2(123 BYTE)         NULL,
  DATE_MODFC             DATE                       NULL,
  UTILS_MODFC            VARCHAR2(123 BYTE)         NULL,
  REF_DOMN               NUMBER(10)                 NULL
);


Prompt Table SIE_25_VERSN_PUBLC;
CREATE TABLE SIE_25_VERSN_PUBLC
(
  SEQNC             NUMBER(10)                      NULL,
  DATE_CREAT        DATE                            NULL,
  UTILS_CREAT       VARCHAR2(123 BYTE)              NULL,
  DATE_MODFC        DATE                            NULL,
  UTILS_MODFC       VARCHAR2(123 BYTE)              NULL,
  DATE_DEBUT_EFECT  DATE                            NULL,
  DATE_FIN_EFECT    DATE                            NULL,
  REF_PUBLC         NUMBER(10)                      NULL,
  CODE              VARCHAR2(23 BYTE)               NULL,
  NOM               VARCHAR2(60 BYTE)               NULL,
  DESCR             VARCHAR2(200 BYTE)              NULL,
  DNR_REF_PRODT     NUMBER(10)                      NULL
);


Prompt Table SIE_29_CONTR;
CREATE TABLE SIE_29_CONTR
(
  SEQNC            NUMBER(10)                       NULL,
  CODE_CONTR       VARCHAR2(23 BYTE)                NULL,
  NOM_STRUC_ACCES  VARCHAR2(61 BYTE)                NULL,
  NOM              VARCHAR2(60 BYTE)                NULL,
  DESCR            VARCHAR2(4000 BYTE)              NULL,
  NIV_GRAVT        NUMBER(1)                        NULL,
  DATE_CREAT       DATE                             NULL,
  UTILS_CREAT      VARCHAR2(123 BYTE)               NULL,
  DATE_MODFC       DATE                             NULL,
  UTILS_MODFC      VARCHAR2(123 BYTE)               NULL,
  REF_PRODT        NUMBER(10)                       NULL,
  DNR_REF_PRODT    NUMBER(10)                       NULL
);


Prompt Table SIE_29_RESLT_REQUT_AQ;
CREATE TABLE SIE_29_RESLT_REQUT_AQ
(
  REF_CONTR  NUMBER(10)                             NULL,
  ID         NUMBER                                 NULL,
  FLOW_ID    NUMBER                                 NULL,
  PAGE_ID    NUMBER                                 NULL,
  NOM_COMPS  VARCHAR2(500 BYTE)                     NULL,
  NIV_GRAVT  NUMBER(1)                              NULL,
  NATR       VARCHAR2(500 BYTE)                     NULL
);


Prompt Table SIE_30_AFECT_ITEM;
CREATE TABLE SIE_30_AFECT_ITEM
(
  SEQNC                 NUMBER(10)                  NULL,
  REF_ITEM_CARNT_PRODT  NUMBER(10)                  NULL,
  REF_UTILS             NUMBER(10)                  NULL,
  DATE_CREAT            DATE                        NULL,
  UTILS_CREAT           VARCHAR2(123 BYTE)          NULL,
  DATE_MODFC            DATE                        NULL,
  UTILS_MODFC           VARCHAR2(123 BYTE)          NULL
);


Prompt Table SIE_30_CARNT_APLIC;
CREATE TABLE SIE_30_CARNT_APLIC
(
  SEQNC            NUMBER(10)                       NULL,
  NOM              VARCHAR2(200 BYTE)               NULL,
  REF_CARNT_PRODT  NUMBER(10)                       NULL,
  REF_APLIC        NUMBER(10)                       NULL,
  REF_UTILS_RESPN  NUMBER(10)                       NULL,
  DATE_CREAT       DATE                             NULL,
  UTILS_CREAT      VARCHAR2(123 BYTE)               NULL,
  DATE_MODFC       DATE                             NULL,
  UTILS_MODFC      VARCHAR2(123 BYTE)               NULL,
  DOCMN_REFRC      VARCHAR2(200 BYTE)               NULL
);


Prompt Table SIE_30_CARNT_PRODT;
CREATE TABLE SIE_30_CARNT_PRODT
(
  SEQNC            NUMBER(10)                       NULL,
  REF_PRODT        NUMBER(10)                       NULL,
  DOCMN_REFRC      VARCHAR2(200 BYTE)               NULL,
  REF_UTILS_RESPN  NUMBER(10)                       NULL,
  DATE_CREAT       DATE                             NULL,
  UTILS_CREAT      VARCHAR2(123 BYTE)               NULL,
  DATE_MODFC       DATE                             NULL,
  UTILS_MODFC      VARCHAR2(123 BYTE)               NULL
);


Prompt Table SIE_30_CARNT_SPRIN;
CREATE TABLE SIE_30_CARNT_SPRIN
(
  SEQNC             NUMBER(10)                      NULL,
  DESCR             VARCHAR2(4000 BYTE)             NULL,
  REF_UTILS_RESPN   NUMBER(10)                      NULL,
  REF_CARNT_PRODT   NUMBER(10)                      NULL,
  DATE_DEBUT_PREVU  DATE                            NULL,
  DATE_FIN_PREVU    DATE                            NULL,
  REF_VERSN         NUMBER(10)                      NULL,
  DATE_CREAT        DATE                            NULL,
  UTILS_CREAT       VARCHAR2(123 BYTE)              NULL,
  DATE_MODFC        DATE                            NULL,
  UTILS_MODFC       VARCHAR2(123 BYTE)              NULL
);


Prompt Table SIE_30_CAS_UTILS;
CREATE TABLE SIE_30_CAS_UTILS
(
  SEQNC            NUMBER(10)                       NULL,
  CODE             VARCHAR2(23 BYTE)                NULL,
  NOM              VARCHAR2(200 BYTE)               NULL,
  DESCR            VARCHAR2(4000 BYTE)              NULL,
  DOCMN_REFRC      VARCHAR2(200 BYTE)               NULL,
  REF_CARNT_PRODT  NUMBER(10)                       NULL,
  REF_STAT         NUMBER(10)                       NULL,
  DATE_CREAT       DATE                             NULL,
  UTILS_CREAT      VARCHAR2(123 BYTE)               NULL,
  DATE_MODFC       DATE                             NULL,
  UTILS_MODFC      VARCHAR2(123 BYTE)               NULL,
  REF_UTILS_RESPN  NUMBER(10)                       NULL
);


Prompt Table SIE_30_EFORT_ITEM;
CREATE TABLE SIE_30_EFORT_ITEM
(
  SEQNC                 NUMBER(10)                  NULL,
  REF_ITEM_CARNT_SPRIN  NUMBER(10)                  NULL,
  REF_UTILS             NUMBER(10)                  NULL,
  COMNT                 VARCHAR2(4000 BYTE)         NULL,
  DATE_EFORT            DATE                        NULL,
  VALR                  NUMBER(5,2)                 NULL,
  DATE_CREAT            DATE                        NULL,
  UTILS_CREAT           VARCHAR2(123 BYTE)          NULL,
  DATE_MODFC            DATE                        NULL,
  UTILS_MODFC           VARCHAR2(123 BYTE)          NULL
);


Prompt Table SIE_30_HISTR_EFORT_RESTN;
CREATE TABLE SIE_30_HISTR_EFORT_RESTN
(
  SEQNC                 NUMBER(10)                  NULL,
  REF_ITEM_CARNT_SPRIN  NUMBER(10)                  NULL,
  DATE_HEURE_SAISI      DATE                        NULL,
  EFORT_RESTN           NUMBER(10,2)                NULL,
  DATE_CREAT            DATE                        NULL,
  UTILS_CREAT           VARCHAR2(123 BYTE)          NULL,
  DATE_MODFC            DATE                        NULL,
  UTILS_MODFC           VARCHAR2(123 BYTE)          NULL
);


Prompt Table SIE_30_ITEM_CARNT_PRODT;
CREATE TABLE SIE_30_ITEM_CARNT_PRODT
(
  SEQNC              NUMBER(10)                     NULL,
  NOM                VARCHAR2(200 BYTE)             NULL,
  DESCR              VARCHAR2(4000 BYTE)            NULL,
  REF_CARNT_PRODT    NUMBER(10)                     NULL,
  REF_DV_PRIOR       NUMBER(1)                      NULL,
  REF_STAT           NUMBER(10)                     NULL,
  REF_DV_TAIL_RELTV  NUMBER(10)                     NULL,
  REF_CAS_UTILS      NUMBER(10)                     NULL,
  DATE_CREAT         DATE                           NULL,
  UTILS_CREAT        VARCHAR2(123 BYTE)             NULL,
  DATE_MODFC         DATE                           NULL,
  UTILS_MODFC        VARCHAR2(123 BYTE)             NULL
);


Prompt Table SIE_30_ITEM_CARNT_SPRIN;
CREATE TABLE SIE_30_ITEM_CARNT_SPRIN
(
  SEQNC                 NUMBER(10)                  NULL,
  NOM                   VARCHAR2(200 BYTE)          NULL,
  DESCR                 VARCHAR2(4000 BYTE)         NULL,
  NUMR_REFRC_DOCMN      NUMBER(3)                   NULL,
  REF_ITEM_CARNT_PRODT  NUMBER(10)                  NULL,
  REF_CARNT_SPRIN       NUMBER(10)                  NULL,
  EFORT_PREVU           NUMBER(10,2)                NULL,
  EFORT_RESTN           NUMBER(10,2)                NULL,
  REF_DV_PRIOR          NUMBER(10)                  NULL,
  DATE_CREAT            DATE                        NULL,
  UTILS_CREAT           VARCHAR2(123 BYTE)          NULL,
  DATE_MODFC            DATE                        NULL,
  UTILS_MODFC           VARCHAR2(123 BYTE)          NULL,
  REF_SIE_30_PAGE       NUMBER(10)                  NULL
);


Prompt Table SIE_30_PAGE;
CREATE TABLE SIE_30_PAGE
(
  SEQNC            NUMBER(10)                       NULL,
  REF_SIE_13_PAGE  NUMBER(10)                       NULL,
  NOM              VARCHAR2(200 BYTE)               NULL,
  NUMR_APEX        NUMBER                           NULL,
  DATE_CREAT       DATE                             NULL,
  UTILS_CREAT      VARCHAR2(123 BYTE)               NULL,
  DATE_MODFC       DATE                             NULL,
  UTILS_MODFC      VARCHAR2(123 BYTE)               NULL
);


Prompt Table SIE_30_PAGE_ITEM;
CREATE TABLE SIE_30_PAGE_ITEM
(
  SEQNC                 NUMBER(10)                  NULL,
  REF_SIE_30_PAGE       NUMBER(10)                  NULL,
  REF_ITEM_CARNT_PRODT  NUMBER(10)                  NULL,
  DATE_CREAT            DATE                        NULL,
  UTILS_CREAT           VARCHAR2(123 BYTE)          NULL,
  DATE_MODFC            DATE                        NULL,
  UTILS_MODFC           VARCHAR2(123 BYTE)          NULL
);


Prompt Table TC_SIE_07_SEQNC;
CREATE GLOBAL TEMPORARY TABLE TC_SIE_07_SEQNC
(
  SEQNC  NUMBER(10)                                 NULL
)
ON COMMIT DELETE ROWS;
