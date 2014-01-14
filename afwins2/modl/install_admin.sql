/* Formatted on 6/4/2013 3:44:03 PM (QP5 v5.185.11230.41888) */
--Créer les modifications au modele et créer utils AFW_ADMIN + insert dans sie_13_fichr et mime_type

declare
  vnu_utils                               number (10);
  vnu_domn                                number (10);
  vnu_super_utils                         number (10);
begin
  insert into   vd_i_sie_12_utils (nom, prenm, code_utils, date_expir, indic_verl, indic_chang_mot_passe, courl, indic_actif)
       values   ('admin',
                 'admin',
                 'AFW_ADMIN',
                 sysdate + 10000,
                 'N',
                 'N',
                 'admin@admin.ca',
				 'O')
    returning   seqnc
         into   vnu_utils;

  insert
       into   sie_12_group_utils (seqnc,
                                  nom,
                                  descr,
                                  date_creat,
                                  utils_creat,
                                  date_modfc,
                                  utils_modfc,
                                  code,
                                  indic_ignor_group_admin,
                                  indic_systm)
     values   (0,
               'Super utilisateur',
               'Ce groupe d''utilisateur permet d''effectuer toutes les opérations que permet l''application.',
               to_date ('08/26/2008 20:57:24',
                        'MM/DD/YYYY HH24:MI:SS'),
               'BOUST',
               to_date ('06/13/2011 11:45:00',
                        'MM/DD/YYYY HH24:MI:SS'),
               'CONAL',
               'SUPER_UTILS',
               'O',
               'N')
  returning   seqnc
       into   vnu_super_utils;
		 
  insert into   vd_i_sie_12_domn (code, nom, descr)
       values   ('INTER',
                 'Internal',
                 'Domaine temporaire pour aider l''export de SAF')
    returning   seqnc
         into   vnu_domn;

  insert into   vd_i_sie_12_domn_utils (ref_utils, ref_domn, date_debut_efect)
       values   (vnu_utils,
                 vnu_domn,
                 sysdate);
end;
/

begin
  insert into   sie_01_code_err_oracl (seqnc, err_code, utils_creat, date_creat, date_modfc, utils_modfc, libl)
       values   (67,
                 1,
                 'PRIBR',
                 to_date ('08/01/2008 11:03:41',
                          'MM/DD/YYYY HH24:MI:SS'),
                 to_date ('08/20/2008 17:41:22',
                          'MM/DD/YYYY HH24:MI:SS'),
                 'PRIBR',
                 'ora-00001 - Violation de contrainte unique.');

  insert into   sie_01_code_err_oracl (seqnc, err_code, utils_creat, date_creat, date_modfc, utils_modfc, libl)
       values   (68,
                 1400,
                 'PRIBR',
                 to_date ('08/01/2008 11:10:10',
                          'MM/DD/YYYY HH24:MI:SS'),
                 to_date ('08/20/2008 17:41:22',
                          'MM/DD/YYYY HH24:MI:SS'),
                 'PRIBR',
                 'ora-01400 - Impossible d''insérer null.');

  insert into   sie_01_code_err_oracl (seqnc, err_code, utils_creat, date_creat, date_modfc, utils_modfc, libl)
       values   (69,
                 1438,
                 'PRIBR',
                 to_date ('08/01/2008 11:12:28',
                          'MM/DD/YYYY HH24:MI:SS'),
                 to_date ('08/20/2008 17:41:22',
                          'MM/DD/YYYY HH24:MI:SS'),
                 'PRIBR',
                 'ora-01438 - Valeur incohérente avec la précision du champ.');

  insert into   sie_01_code_err_oracl (seqnc, err_code, utils_creat, date_creat, date_modfc, utils_modfc, libl)
       values   (70,
                 1407,
                 'PRIBR',
                 to_date ('08/01/2008 11:16:02',
                          'MM/DD/YYYY HH24:MI:SS'),
                 to_date ('08/20/2008 17:41:22',
                          'MM/DD/YYYY HH24:MI:SS'),
                 'PRIBR',
                 'ora-01407 - Impossible de mettre à jour avec null.');

  insert into   sie_01_code_err_oracl (seqnc, err_code, utils_creat, date_creat, date_modfc, utils_modfc, libl)
       values   (71,
                 2290,
                 'PRIBR',
                 to_date ('08/01/2008 11:16:32',
                          'MM/DD/YYYY HH24:MI:SS'),
                 to_date ('08/20/2008 17:41:22',
                          'MM/DD/YYYY HH24:MI:SS'),
                 'PRIBR',
                 'ora-02290 - Violation de contrainte de vérification (check).');

  insert into   sie_01_code_err_oracl (seqnc, err_code, utils_creat, date_creat, date_modfc, utils_modfc, libl)
       values   (266,
                 2292,
                 'BOUST',
                 to_date ('08/19/2008 15:05:01',
                          'MM/DD/YYYY HH24:MI:SS'),
                 to_date ('08/21/2008 13:42:44',
                          'MM/DD/YYYY HH24:MI:SS'),
                 'BOUST',
                 'ora-02292 - Enregistrement fils existant.');

  insert into   sie_01_code_err_oracl (seqnc, err_code, utils_creat, date_creat, date_modfc, utils_modfc, libl)
       values   (286,
                 1861,
                 'BOUST',
                 to_date ('08/19/2008 18:01:19',
                          'MM/DD/YYYY HH24:MI:SS'),
                 to_date ('08/21/2008 13:43:00',
                          'MM/DD/YYYY HH24:MI:SS'),
                 'BOUST',
                 'ora-01861 - Format de date invalide.');

  insert into   sie_01_code_err_oracl (seqnc, err_code, utils_creat, date_creat, date_modfc, utils_modfc, libl)
       values   (287,
                 1841,
                 'BOUST',
                 to_date ('08/19/2008 18:12:11',
                          'MM/DD/YYYY HH24:MI:SS'),
                 to_date ('03/16/2009 18:51:57',
                          'MM/DD/YYYY HH24:MI:SS'),
                 'PRIBR',
                 'ora-01841 - L''année est invalide');

  insert into   sie_01_code_err_oracl (seqnc, err_code, utils_creat, date_creat, date_modfc, utils_modfc, libl)
       values   (306,
                 20507,
                 'BOUST',
                 to_date ('08/19/2008 22:03:37',
                          'MM/DD/YYYY HH24:MI:SS'),
                 to_date ('08/20/2008 17:41:22',
                          'MM/DD/YYYY HH24:MI:SS'),
                 'PRIBR',
                 'ora-20507 - Valeur numérique invalide.');

  insert into   sie_01_code_err_oracl (seqnc, err_code, utils_creat, date_creat, date_modfc, utils_modfc, libl)
       values   (406,
                 28234,
                 'CARLO',
                 to_date ('12/01/2009 23:03:02',
                          'MM/DD/YYYY HH24:MI:SS'),
                 null,
                 null,
                 'key length too short');

  insert into   sie_01_code_err_oracl (seqnc, err_code, utils_creat, date_creat, date_modfc, utils_modfc, libl)
       values   (326,
                 6502,
                 'BOUST',
                 to_date ('03/24/2009 13:52:50',
                          'MM/DD/YYYY HH24:MI:SS'),
                 null,
                 null,
                 'ora-06502 - Valeur numérique invalide.');

insert into   sie_01_code_err_oracl (seqnc, err_code, utils_creat, date_creat, libl)
     values   (1745,
               20001,
               'CONAL:SIE',
               to_date ('03/11/2011 14:00:24',
                        'MM/DD/YYYY HH24:MI:SS'),
               'ora-20001 - Error in MRU');

insert into   sie_01_code_err_oracl (seqnc, err_code, utils_creat, date_creat, libl)
     values   (1746,
               20998,
               'CONAL:SIE',
               to_date ('03/11/2011 14:10:54',
                        'MM/DD/YYYY HH24:MI:SS'),
               'ora-20998 - Error in MRU');

  insert into   sie_13_type_fichr (seqnc, code, nom, descr, date_creat, utils_creat, date_modfc, utils_modfc, nom_icon)
       values   (1,
                 'IMAG',
                 'Image',
                 null,
                 to_date ('10/21/2008 23:54:59',
                          'MM/DD/YYYY HH24:MI:SS'),
                 'PRIBR:SIE',
                 to_date ('01/23/2011 17:52:25',
                          'MM/DD/YYYY HH24:MI:SS'),
                 'CONAL',
                 'icon_imag.png');

  insert into   sie_13_type_fichr (seqnc, code, nom, descr, date_creat, utils_creat, date_modfc, utils_modfc, nom_icon)
       values   (2,
                 'WORD',
                 'Document Microsoft WORD',
                 null,
                 to_date ('10/21/2008 23:55:19',
                          'MM/DD/YYYY HH24:MI:SS'),
                 'PRIBR:SIE',
                 to_date ('05/01/2011 16:16:18',
                          'MM/DD/YYYY HH24:MI:SS'),
                 'PRIBR',
                 'icon_word.png');

  insert into   sie_13_type_fichr (seqnc, code, nom, descr, date_creat, utils_creat, date_modfc, utils_modfc, nom_icon)
       values   (3,
                 'PDF',
                 'Document Adobe Acrobat',
                 null,
                 to_date ('10/21/2008 23:55:49',
                          'MM/DD/YYYY HH24:MI:SS'),
                 'PRIBR:SIE',
                 to_date ('01/23/2011 17:52:25',
                          'MM/DD/YYYY HH24:MI:SS'),
                 'CONAL',
                 'icon_pdf.png');

  insert into   sie_13_type_fichr (seqnc, code, nom, descr, date_creat, utils_creat, date_modfc, utils_modfc, nom_icon)
       values   (4,
                 'ARCHI',
                 'Document compressé',
                 null,
                 to_date ('10/21/2008 23:56:20',
                          'MM/DD/YYYY HH24:MI:SS'),
                 'PRIBR:SIE',
                 to_date ('01/23/2011 17:52:25',
                          'MM/DD/YYYY HH24:MI:SS'),
                 'CONAL',
                 'icon_archi.png');

  insert into   sie_13_type_fichr (seqnc, code, nom, descr, date_creat, utils_creat, date_modfc, utils_modfc, nom_icon)
       values   (5,
                 'VIDEO',
                 'Document vidéo',
                 null,
                 to_date ('10/21/2008 23:56:49',
                          'MM/DD/YYYY HH24:MI:SS'),
                 'PRIBR:SIE',
                 to_date ('01/23/2011 17:52:25',
                          'MM/DD/YYYY HH24:MI:SS'),
                 'CONAL',
                 'icon_video.png');

  insert into   sie_13_type_fichr (seqnc, code, nom, descr, date_creat, utils_creat, date_modfc, utils_modfc, nom_icon)
       values   (21,
                 'EXCEL',
                 'Document Microsoft EXCEL',
                 null,
                 to_date ('10/22/2008 01:07:05',
                          'MM/DD/YYYY HH24:MI:SS'),
                 'PRIBR:SIE',
                 to_date ('05/01/2011 16:16:12',
                          'MM/DD/YYYY HH24:MI:SS'),
                 'PRIBR',
                 'icon_excel.png');

  insert into   sie_13_type_fichr (seqnc, code, nom, descr, date_creat, utils_creat, date_modfc, utils_modfc, nom_icon)
       values   (22,
                 'AUDIO',
                 'Document audio',
                 null,
                 to_date ('10/22/2008 01:14:22',
                          'MM/DD/YYYY HH24:MI:SS'),
                 'PRIBR:SIE',
                 to_date ('01/23/2011 17:52:25',
                          'MM/DD/YYYY HH24:MI:SS'),
                 'CONAL',
                 'icon_audio.gif');

  insert into   sie_13_type_fichr (seqnc, code, nom, descr, date_creat, utils_creat, date_modfc, utils_modfc, nom_icon)
       values   (23,
                 'TEXT',
                 'Document texte pur',
                 null,
                 to_date ('10/22/2008 01:15:12',
                          'MM/DD/YYYY HH24:MI:SS'),
                 'PRIBR:SIE',
                 to_date ('01/23/2011 17:52:25',
                          'MM/DD/YYYY HH24:MI:SS'),
                 'CONAL',
                 'icon_text.gif');

  insert into   sie_13_type_fichr (seqnc, code, nom, descr, date_creat, utils_creat, date_modfc, utils_modfc, nom_icon)
       values   (41,
                 'EXECT',
                 'Exécutable',
                 null,
                 to_date ('10/23/2008 14:17:01',
                          'MM/DD/YYYY HH24:MI:SS'),
                 'PRIBR:SIE',
                 to_date ('01/23/2011 17:52:25',
                          'MM/DD/YYYY HH24:MI:SS'),
                 'CONAL',
                 'icon_exect.gif');

  insert into   sie_13_type_fichr (seqnc, code, nom, descr, date_creat, utils_creat, date_modfc, utils_modfc, nom_icon)
       values   (61,
                 'JS',
                 'Fichier Javascript',
                 null,
                 to_date ('05/01/2011 16:16:48',
                          'MM/DD/YYYY HH24:MI:SS'),
                 'PRIBR',
                 null,
                 null,
                 null);

  insert into   sie_13_type_fichr (seqnc, code, nom, descr, date_creat, utils_creat, date_modfc, utils_modfc, nom_icon)
       values   (62,
                 'CSS',
                 'Fichier CSS',
                 null,
                 to_date ('05/01/2011 16:17:03',
                          'MM/DD/YYYY HH24:MI:SS'),
                 'PRIBR',
                 null,
                 null,
                 null);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (432,
               '.sbk',
               'application/x-tbook',
               to_date ('06/13/2011 07:47:41',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (433,
               '.scm',
               'application/x-lotusscreencam',
               to_date ('06/13/2011 07:47:41',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (434,
               '.scm',
               'text/x-script.guile',
               to_date ('06/13/2011 07:47:42',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (435,
               '.scm',
               'text/x-script.scheme',
               to_date ('06/13/2011 07:47:42',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (436,
          5,
          '.scm',
          'video/x-scm',
          to_date ('06/13/2011 07:47:42',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (437,
               '.sdml',
               'text/plain',
               to_date ('06/13/2011 07:47:42',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (438,
               '.sdp',
               'application/sdp',
               to_date ('06/13/2011 07:47:42',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (439,
               '.sdp',
               'application/x-sdp',
               to_date ('06/13/2011 07:47:42',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (440,
               '.sdr',
               'application/sounder',
               to_date ('06/13/2011 07:47:42',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (441,
               '.sea',
               'application/sea',
               to_date ('06/13/2011 07:47:43',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (442,
               '.sea',
               'application/x-sea',
               to_date ('06/13/2011 07:47:43',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (443,
               '.set',
               'application/set',
               to_date ('06/13/2011 07:47:43',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (444,
               '.sgm',
               'text/sgml',
               to_date ('06/13/2011 07:47:43',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (445,
               '.sgm',
               'text/x-sgml',
               to_date ('06/13/2011 07:47:43',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (446,
               '.sgml',
               'text/sgml',
               to_date ('06/13/2011 07:47:43',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (447,
               '.sgml',
               'text/x-sgml',
               to_date ('06/13/2011 07:47:44',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (448,
               '.sh',
               'application/x-bsh',
               to_date ('06/13/2011 07:47:44',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (449,
               '.sh',
               'application/x-sh',
               to_date ('06/13/2011 07:47:44',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (450,
               '.sh',
               'application/x-shar',
               to_date ('06/13/2011 07:47:44',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (451,
               '.sh',
               'text/x-script.sh',
               to_date ('06/13/2011 07:47:44',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (452,
               '.shar',
               'application/x-bsh',
               to_date ('06/13/2011 07:47:44',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (453,
               '.shar',
               'application/x-shar',
               to_date ('06/13/2011 07:47:45',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (454,
               '.shtml',
               'text/html',
               to_date ('06/13/2011 07:47:45',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (455,
               '.shtml',
               'text/x-server-parsed-html',
               to_date ('06/13/2011 07:47:45',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (456,
          22,
          '.sid',
          'audio/x-psid',
          to_date ('06/13/2011 07:47:45',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (457,
               '.sit',
               'application/x-sit',
               to_date ('06/13/2011 07:47:45',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (458,
               '.sit',
               'application/x-stuffit',
               to_date ('06/13/2011 07:47:45',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (459,
               '.skd',
               'application/x-koan',
               to_date ('06/13/2011 07:47:46',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (460,
               '.skm',
               'application/x-koan',
               to_date ('06/13/2011 07:47:46',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (461,
               '.skp',
               'application/x-koan',
               to_date ('06/13/2011 07:47:46',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (462,
               '.skt',
               'application/x-koan',
               to_date ('06/13/2011 07:47:46',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (463,
               '.sl',
               'application/x-seelogo',
               to_date ('06/13/2011 07:47:46',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (464,
               '.smi',
               'application/smil',
               to_date ('06/13/2011 07:47:46',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (465,
               '.smil',
               'application/smil',
               to_date ('06/13/2011 07:47:46',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert
  into   sie_13_mime_type (seqnc,
                           ref_type_fichr,
                           ext,
                           mime_type,
                           date_creat,
                           utils_creat,
                           date_modfc,
                           utils_modfc,
                           ordre_choix)
values   (466,
          22,
          '.snd',
          'audio/basic',
          to_date ('06/13/2011 07:47:47',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101',
          1);

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (467,
          22,
          '.snd',
          'audio/x-adpcm',
          to_date ('06/13/2011 07:47:47',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (468,
               '.sol',
               'application/solids',
               to_date ('06/13/2011 07:47:47',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (469,
               '.spc',
               'application/x-pkcs7-certificates',
               to_date ('06/13/2011 07:47:47',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (470,
               '.spc',
               'text/x-speech',
               to_date ('06/13/2011 07:47:47',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (471,
               '.spl',
               'application/futuresplash',
               to_date ('06/13/2011 07:47:47',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (472,
          1,
          '.spr',
          'application/x-sprite',
          to_date ('06/13/2011 07:47:48',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (473,
          1,
          '.sprite',
          'application/x-sprite',
          to_date ('06/13/2011 07:47:48',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (474,
               '.src',
               'application/x-wais-source',
               to_date ('06/13/2011 07:47:48',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (475,
               '.ssi',
               'text/x-server-parsed-html',
               to_date ('06/13/2011 07:47:48',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (476,
               '.ssm',
               'application/streamingmedia',
               to_date ('06/13/2011 07:47:48',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (477,
               '.sst',
               'application/vnd.ms-pki.certstore',
               to_date ('06/13/2011 07:47:48',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (478,
               '.step',
               'application/step',
               to_date ('06/13/2011 07:47:49',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (479,
               '.stl',
               'application/sla',
               to_date ('06/13/2011 07:47:49',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (480,
               '.stl',
               'application/vnd.ms-pki.stl',
               to_date ('06/13/2011 07:47:49',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (481,
               '.stl',
               'application/x-navistyle',
               to_date ('06/13/2011 07:47:49',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (482,
               '.stp',
               'application/step',
               to_date ('06/13/2011 07:47:49',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (483,
               '.sv4cpio',
               'application/x-sv4cpio',
               to_date ('06/13/2011 07:47:49',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (484,
               '.sv4crc',
               'application/x-sv4crc',
               to_date ('06/13/2011 07:47:49',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert
  into   sie_13_mime_type (seqnc,
                           ref_type_fichr,
                           ext,
                           mime_type,
                           date_creat,
                           utils_creat,
                           date_modfc,
                           utils_modfc,
                           ordre_choix)
values   (485,
          1,
          '.svf',
          'image/vnd.dwg',
          to_date ('06/13/2011 07:47:50',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101',
          1);

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (486,
          1,
          '.svf',
          'image/x-dwg',
          to_date ('06/13/2011 07:47:50',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (487,
               '.svr',
               'application/x-world',
               to_date ('06/13/2011 07:47:50',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (488,
               '.svr',
               'x-world/x-svr',
               to_date ('06/13/2011 07:47:50',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (489,
               '.swf',
               'application/x-shockwave-flash',
               to_date ('06/13/2011 07:47:50',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (490,
               '.t',
               'application/x-troff',
               to_date ('06/13/2011 07:47:50',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (491,
               '.talk',
               'text/x-speech',
               to_date ('06/13/2011 07:47:51',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (492,
               '.tar',
               'application/x-tar',
               to_date ('06/13/2011 07:47:51',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (493,
               '.tbk',
               'application/toolbook',
               to_date ('06/13/2011 07:47:51',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (494,
               '.tbk',
               'application/x-tbook',
               to_date ('06/13/2011 07:47:51',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (495,
               '.tcl',
               'application/x-tcl',
               to_date ('06/13/2011 07:47:51',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (496,
               '.tcl',
               'text/x-script.tcl',
               to_date ('06/13/2011 07:47:51',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (497,
               '.tcsh',
               'text/x-script.tcsh',
               to_date ('06/13/2011 07:47:51',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (498,
               '.tex',
               'application/x-tex',
               to_date ('06/13/2011 07:47:52',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (499,
               '.texi',
               'application/x-texinfo',
               to_date ('06/13/2011 07:47:52',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (500,
               '.texinfo',
               'application/x-texinfo',
               to_date ('06/13/2011 07:47:52',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (501,
               '.text',
               'application/plain',
               to_date ('06/13/2011 07:47:52',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert
  into   sie_13_mime_type (seqnc,
                           ref_type_fichr,
                           ext,
                           mime_type,
                           date_creat,
                           utils_creat,
                           date_modfc,
                           utils_modfc,
                           ordre_choix)
values   (502,
          23,
          '.text',
          'text/plain',
          to_date ('06/13/2011 07:47:52',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101',
          1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (503,
               '.tgz',
               'application/gnutar',
               to_date ('06/13/2011 07:47:52',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (504,
               '.tgz',
               'application/x-compressed',
               to_date ('06/13/2011 07:47:53',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert
  into   sie_13_mime_type (seqnc,
                           ref_type_fichr,
                           ext,
                           mime_type,
                           date_creat,
                           utils_creat,
                           date_modfc,
                           utils_modfc,
                           ordre_choix)
values   (505,
          1,
          '.tif',
          'image/tiff',
          to_date ('06/13/2011 07:47:53',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101',
          1);

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (506,
          1,
          '.tif',
          'image/x-tiff',
          to_date ('06/13/2011 07:47:53',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc,
                           ref_type_fichr,
                           ext,
                           mime_type,
                           date_creat,
                           utils_creat,
                           date_modfc,
                           utils_modfc,
                           ordre_choix)
values   (507,
          1,
          '.tiff',
          'image/tiff',
          to_date ('06/13/2011 07:47:53',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101',
          1);

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (508,
          1,
          '.tiff',
          'image/x-tiff',
          to_date ('06/13/2011 07:47:53',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (509,
               '.tr',
               'application/x-troff',
               to_date ('06/13/2011 07:47:53',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (510,
          22,
          '.tsi',
          'audio/tsp-audio',
          to_date ('06/13/2011 07:47:54',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (511,
               '.tsp',
               'application/dsptype',
               to_date ('06/13/2011 07:47:54',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert
  into   sie_13_mime_type (seqnc,
                           ref_type_fichr,
                           ext,
                           mime_type,
                           date_creat,
                           utils_creat,
                           date_modfc,
                           utils_modfc,
                           ordre_choix)
values   (512,
          22,
          '.tsp',
          'audio/tsplayer',
          to_date ('06/13/2011 07:47:54',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101',
          1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (513,
               '.tsv',
               'text/tab-separated-values',
               to_date ('06/13/2011 07:47:54',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (514,
          1,
          '.turbot',
          'image/florian',
          to_date ('06/13/2011 07:47:54',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (515,
          23,
          '.txt',
          'text/plain',
          to_date ('06/13/2011 07:47:54',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (516,
               '.uil',
               'text/x-uil',
               to_date ('06/13/2011 07:47:54',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (517,
               '.uni',
               'text/uri-list',
               to_date ('06/13/2011 07:47:55',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (518,
               '.unis',
               'text/uri-list',
               to_date ('06/13/2011 07:47:55',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (519,
               '.unv',
               'application/i-deas',
               to_date ('06/13/2011 07:47:55',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (520,
               '.uri',
               'text/uri-list',
               to_date ('06/13/2011 07:47:55',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (521,
               '.uris',
               'text/uri-list',
               to_date ('06/13/2011 07:47:55',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (522,
               '.ustar',
               'application/x-ustar',
               to_date ('06/13/2011 07:47:55',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (523,
               '.ustar',
               'multipart/x-ustar',
               to_date ('06/13/2011 07:47:56',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (524,
               '.uu',
               'application/octet-stream',
               to_date ('06/13/2011 07:47:56',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (525,
               '.uu',
               'text/x-uuencode',
               to_date ('06/13/2011 07:47:56',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (526,
               '.uue',
               'text/x-uuencode',
               to_date ('06/13/2011 07:47:57',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (527,
               '.vcd',
               'application/x-cdlink',
               to_date ('06/13/2011 07:47:57',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (528,
               '.vcs',
               'text/x-vcalendar',
               to_date ('06/13/2011 07:47:57',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:15',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (529,
               '.vda',
               'application/vda',
               to_date ('06/13/2011 07:47:57',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:15',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (530,
          5,
          '.vdo',
          'video/vdo',
          to_date ('06/13/2011 07:47:57',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:15',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (531,
               '.vew',
               'application/groupwise',
               to_date ('06/13/2011 07:47:57',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:15',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert
  into   sie_13_mime_type (seqnc,
                           ref_type_fichr,
                           ext,
                           mime_type,
                           date_creat,
                           utils_creat,
                           date_modfc,
                           utils_modfc,
                           ordre_choix)
values   (532,
          5,
          '.viv',
          'video/vivo',
          to_date ('06/13/2011 07:47:57',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:15',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101',
          1);

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (533,
          5,
          '.viv',
          'video/vnd.vivo',
          to_date ('06/13/2011 07:47:58',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:15',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc,
                           ref_type_fichr,
                           ext,
                           mime_type,
                           date_creat,
                           utils_creat,
                           date_modfc,
                           utils_modfc,
                           ordre_choix)
values   (534,
          5,
          '.vivo',
          'video/vivo',
          to_date ('06/13/2011 07:47:58',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:15',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101',
          1);

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (535,
          5,
          '.vivo',
          'video/vnd.vivo',
          to_date ('06/13/2011 07:47:58',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:15',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (536,
               '.vmd',
               'application/vocaltec-media-desc',
               to_date ('06/13/2011 07:47:58',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:15',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (537,
               '.vmf',
               'application/vocaltec-media-file',
               to_date ('06/13/2011 07:47:58',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:15',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert
  into   sie_13_mime_type (seqnc,
                           ref_type_fichr,
                           ext,
                           mime_type,
                           date_creat,
                           utils_creat,
                           date_modfc,
                           utils_modfc,
                           ordre_choix)
values   (538,
          22,
          '.voc',
          'audio/voc',
          to_date ('06/13/2011 07:47:59',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:15',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101',
          1);

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (539,
          22,
          '.voc',
          'audio/x-voc',
          to_date ('06/13/2011 07:47:59',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:15',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (540,
          5,
          '.vos',
          'video/vosaic',
          to_date ('06/13/2011 07:47:59',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:15',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (541,
          22,
          '.vox',
          'audio/voxware',
          to_date ('06/13/2011 07:47:59',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:15',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (542,
          22,
          '.vqe',
          'audio/x-twinvq-plugin',
          to_date ('06/13/2011 07:47:59',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:15',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (543,
          22,
          '.vqf',
          'audio/x-twinvq',
          to_date ('06/13/2011 07:47:59',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:15',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (544,
          22,
          '.vql',
          'audio/x-twinvq-plugin',
          to_date ('06/13/2011 07:48:00',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:15',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (545,
               '.vrml',
               'application/x-vrml',
               to_date ('06/13/2011 07:48:00',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:15',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (546,
               '.vrml',
               'model/vrml',
               to_date ('06/13/2011 07:48:00',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:15',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (614,
          21,
          '.xls',
          'application/x-msexcel',
          to_date ('06/13/2011 07:46:29',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:13',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc,
                           ref_type_fichr,
                           ext,
                           mime_type,
                           date_creat,
                           utils_creat,
                           date_modfc,
                           utils_modfc,
                           ordre_choix)
values   (615,
          21,
          '.xlt',
          'application/excel',
          to_date ('06/13/2011 07:46:29',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:13',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101',
          1);

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (616,
          21,
          '.xlt',
          'application/x-excel',
          to_date ('06/13/2011 07:46:30',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:13',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (617,
          21,
          '.xlv',
          'application/excel',
          to_date ('06/13/2011 07:46:30',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:13',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc,
                           ref_type_fichr,
                           ext,
                           mime_type,
                           date_creat,
                           utils_creat,
                           date_modfc,
                           utils_modfc,
                           ordre_choix)
values   (618,
          21,
          '.xlv',
          'application/x-excel',
          to_date ('06/13/2011 07:46:30',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:13',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101',
          1);

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (619,
          21,
          '.xlw',
          'application/excel',
          to_date ('06/13/2011 07:46:30',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:13',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc,
                           ref_type_fichr,
                           ext,
                           mime_type,
                           date_creat,
                           utils_creat,
                           date_modfc,
                           utils_modfc,
                           ordre_choix)
values   (620,
          21,
          '.xlw',
          'application/vnd.ms-excel',
          to_date ('06/13/2011 07:46:30',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:13',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101',
          1);

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (621,
          21,
          '.xlw',
          'application/x-excel',
          to_date ('06/13/2011 07:46:30',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:13',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (622,
               '.xlw',
               'application/x-msexcel',
               to_date ('06/13/2011 07:46:30',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (623,
          22,
          '.xm',
          'audio/xm',
          to_date ('06/13/2011 07:46:31',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:13',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (624,
               '.xml',
               'application/xml',
               to_date ('06/13/2011 07:46:31',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (625,
               '.xml',
               'text/xml',
               to_date ('06/13/2011 07:46:31',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (626,
               '.xmz',
               'xgl/movie',
               to_date ('06/13/2011 07:46:31',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (627,
               '.xpix',
               'application/x-vnd.ls-xpix',
               to_date ('06/13/2011 07:46:31',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (628,
          1,
          '.xpm',
          'image/x-xpixmap',
          to_date ('06/13/2011 07:46:31',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:13',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc,
                           ref_type_fichr,
                           ext,
                           mime_type,
                           date_creat,
                           utils_creat,
                           date_modfc,
                           utils_modfc,
                           ordre_choix)
values   (629,
          1,
          '.xpm',
          'image/xpm',
          to_date ('06/13/2011 07:46:31',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:13',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101',
          1);

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (630,
          1,
          '.x-png',
          'image/png',
          to_date ('06/13/2011 07:46:32',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:13',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (631,
          5,
          '.xsr',
          'video/x-amt-showrun',
          to_date ('06/13/2011 07:46:32',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:13',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc,
                           ref_type_fichr,
                           ext,
                           mime_type,
                           date_creat,
                           utils_creat,
                           date_modfc,
                           utils_modfc,
                           ordre_choix)
values   (632,
          1,
          '.xwd',
          'image/x-xwd',
          to_date ('06/13/2011 07:46:32',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:13',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101',
          1);

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (633,
          1,
          '.xwd',
          'image/x-xwindowdump',
          to_date ('06/13/2011 07:46:32',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:13',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (634,
               '.xyz',
               'chemical/x-pdb',
               to_date ('06/13/2011 07:46:32',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert
  into   sie_13_mime_type (seqnc,
                           ref_type_fichr,
                           ext,
                           mime_type,
                           date_creat,
                           utils_creat,
                           date_modfc,
                           utils_modfc,
                           ordre_choix)
values   (635,
          4,
          '.z',
          'application/x-compress',
          to_date ('06/13/2011 07:46:32',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:13',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101',
          1);

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (636,
          4,
          '.z',
          'application/x-compressed',
          to_date ('06/13/2011 07:46:32',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:13',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (637,
          4,
          '.zip',
          'application/x-compressed',
          to_date ('06/13/2011 07:46:33',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:13',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (638,
          4,
          '.zip',
          'application/x-zip-compressed',
          to_date ('06/13/2011 07:46:33',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:13',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc,
                           ref_type_fichr,
                           ext,
                           mime_type,
                           date_creat,
                           utils_creat,
                           date_modfc,
                           utils_modfc,
                           ordre_choix)
values   (639,
          4,
          '.zip',
          'application/zip',
          to_date ('06/13/2011 07:46:33',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:13',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101',
          1);

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (640,
          4,
          '.zip',
          'multipart/x-zip',
          to_date ('06/13/2011 07:46:33',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:13',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (641,
               '.zoo',
               'application/octet-stream',
               to_date ('06/13/2011 07:46:33',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (642,
               '.zsh',
               'text/x-script.zsh',
               to_date ('06/13/2011 07:46:33',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (1,
               '.3dm',
               'x-world/x-3dmf',
               to_date ('06/13/2011 07:46:33',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (2,
               '.3dmf',
               'x-world/x-3dmf',
               to_date ('06/13/2011 07:46:34',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (3,
               '.a',
               'application/octet-stream',
               to_date ('06/13/2011 07:46:34',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (4,
               '.aab',
               'application/x-authorware-bin',
               to_date ('06/13/2011 07:46:34',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (5,
               '.aam',
               'application/x-authorware-map',
               to_date ('06/13/2011 07:46:34',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (6,
               '.aas',
               'application/x-authorware-seg',
               to_date ('06/13/2011 07:46:34',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (7,
               '.abc',
               'text/vnd.abc',
               to_date ('06/13/2011 07:46:34',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (8,
               '.acgi',
               'text/html',
               to_date ('06/13/2011 07:46:34',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (9,
          5,
          '.afl',
          'video/animaflex',
          to_date ('06/13/2011 07:46:35',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:13',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (10,
               '.ai',
               'application/postscript',
               to_date ('06/13/2011 07:46:35',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (11,
          22,
          '.aif',
          'audio/aiff',
          to_date ('06/13/2011 07:46:35',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:13',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc,
                           ref_type_fichr,
                           ext,
                           mime_type,
                           date_creat,
                           utils_creat,
                           date_modfc,
                           utils_modfc,
                           ordre_choix)
values   (12,
          22,
          '.aif',
          'audio/x-aiff',
          to_date ('06/13/2011 07:46:35',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:13',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101',
          1);

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (13,
          22,
          '.aifc',
          'audio/aiff',
          to_date ('06/13/2011 07:46:35',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:13',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc,
                           ref_type_fichr,
                           ext,
                           mime_type,
                           date_creat,
                           utils_creat,
                           date_modfc,
                           utils_modfc,
                           ordre_choix)
values   (14,
          22,
          '.aifc',
          'audio/x-aiff',
          to_date ('06/13/2011 07:46:35',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:13',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101',
          1);

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (15,
          22,
          '.aiff',
          'audio/aiff',
          to_date ('06/13/2011 07:46:35',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:13',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc,
                           ref_type_fichr,
                           ext,
                           mime_type,
                           date_creat,
                           utils_creat,
                           date_modfc,
                           utils_modfc,
                           ordre_choix)
values   (16,
          22,
          '.aiff',
          'audio/x-aiff',
          to_date ('06/13/2011 07:46:36',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:13',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101',
          1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (17,
               '.aim',
               'application/x-aim',
               to_date ('06/13/2011 07:46:36',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (18,
               '.aip',
               'text/x-audiosoft-intra',
               to_date ('06/13/2011 07:46:36',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (19,
               '.ani',
               'application/x-navi-animation',
               to_date ('06/13/2011 07:46:36',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (20,
               '.aos',
               'application/x-nokia-9000-communicator-add-on-software',
               to_date ('06/13/2011 07:46:36',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (21,
               '.aps',
               'application/mime',
               to_date ('06/13/2011 07:46:36',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (22,
               '.arc',
               'application/octet-stream',
               to_date ('06/13/2011 07:46:36',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (23,
               '.arj',
               'application/arj',
               to_date ('06/13/2011 07:46:37',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (24,
               '.arj',
               'application/octet-stream',
               to_date ('06/13/2011 07:46:37',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (25,
          1,
          '.art',
          'image/x-jg',
          to_date ('06/13/2011 07:46:37',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:13',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (26,
          5,
          '.asf',
          'video/x-ms-asf',
          to_date ('06/13/2011 07:46:37',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:13',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (27,
               '.asm',
               'text/x-asm',
               to_date ('06/13/2011 07:46:37',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (28,
               '.asp',
               'text/asp',
               to_date ('06/13/2011 07:46:37',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (29,
               '.asx',
               'application/x-mplayer2',
               to_date ('06/13/2011 07:46:37',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (30,
          5,
          '.asx',
          'video/x-ms-asf',
          to_date ('06/13/2011 07:46:38',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:13',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (31,
          5,
          '.asx',
          'video/x-ms-asf-plugin',
          to_date ('06/13/2011 07:46:38',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:13',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (32,
          22,
          '.au',
          'audio/basic',
          to_date ('06/13/2011 07:46:38',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:13',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc,
                           ref_type_fichr,
                           ext,
                           mime_type,
                           date_creat,
                           utils_creat,
                           date_modfc,
                           utils_modfc,
                           ordre_choix)
values   (33,
          22,
          '.au',
          'audio/x-au',
          to_date ('06/13/2011 07:46:38',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:13',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101',
          1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (34,
               '.avi',
               'application/x-troff-msvideo',
               to_date ('06/13/2011 07:46:38',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert
  into   sie_13_mime_type (seqnc,
                           ref_type_fichr,
                           ext,
                           mime_type,
                           date_creat,
                           utils_creat,
                           date_modfc,
                           utils_modfc,
                           ordre_choix)
values   (35,
          5,
          '.avi',
          'video/avi',
          to_date ('06/13/2011 07:46:38',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:13',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101',
          1);

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (36,
          5,
          '.avi',
          'video/msvideo',
          to_date ('06/13/2011 07:46:38',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:13',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (37,
          5,
          '.avi',
          'video/x-msvideo',
          to_date ('06/13/2011 07:46:39',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:13',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (38,
          5,
          '.avs',
          'video/avs-video',
          to_date ('06/13/2011 07:46:39',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:13',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (39,
               '.bcpio',
               'application/x-bcpio',
               to_date ('06/13/2011 07:46:39',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (40,
               '.bin',
               'application/mac-binary',
               to_date ('06/13/2011 07:46:39',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (41,
               '.bin',
               'application/macbinary',
               to_date ('06/13/2011 07:46:39',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (42,
               '.bin',
               'application/octet-stream',
               to_date ('06/13/2011 07:46:39',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (43,
               '.bin',
               'application/x-binary',
               to_date ('06/13/2011 07:46:39',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (44,
               '.bin',
               'application/x-macbinary',
               to_date ('06/13/2011 07:46:40',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (45,
          1,
          '.bm',
          'image/bmp',
          to_date ('06/13/2011 07:46:40',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:13',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc,
                           ref_type_fichr,
                           ext,
                           mime_type,
                           date_creat,
                           utils_creat,
                           date_modfc,
                           utils_modfc,
                           ordre_choix)
values   (46,
          1,
          '.bmp',
          'image/bmp',
          to_date ('06/13/2011 07:46:40',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:13',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101',
          1);

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (47,
          1,
          '.bmp',
          'image/x-windows-bmp',
          to_date ('06/13/2011 07:46:40',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:13',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (48,
               '.boo',
               'application/book',
               to_date ('06/13/2011 07:46:40',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (49,
               '.book',
               'application/book',
               to_date ('06/13/2011 07:46:40',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (50,
               '.boz',
               'application/x-bzip2',
               to_date ('06/13/2011 07:46:40',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (51,
               '.bsh',
               'application/x-bsh',
               to_date ('06/13/2011 07:46:41',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (52,
               '.bz',
               'application/x-bzip',
               to_date ('06/13/2011 07:46:41',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (53,
               '.bz2',
               'application/x-bzip2',
               to_date ('06/13/2011 07:46:41',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (54,
               '.c',
               'text/plain',
               to_date ('06/13/2011 07:46:41',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (55,
               '.c',
               'text/x-c',
               to_date ('06/13/2011 07:46:41',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (56,
               '.c++',
               'text/plain',
               to_date ('06/13/2011 07:46:41',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (57,
               '.cat',
               'application/vnd.ms-pki.seccat',
               to_date ('06/13/2011 07:46:42',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (58,
               '.cc',
               'text/plain',
               to_date ('06/13/2011 07:46:42',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (59,
               '.cc',
               'text/x-c',
               to_date ('06/13/2011 07:46:42',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (60,
               '.ccad',
               'application/clariscad',
               to_date ('06/13/2011 07:46:42',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (61,
               '.cco',
               'application/x-cocoa',
               to_date ('06/13/2011 07:46:43',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (62,
               '.cdf',
               'application/cdf',
               to_date ('06/13/2011 07:46:43',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (63,
               '.cdf',
               'application/x-cdf',
               to_date ('06/13/2011 07:46:43',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (64,
               '.cdf',
               'application/x-netcdf',
               to_date ('06/13/2011 07:46:43',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (65,
               '.cer',
               'application/pkix-cert',
               to_date ('06/13/2011 07:46:43',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (66,
               '.cer',
               'application/x-x509-ca-cert',
               to_date ('06/13/2011 07:46:43',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (67,
               '.cha',
               'application/x-chat',
               to_date ('06/13/2011 07:46:44',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (68,
               '.chat',
               'application/x-chat',
               to_date ('06/13/2011 07:46:44',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (69,
               '.class',
               'application/java',
               to_date ('06/13/2011 07:46:44',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (70,
               '.class',
               'application/java-byte-code',
               to_date ('06/13/2011 07:46:44',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (71,
               '.class',
               'application/x-java-class',
               to_date ('06/13/2011 07:46:44',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (72,
               '.com',
               'application/octet-stream',
               to_date ('06/13/2011 07:46:45',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (73,
               '.com',
               'text/plain',
               to_date ('06/13/2011 07:46:45',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (74,
               '.conf',
               'text/plain',
               to_date ('06/13/2011 07:46:45',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (75,
               '.cpio',
               'application/x-cpio',
               to_date ('06/13/2011 07:46:45',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (76,
               '.cpp',
               'text/x-c',
               to_date ('06/13/2011 07:46:45',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (77,
               '.cpt',
               'application/mac-compactpro',
               to_date ('06/13/2011 07:46:46',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (78,
               '.cpt',
               'application/x-compactpro',
               to_date ('06/13/2011 07:46:46',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (79,
               '.cpt',
               'application/x-cpt',
               to_date ('06/13/2011 07:46:46',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (80,
               '.crl',
               'application/pkcs-crl',
               to_date ('06/13/2011 07:46:46',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (81,
               '.crl',
               'application/pkix-crl',
               to_date ('06/13/2011 07:46:46',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (82,
               '.crt',
               'application/pkix-cert',
               to_date ('06/13/2011 07:46:47',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (83,
               '.crt',
               'application/x-x509-ca-cert',
               to_date ('06/13/2011 07:46:47',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (84,
               '.crt',
               'application/x-x509-user-cert',
               to_date ('06/13/2011 07:46:47',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (85,
               '.csh',
               'application/x-csh',
               to_date ('06/13/2011 07:46:47',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (86,
               '.csh',
               'text/x-script.csh',
               to_date ('06/13/2011 07:46:47',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (87,
               '.css',
               'application/x-pointplus',
               to_date ('06/13/2011 07:46:47',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert
  into   sie_13_mime_type (seqnc,
                           ref_type_fichr,
                           ext,
                           mime_type,
                           date_creat,
                           utils_creat,
                           date_modfc,
                           utils_modfc,
                           ordre_choix)
values   (88,
          62,
          '.css',
          'text/css',
          to_date ('06/13/2011 07:46:47',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101',
          1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (89,
               '.cxx',
               'text/plain',
               to_date ('06/13/2011 07:46:48',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (90,
               '.dcr',
               'application/x-director',
               to_date ('06/13/2011 07:46:48',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (91,
               '.deepv',
               'application/x-deepv',
               to_date ('06/13/2011 07:46:48',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (92,
               '.def',
               'text/plain',
               to_date ('06/13/2011 07:46:48',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (93,
               '.der',
               'application/x-x509-ca-cert',
               to_date ('06/13/2011 07:46:48',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (94,
          5,
          '.dif',
          'video/x-dv',
          to_date ('06/13/2011 07:46:48',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (95,
               '.dir',
               'application/x-director',
               to_date ('06/13/2011 07:46:49',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert
  into   sie_13_mime_type (seqnc,
                           ref_type_fichr,
                           ext,
                           mime_type,
                           date_creat,
                           utils_creat,
                           date_modfc,
                           utils_modfc,
                           ordre_choix)
values   (96,
          5,
          '.dl',
          'video/dl',
          to_date ('06/13/2011 07:46:49',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101',
          1);

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (97,
          5,
          '.dl',
          'video/x-dl',
          to_date ('06/13/2011 07:46:49',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (98,
          2,
          '.doc',
          'application/msword',
          to_date ('06/13/2011 07:46:49',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (99,
          2,
          '.dot',
          'application/msword',
          to_date ('06/13/2011 07:46:49',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (100,
               '.dp',
               'application/commonground',
               to_date ('06/13/2011 07:46:49',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (101,
               '.drw',
               'application/drafting',
               to_date ('06/13/2011 07:46:50',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (102,
               '.dump',
               'application/octet-stream',
               to_date ('06/13/2011 07:46:50',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (103,
          5,
          '.dv',
          'video/x-dv',
          to_date ('06/13/2011 07:46:50',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (104,
               '.dvi',
               'application/x-dvi',
               to_date ('06/13/2011 07:46:50',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (105,
               '.dwf',
               'drawing/x-dwf (old)',
               to_date ('06/13/2011 07:46:50',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (106,
               '.dwf',
               'model/vnd.dwf',
               to_date ('06/13/2011 07:46:50',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (107,
               '.dwg',
               'application/acad',
               to_date ('06/13/2011 07:46:50',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert
  into   sie_13_mime_type (seqnc,
                           ref_type_fichr,
                           ext,
                           mime_type,
                           date_creat,
                           utils_creat,
                           date_modfc,
                           utils_modfc,
                           ordre_choix)
values   (108,
          1,
          '.dwg',
          'image/vnd.dwg',
          to_date ('06/13/2011 07:46:51',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101',
          1);

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (109,
          1,
          '.dwg',
          'image/x-dwg',
          to_date ('06/13/2011 07:46:51',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (110,
               '.dxf',
               'application/dxf',
               to_date ('06/13/2011 07:46:51',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (111,
          1,
          '.dxf',
          'image/vnd.dwg',
          to_date ('06/13/2011 07:46:51',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (112,
          1,
          '.dxf',
          'image/x-dwg',
          to_date ('06/13/2011 07:46:51',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (113,
               '.dxr',
               'application/x-director',
               to_date ('06/13/2011 07:46:51',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (114,
               '.el',
               'text/x-script.elisp',
               to_date ('06/13/2011 07:46:52',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (115,
               '.elc',
               'application/x-bytecode.elisp (compiled elisp)',
               to_date ('06/13/2011 07:46:52',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (116,
               '.elc',
               'application/x-elc',
               to_date ('06/13/2011 07:46:52',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (117,
               '.env',
               'application/x-envoy',
               to_date ('06/13/2011 07:46:52',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (118,
               '.eps',
               'application/postscript',
               to_date ('06/13/2011 07:46:52',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (119,
               '.es',
               'application/x-esrehber',
               to_date ('06/13/2011 07:46:52',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (120,
               '.etx',
               'text/x-setext',
               to_date ('06/13/2011 07:46:53',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (121,
               '.evy',
               'application/envoy',
               to_date ('06/13/2011 07:46:53',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (122,
               '.evy',
               'application/x-envoy',
               to_date ('06/13/2011 07:46:53',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (123,
          41,
          '.exe',
          'application/octet-stream',
          to_date ('06/13/2011 07:46:53',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (124,
               '.f',
               'text/plain',
               to_date ('06/13/2011 07:46:53',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (125,
               '.f',
               'text/x-fortran',
               to_date ('06/13/2011 07:46:53',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (126,
               '.f77',
               'text/x-fortran',
               to_date ('06/13/2011 07:46:53',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (127,
               '.f90',
               'text/plain',
               to_date ('06/13/2011 07:46:54',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (128,
               '.f90',
               'text/x-fortran',
               to_date ('06/13/2011 07:46:54',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (129,
               '.fdf',
               'application/vnd.fdf',
               to_date ('06/13/2011 07:46:54',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (130,
               '.fif',
               'application/fractals',
               to_date ('06/13/2011 07:46:54',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert
  into   sie_13_mime_type (seqnc,
                           ref_type_fichr,
                           ext,
                           mime_type,
                           date_creat,
                           utils_creat,
                           date_modfc,
                           utils_modfc,
                           ordre_choix)
values   (131,
          1,
          '.fif',
          'image/fif',
          to_date ('06/13/2011 07:46:54',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101',
          1);

insert
  into   sie_13_mime_type (seqnc,
                           ref_type_fichr,
                           ext,
                           mime_type,
                           date_creat,
                           utils_creat,
                           date_modfc,
                           utils_modfc,
                           ordre_choix)
values   (132,
          5,
          '.fli',
          'video/fli',
          to_date ('06/13/2011 07:46:54',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101',
          1);

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (133,
          5,
          '.fli',
          'video/x-fli',
          to_date ('06/13/2011 07:46:55',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (134,
          1,
          '.flo',
          'image/florian',
          to_date ('06/13/2011 07:46:55',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (135,
               '.flx',
               'text/vnd.fmi.flexstor',
               to_date ('06/13/2011 07:46:55',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (136,
          5,
          '.fmf',
          'video/x-atomic3d-feature',
          to_date ('06/13/2011 07:46:55',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (137,
               '.for',
               'text/plain',
               to_date ('06/13/2011 07:46:55',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (138,
               '.for',
               'text/x-fortran',
               to_date ('06/13/2011 07:46:55',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert
  into   sie_13_mime_type (seqnc,
                           ref_type_fichr,
                           ext,
                           mime_type,
                           date_creat,
                           utils_creat,
                           date_modfc,
                           utils_modfc,
                           ordre_choix)
values   (139,
          1,
          '.fpx',
          'image/vnd.fpx',
          to_date ('06/13/2011 07:46:55',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101',
          1);

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (140,
          1,
          '.fpx',
          'image/vnd.net-fpx',
          to_date ('06/13/2011 07:46:56',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (141,
               '.frl',
               'application/freeloader',
               to_date ('06/13/2011 07:46:56',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (142,
          22,
          '.funk',
          'audio/make',
          to_date ('06/13/2011 07:46:56',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (143,
               '.g',
               'text/plain',
               to_date ('06/13/2011 07:46:56',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (144,
          1,
          '.g3',
          'image/g3fax',
          to_date ('06/13/2011 07:46:56',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (145,
          1,
          '.gif',
          'image/gif',
          to_date ('06/13/2011 07:46:56',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc,
                           ref_type_fichr,
                           ext,
                           mime_type,
                           date_creat,
                           utils_creat,
                           date_modfc,
                           utils_modfc,
                           ordre_choix)
values   (146,
          5,
          '.gl',
          'video/gl',
          to_date ('06/13/2011 07:46:56',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101',
          1);

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (147,
          5,
          '.gl',
          'video/x-gl',
          to_date ('06/13/2011 07:46:57',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (148,
          22,
          '.gsd',
          'audio/x-gsm',
          to_date ('06/13/2011 07:46:57',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (149,
          22,
          '.gsm',
          'audio/x-gsm',
          to_date ('06/13/2011 07:46:57',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (150,
               '.gsp',
               'application/x-gsp',
               to_date ('06/13/2011 07:46:57',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (151,
               '.gss',
               'application/x-gss',
               to_date ('06/13/2011 07:46:57',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (152,
               '.gtar',
               'application/x-gtar',
               to_date ('06/13/2011 07:46:58',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (153,
               '.gz',
               'application/x-compressed',
               to_date ('06/13/2011 07:46:58',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (154,
               '.gz',
               'application/x-gzip',
               to_date ('06/13/2011 07:46:58',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (155,
               '.gzip',
               'application/x-gzip',
               to_date ('06/13/2011 07:46:58',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (156,
               '.gzip',
               'multipart/x-gzip',
               to_date ('06/13/2011 07:46:58',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (157,
               '.h',
               'text/plain',
               to_date ('06/13/2011 07:46:58',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (158,
               '.h',
               'text/x-h',
               to_date ('06/13/2011 07:46:59',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (159,
               '.hdf',
               'application/x-hdf',
               to_date ('06/13/2011 07:46:59',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (160,
               '.help',
               'application/x-helpfile',
               to_date ('06/13/2011 07:46:59',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (161,
               '.hgl',
               'application/vnd.hp-hpgl',
               to_date ('06/13/2011 07:46:59',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (162,
               '.hh',
               'text/plain',
               to_date ('06/13/2011 07:46:59',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (163,
               '.hh',
               'text/x-h',
               to_date ('06/13/2011 07:47:00',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (164,
               '.hlb',
               'text/x-script',
               to_date ('06/13/2011 07:47:00',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (165,
               '.hlp',
               'application/hlp',
               to_date ('06/13/2011 07:47:00',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (166,
               '.hlp',
               'application/x-helpfile',
               to_date ('06/13/2011 07:47:00',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (167,
               '.hlp',
               'application/x-winhelp',
               to_date ('06/13/2011 07:47:00',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (168,
               '.hpg',
               'application/vnd.hp-hpgl',
               to_date ('06/13/2011 07:47:00',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (169,
               '.hpgl',
               'application/vnd.hp-hpgl',
               to_date ('06/13/2011 07:47:00',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (170,
               '.hqx',
               'application/binhex',
               to_date ('06/13/2011 07:47:01',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (171,
               '.hqx',
               'application/binhex4',
               to_date ('06/13/2011 07:47:01',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (172,
               '.hqx',
               'application/mac-binhex',
               to_date ('06/13/2011 07:47:01',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (173,
               '.hqx',
               'application/mac-binhex40',
               to_date ('06/13/2011 07:47:01',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (174,
               '.hqx',
               'application/x-binhex40',
               to_date ('06/13/2011 07:47:01',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (175,
               '.hqx',
               'application/x-mac-binhex40',
               to_date ('06/13/2011 07:47:01',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (176,
               '.hta',
               'application/hta',
               to_date ('06/13/2011 07:47:01',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (177,
               '.htc',
               'text/x-component',
               to_date ('06/13/2011 07:47:02',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (178,
               '.htm',
               'text/html',
               to_date ('06/13/2011 07:47:02',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (179,
               '.html',
               'text/html',
               to_date ('06/13/2011 07:47:02',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (180,
               '.htmls',
               'text/html',
               to_date ('06/13/2011 07:47:02',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (181,
               '.htt',
               'text/webviewhtml',
               to_date ('06/13/2011 07:47:02',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (182,
               '.htx',
               'text/html',
               to_date ('06/13/2011 07:47:02',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (183,
               '.ice',
               'x-conference/x-cooltalk',
               to_date ('06/13/2011 07:47:02',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (184,
          1,
          '.ico',
          'image/x-icon',
          to_date ('06/13/2011 07:47:03',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (185,
               '.idc',
               'text/plain',
               to_date ('06/13/2011 07:47:03',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (186,
          1,
          '.ief',
          'image/ief',
          to_date ('06/13/2011 07:47:03',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (187,
          1,
          '.iefs',
          'image/ief',
          to_date ('06/13/2011 07:47:03',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (188,
               '.iges',
               'application/iges',
               to_date ('06/13/2011 07:47:03',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (189,
               '.iges',
               'model/iges',
               to_date ('06/13/2011 07:47:03',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (190,
               '.igs',
               'application/iges',
               to_date ('06/13/2011 07:47:03',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (191,
               '.igs',
               'model/iges',
               to_date ('06/13/2011 07:47:04',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (192,
               '.ima',
               'application/x-ima',
               to_date ('06/13/2011 07:47:04',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (193,
               '.imap',
               'application/x-httpd-imap',
               to_date ('06/13/2011 07:47:04',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (194,
               '.inf',
               'application/inf',
               to_date ('06/13/2011 07:47:04',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (195,
               '.ins',
               'application/x-internett-signup',
               to_date ('06/13/2011 07:47:04',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (196,
               '.ip',
               'application/x-ip2',
               to_date ('06/13/2011 07:47:04',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (197,
          5,
          '.isu',
          'video/x-isvideo',
          to_date ('06/13/2011 07:47:04',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (198,
          22,
          '.it',
          'audio/it',
          to_date ('06/13/2011 07:47:05',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (199,
               '.iv',
               'application/x-inventor',
               to_date ('06/13/2011 07:47:05',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (200,
               '.ivr',
               'i-world/i-vrml',
               to_date ('06/13/2011 07:47:05',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (201,
               '.ivy',
               'application/x-livescreen',
               to_date ('06/13/2011 07:47:05',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (202,
          22,
          '.jam',
          'audio/x-jam',
          to_date ('06/13/2011 07:47:05',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (203,
               '.jav',
               'text/plain',
               to_date ('06/13/2011 07:47:05',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (204,
               '.jav',
               'text/x-java-source',
               to_date ('06/13/2011 07:47:05',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (205,
               '.java',
               'text/plain',
               to_date ('06/13/2011 07:47:06',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (206,
               '.java',
               'text/x-java-source',
               to_date ('06/13/2011 07:47:06',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (207,
               '.jcm',
               'application/x-java-commerce',
               to_date ('06/13/2011 07:47:06',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert
  into   sie_13_mime_type (seqnc,
                           ref_type_fichr,
                           ext,
                           mime_type,
                           date_creat,
                           utils_creat,
                           date_modfc,
                           utils_modfc,
                           ordre_choix)
values   (208,
          1,
          '.jfif',
          'image/jpeg',
          to_date ('06/13/2011 07:47:06',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101',
          1);

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (209,
          1,
          '.jfif',
          'image/pjpeg',
          to_date ('06/13/2011 07:47:06',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (210,
          1,
          '.jfif-tbnl',
          'image/jpeg',
          to_date ('06/13/2011 07:47:06',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc,
                           ref_type_fichr,
                           ext,
                           mime_type,
                           date_creat,
                           utils_creat,
                           date_modfc,
                           utils_modfc,
                           ordre_choix)
values   (211,
          1,
          '.jpe',
          'image/jpeg',
          to_date ('06/13/2011 07:47:07',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101',
          1);

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (212,
          1,
          '.jpe',
          'image/pjpeg',
          to_date ('06/13/2011 07:47:07',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc,
                           ref_type_fichr,
                           ext,
                           mime_type,
                           date_creat,
                           utils_creat,
                           date_modfc,
                           utils_modfc,
                           ordre_choix)
values   (213,
          1,
          '.jpeg',
          'image/jpeg',
          to_date ('06/13/2011 07:47:07',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101',
          1);

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (214,
          1,
          '.jpeg',
          'image/pjpeg',
          to_date ('06/13/2011 07:47:07',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc,
                           ref_type_fichr,
                           ext,
                           mime_type,
                           date_creat,
                           utils_creat,
                           date_modfc,
                           utils_modfc,
                           ordre_choix)
values   (215,
          1,
          '.jpg',
          'image/jpeg',
          to_date ('06/13/2011 07:47:07',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101',
          1);

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (216,
          1,
          '.jpg',
          'image/pjpeg',
          to_date ('06/13/2011 07:47:07',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (217,
          1,
          '.jps',
          'image/x-jps',
          to_date ('06/13/2011 07:47:08',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (218,
          61,
          '.js',
          'application/x-javascript',
          to_date ('06/13/2011 07:47:08',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (219,
          1,
          '.jut',
          'image/jutvision',
          to_date ('06/13/2011 07:47:08',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc,
                           ref_type_fichr,
                           ext,
                           mime_type,
                           date_creat,
                           utils_creat,
                           date_modfc,
                           utils_modfc,
                           ordre_choix)
values   (220,
          22,
          '.kar',
          'audio/midi',
          to_date ('06/13/2011 07:47:08',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101',
          1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (221,
               '.kar',
               'music/x-karaoke',
               to_date ('06/13/2011 07:47:08',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (222,
               '.ksh',
               'application/x-ksh',
               to_date ('06/13/2011 07:47:08',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (223,
               '.ksh',
               'text/x-script.ksh',
               to_date ('06/13/2011 07:47:09',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert
  into   sie_13_mime_type (seqnc,
                           ref_type_fichr,
                           ext,
                           mime_type,
                           date_creat,
                           utils_creat,
                           date_modfc,
                           utils_modfc,
                           ordre_choix)
values   (224,
          22,
          '.la',
          'audio/nspaudio',
          to_date ('06/13/2011 07:47:09',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101',
          1);

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (225,
          22,
          '.la',
          'audio/x-nspaudio',
          to_date ('06/13/2011 07:47:09',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (226,
          22,
          '.lam',
          'audio/x-liveaudio',
          to_date ('06/13/2011 07:47:09',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (227,
               '.latex',
               'application/x-latex',
               to_date ('06/13/2011 07:47:09',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (228,
               '.lha',
               'application/lha',
               to_date ('06/13/2011 07:47:09',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (229,
               '.lha',
               'application/octet-stream',
               to_date ('06/13/2011 07:47:10',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (230,
               '.lha',
               'application/x-lha',
               to_date ('06/13/2011 07:47:10',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (231,
               '.lhx',
               'application/octet-stream',
               to_date ('06/13/2011 07:47:10',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (232,
               '.list',
               'text/plain',
               to_date ('06/13/2011 07:47:10',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert
  into   sie_13_mime_type (seqnc,
                           ref_type_fichr,
                           ext,
                           mime_type,
                           date_creat,
                           utils_creat,
                           date_modfc,
                           utils_modfc,
                           ordre_choix)
values   (233,
          22,
          '.lma',
          'audio/nspaudio',
          to_date ('06/13/2011 07:47:10',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101',
          1);

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (234,
          22,
          '.lma',
          'audio/x-nspaudio',
          to_date ('06/13/2011 07:47:10',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (235,
               '.log',
               'text/plain',
               to_date ('06/13/2011 07:47:11',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (236,
               '.lsp',
               'application/x-lisp',
               to_date ('06/13/2011 07:47:11',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (237,
               '.lsp',
               'text/x-script.lisp',
               to_date ('06/13/2011 07:47:11',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (238,
               '.lst',
               'text/plain',
               to_date ('06/13/2011 07:47:11',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (239,
               '.lsx',
               'text/x-la-asf',
               to_date ('06/13/2011 07:47:11',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (240,
               '.ltx',
               'application/x-latex',
               to_date ('06/13/2011 07:47:11',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (241,
               '.lzh',
               'application/octet-stream',
               to_date ('06/13/2011 07:47:12',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (242,
               '.lzh',
               'application/x-lzh',
               to_date ('06/13/2011 07:47:12',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (243,
               '.lzx',
               'application/lzx',
               to_date ('06/13/2011 07:47:12',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (244,
               '.lzx',
               'application/octet-stream',
               to_date ('06/13/2011 07:47:12',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (245,
               '.lzx',
               'application/x-lzx',
               to_date ('06/13/2011 07:47:12',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (246,
               '.m',
               'text/plain',
               to_date ('06/13/2011 07:47:12',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (247,
               '.m',
               'text/x-m',
               to_date ('06/13/2011 07:47:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (248,
          5,
          '.m1v',
          'video/mpeg',
          to_date ('06/13/2011 07:47:13',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (249,
          22,
          '.m2a',
          'audio/mpeg',
          to_date ('06/13/2011 07:47:13',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (250,
          5,
          '.m2v',
          'video/mpeg',
          to_date ('06/13/2011 07:47:13',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (251,
          22,
          '.m3u',
          'audio/x-mpequrl',
          to_date ('06/13/2011 07:47:13',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (252,
               '.man',
               'application/x-troff-man',
               to_date ('06/13/2011 07:47:13',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (253,
               '.map',
               'application/x-navimap',
               to_date ('06/13/2011 07:47:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (254,
               '.mar',
               'text/plain',
               to_date ('06/13/2011 07:47:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (255,
               '.mbd',
               'application/mbedlet',
               to_date ('06/13/2011 07:47:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (256,
               '.mc$',
               'application/x-magic-cap-package-1.0',
               to_date ('06/13/2011 07:47:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (257,
               '.mcd',
               'application/mcad',
               to_date ('06/13/2011 07:47:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (258,
               '.mcd',
               'application/x-mathcad',
               to_date ('06/13/2011 07:47:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert
  into   sie_13_mime_type (seqnc,
                           ref_type_fichr,
                           ext,
                           mime_type,
                           date_creat,
                           utils_creat,
                           date_modfc,
                           utils_modfc,
                           ordre_choix)
values   (259,
          1,
          '.mcf',
          'image/vasa',
          to_date ('06/13/2011 07:47:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101',
          1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (260,
               '.mcf',
               'text/mcf',
               to_date ('06/13/2011 07:47:15',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (261,
               '.mcp',
               'application/netmc',
               to_date ('06/13/2011 07:47:15',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (262,
               '.me',
               'application/x-troff-me',
               to_date ('06/13/2011 07:47:15',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (263,
               '.mht',
               'message/rfc822',
               to_date ('06/13/2011 07:47:15',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (264,
               '.mhtml',
               'message/rfc822',
               to_date ('06/13/2011 07:47:15',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (265,
               '.mid',
               'application/x-midi',
               to_date ('06/13/2011 07:47:15',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (266,
          22,
          '.mid',
          'audio/midi',
          to_date ('06/13/2011 07:47:15',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (267,
          22,
          '.mid',
          'audio/x-mid',
          to_date ('06/13/2011 07:47:16',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (268,
          22,
          '.mid',
          'audio/x-midi',
          to_date ('06/13/2011 07:47:16',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (269,
               '.mid',
               'music/crescendo',
               to_date ('06/13/2011 07:47:16',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (270,
               '.mid',
               'x-music/x-midi',
               to_date ('06/13/2011 07:47:16',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (271,
               '.midi',
               'application/x-midi',
               to_date ('06/13/2011 07:47:16',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (272,
          22,
          '.midi',
          'audio/midi',
          to_date ('06/13/2011 07:47:16',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (273,
          22,
          '.midi',
          'audio/x-mid',
          to_date ('06/13/2011 07:47:16',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (274,
          22,
          '.midi',
          'audio/x-midi',
          to_date ('06/13/2011 07:47:17',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (275,
               '.midi',
               'music/crescendo',
               to_date ('06/13/2011 07:47:17',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (276,
               '.midi',
               'x-music/x-midi',
               to_date ('06/13/2011 07:47:17',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (277,
               '.mif',
               'application/x-frame',
               to_date ('06/13/2011 07:47:17',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (278,
               '.mif',
               'application/x-mif',
               to_date ('06/13/2011 07:47:17',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (279,
               '.mime',
               'message/rfc822',
               to_date ('06/13/2011 07:47:18',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (280,
               '.mime',
               'www/mime',
               to_date ('06/13/2011 07:47:18',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (281,
          22,
          '.mjf',
          'audio/x-vnd.audioexplosion.mjuicemediafile',
          to_date ('06/13/2011 07:47:18',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (282,
          5,
          '.mjpg',
          'video/x-motion-jpeg',
          to_date ('06/13/2011 07:47:18',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (283,
               '.mm',
               'application/base64',
               to_date ('06/13/2011 07:47:18',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (284,
               '.mm',
               'application/x-meme',
               to_date ('06/13/2011 07:47:18',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (285,
               '.mme',
               'application/base64',
               to_date ('06/13/2011 07:47:18',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert
  into   sie_13_mime_type (seqnc,
                           ref_type_fichr,
                           ext,
                           mime_type,
                           date_creat,
                           utils_creat,
                           date_modfc,
                           utils_modfc,
                           ordre_choix)
values   (286,
          22,
          '.mod',
          'audio/mod',
          to_date ('06/13/2011 07:47:19',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101',
          1);

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (287,
          22,
          '.mod',
          'audio/x-mod',
          to_date ('06/13/2011 07:47:19',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (288,
          5,
          '.moov',
          'video/quicktime',
          to_date ('06/13/2011 07:47:19',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (289,
          5,
          '.mov',
          'video/quicktime',
          to_date ('06/13/2011 07:47:19',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (290,
          5,
          '.movie',
          'video/x-sgi-movie',
          to_date ('06/13/2011 07:47:19',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (291,
          22,
          '.mp2',
          'audio/mpeg',
          to_date ('06/13/2011 07:47:19',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (292,
          22,
          '.mp2',
          'audio/x-mpeg',
          to_date ('06/13/2011 07:47:20',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc,
                           ref_type_fichr,
                           ext,
                           mime_type,
                           date_creat,
                           utils_creat,
                           date_modfc,
                           utils_modfc,
                           ordre_choix)
values   (293,
          5,
          '.mp2',
          'video/mpeg',
          to_date ('06/13/2011 07:47:20',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101',
          1);

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (294,
          5,
          '.mp2',
          'video/x-mpeg',
          to_date ('06/13/2011 07:47:20',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (295,
          5,
          '.mp2',
          'video/x-mpeq2a',
          to_date ('06/13/2011 07:47:20',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc,
                           ref_type_fichr,
                           ext,
                           mime_type,
                           date_creat,
                           utils_creat,
                           date_modfc,
                           utils_modfc,
                           ordre_choix)
values   (296,
          22,
          '.mp3',
          'audio/mpeg3',
          to_date ('06/13/2011 07:47:20',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101',
          1);

insert
  into   sie_13_mime_type (seqnc,
                           ref_type_fichr,
                           ext,
                           mime_type,
                           date_creat,
                           utils_creat,
                           date_modfc,
                           utils_modfc,
                           ordre_choix)
values   (297,
          22,
          '.mp3',
          'audio/x-mpeg-3',
          to_date ('06/13/2011 07:47:20',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101',
          2);

insert
  into   sie_13_mime_type (seqnc,
                           ref_type_fichr,
                           ext,
                           mime_type,
                           date_creat,
                           utils_creat,
                           date_modfc,
                           utils_modfc,
                           ordre_choix)
values   (298,
          5,
          '.mp3',
          'video/mpeg',
          to_date ('06/13/2011 07:47:20',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101',
          3);

insert
  into   sie_13_mime_type (seqnc,
                           ref_type_fichr,
                           ext,
                           mime_type,
                           date_creat,
                           utils_creat,
                           date_modfc,
                           utils_modfc,
                           ordre_choix)
values   (299,
          5,
          '.mp3',
          'video/x-mpeg',
          to_date ('06/13/2011 07:47:21',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101',
          4);

insert
  into   sie_13_mime_type (seqnc,
                           ref_type_fichr,
                           ext,
                           mime_type,
                           date_creat,
                           utils_creat,
                           date_modfc,
                           utils_modfc,
                           ordre_choix)
values   (300,
          22,
          '.mpa',
          'audio/mpeg',
          to_date ('06/13/2011 07:47:21',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101',
          1);

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (301,
          5,
          '.mpa',
          'video/mpeg',
          to_date ('06/13/2011 07:47:21',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (302,
               '.mpc',
               'application/x-project',
               to_date ('06/13/2011 07:47:21',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (303,
          5,
          '.mpe',
          'video/mpeg',
          to_date ('06/13/2011 07:47:21',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (304,
          5,
          '.mpeg',
          'video/mpeg',
          to_date ('06/13/2011 07:47:21',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (305,
          22,
          '.mpg',
          'audio/mpeg',
          to_date ('06/13/2011 07:47:21',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc,
                           ref_type_fichr,
                           ext,
                           mime_type,
                           date_creat,
                           utils_creat,
                           date_modfc,
                           utils_modfc,
                           ordre_choix)
values   (306,
          5,
          '.mpg',
          'video/mpeg',
          to_date ('06/13/2011 07:47:22',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101',
          1);

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (307,
          22,
          '.mpga',
          'audio/mpeg',
          to_date ('06/13/2011 07:47:22',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (308,
               '.mpp',
               'application/vnd.ms-project',
               to_date ('06/13/2011 07:47:22',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (309,
               '.mpt',
               'application/x-project',
               to_date ('06/13/2011 07:47:22',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (310,
               '.mpv',
               'application/x-project',
               to_date ('06/13/2011 07:47:22',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (311,
               '.mpx',
               'application/x-project',
               to_date ('06/13/2011 07:47:22',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (312,
               '.mrc',
               'application/marc',
               to_date ('06/13/2011 07:47:23',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (313,
               '.ms',
               'application/x-troff-ms',
               to_date ('06/13/2011 07:47:23',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (314,
          5,
          '.mv',
          'video/x-sgi-movie',
          to_date ('06/13/2011 07:47:23',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (315,
          22,
          '.my',
          'audio/make',
          to_date ('06/13/2011 07:47:23',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (316,
               '.mzz',
               'application/x-vnd.audioexplosion.mzz',
               to_date ('06/13/2011 07:47:23',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (317,
          1,
          '.nap',
          'image/naplps',
          to_date ('06/13/2011 07:47:23',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (318,
          1,
          '.naplps',
          'image/naplps',
          to_date ('06/13/2011 07:47:23',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (319,
               '.nc',
               'application/x-netcdf',
               to_date ('06/13/2011 07:47:24',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (320,
               '.ncm',
               'application/vnd.nokia.configuration-message',
               to_date ('06/13/2011 07:47:24',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (321,
          1,
          '.nif',
          'image/x-niff',
          to_date ('06/13/2011 07:47:24',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (322,
          1,
          '.niff',
          'image/x-niff',
          to_date ('06/13/2011 07:47:24',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (323,
               '.nix',
               'application/x-mix-transfer',
               to_date ('06/13/2011 07:47:24',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (324,
               '.nsc',
               'application/x-conference',
               to_date ('06/13/2011 07:47:24',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (325,
               '.nvd',
               'application/x-navidoc',
               to_date ('06/13/2011 07:47:24',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (326,
               '.o',
               'application/octet-stream',
               to_date ('06/13/2011 07:47:25',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (327,
               '.oda',
               'application/oda',
               to_date ('06/13/2011 07:47:25',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (328,
               '.omc',
               'application/x-omc',
               to_date ('06/13/2011 07:47:25',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (329,
               '.omcd',
               'application/x-omcdatamaker',
               to_date ('06/13/2011 07:47:25',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (330,
               '.omcr',
               'application/x-omcregerator',
               to_date ('06/13/2011 07:47:25',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (331,
               '.p',
               'text/x-pascal',
               to_date ('06/13/2011 07:47:25',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (332,
               '.p10',
               'application/pkcs10',
               to_date ('06/13/2011 07:47:26',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (333,
               '.p10',
               'application/x-pkcs10',
               to_date ('06/13/2011 07:47:26',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (334,
               '.p12',
               'application/pkcs-12',
               to_date ('06/13/2011 07:47:26',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (335,
               '.p12',
               'application/x-pkcs12',
               to_date ('06/13/2011 07:47:26',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (336,
               '.p7a',
               'application/x-pkcs7-signature',
               to_date ('06/13/2011 07:47:26',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (337,
               '.p7c',
               'application/pkcs7-mime',
               to_date ('06/13/2011 07:47:26',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (338,
               '.p7c',
               'application/x-pkcs7-mime',
               to_date ('06/13/2011 07:47:26',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (339,
               '.p7m',
               'application/pkcs7-mime',
               to_date ('06/13/2011 07:47:27',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (340,
               '.p7m',
               'application/x-pkcs7-mime',
               to_date ('06/13/2011 07:47:27',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (341,
               '.p7r',
               'application/x-pkcs7-certreqresp',
               to_date ('06/13/2011 07:47:27',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (342,
               '.p7s',
               'application/pkcs7-signature',
               to_date ('06/13/2011 07:47:27',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (343,
               '.part',
               'application/pro_eng',
               to_date ('06/13/2011 07:47:27',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (344,
               '.pas',
               'text/pascal',
               to_date ('06/13/2011 07:47:27',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (345,
          1,
          '.pbm',
          'image/x-portable-bitmap',
          to_date ('06/13/2011 07:47:28',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (346,
               '.pcl',
               'application/vnd.hp-pcl',
               to_date ('06/13/2011 07:47:28',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (347,
               '.pcl',
               'application/x-pcl',
               to_date ('06/13/2011 07:47:28',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (348,
          1,
          '.pct',
          'image/x-pict',
          to_date ('06/13/2011 07:47:28',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (349,
          1,
          '.pcx',
          'image/x-pcx',
          to_date ('06/13/2011 07:47:28',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (350,
               '.pdb',
               'chemical/x-pdb',
               to_date ('06/13/2011 07:47:28',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (351,
          3,
          '.pdf',
          'application/pdf',
          to_date ('06/13/2011 07:47:28',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc,
                           ref_type_fichr,
                           ext,
                           mime_type,
                           date_creat,
                           utils_creat,
                           date_modfc,
                           utils_modfc,
                           ordre_choix)
values   (352,
          22,
          '.pfunk',
          'audio/make',
          to_date ('06/13/2011 07:47:29',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101',
          1);

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (353,
          22,
          '.pfunk',
          'audio/make.my.funk',
          to_date ('06/13/2011 07:47:29',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (354,
          1,
          '.pgm',
          'image/x-portable-graymap',
          to_date ('06/13/2011 07:47:29',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc,
                           ref_type_fichr,
                           ext,
                           mime_type,
                           date_creat,
                           utils_creat,
                           date_modfc,
                           utils_modfc,
                           ordre_choix)
values   (355,
          1,
          '.pgm',
          'image/x-portable-greymap',
          to_date ('06/13/2011 07:47:29',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101',
          1);

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (356,
          1,
          '.pic',
          'image/pict',
          to_date ('06/13/2011 07:47:30',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (357,
          1,
          '.pict',
          'image/pict',
          to_date ('06/13/2011 07:47:30',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (358,
               '.pkg',
               'application/x-newton-compatible-pkg',
               to_date ('06/13/2011 07:47:30',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (359,
               '.pko',
               'application/vnd.ms-pki.pko',
               to_date ('06/13/2011 07:47:30',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (360,
               '.pl',
               'text/plain',
               to_date ('06/13/2011 07:47:30',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (361,
               '.pl',
               'text/x-script.perl',
               to_date ('06/13/2011 07:47:30',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (362,
               '.plx',
               'application/x-pixclscript',
               to_date ('06/13/2011 07:47:30',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert
  into   sie_13_mime_type (seqnc,
                           ref_type_fichr,
                           ext,
                           mime_type,
                           date_creat,
                           utils_creat,
                           date_modfc,
                           utils_modfc,
                           ordre_choix)
values   (363,
          1,
          '.pm',
          'image/x-xpixmap',
          to_date ('06/13/2011 07:47:31',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101',
          1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (364,
               '.pm',
               'text/x-script.perl-module',
               to_date ('06/13/2011 07:47:31',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (365,
               '.pm4',
               'application/x-pagemaker',
               to_date ('06/13/2011 07:47:31',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (366,
               '.pm5',
               'application/x-pagemaker',
               to_date ('06/13/2011 07:47:31',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (367,
          1,
          '.png',
          'image/png',
          to_date ('06/13/2011 07:47:31',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (368,
               '.pnm',
               'application/x-portable-anymap',
               to_date ('06/13/2011 07:47:31',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert
  into   sie_13_mime_type (seqnc,
                           ref_type_fichr,
                           ext,
                           mime_type,
                           date_creat,
                           utils_creat,
                           date_modfc,
                           utils_modfc,
                           ordre_choix)
values   (369,
          1,
          '.pnm',
          'image/x-portable-anymap',
          to_date ('06/13/2011 07:47:31',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101',
          1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (370,
               '.pot',
               'application/mspowerpoint',
               to_date ('06/13/2011 07:47:32',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (371,
               '.pot',
               'application/vnd.ms-powerpoint',
               to_date ('06/13/2011 07:47:32',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (372,
               '.pov',
               'model/x-pov',
               to_date ('06/13/2011 07:47:32',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (373,
               '.ppa',
               'application/vnd.ms-powerpoint',
               to_date ('06/13/2011 07:47:32',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (374,
          1,
          '.ppm',
          'image/x-portable-pixmap',
          to_date ('06/13/2011 07:47:32',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (375,
               '.pps',
               'application/mspowerpoint',
               to_date ('06/13/2011 07:47:32',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (376,
               '.pps',
               'application/vnd.ms-powerpoint',
               to_date ('06/13/2011 07:47:33',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (377,
               '.ppt',
               'application/mspowerpoint',
               to_date ('06/13/2011 07:47:33',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (378,
               '.ppt',
               'application/powerpoint',
               to_date ('06/13/2011 07:47:33',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (379,
               '.ppt',
               'application/vnd.ms-powerpoint',
               to_date ('06/13/2011 07:47:33',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (380,
               '.ppt',
               'application/x-mspowerpoint',
               to_date ('06/13/2011 07:47:33',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (381,
               '.ppz',
               'application/mspowerpoint',
               to_date ('06/13/2011 07:47:33',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (382,
               '.pre',
               'application/x-freelance',
               to_date ('06/13/2011 07:47:33',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (383,
               '.prt',
               'application/pro_eng',
               to_date ('06/13/2011 07:47:34',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (384,
               '.ps',
               'application/postscript',
               to_date ('06/13/2011 07:47:34',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (385,
               '.psd',
               'application/octet-stream',
               to_date ('06/13/2011 07:47:34',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (386,
               '.pvu',
               'paleovu/x-pv',
               to_date ('06/13/2011 07:47:34',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (387,
               '.pwz',
               'application/vnd.ms-powerpoint',
               to_date ('06/13/2011 07:47:34',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (388,
               '.py',
               'text/x-script.phyton',
               to_date ('06/13/2011 07:47:34',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (389,
               '.pyc',
               'applicaiton/x-bytecode.python',
               to_date ('06/13/2011 07:47:35',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (390,
          22,
          '.qcp',
          'audio/vnd.qcelp',
          to_date ('06/13/2011 07:47:35',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (391,
               '.qd3',
               'x-world/x-3dmf',
               to_date ('06/13/2011 07:47:35',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (392,
               '.qd3d',
               'x-world/x-3dmf',
               to_date ('06/13/2011 07:47:35',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (393,
          1,
          '.qif',
          'image/x-quicktime',
          to_date ('06/13/2011 07:47:35',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (394,
          5,
          '.qt',
          'video/quicktime',
          to_date ('06/13/2011 07:47:35',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (395,
          5,
          '.qtc',
          'video/x-qtc',
          to_date ('06/13/2011 07:47:35',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (396,
          1,
          '.qti',
          'image/x-quicktime',
          to_date ('06/13/2011 07:47:36',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (397,
          1,
          '.qtif',
          'image/x-quicktime',
          to_date ('06/13/2011 07:47:36',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (398,
          22,
          '.ra',
          'audio/x-pn-realaudio',
          to_date ('06/13/2011 07:47:36',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (399,
          22,
          '.ra',
          'audio/x-pn-realaudio-plugin',
          to_date ('06/13/2011 07:47:36',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc,
                           ref_type_fichr,
                           ext,
                           mime_type,
                           date_creat,
                           utils_creat,
                           date_modfc,
                           utils_modfc,
                           ordre_choix)
values   (400,
          22,
          '.ra',
          'audio/x-realaudio',
          to_date ('06/13/2011 07:47:36',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101',
          1);

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (401,
          22,
          '.ram',
          'audio/x-pn-realaudio',
          to_date ('06/13/2011 07:47:36',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (402,
               '.ras',
               'application/x-cmu-raster',
               to_date ('06/13/2011 07:47:37',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (403,
          1,
          '.ras',
          'image/cmu-raster',
          to_date ('06/13/2011 07:47:37',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc,
                           ref_type_fichr,
                           ext,
                           mime_type,
                           date_creat,
                           utils_creat,
                           date_modfc,
                           utils_modfc,
                           ordre_choix)
values   (404,
          1,
          '.ras',
          'image/x-cmu-raster',
          to_date ('06/13/2011 07:47:37',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101',
          1);

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (405,
          1,
          '.rast',
          'image/cmu-raster',
          to_date ('06/13/2011 07:47:37',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (406,
               '.rexx',
               'text/x-script.rexx',
               to_date ('06/13/2011 07:47:37',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (407,
          1,
          '.rf',
          'image/vnd.rn-realflash',
          to_date ('06/13/2011 07:47:37',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (408,
          1,
          '.rgb',
          'image/x-rgb',
          to_date ('06/13/2011 07:47:38',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (409,
               '.rm',
               'application/vnd.rn-realmedia',
               to_date ('06/13/2011 07:47:38',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (410,
          22,
          '.rm',
          'audio/x-pn-realaudio',
          to_date ('06/13/2011 07:47:38',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (411,
          22,
          '.rmi',
          'audio/mid',
          to_date ('06/13/2011 07:47:38',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (412,
          22,
          '.rmm',
          'audio/x-pn-realaudio',
          to_date ('06/13/2011 07:47:38',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (413,
          22,
          '.rmp',
          'audio/x-pn-realaudio',
          to_date ('06/13/2011 07:47:38',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc,
                           ref_type_fichr,
                           ext,
                           mime_type,
                           date_creat,
                           utils_creat,
                           date_modfc,
                           utils_modfc,
                           ordre_choix)
values   (414,
          22,
          '.rmp',
          'audio/x-pn-realaudio-plugin',
          to_date ('06/13/2011 07:47:38',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101',
          1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (415,
               '.rng',
               'application/ringing-tones',
               to_date ('06/13/2011 07:47:39',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (416,
               '.rng',
               'application/vnd.nokia.ringing-tone',
               to_date ('06/13/2011 07:47:39',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (417,
               '.rnx',
               'application/vnd.rn-realplayer',
               to_date ('06/13/2011 07:47:39',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (418,
               '.roff',
               'application/x-troff',
               to_date ('06/13/2011 07:47:39',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (419,
          1,
          '.rp',
          'image/vnd.rn-realpix',
          to_date ('06/13/2011 07:47:39',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (420,
          22,
          '.rpm',
          'audio/x-pn-realaudio-plugin',
          to_date ('06/13/2011 07:47:39',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (421,
               '.rt',
               'text/richtext',
               to_date ('06/13/2011 07:47:40',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (422,
               '.rt',
               'text/vnd.rn-realtext',
               to_date ('06/13/2011 07:47:40',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (423,
               '.rtf',
               'application/rtf',
               to_date ('06/13/2011 07:47:40',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (424,
               '.rtf',
               'application/x-rtf',
               to_date ('06/13/2011 07:47:40',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (425,
               '.rtf',
               'text/richtext',
               to_date ('06/13/2011 07:47:40',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (426,
               '.rtx',
               'application/rtf',
               to_date ('06/13/2011 07:47:40',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (427,
               '.rtx',
               'text/richtext',
               to_date ('06/13/2011 07:47:41',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (428,
          5,
          '.rv',
          'video/vnd.rn-realvideo',
          to_date ('06/13/2011 07:47:41',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (429,
               '.s',
               'text/x-asm',
               to_date ('06/13/2011 07:47:41',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (430,
          22,
          '.s3m',
          'audio/s3m',
          to_date ('06/13/2011 07:47:41',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:14',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (431,
               '.saveme',
               'application/octet-stream',
               to_date ('06/13/2011 07:47:41',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:14',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (547,
               '.vrml',
               'x-world/x-vrml',
               to_date ('06/13/2011 07:48:00',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:15',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (548,
               '.vrt',
               'x-world/x-vrt',
               to_date ('06/13/2011 07:48:00',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:15',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (549,
               '.vsd',
               'application/x-visio',
               to_date ('06/13/2011 07:48:00',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:15',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (550,
               '.vst',
               'application/x-visio',
               to_date ('06/13/2011 07:48:01',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:15',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (551,
               '.vsw',
               'application/x-visio',
               to_date ('06/13/2011 07:48:01',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:15',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (552,
               '.w60',
               'application/wordperfect6.0',
               to_date ('06/13/2011 07:48:01',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:15',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (553,
               '.w61',
               'application/wordperfect6.1',
               to_date ('06/13/2011 07:48:01',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:15',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (554,
          2,
          '.w6w',
          'application/msword',
          to_date ('06/13/2011 07:48:01',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:15',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (555,
          22,
          '.wav',
          'audio/wav',
          to_date ('06/13/2011 07:48:02',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:15',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc,
                           ref_type_fichr,
                           ext,
                           mime_type,
                           date_creat,
                           utils_creat,
                           date_modfc,
                           utils_modfc,
                           ordre_choix)
values   (556,
          22,
          '.wav',
          'audio/x-wav',
          to_date ('06/13/2011 07:48:02',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:15',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101',
          1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (557,
               '.wb1',
               'application/x-qpro',
               to_date ('06/13/2011 07:48:02',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:15',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (558,
          1,
          '.wbmp',
          'image/vnd.wap.wbmp',
          to_date ('06/13/2011 07:48:02',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:15',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (559,
               '.web',
               'application/vnd.xara',
               to_date ('06/13/2011 07:48:02',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:15',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (560,
          2,
          '.wiz',
          'application/msword',
          to_date ('06/13/2011 07:48:02',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:15',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (561,
               '.wk1',
               'application/x-123',
               to_date ('06/13/2011 07:48:03',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:15',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (562,
               '.wmf',
               'windows/metafile',
               to_date ('06/13/2011 07:48:03',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:15',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (563,
               '.wml',
               'text/vnd.wap.wml',
               to_date ('06/13/2011 07:48:03',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:15',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (564,
               '.wmlc',
               'application/vnd.wap.wmlc',
               to_date ('06/13/2011 07:48:03',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:15',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (565,
               '.wmls',
               'text/vnd.wap.wmlscript',
               to_date ('06/13/2011 07:48:03',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:15',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (566,
               '.wmlsc',
               'application/vnd.wap.wmlscriptc',
               to_date ('06/13/2011 07:48:03',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:15',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (567,
          2,
          '.word',
          'application/msword',
          to_date ('06/13/2011 07:48:04',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:15',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (568,
               '.wp',
               'application/wordperfect',
               to_date ('06/13/2011 07:48:04',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:15',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (569,
               '.wp5',
               'application/wordperfect',
               to_date ('06/13/2011 07:48:04',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:15',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (570,
               '.wp5',
               'application/wordperfect6.0',
               to_date ('06/13/2011 07:48:04',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:15',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (571,
               '.wp6',
               'application/wordperfect',
               to_date ('06/13/2011 07:48:04',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:15',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (572,
               '.wpd',
               'application/wordperfect',
               to_date ('06/13/2011 07:48:04',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:15',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (573,
               '.wpd',
               'application/x-wpwin',
               to_date ('06/13/2011 07:48:04',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:15',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (574,
               '.wq1',
               'application/x-lotus',
               to_date ('06/13/2011 07:48:05',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:15',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (575,
               '.wri',
               'application/mswrite',
               to_date ('06/13/2011 07:48:05',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:15',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (576,
               '.wri',
               'application/x-wri',
               to_date ('06/13/2011 07:48:05',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:15',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (577,
               '.wrl',
               'application/x-world',
               to_date ('06/13/2011 07:48:05',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:15',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (578,
               '.wrl',
               'model/vrml',
               to_date ('06/13/2011 07:48:05',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:15',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (579,
               '.wrl',
               'x-world/x-vrml',
               to_date ('06/13/2011 07:48:05',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:15',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (580,
               '.wrz',
               'model/vrml',
               to_date ('06/13/2011 07:48:06',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:15',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc, ordre_choix)
     values   (581,
               '.wrz',
               'x-world/x-vrml',
               to_date ('06/13/2011 07:48:06',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:15',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101',
               1);

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (582,
               '.wsc',
               'text/scriplet',
               to_date ('06/13/2011 07:48:06',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:15',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (583,
               '.wsrc',
               'application/x-wais-source',
               to_date ('06/13/2011 07:48:06',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:15',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (584,
               '.wtk',
               'application/x-wintalk',
               to_date ('06/13/2011 07:48:06',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:15',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (585,
          1,
          '.xbm',
          'image/x-xbitmap',
          to_date ('06/13/2011 07:48:06',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:15',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (586,
          1,
          '.xbm',
          'image/x-xbm',
          to_date ('06/13/2011 07:48:06',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:15',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc,
                           ref_type_fichr,
                           ext,
                           mime_type,
                           date_creat,
                           utils_creat,
                           date_modfc,
                           utils_modfc,
                           ordre_choix)
values   (587,
          1,
          '.xbm',
          'image/xbm',
          to_date ('06/13/2011 07:48:07',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:15',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101',
          1);

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (588,
          5,
          '.xdr',
          'video/x-amt-demorun',
          to_date ('06/13/2011 07:48:07',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:15',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert into   sie_13_mime_type (seqnc, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
     values   (589,
               '.xgz',
               'xgl/drawing',
               to_date ('06/13/2011 07:48:07',
                        'MM/DD/YYYY HH24:MI:SS'),
               'SYSTEM',
               to_date ('07/29/2013 11:59:15',
                        'MM/DD/YYYY HH24:MI:SS'),
               'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (590,
          1,
          '.xif',
          'image/vnd.xiff',
          to_date ('06/13/2011 07:48:07',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:15',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (591,
          21,
          '.xl',
          'application/excel',
          to_date ('06/13/2011 07:48:07',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:15',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (592,
          21,
          '.xla',
          'application/excel',
          to_date ('06/13/2011 07:48:07',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:15',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (593,
          21,
          '.xla',
          'application/x-excel',
          to_date ('06/13/2011 07:48:08',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:15',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc,
                           ref_type_fichr,
                           ext,
                           mime_type,
                           date_creat,
                           utils_creat,
                           date_modfc,
                           utils_modfc,
                           ordre_choix)
values   (594,
          21,
          '.xla',
          'application/x-msexcel',
          to_date ('06/13/2011 07:48:08',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:15',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101',
          1);

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (595,
          21,
          '.xlb',
          'application/excel',
          to_date ('06/13/2011 07:48:08',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:15',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (596,
          21,
          '.xlb',
          'application/vnd.ms-excel',
          to_date ('06/13/2011 07:48:08',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:15',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc,
                           ref_type_fichr,
                           ext,
                           mime_type,
                           date_creat,
                           utils_creat,
                           date_modfc,
                           utils_modfc,
                           ordre_choix)
values   (597,
          21,
          '.xlb',
          'application/x-excel',
          to_date ('06/13/2011 07:48:08',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:15',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101',
          1);

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (598,
          21,
          '.xlc',
          'application/excel',
          to_date ('06/13/2011 07:48:08',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:15',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (599,
          21,
          '.xlc',
          'application/vnd.ms-excel',
          to_date ('06/13/2011 07:48:09',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:15',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc,
                           ref_type_fichr,
                           ext,
                           mime_type,
                           date_creat,
                           utils_creat,
                           date_modfc,
                           utils_modfc,
                           ordre_choix)
values   (600,
          21,
          '.xlc',
          'application/x-excel',
          to_date ('06/13/2011 07:48:09',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:15',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101',
          1);

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (601,
          21,
          '.xld',
          'application/excel',
          to_date ('06/13/2011 07:48:09',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:15',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc,
                           ref_type_fichr,
                           ext,
                           mime_type,
                           date_creat,
                           utils_creat,
                           date_modfc,
                           utils_modfc,
                           ordre_choix)
values   (602,
          21,
          '.xld',
          'application/x-excel',
          to_date ('06/13/2011 07:48:09',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:15',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101',
          1);

insert
  into   sie_13_mime_type (seqnc,
                           ref_type_fichr,
                           ext,
                           mime_type,
                           date_creat,
                           utils_creat,
                           date_modfc,
                           utils_modfc,
                           ordre_choix)
values   (603,
          21,
          '.xlk',
          'application/excel',
          to_date ('06/13/2011 07:48:09',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:15',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101',
          1);

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (604,
          21,
          '.xlk',
          'application/x-excel',
          to_date ('06/13/2011 07:48:09',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:15',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc,
                           ref_type_fichr,
                           ext,
                           mime_type,
                           date_creat,
                           utils_creat,
                           date_modfc,
                           utils_modfc,
                           ordre_choix)
values   (605,
          21,
          '.xll',
          'application/excel',
          to_date ('06/13/2011 07:48:09',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:15',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101',
          1);

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (606,
          21,
          '.xll',
          'application/vnd.ms-excel',
          to_date ('06/13/2011 07:48:10',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:15',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (607,
          21,
          '.xll',
          'application/x-excel',
          to_date ('06/13/2011 07:48:10',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:15',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (608,
          21,
          '.xlm',
          'application/excel',
          to_date ('06/13/2011 07:48:10',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:15',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc,
                           ref_type_fichr,
                           ext,
                           mime_type,
                           date_creat,
                           utils_creat,
                           date_modfc,
                           utils_modfc,
                           ordre_choix)
values   (609,
          21,
          '.xlm',
          'application/vnd.ms-excel',
          to_date ('06/13/2011 07:48:10',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:15',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101',
          1);

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (610,
          21,
          '.xlm',
          'application/x-excel',
          to_date ('06/13/2011 07:48:10',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:15',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (611,
          21,
          '.xls',
          'application/excel',
          to_date ('06/13/2011 07:48:10',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:15',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc,
                           ref_type_fichr,
                           ext,
                           mime_type,
                           date_creat,
                           utils_creat,
                           date_modfc,
                           utils_modfc,
                           ordre_choix)
values   (613,
          21,
          '.xls',
          'application/x-excel',
          to_date ('06/13/2011 07:48:11',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:15',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101',
          1);

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (661,
          21,
          '.xlsx',
          'application/octet-stream',
          to_date ('06/13/2011 07:48:11',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:15',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (701,
          4,
          '.rar',
          'application/x-compressed',
          to_date ('06/13/2011 07:48:11',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:15',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (702,
          23,
          '.sql',
          'text/plain',
          to_date ('06/13/2011 07:48:11',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:15',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (681,
          2,
          '.docx',
          'application/octet-stream',
          to_date ('06/13/2011 07:48:11',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:15',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert
  into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat, date_modfc, utils_modfc)
values   (683,
          21,
          '.xls',
          'application/vnd.ms-excel',
          to_date ('06/13/2011 07:48:11',
                   'MM/DD/YYYY HH24:MI:SS'),
          'SYSTEM',
          to_date ('07/29/2013 11:59:15',
                   'MM/DD/YYYY HH24:MI:SS'),
          'AFW_040101');

insert into   sie_13_mime_type (seqnc, ref_type_fichr, ext, mime_type, date_creat, utils_creat)
     values   (721,
               21,
               '.csv',
               'text/csv',
               to_date ('08/29/2013 12:31:09',
                        'MM/DD/YYYY HH24:MI:SS'),
               'WATFR');
end;
/

commit;