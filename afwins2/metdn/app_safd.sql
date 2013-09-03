--Méta
set define off
set serveroutput on
set feedback off

alter session set current_schema = afw_040200;


begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut - Initialisation - Application - SAFD');
  sie$migrt$pkg.var_aplic(11) := sie_11_aplic_pkg.maj_aplic ('SAFD','SIE APEX Framework - Domaine',1000004, sie$migrt$pkg.vnu_seqnc_prodt);

  sie_13_page_pkg.maj_table_a_partr_refrt_apex(sie$migrt$pkg.var_aplic(11),'O');
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin - Initialisation - Application - SAFD');
end;
/


--Debut - sie_11_versn
begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut - sie_11_versn');
delete from tc$11$versn;

insert into tc$11$versn (code, dnr_ref_aplic, dnr_ref_prodt, indic_docmn_verl, nom, numr_versn_1, numr_versn_2, numr_versn_3, numr_versn_4, ref_aplic, ref_plugn, ref_prodt, seqnc) values ('0100', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), null, 'O', null, 0, 1, 0, 0, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), null, null, 863);

merge into sie_11_versn t
                        using tc$11$versn tf
               on ((t.code = tf.code) and (t.ref_aplic = tf.ref_aplic or (t.ref_aplic is null and tf.ref_aplic is null) or tf.ref_aplic is null ) and (t.ref_plugn = tf.ref_plugn or (t.ref_plugn is null and tf.ref_plugn is null) or tf.ref_plugn is null ) and (t.ref_prodt = tf.ref_prodt or (t.ref_prodt is null and tf.ref_prodt is null) or tf.ref_prodt is null ))
when not matched then
              insert (t.code, t.dnr_ref_aplic, t.dnr_ref_prodt, t.indic_docmn_verl, t.nom, t.numr_versn_1, t.numr_versn_2, t.numr_versn_3, t.numr_versn_4, t.ref_aplic, t.ref_plugn, t.ref_prodt)
              values (tf.code, tf.dnr_ref_aplic, tf.dnr_ref_prodt, tf.indic_docmn_verl, tf.nom, tf.numr_versn_1, tf.numr_versn_2, tf.numr_versn_3, tf.numr_versn_4, tf.ref_aplic, tf.ref_plugn, tf.ref_prodt)
when matched then
              update set t.dnr_ref_aplic = tf.dnr_ref_aplic, t.dnr_ref_prodt = tf.dnr_ref_prodt, t.indic_docmn_verl = tf.indic_docmn_verl, t.nom = tf.nom, t.numr_versn_1 = tf.numr_versn_1, t.numr_versn_2 = tf.numr_versn_2, t.numr_versn_3 = tf.numr_versn_3, t.numr_versn_4 = tf.numr_versn_4
log errors into em$11_versn
reject limit unlimited
;

declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$11_versn;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Merge sur sie_11_versn');
  end if;
end;

select seqnc into sie$migrt$pkg.var_versn(863) from sie_11_versn where code = '0100' and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select') and ref_plugn is null and ref_prodt is null;
--Fin - sie_11_versn
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin - sie_11_versn');
end;
/

--Debut - sie_13_page
begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut - sie_13_page');
delete from tc$13$page;

insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:24:36', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'File d''attente', 20020, null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 12063);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:24:36', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mettre à jour un courriel', 20030, null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 12064);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:24:36', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Créer un élément de configuration d''événement notifiable', 34830, null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 11483);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:24:36', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Créer un destinataire de configuration d''événement notifiable', 34840, null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 11963);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:24:35', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'O', 'O', 'N', 'N', 'N', 'N', 'N', 'Commentaire', 102, null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 11385);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:24:35', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mettre à jour modèle de message de notification', 34310, null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 11424);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:24:35', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des événements notifiables', 34200, null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 11443);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:24:35', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mettre à jour un événement notifiable', 34810, null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 11444);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:24:36', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des événements notifiables', 34800, null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 11445);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:24:36', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mettre à jour une configuration', 34820, null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 11446);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:24:36', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Modèle de recherche', 19020, null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 11544);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:24:36', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mettre à jour un modèle de recherche', 19030, null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 11545);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:24:36', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Application du modèle de recherche', 19040, null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 11564);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:24:36', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Détail de l''application du modèle de recherche', 19041, null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 11583);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:24:36', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Lier un utilisateur au domaine', 12011, null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 52163);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:24:36', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des courriels', 35020, null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 52323);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:24:35', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des utilisateurs', 12010, null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 10763);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:24:35', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mettre à jour les membres', 12181, null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 10764);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:24:35', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des comptes de télécopie', 34700, null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 10765);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:24:35', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste de valeurs interactive - Applications', 30010, null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 10766);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:24:35', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des types de structure', 12326, null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 10767);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:24:35', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mettre à jour un destinataire', 34210, null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 10769);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:24:35', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des comptes de notification sms', 34600, null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 10770);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:24:35', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des domaines', 12200, null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 10771);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:24:35', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mettre à jour un modèle de communication', 34500, null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 10772);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:24:35', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste de valeurs interactive - Messages', 30040, null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 10773);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:24:35', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Modifier le mot de passe', 12030, null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 10774);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:24:35', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mettre à jour un compte de notification sms', 34610, null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 10775);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:24:35', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste de valeurs interactive - Items de pages', 30030, null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 10776);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:24:35', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mettre à jour un compte de télécopie', 34710, null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 10777);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:24:35', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Page commune', 0, null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 10778);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:24:35', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Historique des accès', 12021, null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 10779);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:24:35', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste de valeurs interactive - Pages Popup IR LOV', 30050, null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 10780);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:24:35', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mettre à jour un profil de courriel', 20010, null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 10781);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:24:35', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mettre à jour un utilisateur', 12020, null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 10782);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:24:35', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Créer et mettre à jour les autorisations', 13053, null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 10783);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:24:35', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des classes d''intervention', 21000, null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 10784);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:24:35', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des structures administratives', 12141, null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 10785);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:24:35', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des groupes utilisateur', 12121, null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 10786);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:24:35', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mettre à jour un type de structure', 12336, null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 10787);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:24:35', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste de valeurs interactive - Pages', 30020, null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 10788);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:24:35', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mettre à jour un modèle de notification', 34100, null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 10789);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:24:35', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des modèles de notification', 34000, null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 10790);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:24:35', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Tableau de board', 1, null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 10791);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:24:35', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mettre à jour un domaine', 12210, null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 10792);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:24:35', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mettre à jour une classe d''intervention', 21010, null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 10793);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:24:35', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des modèles de communication', 34400, null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 10794);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:24:35', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des profils de courriels', 20000, null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 10796);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:24:35', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mettre à jour une structure administrative', 12151, null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 10797);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:24:35', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mettre à jour un groupe utilisateur', 12131, null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 10798);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:24:35', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des destinataires', 34211, null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 10799);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:24:35', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Page de connexion', 101, null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 10808);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:24:36', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Opérations', 12220, null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 53503);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:24:35', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des modèles de message de notification', 34300, null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 11423);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:24:36', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des requêtes d''intervention', 34900, null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 12083);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:24:36', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Format de réponse', 35011, null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 52125);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:24:36', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des formats de réponse', 35010, null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 52123);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:24:36', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des fonctionnalités', 35041, null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 53483);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:24:36', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Modifier une fonctionnalité', 35042, null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 53484);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-06-03 18:24:36', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des produits', 35031, null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 53463);

merge into sie_13_page t
                        using tc$13$page tf
               on ((t.numr_apex = tf.numr_apex) and (t.ref_aplic = tf.ref_aplic or (t.ref_aplic is null and tf.ref_aplic is null) or tf.ref_aplic is null ))
when not matched then
              insert (t.date_dernr_maj_refrn_apex, t.descr, t.dnr_ref_aplic, t.indic_prise_charg_sie01, t.indic_prise_charg_sie04, t.indic_prise_charg_sie13_confr, t.indic_prise_charg_sie13_navgt, t.indic_prise_charg_sie14_popup, t.indic_prise_charg_sie18, t.indic_prise_charg_sie19, t.nom, t.numr_apex, t.prefx_mesg, t.ref_aplic)
              values (tf.date_dernr_maj_refrn_apex, tf.descr, tf.dnr_ref_aplic, tf.indic_prise_charg_sie01, tf.indic_prise_charg_sie04, tf.indic_prise_charg_sie13_confr, tf.indic_prise_charg_sie13_navgt, tf.indic_prise_charg_sie14_popup, tf.indic_prise_charg_sie18, tf.indic_prise_charg_sie19, tf.nom, tf.numr_apex, tf.prefx_mesg, tf.ref_aplic)
when matched then
              update set t.date_dernr_maj_refrn_apex = tf.date_dernr_maj_refrn_apex, t.descr = tf.descr, t.dnr_ref_aplic = tf.dnr_ref_aplic, t.indic_prise_charg_sie01 = tf.indic_prise_charg_sie01, t.indic_prise_charg_sie04 = tf.indic_prise_charg_sie04, t.indic_prise_charg_sie13_confr = tf.indic_prise_charg_sie13_confr, t.indic_prise_charg_sie13_navgt = tf.indic_prise_charg_sie13_navgt, t.indic_prise_charg_sie14_popup = tf.indic_prise_charg_sie14_popup, t.indic_prise_charg_sie18 = tf.indic_prise_charg_sie18, t.indic_prise_charg_sie19 = tf.indic_prise_charg_sie19, t.nom = tf.nom, t.prefx_mesg = tf.prefx_mesg
log errors into em$13_page
reject limit unlimited
;

declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_page;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Merge sur sie_13_page');
  end if;
end;

select seqnc into sie$migrt$pkg.var_page(12063) from sie_13_page where numr_apex = 20020 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
select seqnc into sie$migrt$pkg.var_page(12064) from sie_13_page where numr_apex = 20030 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
select seqnc into sie$migrt$pkg.var_page(11483) from sie_13_page where numr_apex = 34830 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
select seqnc into sie$migrt$pkg.var_page(11963) from sie_13_page where numr_apex = 34840 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
select seqnc into sie$migrt$pkg.var_page(11385) from sie_13_page where numr_apex = 102 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
select seqnc into sie$migrt$pkg.var_page(11424) from sie_13_page where numr_apex = 34310 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
select seqnc into sie$migrt$pkg.var_page(11443) from sie_13_page where numr_apex = 34200 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
select seqnc into sie$migrt$pkg.var_page(11444) from sie_13_page where numr_apex = 34810 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
select seqnc into sie$migrt$pkg.var_page(11445) from sie_13_page where numr_apex = 34800 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
select seqnc into sie$migrt$pkg.var_page(11446) from sie_13_page where numr_apex = 34820 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
select seqnc into sie$migrt$pkg.var_page(11544) from sie_13_page where numr_apex = 19020 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
select seqnc into sie$migrt$pkg.var_page(11545) from sie_13_page where numr_apex = 19030 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
select seqnc into sie$migrt$pkg.var_page(11564) from sie_13_page where numr_apex = 19040 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
select seqnc into sie$migrt$pkg.var_page(11583) from sie_13_page where numr_apex = 19041 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
select seqnc into sie$migrt$pkg.var_page(52163) from sie_13_page where numr_apex = 12011 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
select seqnc into sie$migrt$pkg.var_page(52323) from sie_13_page where numr_apex = 35020 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
select seqnc into sie$migrt$pkg.var_page(10763) from sie_13_page where numr_apex = 12010 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
select seqnc into sie$migrt$pkg.var_page(10764) from sie_13_page where numr_apex = 12181 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
select seqnc into sie$migrt$pkg.var_page(10765) from sie_13_page where numr_apex = 34700 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
select seqnc into sie$migrt$pkg.var_page(10766) from sie_13_page where numr_apex = 30010 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
select seqnc into sie$migrt$pkg.var_page(10767) from sie_13_page where numr_apex = 12326 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
select seqnc into sie$migrt$pkg.var_page(10769) from sie_13_page where numr_apex = 34210 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
select seqnc into sie$migrt$pkg.var_page(10770) from sie_13_page where numr_apex = 34600 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
select seqnc into sie$migrt$pkg.var_page(10771) from sie_13_page where numr_apex = 12200 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
select seqnc into sie$migrt$pkg.var_page(10772) from sie_13_page where numr_apex = 34500 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
select seqnc into sie$migrt$pkg.var_page(10773) from sie_13_page where numr_apex = 30040 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
select seqnc into sie$migrt$pkg.var_page(10774) from sie_13_page where numr_apex = 12030 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
select seqnc into sie$migrt$pkg.var_page(10775) from sie_13_page where numr_apex = 34610 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
select seqnc into sie$migrt$pkg.var_page(10776) from sie_13_page where numr_apex = 30030 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
select seqnc into sie$migrt$pkg.var_page(10777) from sie_13_page where numr_apex = 34710 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
select seqnc into sie$migrt$pkg.var_page(10778) from sie_13_page where numr_apex = 0 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
select seqnc into sie$migrt$pkg.var_page(10779) from sie_13_page where numr_apex = 12021 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
select seqnc into sie$migrt$pkg.var_page(10780) from sie_13_page where numr_apex = 30050 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
select seqnc into sie$migrt$pkg.var_page(10781) from sie_13_page where numr_apex = 20010 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
select seqnc into sie$migrt$pkg.var_page(10782) from sie_13_page where numr_apex = 12020 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
select seqnc into sie$migrt$pkg.var_page(10783) from sie_13_page where numr_apex = 13053 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
select seqnc into sie$migrt$pkg.var_page(10784) from sie_13_page where numr_apex = 21000 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
select seqnc into sie$migrt$pkg.var_page(10785) from sie_13_page where numr_apex = 12141 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
select seqnc into sie$migrt$pkg.var_page(10786) from sie_13_page where numr_apex = 12121 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
select seqnc into sie$migrt$pkg.var_page(10787) from sie_13_page where numr_apex = 12336 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
select seqnc into sie$migrt$pkg.var_page(10788) from sie_13_page where numr_apex = 30020 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
select seqnc into sie$migrt$pkg.var_page(10789) from sie_13_page where numr_apex = 34100 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
select seqnc into sie$migrt$pkg.var_page(10790) from sie_13_page where numr_apex = 34000 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
select seqnc into sie$migrt$pkg.var_page(10791) from sie_13_page where numr_apex = 1 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
select seqnc into sie$migrt$pkg.var_page(10792) from sie_13_page where numr_apex = 12210 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
select seqnc into sie$migrt$pkg.var_page(10793) from sie_13_page where numr_apex = 21010 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
select seqnc into sie$migrt$pkg.var_page(10794) from sie_13_page where numr_apex = 34400 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
select seqnc into sie$migrt$pkg.var_page(10796) from sie_13_page where numr_apex = 20000 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
select seqnc into sie$migrt$pkg.var_page(10797) from sie_13_page where numr_apex = 12151 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
select seqnc into sie$migrt$pkg.var_page(10798) from sie_13_page where numr_apex = 12131 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
select seqnc into sie$migrt$pkg.var_page(10799) from sie_13_page where numr_apex = 34211 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
select seqnc into sie$migrt$pkg.var_page(10808) from sie_13_page where numr_apex = 101 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
select seqnc into sie$migrt$pkg.var_page(53503) from sie_13_page where numr_apex = 12220 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
select seqnc into sie$migrt$pkg.var_page(11423) from sie_13_page where numr_apex = 34300 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
select seqnc into sie$migrt$pkg.var_page(12083) from sie_13_page where numr_apex = 34900 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
select seqnc into sie$migrt$pkg.var_page(52125) from sie_13_page where numr_apex = 35011 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
select seqnc into sie$migrt$pkg.var_page(52123) from sie_13_page where numr_apex = 35010 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
select seqnc into sie$migrt$pkg.var_page(53483) from sie_13_page where numr_apex = 35041 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
select seqnc into sie$migrt$pkg.var_page(53484) from sie_13_page where numr_apex = 35042 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
select seqnc into sie$migrt$pkg.var_page(53463) from sie_13_page where numr_apex = 35031 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
--Fin - sie_13_page
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin - sie_13_page');
end;
/

--Debut - sie_13_page_lang
begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut - sie_13_page_lang');
delete from tc$13$page$lang;

insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'Opération domaine', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(53503, 'Insert'), 50544);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'Feedback', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(11385, 'Insert'), 8726);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'Modèle de recherche', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(11545, 'Insert'), 8886);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'Détail de l''application du modèle de recherche', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(11583, 'Insert'), 8924);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'Modèle de message de notification', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(11424, 'Insert'), 8765);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'Modèle de recherche', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(11544, 'Insert'), 8885);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'Modèles de message de notification', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(11423, 'Insert'), 8764);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'Événements notifiables', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(11445, 'Insert'), 8784);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'Événement notifiable', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(11444, 'Insert'), 8785);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'Événements notifiables', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(11443, 'Insert'), 8786);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'Configuration', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(11446, 'Insert'), 8787);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'Créer un élément', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(11483, 'Insert'), 8824);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'Application du modèle de recherche', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(11564, 'Insert'), 8905);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'Destinataires', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(10799, 'Insert'), 8084);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'Groupe utilisateur', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(10798, 'Insert'), 8085);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'Structure administrative', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(10797, 'Insert'), 8086);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'Profils de courriels', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(10796, 'Insert'), 8087);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'Modèles de communication', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(10794, 'Insert'), 8089);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'Classe d''intervention', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(10793, 'Insert'), 8090);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'Domaine', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(10792, 'Insert'), 8091);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'Accueil Domaine', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(10791, 'Insert'), 8092);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'Modèles de notifiation', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(10790, 'Insert'), 8093);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'Modèle de notification', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(10789, 'Insert'), 8094);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'Liste de valeurs interactive - Pages', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(10788, 'Insert'), 8095);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'Type de structure', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(10787, 'Insert'), 8096);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'Groupes utilisateur', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(10786, 'Insert'), 8097);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'Structures administratives', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(10785, 'Insert'), 8098);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'Classes d''intervention', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(10784, 'Insert'), 8099);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'Créer et mettre à jour les autorisations', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(10783, 'Insert'), 8100);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'Utilisateur', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(10782, 'Insert'), 8101);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'Profil de courriel', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(10781, 'Insert'), 8102);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'Liste de valeurs interactive - Pages Popup IR LOV', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(10780, 'Insert'), 8103);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'Historique des accès', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(10779, 'Insert'), 8104);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'Page commune', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(10778, 'Insert'), 8105);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'Compte de télécopie', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(10777, 'Insert'), 8106);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'Liste de valeurs interactive - Items de pages', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(10776, 'Insert'), 8107);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'Compte de notification SMS', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(10775, 'Insert'), 8108);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'Gérer le mot de passe', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(10774, 'Insert'), 8109);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'Liste de valeurs interactive - Messages', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(10773, 'Insert'), 8110);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'Modèle de communication', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(10772, 'Insert'), 8111);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'Domaines', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(10771, 'Insert'), 8112);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'Comptes de notification sms', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(10770, 'Insert'), 8113);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'Destinataire', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(10769, 'Insert'), 8114);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'Types de structure', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(10767, 'Insert'), 8116);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'Liste de valeurs interactive - Applications', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(10766, 'Insert'), 8117);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'Comptes de télécopie', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(10765, 'Insert'), 8118);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'Mettre à jour les membres', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(10764, 'Insert'), 8119);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'Utilisateurs', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(10763, 'Insert'), 8120);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'Page de connexion', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(10808, 'Insert'), 8129);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'File d''attente', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(12063, 'Insert'), 9404);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'Courriel', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(12064, 'Insert'), 9405);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'Créer un destinataire', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(11963, 'Insert'), 9304);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'Requêtes d''intervention', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(12083, 'Insert'), 9424);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'Liste des produits', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(53463, 'Insert'), 50504);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'Format de réponse', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(52125, 'Insert'), 49166);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'Lier un utilisateur au domaine', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(52163, 'Insert'), 49204);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'Formats de réponse', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(52123, 'Insert'), 49164);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'Courriels', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(52323, 'Insert'), 49364);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'Modifier une fonctionnalité', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(53484, 'Insert'), 50524);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'Liste des fonctionnalités', sie$migrt$pkg.obten_var_lang(1, 'Insert'), sie$migrt$pkg.obten_var_page(53483, 'Insert'), 50525);

merge into sie_13_page_lang t
                        using tc$13$page$lang tf
               on ((t.ref_lang = tf.ref_lang or (t.ref_lang is null and tf.ref_lang is null) or tf.ref_lang is null ) and (t.ref_page = tf.ref_page or (t.ref_page is null and tf.ref_page is null) or tf.ref_page is null ))
when not matched then
              insert (t.dnr_ref_aplic, t.nom, t.ref_lang, t.ref_page)
              values (tf.dnr_ref_aplic, tf.nom, tf.ref_lang, tf.ref_page)
when matched then
              update set t.dnr_ref_aplic = tf.dnr_ref_aplic, t.nom = tf.nom
log errors into em$13_page_lang
reject limit unlimited
;

declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_page_lang;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Merge sur sie_13_page_lang');
  end if;
end;

select seqnc into sie$migrt$pkg.var_page_lang(50544) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(53503, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(8726) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(11385, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(8886) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(11545, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(8924) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(11583, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(8765) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(11424, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(8885) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(11544, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(8764) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(11423, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(8784) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(11445, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(8785) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(11444, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(8786) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(11443, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(8787) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(11446, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(8824) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(11483, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(8905) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(11564, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(8084) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(10799, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(8085) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(10798, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(8086) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(10797, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(8087) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(10796, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(8089) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(10794, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(8090) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(10793, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(8091) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(10792, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(8092) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(10791, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(8093) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(10790, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(8094) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(10789, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(8095) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(10788, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(8096) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(10787, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(8097) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(10786, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(8098) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(10785, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(8099) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(10784, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(8100) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(10783, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(8101) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(10782, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(8102) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(10781, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(8103) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(10780, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(8104) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(10779, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(8105) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(10778, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(8106) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(10777, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(8107) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(10776, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(8108) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(10775, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(8109) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(10774, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(8110) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(10773, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(8111) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(10772, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(8112) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(10771, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(8113) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(10770, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(8114) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(10769, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(8116) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(10767, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(8117) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(10766, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(8118) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(10765, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(8119) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(10764, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(8120) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(10763, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(8129) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(10808, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(9404) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(12063, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(9405) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(12064, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(9304) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(11963, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(9424) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(12083, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(50504) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(53463, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(49166) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(52125, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(49204) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(52163, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(49164) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(52123, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(49364) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(52323, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(50524) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(53484, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(50525) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(1, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(53483, 'Select');
--Fin - sie_13_page_lang
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin - sie_13_page_lang');
end;
/

--Debut - sie_13_page_ir
begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut - sie_13_page_ir');
delete from tc$13$page$ir;

insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'N', null, 'Liste des évènements notifiables', 1, sie$migrt$pkg.obten_var_page(11443, 'Insert'), 4496, null);
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('sie_13_page_ir');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('sie_13_page_ir');
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'N', null, 'Liste des carnets de produits', 1, sie$migrt$pkg.obten_var_page(10763, 'Insert'), 4253, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'N', null, 'Liste des comptes de télécopies', 1, sie$migrt$pkg.obten_var_page(10765, 'Insert'), 4254, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'N', null, 'Applications', 1, sie$migrt$pkg.obten_var_page(10766, 'Insert'), 4255, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'N', null, 'Liste des carnets de produits', 1, sie$migrt$pkg.obten_var_page(10767, 'Insert'), 4256, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'N', null, 'Liste des domaines', 1, sie$migrt$pkg.obten_var_page(10771, 'Insert'), 4258, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'N', null, 'Applications', 1, sie$migrt$pkg.obten_var_page(10773, 'Insert'), 4259, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'N', null, 'Applications', 1, sie$migrt$pkg.obten_var_page(10776, 'Insert'), 4260, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'N', null, 'Historique des accès', 1, sie$migrt$pkg.obten_var_page(10779, 'Insert'), 4261, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'N', null, 'Applications', 1, sie$migrt$pkg.obten_var_page(10780, 'Insert'), 4262, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'N', null, 'Liste des accès', 1, sie$migrt$pkg.obten_var_page(10783, 'Insert'), 4263, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'N', null, 'Liste des classes d''intervention', 1, sie$migrt$pkg.obten_var_page(10784, 'Insert'), 4264, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'N', null, 'Liste des carnets de produits', 1, sie$migrt$pkg.obten_var_page(10785, 'Insert'), 4265, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'N', null, 'Liste des carnets de produits', 1, sie$migrt$pkg.obten_var_page(10786, 'Insert'), 4266, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'N', null, 'Applications', 1, sie$migrt$pkg.obten_var_page(10788, 'Insert'), 4267, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'N', null, 'Liste des modèles d''affichage de notification', 1, sie$migrt$pkg.obten_var_page(10790, 'Insert'), 4268, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'N', null, 'Liste des modèles de communication', 1, sie$migrt$pkg.obten_var_page(10794, 'Insert'), 4269, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'N', null, 'Liste des profils de courriels', 1, sie$migrt$pkg.obten_var_page(10796, 'Insert'), 4271, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'N', null, 'Liste des destinataires', 1, sie$migrt$pkg.obten_var_page(10799, 'Insert'), 4272, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'N', null, 'Liste des autorisations', 1, sie$migrt$pkg.obten_var_page(10798, 'Insert'), 4277, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'N', null, 'Liste des évènements notifiables', 1, sie$migrt$pkg.obten_var_page(11445, 'Insert'), 4456, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'N', null, 'Liste des courriels', 1, sie$migrt$pkg.obten_var_page(12063, 'Insert'), 4776, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'N', null, 'Liste des gabarits de formulaires', 1, sie$migrt$pkg.obten_var_page(52123, 'Insert'), 25176, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'N', null, 'Liste des modèles de message de notification', 1, sie$migrt$pkg.obten_var_page(11423, 'Insert'), 4437, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'N', null, 'Liste de modèle de recherche', 1, sie$migrt$pkg.obten_var_page(11544, 'Insert'), 4556, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'N', null, 'Liste des produits', 1, sie$migrt$pkg.obten_var_page(53463, 'Insert'), 25796, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'N', null, 'Liste des fonctionnalités', 1, sie$migrt$pkg.obten_var_page(53483, 'Insert'), 25816, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'N', null, 'Liste des requêtes d''intervention', 1, sie$migrt$pkg.obten_var_page(12083, 'Insert'), 4756, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'N', null, 'Liste des requêtes d''intervention', 1, sie$migrt$pkg.obten_var_page(52323, 'Insert'), 25256, null);
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin partie - sie_13_page_ir');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut partie - sie_13_page_ir');

merge into sie_13_page_ir t
                        using tc$13$page$ir tf
               on ((t.ref_page = tf.ref_page or (t.ref_page is null and tf.ref_page is null) or tf.ref_page is null ))
when not matched then
              insert (t.dnr_ref_aplic, t.indic_forcr_ajust_page, t.largr_deft, t.libl_regn, t.nombr_page_largr, t.ref_page, t.unite_mesr_largr_deft)
              values (tf.dnr_ref_aplic, tf.indic_forcr_ajust_page, tf.largr_deft, tf.libl_regn, tf.nombr_page_largr, tf.ref_page, tf.unite_mesr_largr_deft)
when matched then
              update set t.dnr_ref_aplic = tf.dnr_ref_aplic, t.indic_forcr_ajust_page = tf.indic_forcr_ajust_page, t.largr_deft = tf.largr_deft, t.libl_regn = tf.libl_regn, t.nombr_page_largr = tf.nombr_page_largr, t.unite_mesr_largr_deft = tf.unite_mesr_largr_deft
log errors into em$13_page_ir
reject limit unlimited
;

declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_page_ir;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Merge sur sie_13_page_ir');
  end if;
end;

null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin partie - sie_13_page_ir');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut partie - sie_13_page_ir');
select seqnc into sie$migrt$pkg.var_page_ir(4496) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(11443, 'Select');
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('sie_13_page_ir');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('sie_13_page_ir');
select seqnc into sie$migrt$pkg.var_page_ir(4253) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(10763, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(4254) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(10765, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(4255) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(10766, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(4256) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(10767, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(4258) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(10771, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(4259) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(10773, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(4260) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(10776, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(4261) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(10779, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(4262) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(10780, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(4263) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(10783, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(4264) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(10784, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(4265) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(10785, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(4266) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(10786, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(4267) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(10788, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(4268) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(10790, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(4269) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(10794, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(4271) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(10796, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(4272) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(10799, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(4277) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(10798, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(4456) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(11445, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(4776) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(12063, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(25176) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(52123, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(4437) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(11423, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(4556) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(11544, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(25796) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(53463, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(25816) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(53483, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(4756) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(12083, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(25256) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(52323, 'Select');
--Fin - sie_13_page_ir
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin - sie_13_page_ir');
end;
/

--Debut - sie_13_page_ir_coln
begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut - sie_13_page_ir_coln');
delete from tc$13$page$ir$coln;

insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('TYPE', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 455669332186180902, 'O', null, 'Type', 1, sie$migrt$pkg.obten_var_page_ir(25256, 'Insert'), 265213, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('STAT_SOUMS', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 455669437117180907, 'O', null, 'Statut', 2, sie$migrt$pkg.obten_var_page_ir(25256, 'Insert'), 265214, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOMBR_TENTV', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 455669548641180908, 'O', null, 'Nombre tentatives', 3, sie$migrt$pkg.obten_var_page_ir(25256, 'Insert'), 265215, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SUJET', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 455669636790180908, 'O', null, 'Sujet', 4, sie$migrt$pkg.obten_var_page_ir(25256, 'Insert'), 265216, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM_ENVOY', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 455669738069180908, 'O', null, 'Courriel envoi', 5, sie$migrt$pkg.obten_var_page_ir(25256, 'Insert'), 265217, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SERVR', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 455669843362180908, 'O', null, 'Serveur', 6, sie$migrt$pkg.obten_var_page_ir(25256, 'Insert'), 265218, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('PORT', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 455669957748180913, 'O', null, 'Port', 7, sie$migrt$pkg.obten_var_page_ir(25256, 'Insert'), 265219, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DOMN', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 455670061452180913, 'O', null, 'Domaine', 8, sie$migrt$pkg.obten_var_page_ir(25256, 'Insert'), 265220, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DATE_CREAT', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 455670140053180913, 'O', null, 'Date création', 9, sie$migrt$pkg.obten_var_page_ir(25256, 'Insert'), 265221, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 422619260649875947, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(4437, 'Insert'), 22033, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 422619361517875951, 'O', null, 'Code', 2, sie$migrt$pkg.obten_var_page_ir(4437, 'Insert'), 22034, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 422619453905875951, 'O', null, 'Nom', 3, sie$migrt$pkg.obten_var_page_ir(4437, 'Insert'), 22035, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DESCR', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 422619560189875951, 'O', null, 'Description', 4, sie$migrt$pkg.obten_var_page_ir(4437, 'Insert'), 22036, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_DV_TYPE_DON_SAIS_FORMT', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 453361431630866444, 'O', null, 'Type donnée', 4, sie$migrt$pkg.obten_var_page_ir(25176, 'Insert'), 264753, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_DV_TYPE_CHAMP_REPNS_FORMT', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 453361547116866449, 'O', null, 'Type champ', 5, sie$migrt$pkg.obten_var_page_ir(25176, 'Insert'), 264754, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('INDIC_REPNS_OBLIG_FORMT', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 453364657612949606, 'O', null, 'Réponse obligatoire', 7, sie$migrt$pkg.obten_var_page_ir(25176, 'Insert'), 264755, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('INDIC_AUTRE_FORMT', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 453365662937960584, 'O', null, 'Autre réponse', 8, sie$migrt$pkg.obten_var_page_ir(25176, 'Insert'), 264756, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('GRP', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 558622239760511730, 'O', null, 'Grp', 6, sie$migrt$pkg.obten_var_page_ir(4266, 'Insert'), 265662, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 422661036113019192, 'O', null, 'Code', 2, sie$migrt$pkg.obten_var_page_ir(4496, 'Insert'), 22074, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 422661148953019193, 'O', null, 'Nom', 3, sie$migrt$pkg.obten_var_page_ir(4496, 'Insert'), 22075, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_STRUC_APLIC', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 422661232358019193, 'O', null, 'Structure applicative', 4, sie$migrt$pkg.obten_var_page_ir(4496, 'Insert'), 22076, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 428622746337006524, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(4776, 'Insert'), 22473, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('ADRES_ENVOY', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 428622857139006525, 'O', null, 'Adresse d''envoi', 2, sie$migrt$pkg.obten_var_page_ir(4776, 'Insert'), 22474, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SUJET', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 428622931825006526, 'O', null, 'Sujet', 3, sie$migrt$pkg.obten_var_page_ir(4776, 'Insert'), 22475, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('STAT_SOUMS_FORMT', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 428627643573069070, 'O', null, 'Statut', 4, sie$migrt$pkg.obten_var_page_ir(4776, 'Insert'), 22476, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 422660938446019191, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(4496, 'Insert'), 22073, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_PRODT_FORMT', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 425375148648051625, 'O', null, 'Produit', 5, sie$migrt$pkg.obten_var_page_ir(4456, 'Insert'), 22353, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('INDIC_ACTIF_FORMT', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 427655353361456550, 'O', null, 'Actif', 15, sie$migrt$pkg.obten_var_page_ir(4253, 'Insert'), 22374, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 558064449532019060, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(25816, 'Insert'), 265582, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_FONCT_FORMT', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 558064561190019062, 'O', null, 'Fonctionnalité', 2, sie$migrt$pkg.obten_var_page_ir(25816, 'Insert'), 265583, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 48447773766609313, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(4253, 'Insert'), 21491, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 48447878342609314, 'O', null, 'Nom', 3, sie$migrt$pkg.obten_var_page_ir(4253, 'Insert'), 21492, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('PRENM', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 48453477515683509, 'O', null, 'Prénom', 4, sie$migrt$pkg.obten_var_page_ir(4253, 'Insert'), 21493, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE_UTILS', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 48453687164683511, 'O', null, 'Code', 2, sie$migrt$pkg.obten_var_page_ir(4253, 'Insert'), 21494, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DATE_EXPIR', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 48453881726683511, 'O', null, 'Date expiration', 7, sie$migrt$pkg.obten_var_page_ir(4253, 'Insert'), 21495, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DATE_CREAT', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 48454194504683511, 'O', null, 'Date Creat', 10, sie$migrt$pkg.obten_var_page_ir(4253, 'Insert'), 21496, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('UTILS_CREAT', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 48454279506683513, 'O', null, 'Utils Creat', 11, sie$migrt$pkg.obten_var_page_ir(4253, 'Insert'), 21497, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('INDIC_VERL_FORMT', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 48455692369735175, 'O', null, 'Verrouillé', 12, sie$migrt$pkg.obten_var_page_ir(4253, 'Insert'), 21498, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('INDIC_CHANG_MOT_PASSE_FORMT', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 48455795071735175, 'O', null, 'Changer mot de passe', 13, sie$migrt$pkg.obten_var_page_ir(4253, 'Insert'), 21499, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('MOT_PASSE', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 51956672231668377, 'O', null, 'Mot de passe', 14, sie$migrt$pkg.obten_var_page_ir(4253, 'Insert'), 21500, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 24866077326957832, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(4254, 'Insert'), 21501, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 24866148827957833, 'O', null, 'Code', 2, sie$migrt$pkg.obten_var_page_ir(4254, 'Insert'), 21502, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 24866264268957833, 'O', null, 'Nom', 3, sie$migrt$pkg.obten_var_page_ir(4254, 'Insert'), 21503, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NUMR', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 24866450551957834, 'O', null, 'Numéro expéditeur', 5, sie$migrt$pkg.obten_var_page_ir(4254, 'Insert'), 21505, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_PROFL_FORMT', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 24866570124957834, 'O', null, 'Profil de courriel expéditeur', 6, sie$migrt$pkg.obten_var_page_ir(4254, 'Insert'), 21506, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 74894273964119124, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(4255, 'Insert'), 21508, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 74894370660119129, 'O', null, 'Code', 2, sie$migrt$pkg.obten_var_page_ir(4255, 'Insert'), 21509, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 74894448832119129, 'O', null, 'Nom', 3, sie$migrt$pkg.obten_var_page_ir(4255, 'Insert'), 21510, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NUMR_APLIC_APEX', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 74895152113119129, 'O', null, 'Numéro', 10, sie$migrt$pkg.obten_var_page_ir(4255, 'Insert'), 21511, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 51105185115837049, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(4256, 'Insert'), 21512, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 51105375602837050, 'O', null, 'Nom', 4, sie$migrt$pkg.obten_var_page_ir(4256, 'Insert'), 21513, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DESCR', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 51105474623837050, 'O', null, 'Description', 5, sie$migrt$pkg.obten_var_page_ir(4256, 'Insert'), 21514, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 51105574433837050, 'O', null, 'Code', 3, sie$migrt$pkg.obten_var_page_ir(4256, 'Insert'), 21515, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 21850153474469724, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(4258, 'Insert'), 21520, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 21850256375469727, 'O', null, 'Code', 2, sie$migrt$pkg.obten_var_page_ir(4258, 'Insert'), 21521, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 21850352866469727, 'O', null, 'Nom', 3, sie$migrt$pkg.obten_var_page_ir(4258, 'Insert'), 21522, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 75080668343605113, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(4259, 'Insert'), 21523, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 75080763984605113, 'O', null, 'Nom', 2, sie$migrt$pkg.obten_var_page_ir(4259, 'Insert'), 21524, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NUMR_MESG', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 75084175977754715, 'O', null, 'Numéro', 3, sie$migrt$pkg.obten_var_page_ir(4259, 'Insert'), 21525, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('MESG', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 75084263909754723, 'O', null, 'Message', 4, sie$migrt$pkg.obten_var_page_ir(4259, 'Insert'), 21526, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_PRODT_FORMT', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 75084379381754723, 'O', null, 'Application', 6, sie$migrt$pkg.obten_var_page_ir(4259, 'Insert'), 21527, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('TYPE_MESG', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 75084454829754723, 'O', null, 'Type', 5, sie$migrt$pkg.obten_var_page_ir(4259, 'Insert'), 21528, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_PRODT', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 75109047924197256, 'O', null, 'Ref Prodt', 7, sie$migrt$pkg.obten_var_page_ir(4259, 'Insert'), 21529, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NUMR_APLIC', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 75078551023592543, 'O', null, 'Numéro application', 1, sie$migrt$pkg.obten_var_page_ir(4260, 'Insert'), 21530, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('APLIC', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 75078665009592545, 'O', null, 'Application', 2, sie$migrt$pkg.obten_var_page_ir(4260, 'Insert'), 21531, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NUMR_PAGE', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 75078748024592545, 'O', null, 'Numéro page', 3, sie$migrt$pkg.obten_var_page_ir(4260, 'Insert'), 21532, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('PAGE', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 75078878489592545, 'O', null, 'Page', 4, sie$migrt$pkg.obten_var_page_ir(4260, 'Insert'), 21533, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 75078949516592545, 'O', null, 'Seqnc', 5, sie$migrt$pkg.obten_var_page_ir(4260, 'Insert'), 21534, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 75079049418592545, 'O', null, 'Nom', 6, sie$migrt$pkg.obten_var_page_ir(4260, 'Insert'), 21535, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_DV_TYPE_EVENM_FORMT', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 56682859243634467, 'O', null, 'Événement', 2, sie$migrt$pkg.obten_var_page_ir(4261, 'Insert'), 21536, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DATE_EVENM', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 56685555906673842, 'O', null, 'Date', 1, sie$migrt$pkg.obten_var_page_ir(4261, 'Insert'), 21537, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NUMR_APLIC', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 77669358761770073, 'O', null, 'Numéro application', 1, sie$migrt$pkg.obten_var_page_ir(4262, 'Insert'), 21538, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('APLIC', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 77669448547770074, 'O', null, 'Application', 2, sie$migrt$pkg.obten_var_page_ir(4262, 'Insert'), 21539, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NUMR_PAGE', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 77669552705770074, 'O', null, 'Numéro page', 3, sie$migrt$pkg.obten_var_page_ir(4262, 'Insert'), 21540, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('PAGE', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 77669675779770074, 'O', null, 'Page', 4, sie$migrt$pkg.obten_var_page_ir(4262, 'Insert'), 21541, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 77669766701770074, 'O', null, 'Seqnc', 5, sie$migrt$pkg.obten_var_page_ir(4262, 'Insert'), 21542, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 77669857017770074, 'O', null, 'Nom', 6, sie$migrt$pkg.obten_var_page_ir(4262, 'Insert'), 21543, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_PRODT', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 77669954654770074, 'O', null, 'Ref Prodt', 7, sie$migrt$pkg.obten_var_page_ir(4262, 'Insert'), 21544, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 69901380808677452, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(4263, 'Insert'), 21545, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 16523665072966779, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(4264, 'Insert'), 21557, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 16523754933966779, 'O', null, 'Nom', 2, sie$migrt$pkg.obten_var_page_ir(4264, 'Insert'), 21558, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_PRODT_FORMT', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 16523851459966779, 'O', null, 'Application', 3, sie$migrt$pkg.obten_var_page_ir(4264, 'Insert'), 21559, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_PROFL_COURL_FORMT', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 16523969043966781, 'O', null, 'Profil de courriel', 4, sie$migrt$pkg.obten_var_page_ir(4264, 'Insert'), 21560, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 50373793722705478, 'O', null, 'Éditer', 1, sie$migrt$pkg.obten_var_page_ir(4265, 'Insert'), 21561, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 50373897671705481, 'O', null, 'Nom', 3, sie$migrt$pkg.obten_var_page_ir(4265, 'Insert'), 21562, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_TYPE_STRUC_FORMT', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 51100893817732697, 'O', null, 'Type', 6, sie$migrt$pkg.obten_var_page_ir(4265, 'Insert'), 21563, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 50345091104084819, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(4266, 'Insert'), 21564, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 50345186526084819, 'O', null, 'Nom', 3, sie$migrt$pkg.obten_var_page_ir(4266, 'Insert'), 21565, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 50788989936657909, 'O', null, 'Code', 5, sie$migrt$pkg.obten_var_page_ir(4266, 'Insert'), 21567, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NUMR_APLIC', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 74906177872190943, 'O', null, 'Numéro application', 1, sie$migrt$pkg.obten_var_page_ir(4267, 'Insert'), 21569, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('APLIC', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 74906255000190949, 'O', null, 'Application', 2, sie$migrt$pkg.obten_var_page_ir(4267, 'Insert'), 21570, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NUMR_PAGE', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 74906370227190949, 'O', null, 'Numéro page', 3, sie$migrt$pkg.obten_var_page_ir(4267, 'Insert'), 21571, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('PAGE', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 74906458254190949, 'O', null, 'Page', 4, sie$migrt$pkg.obten_var_page_ir(4267, 'Insert'), 21572, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 74929370833330904, 'O', null, 'Seqnc', 5, sie$migrt$pkg.obten_var_page_ir(4267, 'Insert'), 21573, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 74929448203330909, 'O', null, 'Nom', 6, sie$migrt$pkg.obten_var_page_ir(4267, 'Insert'), 21574, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_PRODT', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 75115468889316874, 'O', null, 'Ref Prodt', 7, sie$migrt$pkg.obten_var_page_ir(4267, 'Insert'), 21575, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 24376158919321289, 'O', null, 'Code', 2, sie$migrt$pkg.obten_var_page_ir(4268, 'Insert'), 21576, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 24376278598321294, 'O', null, 'Nom', 3, sie$migrt$pkg.obten_var_page_ir(4268, 'Insert'), 21577, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DESCR', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 24376358125321294, 'O', null, 'Description', 4, sie$migrt$pkg.obten_var_page_ir(4268, 'Insert'), 21578, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 24690561511722350, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(4268, 'Insert'), 21579, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 24722470545234075, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(4269, 'Insert'), 21580, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 24722553235234078, 'O', null, 'Code', 3, sie$migrt$pkg.obten_var_page_ir(4269, 'Insert'), 21581, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 24722663281234078, 'O', null, 'Nom', 4, sie$migrt$pkg.obten_var_page_ir(4269, 'Insert'), 21582, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DESCR', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 24722777076234078, 'O', null, 'Description', 5, sie$migrt$pkg.obten_var_page_ir(4269, 'Insert'), 21583, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_TYPE_COMNC_FORMT', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 24722868919234078, 'O', null, 'Type', 2, sie$migrt$pkg.obten_var_page_ir(4269, 'Insert'), 21584, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 16512578059960087, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(4271, 'Insert'), 21589, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM_ENVOY', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 16513048023960088, 'O', null, 'Nom expéditeur', 6, sie$migrt$pkg.obten_var_page_ir(4271, 'Insert'), 21590, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('ADRES_ENVOY', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 16513148425960088, 'O', null, 'Adresse expéditeur', 7, sie$migrt$pkg.obten_var_page_ir(4271, 'Insert'), 21591, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 24841879758553763, 'O', null, 'Code', 11, sie$migrt$pkg.obten_var_page_ir(4271, 'Insert'), 21592, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 24841976160553765, 'O', null, 'Nom', 12, sie$migrt$pkg.obten_var_page_ir(4271, 'Insert'), 21593, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 25066872216665346, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(4272, 'Insert'), 21595, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 25066960377665349, 'O', null, 'Code', 2, sie$migrt$pkg.obten_var_page_ir(4272, 'Insert'), 21596, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 25067062335665350, 'O', null, 'Nom', 3, sie$migrt$pkg.obten_var_page_ir(4272, 'Insert'), 21597, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 96900141429204955, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(4277, 'Insert'), 21620, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_GROUP', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 96900248109204958, 'O', null, 'ref grp', 2, sie$migrt$pkg.obten_var_page_ir(4277, 'Insert'), 21621, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_UTILS', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 299187138374240457, 'O', null, 'Utilisateur', 7, sie$migrt$pkg.obten_var_page_ir(4277, 'Insert'), 21622, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DATE_DEBUT_EFECT', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 96900452641204958, 'O', null, 'Début effectivité', 4, sie$migrt$pkg.obten_var_page_ir(4277, 'Insert'), 21623, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DATE_FIN_EFECT', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 96900544095204959, 'O', null, 'Fin effectivité', 5, sie$migrt$pkg.obten_var_page_ir(4277, 'Insert'), 21624, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_GROUP_UTILS_LIE', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 96900639199204959, 'O', null, 'Groupe', 6, sie$migrt$pkg.obten_var_page_ir(4277, 'Insert'), 21625, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DATE_DEBUT_EFECT', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 111199557322316813, 'O', null, 'Début effectivité', 4, sie$migrt$pkg.obten_var_page_ir(4263, 'Insert'), 21693, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DATE_FIN_EFECT', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 111199644453316814, 'O', null, 'Fin effectivité', 5, sie$migrt$pkg.obten_var_page_ir(4263, 'Insert'), 21694, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_GROUP', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 111256946174363265, 'O', null, 'Groupe', 6, sie$migrt$pkg.obten_var_page_ir(4263, 'Insert'), 21695, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_UTILS', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 111257032241363265, 'O', null, 'Utilisateur', 7, sie$migrt$pkg.obten_var_page_ir(4263, 'Insert'), 21696, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_GROUP_UTILS_LIE', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 111257146319363265, 'O', null, 'Groupe lié', 8, sie$migrt$pkg.obten_var_page_ir(4263, 'Insert'), 21697, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 422663761288028812, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(4456, 'Insert'), 22053, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 422663844155028812, 'O', null, 'Code', 2, sie$migrt$pkg.obten_var_page_ir(4456, 'Insert'), 22054, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 422663963297028812, 'O', null, 'Nom', 3, sie$migrt$pkg.obten_var_page_ir(4456, 'Insert'), 22055, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_STRUC_APLIC', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 422664063740028812, 'O', null, 'Structure applicative', 4, sie$migrt$pkg.obten_var_page_ir(4456, 'Insert'), 22056, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 423390254774417407, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(4556, 'Insert'), 22133, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 423390349766417408, 'O', null, 'Code', 2, sie$migrt$pkg.obten_var_page_ir(4556, 'Insert'), 22134, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 423390452357417408, 'O', null, 'Nom', 3, sie$migrt$pkg.obten_var_page_ir(4556, 'Insert'), 22135, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 429166431938838417, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(4756, 'Insert'), 22453, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_UTILS_FORMT', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 429166562498838418, 'O', null, 'Utilisateur', 2, sie$migrt$pkg.obten_var_page_ir(4756, 'Insert'), 22454, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_DV_TYPE_REQT_INTER_FORMT', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 429166639230838418, 'O', null, 'Type', 3, sie$migrt$pkg.obten_var_page_ir(4756, 'Insert'), 22455, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DATE_DEBUT_EFECT', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 429166746728838418, 'O', null, 'Début effectivité', 4, sie$migrt$pkg.obten_var_page_ir(4756, 'Insert'), 22456, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DATE_FIN_EFECT', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 429166835320838418, 'O', null, 'Fin effectivité', 5, sie$migrt$pkg.obten_var_page_ir(4756, 'Insert'), 22457, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DATE_TRAIT', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 429166957030838418, 'O', null, 'Traitement', 6, sie$migrt$pkg.obten_var_page_ir(4756, 'Insert'), 22458, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('ADRES_IP', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 440541035623938512, 'O', null, 'Adresse IP', 3, sie$migrt$pkg.obten_var_page_ir(4261, 'Insert'), 264473, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('INDIC_ACTIF_FORMT', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 558110336908919552, 'O', null, 'Actif', 3, sie$migrt$pkg.obten_var_page_ir(25816, 'Insert'), 265602, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 453142038452813574, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(25176, 'Insert'), 264633, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 453142236643813578, 'O', null, 'Nom', 3, sie$migrt$pkg.obten_var_page_ir(25176, 'Insert'), 264635, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 558046861100745733, 'O', null, 'Code', 2, sie$migrt$pkg.obten_var_page_ir(25796, 'Insert'), 265563, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 558046958606745734, 'O', null, 'Nom', 3, sie$migrt$pkg.obten_var_page_ir(25796, 'Insert'), 265564, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 558046749064745725, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(25796, 'Insert'), 265562, null);
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin partie - sie_13_page_ir_coln');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut partie - sie_13_page_ir_coln');

merge into sie_13_page_ir_coln t
                        using tc$13$page$ir$coln tf
               on ((t.coln_table = tf.coln_table) and (t.ref_page_ir = tf.ref_page_ir or (t.ref_page_ir is null and tf.ref_page_ir is null) or tf.ref_page_ir is null ))
when not matched then
              insert (t.coln_table, t.dnr_ref_aplic, t.id_apex, t.indic_exprt, t.largr, t.libl, t.ordre_afich, t.ref_page_ir, t.type_largr)
              values (tf.coln_table, tf.dnr_ref_aplic, tf.id_apex, tf.indic_exprt, tf.largr, tf.libl, tf.ordre_afich, tf.ref_page_ir, tf.type_largr)
when matched then
              update set t.dnr_ref_aplic = tf.dnr_ref_aplic, t.id_apex = tf.id_apex, t.indic_exprt = tf.indic_exprt, t.largr = tf.largr, t.libl = tf.libl, t.ordre_afich = tf.ordre_afich, t.type_largr = tf.type_largr
log errors into em$13_page_ir_coln
reject limit unlimited
;

declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_page_ir_coln;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Merge sur sie_13_page_ir_coln');
  end if;
end;

null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin partie - sie_13_page_ir_coln');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut partie - sie_13_page_ir_coln');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265213) from sie_13_page_ir_coln where coln_table = 'TYPE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25256, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265214) from sie_13_page_ir_coln where coln_table = 'STAT_SOUMS' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25256, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265215) from sie_13_page_ir_coln where coln_table = 'NOMBR_TENTV' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25256, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265216) from sie_13_page_ir_coln where coln_table = 'SUJET' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25256, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265217) from sie_13_page_ir_coln where coln_table = 'NOM_ENVOY' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25256, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265218) from sie_13_page_ir_coln where coln_table = 'SERVR' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25256, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265219) from sie_13_page_ir_coln where coln_table = 'PORT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25256, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265220) from sie_13_page_ir_coln where coln_table = 'DOMN' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25256, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265221) from sie_13_page_ir_coln where coln_table = 'DATE_CREAT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25256, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(22033) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4437, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(22034) from sie_13_page_ir_coln where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4437, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(22035) from sie_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4437, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(22036) from sie_13_page_ir_coln where coln_table = 'DESCR' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4437, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(264753) from sie_13_page_ir_coln where coln_table = 'REF_DV_TYPE_DON_SAIS_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25176, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(264754) from sie_13_page_ir_coln where coln_table = 'REF_DV_TYPE_CHAMP_REPNS_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25176, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(264755) from sie_13_page_ir_coln where coln_table = 'INDIC_REPNS_OBLIG_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25176, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(264756) from sie_13_page_ir_coln where coln_table = 'INDIC_AUTRE_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25176, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265662) from sie_13_page_ir_coln where coln_table = 'GRP' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4266, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(22074) from sie_13_page_ir_coln where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4496, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(22075) from sie_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4496, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(22076) from sie_13_page_ir_coln where coln_table = 'REF_STRUC_APLIC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4496, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(22473) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4776, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(22474) from sie_13_page_ir_coln where coln_table = 'ADRES_ENVOY' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4776, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(22475) from sie_13_page_ir_coln where coln_table = 'SUJET' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4776, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(22476) from sie_13_page_ir_coln where coln_table = 'STAT_SOUMS_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4776, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(22073) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4496, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(22353) from sie_13_page_ir_coln where coln_table = 'REF_PRODT_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4456, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(22374) from sie_13_page_ir_coln where coln_table = 'INDIC_ACTIF_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4253, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265582) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25816, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265583) from sie_13_page_ir_coln where coln_table = 'REF_FONCT_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25816, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21491) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4253, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21492) from sie_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4253, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21493) from sie_13_page_ir_coln where coln_table = 'PRENM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4253, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21494) from sie_13_page_ir_coln where coln_table = 'CODE_UTILS' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4253, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21495) from sie_13_page_ir_coln where coln_table = 'DATE_EXPIR' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4253, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21496) from sie_13_page_ir_coln where coln_table = 'DATE_CREAT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4253, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21497) from sie_13_page_ir_coln where coln_table = 'UTILS_CREAT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4253, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21498) from sie_13_page_ir_coln where coln_table = 'INDIC_VERL_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4253, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21499) from sie_13_page_ir_coln where coln_table = 'INDIC_CHANG_MOT_PASSE_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4253, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21500) from sie_13_page_ir_coln where coln_table = 'MOT_PASSE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4253, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21501) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4254, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21502) from sie_13_page_ir_coln where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4254, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21503) from sie_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4254, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21505) from sie_13_page_ir_coln where coln_table = 'NUMR' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4254, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21506) from sie_13_page_ir_coln where coln_table = 'REF_PROFL_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4254, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21508) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4255, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21509) from sie_13_page_ir_coln where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4255, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21510) from sie_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4255, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21511) from sie_13_page_ir_coln where coln_table = 'NUMR_APLIC_APEX' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4255, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21512) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4256, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21513) from sie_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4256, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21514) from sie_13_page_ir_coln where coln_table = 'DESCR' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4256, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21515) from sie_13_page_ir_coln where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4256, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21520) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4258, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21521) from sie_13_page_ir_coln where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4258, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21522) from sie_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4258, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21523) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4259, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21524) from sie_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4259, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21525) from sie_13_page_ir_coln where coln_table = 'NUMR_MESG' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4259, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21526) from sie_13_page_ir_coln where coln_table = 'MESG' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4259, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21527) from sie_13_page_ir_coln where coln_table = 'REF_PRODT_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4259, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21528) from sie_13_page_ir_coln where coln_table = 'TYPE_MESG' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4259, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21529) from sie_13_page_ir_coln where coln_table = 'REF_PRODT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4259, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21530) from sie_13_page_ir_coln where coln_table = 'NUMR_APLIC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4260, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21531) from sie_13_page_ir_coln where coln_table = 'APLIC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4260, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21532) from sie_13_page_ir_coln where coln_table = 'NUMR_PAGE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4260, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21533) from sie_13_page_ir_coln where coln_table = 'PAGE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4260, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21534) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4260, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21535) from sie_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4260, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21536) from sie_13_page_ir_coln where coln_table = 'REF_DV_TYPE_EVENM_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4261, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21537) from sie_13_page_ir_coln where coln_table = 'DATE_EVENM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4261, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21538) from sie_13_page_ir_coln where coln_table = 'NUMR_APLIC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4262, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21539) from sie_13_page_ir_coln where coln_table = 'APLIC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4262, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21540) from sie_13_page_ir_coln where coln_table = 'NUMR_PAGE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4262, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21541) from sie_13_page_ir_coln where coln_table = 'PAGE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4262, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21542) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4262, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21543) from sie_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4262, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21544) from sie_13_page_ir_coln where coln_table = 'REF_PRODT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4262, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21545) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4263, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21557) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4264, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21558) from sie_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4264, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21559) from sie_13_page_ir_coln where coln_table = 'REF_PRODT_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4264, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21560) from sie_13_page_ir_coln where coln_table = 'REF_PROFL_COURL_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4264, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21561) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4265, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21562) from sie_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4265, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21563) from sie_13_page_ir_coln where coln_table = 'REF_TYPE_STRUC_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4265, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21564) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4266, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21565) from sie_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4266, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21567) from sie_13_page_ir_coln where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4266, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21569) from sie_13_page_ir_coln where coln_table = 'NUMR_APLIC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4267, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21570) from sie_13_page_ir_coln where coln_table = 'APLIC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4267, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21571) from sie_13_page_ir_coln where coln_table = 'NUMR_PAGE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4267, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21572) from sie_13_page_ir_coln where coln_table = 'PAGE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4267, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21573) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4267, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21574) from sie_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4267, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21575) from sie_13_page_ir_coln where coln_table = 'REF_PRODT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4267, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21576) from sie_13_page_ir_coln where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4268, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21577) from sie_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4268, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21578) from sie_13_page_ir_coln where coln_table = 'DESCR' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4268, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21579) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4268, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21580) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4269, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21581) from sie_13_page_ir_coln where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4269, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21582) from sie_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4269, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21583) from sie_13_page_ir_coln where coln_table = 'DESCR' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4269, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21584) from sie_13_page_ir_coln where coln_table = 'REF_TYPE_COMNC_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4269, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21589) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4271, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21590) from sie_13_page_ir_coln where coln_table = 'NOM_ENVOY' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4271, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21591) from sie_13_page_ir_coln where coln_table = 'ADRES_ENVOY' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4271, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21592) from sie_13_page_ir_coln where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4271, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21593) from sie_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4271, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21595) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4272, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21596) from sie_13_page_ir_coln where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4272, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21597) from sie_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4272, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21620) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4277, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21621) from sie_13_page_ir_coln where coln_table = 'REF_GROUP' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4277, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21622) from sie_13_page_ir_coln where coln_table = 'REF_UTILS' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4277, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21623) from sie_13_page_ir_coln where coln_table = 'DATE_DEBUT_EFECT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4277, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21624) from sie_13_page_ir_coln where coln_table = 'DATE_FIN_EFECT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4277, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21625) from sie_13_page_ir_coln where coln_table = 'REF_GROUP_UTILS_LIE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4277, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21693) from sie_13_page_ir_coln where coln_table = 'DATE_DEBUT_EFECT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4263, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21694) from sie_13_page_ir_coln where coln_table = 'DATE_FIN_EFECT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4263, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21695) from sie_13_page_ir_coln where coln_table = 'REF_GROUP' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4263, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21696) from sie_13_page_ir_coln where coln_table = 'REF_UTILS' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4263, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(21697) from sie_13_page_ir_coln where coln_table = 'REF_GROUP_UTILS_LIE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4263, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(22053) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4456, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(22054) from sie_13_page_ir_coln where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4456, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(22055) from sie_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4456, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(22056) from sie_13_page_ir_coln where coln_table = 'REF_STRUC_APLIC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4456, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(22133) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4556, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(22134) from sie_13_page_ir_coln where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4556, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(22135) from sie_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4556, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(22453) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4756, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(22454) from sie_13_page_ir_coln where coln_table = 'REF_UTILS_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4756, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(22455) from sie_13_page_ir_coln where coln_table = 'REF_DV_TYPE_REQT_INTER_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4756, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(22456) from sie_13_page_ir_coln where coln_table = 'DATE_DEBUT_EFECT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4756, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(22457) from sie_13_page_ir_coln where coln_table = 'DATE_FIN_EFECT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4756, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(22458) from sie_13_page_ir_coln where coln_table = 'DATE_TRAIT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4756, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(264473) from sie_13_page_ir_coln where coln_table = 'ADRES_IP' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4261, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265602) from sie_13_page_ir_coln where coln_table = 'INDIC_ACTIF_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25816, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(264633) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25176, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(264635) from sie_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25176, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265563) from sie_13_page_ir_coln where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25796, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265564) from sie_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25796, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(265562) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25796, 'Select');
--Fin - sie_13_page_ir_coln
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin - sie_13_page_ir_coln');
end;
/

--Debut - sie_13_page_prefr_navgt
begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut - sie_13_page_prefr_navgt');
delete from tc$13$page$prefr$navgt;

--Fin - sie_13_page_prefr_navgt
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin - sie_13_page_prefr_navgt');
end;
/

--Debut - sie_13_liste_navgt
begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut - sie_13_liste_navgt');
delete from tc$13$liste$navgt;

insert into tc$13$liste$navgt (aplic, code, dnr_ref_aplic, indic_reint_sidf, libl, ordre_presn, page, ref_page, sapc, sapi, seqnc, sspc, sspi) values ('120', 'TYPE_AFICH_CALEN', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'N', 'Modèle affichage calendrier', 1, '17035', sie$migrt$pkg.obten_var_page(10792, 'Insert'), null, null, 2208, null, null);
insert into tc$13$liste$navgt (aplic, code, dnr_ref_aplic, indic_reint_sidf, libl, ordre_presn, page, ref_page, sapc, sapi, seqnc, sspc, sspi) values ('123', 'DISPN_UTILS', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'N', 'Disponibilité', 2, '1031', sie$migrt$pkg.obten_var_page(10782, 'Insert'), null, null, 14001, null, null);
insert into tc$13$liste$navgt (aplic, code, dnr_ref_aplic, indic_reint_sidf, libl, ordre_presn, page, ref_page, sapc, sapi, seqnc, sspc, sspi) values ('120', 'COURL', sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 'N', 'Courriel', 1, '20020', sie$migrt$pkg.obten_var_page(10782, 'Insert'), null, null, 13961, null, null);

merge into sie_13_liste_navgt t
                        using tc$13$liste$navgt tf
               on ((t.code = tf.code) and (t.ref_page = tf.ref_page or (t.ref_page is null and tf.ref_page is null) or tf.ref_page is null ))
when not matched then
              insert (t.aplic, t.code, t.dnr_ref_aplic, t.indic_reint_sidf, t.libl, t.ordre_presn, t.page, t.ref_page, t.sapc, t.sapi, t.sspc, t.sspi)
              values (tf.aplic, tf.code, tf.dnr_ref_aplic, tf.indic_reint_sidf, tf.libl, tf.ordre_presn, tf.page, tf.ref_page, tf.sapc, tf.sapi, tf.sspc, tf.sspi)
when matched then
              update set t.aplic = tf.aplic, t.dnr_ref_aplic = tf.dnr_ref_aplic, t.indic_reint_sidf = tf.indic_reint_sidf, t.libl = tf.libl, t.ordre_presn = tf.ordre_presn, t.page = tf.page, t.sapc = tf.sapc, t.sapi = tf.sapi, t.sspc = tf.sspc, t.sspi = tf.sspi
log errors into em$13_liste_navgt
reject limit unlimited
;

declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_liste_navgt;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Merge sur sie_13_liste_navgt');
  end if;
end;

delete sie_13_liste_navgt t
            where t.dnr_ref_aplic = sie$migrt$pkg.var_aplic(11)
              and not exists (select null
                                from tc$13$liste$navgt tf
                               where (t.code = tf.code) and (t.ref_page = tf.ref_page or (t.ref_page is null and tf.ref_page is null) or tf.ref_page is null ));

select seqnc into sie$migrt$pkg.var_liste_navgt(2208) from sie_13_liste_navgt where code = 'TYPE_AFICH_CALEN' and ref_page = sie$migrt$pkg.obten_var_page(10792, 'Select');
select seqnc into sie$migrt$pkg.var_liste_navgt(14001) from sie_13_liste_navgt where code = 'DISPN_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(10782, 'Select');
select seqnc into sie$migrt$pkg.var_liste_navgt(13961) from sie_13_liste_navgt where code = 'COURL' and ref_page = sie$migrt$pkg.obten_var_page(10782, 'Select');
--Fin - sie_13_liste_navgt
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin - sie_13_liste_navgt');
end;
/

--Debut - sie_13_page_item
begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut - sie_13_page_item');
delete from tc$13$page$item;

insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 423264662887112130, 'O', null, null, null, null, 'N', null, '[P34820_SEQNC_TYPE_COURL]', 'P34820_SEQNC_TYPE_COURL', sie$migrt$pkg.obten_var_page(11446, 'Insert'), 81915, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 423264942586115782, 'O', null, null, null, null, 'N', null, '[P34820_SEQNC_TYPE_SMS]', 'P34820_SEQNC_TYPE_SMS', sie$migrt$pkg.obten_var_page(11446, 'Insert'), 81916, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 423267061380177979, 'O', null, null, null, null, 'N', null, '[P34820_SEQNC_TYPE_ECRAN]', 'P34820_SEQNC_TYPE_ECRAN', sie$migrt$pkg.obten_var_page(11446, 'Insert'), 81917, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 423186044208988646, 'O', null, null, null, null, 'N', null, '2. Résoudre vers', 'P34830_RESLT_2', sie$migrt$pkg.obten_var_page(11483, 'Insert'), 81924, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 423186257970988646, 'O', null, null, null, null, 'N', null, '[P34830_AFICH_RESLT_1]', 'P34830_AFICH_RESLT_1', sie$migrt$pkg.obten_var_page(11483, 'Insert'), 81925, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 423185031918988645, 'O', null, null, null, null, 'N', null, '4. Résoudre vers', 'P34830_RESLT_4', sie$migrt$pkg.obten_var_page(11483, 'Insert'), 81926, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 423185248735988645, 'O', null, null, null, null, 'N', null, '5. Résoudre vers', 'P34830_RESLT_5', sie$migrt$pkg.obten_var_page(11483, 'Insert'), 81927, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 423185433358988645, 'O', null, null, null, null, 'N', null, '6. Résoudre vers', 'P34830_RESLT_6', sie$migrt$pkg.obten_var_page(11483, 'Insert'), 81928, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 423185839132988646, 'O', null, null, null, null, 'N', null, 'Champ de données', 'P34830_CHAMP_1', sie$migrt$pkg.obten_var_page(11483, 'Insert'), 81929, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 423186663044988647, 'O', null, null, null, null, 'N', null, '3. Résoudre vers', 'P34830_RESLT_3', sie$migrt$pkg.obten_var_page(11483, 'Insert'), 81930, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 422632563804365738, 'O', null, null, null, null, 'O', null, '[P34310_REF_DOMN]', 'P34310_REF_DOMN', sie$migrt$pkg.obten_var_page(11424, 'Insert'), 69964, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 422623346548113156, 'O', null, null, null, null, 'O', null, 'Code', 'P34310_CODE', sie$migrt$pkg.obten_var_page(11424, 'Insert'), 69965, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 422623560847113156, 'O', null, null, null, null, 'O', null, 'Nom', 'P34310_NOM', sie$migrt$pkg.obten_var_page(11424, 'Insert'), 69966, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 422623734016113157, 'O', null, null, null, null, 'O', null, 'Description', 'P34310_DESCR', sie$migrt$pkg.obten_var_page(11424, 'Insert'), 69967, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 422623939654113157, 'O', null, null, null, null, 'O', null, 'Objet', 'P34310_OBJET', sie$migrt$pkg.obten_var_page(11424, 'Insert'), 69968, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 422624151710113158, 'O', null, null, null, null, 'O', null, 'Corps Message', 'P34310_CORPS_MESG', sie$migrt$pkg.obten_var_page(11424, 'Insert'), 69969, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 422623146855113149, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P34310_SEQNC', sie$migrt$pkg.obten_var_page(11424, 'Insert'), 69970, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 427684132762881665, 'O', null, null, null, null, 'O', null, 'Domaine', 'P20010_DOMN', sie$migrt$pkg.obten_var_page(10781, 'Insert'), 110068, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 558428544000797629, 'O', null, null, null, null, 'O', null, 'Groupe utilisateur', 'P12220_REF_GROUP_UTILS_FORMT', sie$migrt$pkg.obten_var_page(53503, 'Insert'), 586015, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 558428747618797629, 'O', null, null, null, null, 'O', null, 'Opération', 'P12220_REF_OPERT', sie$migrt$pkg.obten_var_page(53503, 'Insert'), 586016, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 558428963262797629, 'O', null, null, null, null, 'O', null, 'Option', 'P12220_REF_OPERT_OPTIO', sie$migrt$pkg.obten_var_page(53503, 'Insert'), 586017, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 558429136005797629, 'O', null, null, null, null, 'O', null, 'Ref Domn', 'P12220_REF_DOMN', sie$migrt$pkg.obten_var_page(53503, 'Insert'), 586018, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 558428158981797618, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P12220_SEQNC', sie$migrt$pkg.obten_var_page(53503, 'Insert'), 586019, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 554856702182060656, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(53503, 'Insert'), 585995, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 554874824160495194, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', sie$migrt$pkg.obten_var_page(53503, 'Insert'), 586020, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 558433552474864615, 'O', null, null, null, null, 'O', null, 'Opération', 'P12220_REF_OPERT_FORMT', sie$migrt$pkg.obten_var_page(53503, 'Insert'), 586034, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 440416758600424669, 'O', null, null, null, null, 'O', null, '[P19030_DNR_REF_PRODT]', 'P19030_DNR_REF_PRODT', sie$migrt$pkg.obten_var_page(11545, 'Insert'), 583131, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 554512125981716644, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', sie$migrt$pkg.obten_var_page(53483, 'Insert'), 585954, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 423857354890662305, 'O', null, null, null, null, 'N', null, '[P34820_MODE]', 'P34820_MODE', sie$migrt$pkg.obten_var_page(11446, 'Insert'), 87585, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 423801962831920310, 'O', null, null, null, null, 'O', null, 'Compte d''envoi', 'P34820_REF_COMPT_COURL', sie$migrt$pkg.obten_var_page(11446, 'Insert'), 87586, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 423802159632920310, 'O', null, null, null, null, 'O', null, 'Compte d''envoi', 'P34820_REF_COMPT_TWILI', sie$migrt$pkg.obten_var_page(11446, 'Insert'), 87587, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 423859848254906421, 'O', null, null, null, null, 'N', null, 'Destinataire', 'P34820_RESLT_DESTN', sie$migrt$pkg.obten_var_page(11446, 'Insert'), 87589, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 423860554806031252, 'O', null, null, null, null, 'N', null, 'Nom formatté', 'P34820_CHAMP_NOM_FORMT', sie$migrt$pkg.obten_var_page(11446, 'Insert'), 87590, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 423861134253091532, 'O', null, null, null, null, 'N', null, 'Courriel', 'P34820_CHAMP_ADRES_COURL', sie$migrt$pkg.obten_var_page(11446, 'Insert'), 87591, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 423862832923195257, 'O', null, null, null, null, 'N', null, 'Nature', 'P34820_CHAMP_NATR_COURL', sie$migrt$pkg.obten_var_page(11446, 'Insert'), 87592, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 423861556547107435, 'O', null, null, null, null, 'N', null, 'Numéro sms', 'P34820_CHAMP_NUMR_SMS', sie$migrt$pkg.obten_var_page(11446, 'Insert'), 87593, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 423869136099266837, 'O', null, null, null, null, 'O', null, '[P34820_REF_DOMN]', 'P34820_REF_DOMN', sie$migrt$pkg.obten_var_page(11446, 'Insert'), 87594, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 558061837132019031, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P35042_SEQNC', sie$migrt$pkg.obten_var_page(53484, 'Insert'), 585955, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 44895769878306901, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', sie$migrt$pkg.obten_var_page(10763, 'Insert'), 109589, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 428234042358915901, 'O', null, null, null, null, 'N', null, 'Groupe d''utilisateurs', 'P12020_GROUP_UTILS', sie$migrt$pkg.obten_var_page(10782, 'Insert'), 577088, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 428231659168684244, 'O', null, null, null, null, 'N', null, 'Groupe de droit', 'P12020_GROUP_DROIT', sie$migrt$pkg.obten_var_page(10782, 'Insert'), 577089, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 434269646235606778, 'O', null, null, null, null, 'O', null, 'Procédure PL/SQL authentification externe', 'P12210_PROCD_AUTHE_EXTER_AFW', sie$migrt$pkg.obten_var_page(10792, 'Insert'), 577093, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 434270045327616028, 'O', null, null, null, null, 'O', null, 'Procédure PL/SQL niveau sécurité mot passe', 'P12210_PROCD_VALD_NIV_SECRT_MP', sie$migrt$pkg.obten_var_page(10792, 'Insert'), 577094, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 434475950628393040, 'O', null, null, null, null, 'N', null, '[P12210_MODE]', 'P12210_MODE', sie$migrt$pkg.obten_var_page(10792, 'Insert'), 577095, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 434471056667205555, 'O', null, null, null, null, 'O', null, 'PRODT', 'P19030_REF_PRODT', sie$migrt$pkg.obten_var_page(11545, 'Insert'), 577101, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 428639456527226847, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P20030_SEQNC', sie$migrt$pkg.obten_var_page(12064, 'Insert'), 577102, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 428639643050226855, 'O', null, null, null, null, 'O', null, 'Serveur', 'P20030_SERVR', sie$migrt$pkg.obten_var_page(12064, 'Insert'), 577103, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 428639859809226856, 'O', null, null, null, null, 'O', null, 'Port', 'P20030_PORT', sie$migrt$pkg.obten_var_page(12064, 'Insert'), 577104, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 428640046360226857, 'O', null, null, null, null, 'O', null, 'Domaine', 'P20030_DOMN', sie$migrt$pkg.obten_var_page(12064, 'Insert'), 577105, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 428640251082226857, 'O', null, null, null, null, 'O', null, 'Nom d''envoi', 'P20030_NOM_ENVOY', sie$migrt$pkg.obten_var_page(12064, 'Insert'), 577106, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 428640439798226857, 'O', null, null, null, null, 'O', null, 'Adresse d''envoi', 'P20030_ADRES_ENVOY', sie$migrt$pkg.obten_var_page(12064, 'Insert'), 577107, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 428640659224226857, 'O', null, null, null, null, 'O', null, 'Sujet', 'P20030_SUJET', sie$migrt$pkg.obten_var_page(12064, 'Insert'), 577108, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 428640853351226858, 'O', null, null, null, null, 'O', null, 'Format HTML', 'P20030_INDIC_FORMT_HTML', sie$migrt$pkg.obten_var_page(12064, 'Insert'), 577109, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 428641035682226858, 'O', null, null, null, null, 'O', null, 'Corps', 'P20030_CORPS', sie$migrt$pkg.obten_var_page(12064, 'Insert'), 577110, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 428641232608226858, 'O', null, null, null, null, 'O', null, 'Nombre de tentative', 'P20030_NOMBR_TENTV', sie$migrt$pkg.obten_var_page(12064, 'Insert'), 577111, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 428641435135226858, 'O', null, null, null, null, 'O', null, 'Nombre de tentative maximale', 'P20030_NOMBR_TENTV_MAX', sie$migrt$pkg.obten_var_page(12064, 'Insert'), 577112, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 428641643005226858, 'O', null, null, null, null, 'O', null, 'Sens', 'P20030_SENS', sie$migrt$pkg.obten_var_page(12064, 'Insert'), 577113, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 428641841329226859, 'O', null, null, null, null, 'O', null, 'Statut', 'P20030_STAT_SOUMS', sie$migrt$pkg.obten_var_page(12064, 'Insert'), 577114, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 558062044685019040, 'O', null, null, null, null, 'O', null, 'Fonctionnalité', 'P35042_REF_FONCT', sie$migrt$pkg.obten_var_page(53484, 'Insert'), 585956, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 558062456347019043, 'O', null, null, null, null, 'O', null, 'Nom de domaine', 'P35042_REF_DOMN', sie$migrt$pkg.obten_var_page(53484, 'Insert'), 585958, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 558062836856019043, 'O', null, null, null, null, 'O', null, 'Actif', 'P35042_INDIC_ACTIF', sie$migrt$pkg.obten_var_page(53484, 'Insert'), 585960, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 554508001715716605, 'N', null, null, null, null, 'N', null, 'Annulé', 'CANCEL', sie$migrt$pkg.obten_var_page(53484, 'Insert'), 585961, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 554507806075716604, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', sie$migrt$pkg.obten_var_page(53484, 'Insert'), 585962, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 554507703027716604, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', sie$migrt$pkg.obten_var_page(53484, 'Insert'), 585963, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 554507612060716604, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', sie$migrt$pkg.obten_var_page(53484, 'Insert'), 585964, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 426981234550301057, 'O', null, null, null, null, 'O', null, 'domaine', 'P20010_REF_DOMN', sie$migrt$pkg.obten_var_page(10781, 'Insert'), 106302, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 426874639215187915, 'O', null, null, null, null, 'N', null, '[P34840_AFICH_RESLT_1]', 'P34840_AFICH_RESLT_1', sie$migrt$pkg.obten_var_page(11963, 'Insert'), 103782, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 426875039917187917, 'O', null, null, null, null, 'N', null, 'Champ de données', 'P34840_CHAMP_1', sie$migrt$pkg.obten_var_page(11963, 'Insert'), 103783, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 426875456272187918, 'O', null, null, null, null, 'N', null, 'Chaîne de substitution', 'P34840_ELEMN_SUBST_MESG', sie$migrt$pkg.obten_var_page(11963, 'Insert'), 103784, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 426875635174187919, 'O', null, null, null, null, 'O', null, 'Code', 'P34840_CODE', sie$migrt$pkg.obten_var_page(11963, 'Insert'), 103785, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 426876637743187922, 'O', null, null, null, null, 'N', null, '2. Résoudre vers', 'P34840_RESLT_2', sie$migrt$pkg.obten_var_page(11963, 'Insert'), 103786, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 426876835078187922, 'O', null, null, null, null, 'N', null, '4. Résoudre vers', 'P34840_RESLT_4', sie$migrt$pkg.obten_var_page(11963, 'Insert'), 103787, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 426877043006187923, 'O', null, null, null, null, 'N', null, '5. Résoudre vers', 'P34840_RESLT_5', sie$migrt$pkg.obten_var_page(11963, 'Insert'), 103788, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 426877236674187923, 'O', null, null, null, null, 'N', null, '6. Résoudre vers', 'P34840_RESLT_6', sie$migrt$pkg.obten_var_page(11963, 'Insert'), 103789, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 426877657900187924, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P34840_SEQNC', sie$migrt$pkg.obten_var_page(11963, 'Insert'), 103790, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 426877857675187924, 'O', null, null, null, null, 'O', null, 'Ref Confg Evenm Notfb', 'P34840_REF_CONFG_EVENM_NOTFB', sie$migrt$pkg.obten_var_page(11963, 'Insert'), 103791, 'ITEM');
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('sie_13_page_item');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('sie_13_page_item');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 426878046498187924, 'O', null, null, null, null, 'O', null, 'Ident Acces', 'P34840_IDENT_ACCES', sie$migrt$pkg.obten_var_page(11963, 'Insert'), 103792, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 426877437889187923, 'O', null, null, null, null, 'N', null, '3. Résoudre vers', 'P34840_RESLT_3', sie$migrt$pkg.obten_var_page(11963, 'Insert'), 103793, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 426878254168187924, 'O', null, null, null, null, 'O', null, 'Ident Acces Formt', 'P34840_IDENT_ACCES_FORMT', sie$migrt$pkg.obten_var_page(11963, 'Insert'), 103794, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 426878434950187925, 'O', null, null, null, null, 'N', null, '[P34840_RESLT_1]', 'P34840_RESLT_1', sie$migrt$pkg.obten_var_page(11963, 'Insert'), 103795, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 426865556749450034, 'O', null, null, null, null, 'N', null, 'Chaîne de substitution', 'P34830_ELEMN_SUBST_MESG', sie$migrt$pkg.obten_var_page(11483, 'Insert'), 103800, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 426681754050061576, 'O', null, null, null, null, 'N', null, '[P34830_RESLT_1]', 'P34830_RESLT_1', sie$migrt$pkg.obten_var_page(11483, 'Insert'), 103801, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 419924322702179779, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', sie$migrt$pkg.obten_var_page(11583, 'Insert'), 109571, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 423323306032885501, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(11963, 'Insert'), 109572, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 423323515208885503, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', sie$migrt$pkg.obten_var_page(11963, 'Insert'), 109573, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 423477662285512864, 'O', null, null, null, null, 'O', null, '[P19041_SEQNC]', 'P19041_SEQNC', sie$migrt$pkg.obten_var_page(11583, 'Insert'), 82463, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 423477851681519237, 'O', null, null, null, null, 'O', null, 'Application du modèle de recherche', 'P19041_REF_APLIC_MODL_RECHR', sie$migrt$pkg.obten_var_page(11583, 'Insert'), 82464, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 423478142377544954, 'O', null, null, null, null, 'O', null, 'Attribut de la structure applicative', 'P19041_REF_ATRIB_STRUC_APLIC', sie$migrt$pkg.obten_var_page(11583, 'Insert'), 82465, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 423478464241579641, 'O', null, null, null, null, 'O', null, 'Patron de recherche', 'P19041_REF_PATRN_RECHR', sie$migrt$pkg.obten_var_page(11583, 'Insert'), 82466, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 423478735891599826, 'O', null, null, null, null, 'O', null, 'Ordre d''execution', 'P19041_ORDRE_EXECT', sie$migrt$pkg.obten_var_page(11583, 'Insert'), 82467, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 423478962903607618, 'O', null, null, null, null, 'O', null, 'Pertinence', 'P19041_PERTN', sie$migrt$pkg.obten_var_page(11583, 'Insert'), 82468, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 47784158224940240, 'N', null, null, null, null, 'N', null, 'Appliquer', 'SAVE', sie$migrt$pkg.obten_var_page(10764, 'Insert'), 109469, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 47783957506940237, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(10764, 'Insert'), 109470, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 21314028482666003, 'N', null, null, null, null, 'N', null, 'Créer', 'CREER', sie$migrt$pkg.obten_var_page(10765, 'Insert'), 109471, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 47553241483534633, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', sie$migrt$pkg.obten_var_page(10767, 'Insert'), 109472, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 21256535261352890, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', sie$migrt$pkg.obten_var_page(10769, 'Insert'), 109473, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 21256830189352890, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(10769, 'Insert'), 109474, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 21256435566352890, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', sie$migrt$pkg.obten_var_page(10769, 'Insert'), 109475, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 21256642070352890, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', sie$migrt$pkg.obten_var_page(10769, 'Insert'), 109476, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 18805541362464536, 'N', null, null, null, null, 'N', null, 'Créer', 'CREER', sie$migrt$pkg.obten_var_page(10771, 'Insert'), 109477, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 21154216945227431, 'N', null, null, null, null, 'N', null, 'Ajouter', 'ADD', sie$migrt$pkg.obten_var_page(10772, 'Insert'), 109478, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 21147542117098638, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', sie$migrt$pkg.obten_var_page(10772, 'Insert'), 109479, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 21147819917098639, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(10772, 'Insert'), 109480, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 21147435966098638, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', sie$migrt$pkg.obten_var_page(10772, 'Insert'), 109481, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 21147623945098638, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', sie$migrt$pkg.obten_var_page(10772, 'Insert'), 109482, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 21154136737227431, 'N', null, null, null, null, 'N', null, 'Supprimer', 'MULTI_ROW_DELETE', sie$migrt$pkg.obten_var_page(10772, 'Insert'), 109483, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 421652920271788257, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(10774, 'Insert'), 109484, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 421653406896793935, 'N', null, null, null, null, 'N', null, 'Appliquer', 'DEFNR', sie$migrt$pkg.obten_var_page(10774, 'Insert'), 109485, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 21315236305679306, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', sie$migrt$pkg.obten_var_page(10777, 'Insert'), 109486, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 21315519347679306, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(10777, 'Insert'), 109487, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 21315131190679306, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', sie$migrt$pkg.obten_var_page(10777, 'Insert'), 109488, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 21315340920679306, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', sie$migrt$pkg.obten_var_page(10777, 'Insert'), 109489, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 12963525085662021, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', sie$migrt$pkg.obten_var_page(10781, 'Insert'), 109490, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 12963742065662022, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(10781, 'Insert'), 109491, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 12963933994662022, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', sie$migrt$pkg.obten_var_page(10781, 'Insert'), 109492, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 12964130561662022, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', sie$migrt$pkg.obten_var_page(10781, 'Insert'), 109493, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 44937950124589419, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', sie$migrt$pkg.obten_var_page(10782, 'Insert'), 109494, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 44938271398589420, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(10782, 'Insert'), 109495, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 44937853239589419, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', sie$migrt$pkg.obten_var_page(10782, 'Insert'), 109496, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 44943447918599286, 'N', null, null, null, null, 'N', null, 'Enregistrer et ajouter', 'CREATE_ADD', sie$migrt$pkg.obten_var_page(10782, 'Insert'), 109497, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 44938041589589419, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', sie$migrt$pkg.obten_var_page(10782, 'Insert'), 109498, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 421659219728948947, 'N', null, null, null, null, 'N', null, 'Modifier le mot de passe', 'P12020_MOT_PASSE', sie$migrt$pkg.obten_var_page(10782, 'Insert'), 109499, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 47032943616806984, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(10783, 'Insert'), 109500, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 12971540060664362, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', sie$migrt$pkg.obten_var_page(10784, 'Insert'), 109501, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 46821657643403064, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', sie$migrt$pkg.obten_var_page(10785, 'Insert'), 109502, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 46792965290782400, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', sie$migrt$pkg.obten_var_page(10786, 'Insert'), 109503, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 47575563160672690, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', sie$migrt$pkg.obten_var_page(10787, 'Insert'), 109504, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 47575963373672692, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(10787, 'Insert'), 109505, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 47575746666672690, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', sie$migrt$pkg.obten_var_page(10787, 'Insert'), 109506, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 47575366840672690, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', sie$migrt$pkg.obten_var_page(10787, 'Insert'), 109507, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 20827533416435251, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', sie$migrt$pkg.obten_var_page(10789, 'Insert'), 109508, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 20827835614435252, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(10789, 'Insert'), 109509, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 20827440218435251, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', sie$migrt$pkg.obten_var_page(10789, 'Insert'), 109510, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 20827627445435251, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', sie$migrt$pkg.obten_var_page(10789, 'Insert'), 109511, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 20824841696039803, 'N', null, null, null, null, 'N', null, 'Créer', 'CREAT', sie$migrt$pkg.obten_var_page(10790, 'Insert'), 109512, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 19421419710924115, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', sie$migrt$pkg.obten_var_page(10792, 'Insert'), 109513, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 19421743568924115, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(10792, 'Insert'), 109514, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 19421341536924115, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', sie$migrt$pkg.obten_var_page(10792, 'Insert'), 109515, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 19421546187924115, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', sie$migrt$pkg.obten_var_page(10792, 'Insert'), 109516, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 12974039960669779, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', sie$migrt$pkg.obten_var_page(10793, 'Insert'), 109517, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 12974246998669780, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(10793, 'Insert'), 109518, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 453163550748239325, 'O', null, null, null, null, 'O', null, 'Nombre minimum occurences', 'P35011_NOMBR_MINM_OCURN_INTER', sie$migrt$pkg.obten_var_page(52125, 'Insert'), 583525, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 453163753474239325, 'O', null, null, null, null, 'O', null, 'Nombre maximum occurences', 'P35011_NOMBR_MAXM_OCURN_INTER', sie$migrt$pkg.obten_var_page(52125, 'Insert'), 583526, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 453163937254239326, 'O', null, null, null, null, 'O', null, 'Type champ réponse', 'P35011_REF_DV_TYPE_CHAMP_REPNS', sie$migrt$pkg.obten_var_page(52125, 'Insert'), 583527, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 453164359641239326, 'O', null, null, null, null, 'O', null, 'Nombre caractères', 'P35011_NOMBR_CARCT_REPNS', sie$migrt$pkg.obten_var_page(52125, 'Insert'), 583529, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 453164532763239326, 'O', null, null, null, null, 'O', null, 'Masque', 'P35011_REF_DV_MASQ_FORMT_REPNS', sie$migrt$pkg.obten_var_page(52125, 'Insert'), 583530, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 453164757979239326, 'O', null, null, null, null, 'O', null, 'Largeur champ', 'P35011_LARGR_REPNS', sie$migrt$pkg.obten_var_page(52125, 'Insert'), 583531, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 453164948934239326, 'O', null, null, null, null, 'O', null, 'Nombre colonnes', 'P35011_NOMBR_COLN_REPNS', sie$migrt$pkg.obten_var_page(52125, 'Insert'), 583532, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 453165138150239327, 'O', null, null, null, null, 'O', null, 'Nombre rangées', 'P35011_NOMBR_RANGE_REPNS', sie$migrt$pkg.obten_var_page(52125, 'Insert'), 583533, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 453165351543239327, 'O', null, null, null, null, 'O', null, 'Autre réponse', 'P35011_INDIC_AUTRE', sie$migrt$pkg.obten_var_page(52125, 'Insert'), 583534, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 453165545385239327, 'O', null, null, null, null, 'O', null, 'Type champ réponse', 'P35011_REF_DV_TYPE_CHAMP_AUTRE', sie$migrt$pkg.obten_var_page(52125, 'Insert'), 583535, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 453165741063239328, 'O', null, null, null, null, 'O', null, 'Nombre caractère', 'P35011_NOMBR_CARCT_AUTRE', sie$migrt$pkg.obten_var_page(52125, 'Insert'), 583536, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 453165944886239328, 'O', null, null, null, null, 'O', null, 'Masque', 'P35011_REF_DV_MASQ_FORMT_AUTRE', sie$migrt$pkg.obten_var_page(52125, 'Insert'), 583537, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 453166135049239328, 'O', null, null, null, null, 'O', null, 'Largeur champ', 'P35011_LARGR_AUTRE', sie$migrt$pkg.obten_var_page(52125, 'Insert'), 583538, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 453166363502239328, 'O', null, null, null, null, 'O', null, 'Nombre colonnes', 'P35011_NOMBR_COLN_AUTRE', sie$migrt$pkg.obten_var_page(52125, 'Insert'), 583539, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 453166535319239329, 'O', null, null, null, null, 'O', null, 'Nombre rangées', 'P35011_NOMBR_RANGE_AUTRE', sie$migrt$pkg.obten_var_page(52125, 'Insert'), 583540, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 453167755649239331, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P35011_SEQNC', sie$migrt$pkg.obten_var_page(52125, 'Insert'), 583541, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 449614214838936910, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(52125, 'Insert'), 583542, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 449614426762936911, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', sie$migrt$pkg.obten_var_page(52125, 'Insert'), 583543, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 449614609442936911, 'N', null, null, null, null, 'N', null, 'Appliquer', 'SAVE', sie$migrt$pkg.obten_var_page(52125, 'Insert'), 583544, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 449614832239936911, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', sie$migrt$pkg.obten_var_page(52125, 'Insert'), 583545, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 12974440396669780, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', sie$migrt$pkg.obten_var_page(10793, 'Insert'), 109519, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 12974628640669780, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', sie$migrt$pkg.obten_var_page(10793, 'Insert'), 109520, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 21170335386943690, 'N', null, null, null, null, 'N', null, 'Créer', 'CREAT', sie$migrt$pkg.obten_var_page(10794, 'Insert'), 109521, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 12961025750657680, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', sie$migrt$pkg.obten_var_page(10796, 'Insert'), 109522, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 46830871356480037, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', sie$migrt$pkg.obten_var_page(10797, 'Insert'), 109523, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 46831263830480037, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(10797, 'Insert'), 109524, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 46831044440480037, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', sie$migrt$pkg.obten_var_page(10797, 'Insert'), 109525, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 46830670629480036, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', sie$migrt$pkg.obten_var_page(10797, 'Insert'), 109526, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 46795041331787497, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', sie$migrt$pkg.obten_var_page(10798, 'Insert'), 109527, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 46795452465787497, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(10798, 'Insert'), 109528, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 46795252837787497, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', sie$migrt$pkg.obten_var_page(10798, 'Insert'), 109529, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 46794853159787495, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', sie$migrt$pkg.obten_var_page(10798, 'Insert'), 109530, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 83362727510153045, 'N', null, null, null, null, 'N', null, 'Supprimer', 'MULTI_ROW_DELETE', sie$migrt$pkg.obten_var_page(10798, 'Insert'), 109531, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 83362808150153045, 'N', null, null, null, null, 'N', null, 'Ajouter', 'ADD', sie$migrt$pkg.obten_var_page(10798, 'Insert'), 109532, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 99832702727524388, 'N', null, null, null, null, 'N', null, 'Éditer', 'EDITR_GROUP', sie$migrt$pkg.obten_var_page(10798, 'Insert'), 109533, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 99930603204533994, 'N', null, null, null, null, 'N', null, 'Éditer', 'EDITR_UTILS', sie$migrt$pkg.obten_var_page(10798, 'Insert'), 109534, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 294591624407421332, 'N', null, null, null, null, 'N', null, 'Éditer', 'EDITR_DROIT', sie$migrt$pkg.obten_var_page(10798, 'Insert'), 109535, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 21514429363384627, 'N', null, null, null, null, 'N', null, 'Créer', 'CREAT', sie$migrt$pkg.obten_var_page(10799, 'Insert'), 109536, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 418927901783132831, 'N', null, null, null, null, 'N', null, 'Appliquer', 'SUBMIT', sie$migrt$pkg.obten_var_page(11385, 'Insert'), 109537, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 419073002881985767, 'N', null, null, null, null, 'N', null, 'Créer', 'CRÉER', sie$migrt$pkg.obten_var_page(11423, 'Insert'), 109538, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 419069305089810725, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(11424, 'Insert'), 109539, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 419069111226810724, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', sie$migrt$pkg.obten_var_page(11424, 'Insert'), 109540, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 423459636931550036, 'O', null, null, null, null, 'O', null, 'Nombre maximum de résultats', 'P19040_NOMBR_MAXIM_RESLT', sie$migrt$pkg.obten_var_page(11564, 'Insert'), 82345, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 423451037297634592, 'O', null, null, null, null, 'O', null, 'Modèle de recherche', 'P19040_REF_MODL_RECHR', sie$migrt$pkg.obten_var_page(11564, 'Insert'), 82346, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 423451239852644823, 'O', null, null, null, null, 'O', null, 'Structure applicative de la recherche ', 'P19040_REF_STRUC_APLIC_RECHR', sie$migrt$pkg.obten_var_page(11564, 'Insert'), 82347, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 423451463017698842, 'O', null, null, null, null, 'O', null, 'Lien ', 'P19040_REF_STRUC_APLIC_LIEN', sie$migrt$pkg.obten_var_page(11564, 'Insert'), 82348, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 423450843006598456, 'O', null, null, null, null, 'O', null, '[P19040_SEQNC]', 'P19040_SEQNC', sie$migrt$pkg.obten_var_page(11564, 'Insert'), 82349, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 419069023647810724, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', sie$migrt$pkg.obten_var_page(11424, 'Insert'), 109541, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 419068923885810724, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', sie$migrt$pkg.obten_var_page(11424, 'Insert'), 109542, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 87241653874491700, 'O', null, null, null, null, 'N', null, '[P12131_MODE]', 'P12131_MODE', sie$migrt$pkg.obten_var_page(10798, 'Insert'), 40757, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 419107710491716766, 'N', null, null, null, null, 'N', null, 'Créer', 'CRÉER', sie$migrt$pkg.obten_var_page(11443, 'Insert'), 109543, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 419118226166735251, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(11444, 'Insert'), 109544, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 419143108497393210, 'N', null, null, null, null, 'N', null, 'Créer', 'CREAT_CONFG', sie$migrt$pkg.obten_var_page(11444, 'Insert'), 109545, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 423357716113908129, 'N', null, null, null, null, 'N', null, 'Éléments substitution', 'AFICH_ELEMN_SUBST_MESG', sie$migrt$pkg.obten_var_page(11446, 'Insert'), 109546, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 423335122021244107, 'N', null, null, null, null, 'N', null, 'Ajouter', 'CREAT_DESTN_CONFIG', sie$migrt$pkg.obten_var_page(11446, 'Insert'), 109547, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 420297926943999494, 'N', null, null, null, null, 'N', null, 'Supprimer', 'SUPRM_ELEMN_CONFIG', sie$migrt$pkg.obten_var_page(11446, 'Insert'), 109548, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 419646008607820495, 'N', null, null, null, null, 'N', null, 'Ajouter', 'CREAT_ELEMN_CONFIG', sie$migrt$pkg.obten_var_page(11446, 'Insert'), 109549, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 419132315274178991, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(11446, 'Insert'), 109550, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 419132103809178991, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', sie$migrt$pkg.obten_var_page(11446, 'Insert'), 109551, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 419132008074178991, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', sie$migrt$pkg.obten_var_page(11446, 'Insert'), 109552, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 419131925026178991, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', sie$migrt$pkg.obten_var_page(11446, 'Insert'), 109553, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 420320005817258104, 'N', null, null, null, null, 'N', null, 'Supprimer', 'SUPRM_DESTN_CONFG', sie$migrt$pkg.obten_var_page(11446, 'Insert'), 109554, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 419631313768686222, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(11483, 'Insert'), 109555, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 419631932723686225, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', sie$migrt$pkg.obten_var_page(11483, 'Insert'), 109556, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 419839530469182566, 'N', null, null, null, null, 'N', null, 'Créer', 'CREER', sie$migrt$pkg.obten_var_page(11544, 'Insert'), 109557, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 419842117843292486, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(11545, 'Insert'), 109558, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 419842430094305463, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', sie$migrt$pkg.obten_var_page(11545, 'Insert'), 109559, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 419842722045322079, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', sie$migrt$pkg.obten_var_page(11545, 'Insert'), 109560, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 419843109148337265, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', sie$migrt$pkg.obten_var_page(11545, 'Insert'), 109561, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 419894829676093125, 'N', null, null, null, null, 'N', null, 'Créer', 'CRÉER', sie$migrt$pkg.obten_var_page(11545, 'Insert'), 109562, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 419922304385127134, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE1', sie$migrt$pkg.obten_var_page(11564, 'Insert'), 109563, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 419896810863229591, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(11564, 'Insert'), 109564, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 419897020691241865, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', sie$migrt$pkg.obten_var_page(11564, 'Insert'), 109565, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 419897224631252543, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', sie$migrt$pkg.obten_var_page(11564, 'Insert'), 109566, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 419897417836260052, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', sie$migrt$pkg.obten_var_page(11564, 'Insert'), 109567, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 419923428888153198, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(11583, 'Insert'), 109568, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 419923725556161614, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', sie$migrt$pkg.obten_var_page(11583, 'Insert'), 109569, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 419924023609170514, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', sie$migrt$pkg.obten_var_page(11583, 'Insert'), 109570, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 453162554487239322, 'O', null, null, null, null, 'O', null, 'Réponse obligatoire', 'P35011_INDIC_REPNS_OBLIG', sie$migrt$pkg.obten_var_page(52125, 'Insert'), 583520, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 453162737842239322, 'O', null, null, null, null, 'O', null, 'Nom', 'P35011_NOM', sie$migrt$pkg.obten_var_page(52125, 'Insert'), 583521, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 453162955916239324, 'O', null, null, null, null, 'O', null, 'Intervalle', 'P35011_INDIC_INTER', sie$migrt$pkg.obten_var_page(52125, 'Insert'), 583522, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 453163148180239325, 'O', null, null, null, null, 'O', null, 'Type donnée saisie', 'P35011_REF_DV_TYPE_DON_SAIS', sie$migrt$pkg.obten_var_page(52125, 'Insert'), 583523, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 453163364235239325, 'O', null, null, null, null, 'O', null, 'Réponses multiples', 'P35011_INDIC_REPNS_MULTP', sie$migrt$pkg.obten_var_page(52125, 'Insert'), 583524, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 510889837540116463, 'O', null, null, null, null, 'O', null, 'Code utilisateur pour la base de données', 'P12020_CODE_UTILS_BASE_DON', sie$migrt$pkg.obten_var_page(10782, 'Insert'), 585934, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 422686155749481413, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P34820_SEQNC', sie$migrt$pkg.obten_var_page(11446, 'Insert'), 71096, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 422686342428481421, 'O', null, null, null, null, 'O', null, 'Type', 'P34820_REF_TYPE_COMNC', sie$migrt$pkg.obten_var_page(11446, 'Insert'), 71097, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 422686535984481425, 'O', null, null, null, null, 'O', null, 'Objet', 'P34820_OBJET', sie$migrt$pkg.obten_var_page(11446, 'Insert'), 71098, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 422686748719481425, 'O', null, null, null, null, 'O', null, 'Message', 'P34820_MESG', sie$migrt$pkg.obten_var_page(11446, 'Insert'), 71099, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 422686956080481426, 'O', null, null, null, null, 'O', null, 'Ref Evenm Notfb', 'P34820_REF_EVENM_NOTFB', sie$migrt$pkg.obten_var_page(11446, 'Insert'), 71100, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 422687350627481426, 'O', null, null, null, null, 'O', null, 'Nom', 'P34820_NOM', sie$migrt$pkg.obten_var_page(11446, 'Insert'), 71102, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 422687563995481426, 'O', null, null, null, null, 'O', null, 'Description', 'P34820_DESCR', sie$migrt$pkg.obten_var_page(11446, 'Insert'), 71103, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 426620653369031379, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P34830_SEQNC', sie$migrt$pkg.obten_var_page(11483, 'Insert'), 103008, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 426620862200031385, 'O', null, null, null, null, 'O', null, 'Ref Confg Evenm Notfb', 'P34830_REF_CONFG_EVENM_NOTFB', sie$migrt$pkg.obten_var_page(11483, 'Insert'), 103009, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 426621040742031386, 'O', null, null, null, null, 'O', null, 'Code', 'P34830_CODE', sie$migrt$pkg.obten_var_page(11483, 'Insert'), 103010, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 426621262805031386, 'O', null, null, null, null, 'O', null, 'Ident Acces', 'P34830_IDENT_ACCES', sie$migrt$pkg.obten_var_page(11483, 'Insert'), 103011, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 426621436355031387, 'O', null, null, null, null, 'O', null, 'Ident Acces Formt', 'P34830_IDENT_ACCES_FORMT', sie$migrt$pkg.obten_var_page(11483, 'Insert'), 103012, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 453306048399574235, 'O', null, null, null, null, 'O', null, 'Utilisateur', 'P12011_REF_UTILS', sie$migrt$pkg.obten_var_page(52163, 'Insert'), 583570, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 453306263245574238, 'O', null, null, null, null, 'O', null, 'Ref Domn', 'P12011_REF_DOMN', sie$migrt$pkg.obten_var_page(52163, 'Insert'), 583571, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 453306455409574238, 'O', null, null, null, null, 'O', null, 'Début effectivité', 'P12011_DATE_DEBUT_EFECT', sie$migrt$pkg.obten_var_page(52163, 'Insert'), 583572, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 48759095828712141, 'O', null, null, null, null, 'N', null, 'Libl Contx', 'P12010_LIBL_CONTX', sie$migrt$pkg.obten_var_page(10763, 'Insert'), 36371, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 48759275180715664, 'O', null, null, null, null, 'N', null, '&P12010_LIBL_CONTX.', 'P12010_CONTX', sie$migrt$pkg.obten_var_page(10763, 'Insert'), 36372, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 48764197484807267, 'O', null, null, null, null, 'N', null, 'Struc Admin', 'P12181_STRUC_ADMIN', sie$migrt$pkg.obten_var_page(10764, 'Insert'), 36374, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 51337091214242659, 'O', null, null, null, null, 'N', null, '[P12181_MEMBR_STRUC]', 'P12181_MEMBR_STRUC', sie$migrt$pkg.obten_var_page(10764, 'Insert'), 36375, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 51337274853242663, 'O', null, null, null, null, 'N', null, 'Structure', 'P12181_CONTX', sie$migrt$pkg.obten_var_page(10764, 'Insert'), 36376, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 20867865856555143, 'O', null, null, null, null, 'N', null, '[P30010_SEQNC]', 'P30010_SEQNC', sie$migrt$pkg.obten_var_page(10766, 'Insert'), 36380, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 453306641772574238, 'O', null, null, null, null, 'O', null, 'Fin effectivité', 'P12011_DATE_FIN_EFECT', sie$migrt$pkg.obten_var_page(52163, 'Insert'), 583573, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 449588817624511139, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', sie$migrt$pkg.obten_var_page(52123, 'Insert'), 583508, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 449755816424282365, 'N', null, null, null, null, 'N', null, 'Lier', 'LIER', sie$migrt$pkg.obten_var_page(10763, 'Insert'), 583568, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 453305847515574226, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P12011_SEQNC', sie$migrt$pkg.obten_var_page(52163, 'Insert'), 583569, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 449752501089271802, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', sie$migrt$pkg.obten_var_page(52163, 'Insert'), 583575, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 24869053315981727, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P34710_SEQNC', sie$migrt$pkg.obten_var_page(10777, 'Insert'), 36310, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 24869265452981734, 'O', null, null, null, null, 'O', null, 'Code', 'P34710_CODE', sie$migrt$pkg.obten_var_page(10777, 'Insert'), 36311, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 24869456683981735, 'O', null, null, null, null, 'O', null, 'Nom', 'P34710_NOM', sie$migrt$pkg.obten_var_page(10777, 'Insert'), 36312, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 24869668403981736, 'O', null, null, null, null, 'O', null, 'Description', 'P34710_DESCR', sie$migrt$pkg.obten_var_page(10777, 'Insert'), 36313, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 24869866837981736, 'O', null, null, null, null, 'O', null, 'Numéro expéditeur', 'P34710_NUMR', sie$migrt$pkg.obten_var_page(10777, 'Insert'), 36314, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 24870068901981737, 'O', null, null, null, null, 'O', null, 'Profil de courriel expéditeur', 'P34710_REF_PROFL_COURL', sie$migrt$pkg.obten_var_page(10777, 'Insert'), 36315, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 24870279207981737, 'O', null, null, null, null, 'O', null, '[P34710_REF_DOMN]', 'P34710_REF_DOMN', sie$migrt$pkg.obten_var_page(10777, 'Insert'), 36316, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 25306969741871775, 'O', null, null, null, null, 'O', null, 'Page de garde ', 'P34710_REF_PUBLC_PAGE_GARDE', sie$migrt$pkg.obten_var_page(10777, 'Insert'), 36317, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 422481057225435252, 'O', null, null, null, null, 'N', null, 'Application:', 'P102_APPLICATION_ID', sie$migrt$pkg.obten_var_page(11385, 'Insert'), 65975, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 422481564309435255, 'O', null, null, null, null, 'N', null, 'Page:', 'P102_PAGE_ID', sie$migrt$pkg.obten_var_page(11385, 'Insert'), 65976, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 422482063955435256, 'O', null, null, null, null, 'N', null, '[P102_A]', 'P102_A', sie$migrt$pkg.obten_var_page(11385, 'Insert'), 65977, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 422482241849435256, 'O', null, null, null, null, 'N', null, 'Commentaire', 'P102_FEEDBACK', sie$migrt$pkg.obten_var_page(11385, 'Insert'), 65978, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 422482763985435256, 'O', null, null, null, null, 'N', null, '[P102_X]', 'P102_X', sie$migrt$pkg.obten_var_page(11385, 'Insert'), 65979, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 422482932833435256, 'O', null, null, null, null, 'N', null, 'Type de commentaire', 'P102_FEEDBACK_TYPE', sie$migrt$pkg.obten_var_page(11385, 'Insert'), 65980, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 422483461629435256, 'O', null, null, null, null, 'N', null, '[P102_Y]', 'P102_Y', sie$migrt$pkg.obten_var_page(11385, 'Insert'), 65981, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 24810360431655312, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P34210_SEQNC', sie$migrt$pkg.obten_var_page(10769, 'Insert'), 36393, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 24810547780655319, 'O', null, null, null, null, 'O', null, 'Code', 'P34210_CODE', sie$migrt$pkg.obten_var_page(10769, 'Insert'), 36394, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 24810748028655320, 'O', null, null, null, null, 'O', null, 'Nom', 'P34210_NOM', sie$migrt$pkg.obten_var_page(10769, 'Insert'), 36395, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 24810972226655320, 'O', null, null, null, null, 'O', null, 'Ref Evenm Notfb', 'P34210_REF_EVENM_NOTFB', sie$migrt$pkg.obten_var_page(10769, 'Insert'), 36396, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 24701372468401060, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P34500_SEQNC', sie$migrt$pkg.obten_var_page(10772, 'Insert'), 36402, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 24701567107401066, 'O', null, null, null, null, 'O', null, 'Code', 'P34500_CODE', sie$migrt$pkg.obten_var_page(10772, 'Insert'), 36403, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 24701753242401066, 'O', null, null, null, null, 'O', null, 'Nom', 'P34500_NOM', sie$migrt$pkg.obten_var_page(10772, 'Insert'), 36404, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 24701958943401067, 'O', null, null, null, null, 'O', null, 'Description', 'P34500_DESCR', sie$migrt$pkg.obten_var_page(10772, 'Insert'), 36405, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 24702150586401067, 'O', null, null, null, null, 'O', null, 'Type', 'P34500_REF_TYPE_COMNC', sie$migrt$pkg.obten_var_page(10772, 'Insert'), 36406, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 24702378371401067, 'O', null, null, null, null, 'O', null, 'Indic Systm', 'P34500_INDIC_SYSTM', sie$migrt$pkg.obten_var_page(10772, 'Insert'), 36407, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 16930953643902987, 'O', null, null, null, null, 'N', null, '[P30040_SEQNC]', 'P30040_SEQNC', sie$migrt$pkg.obten_var_page(10773, 'Insert'), 36414, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 49229274809790508, 'O', null, null, null, null, 'O', null, 'Séquence', 'P12030_SEQNC', sie$migrt$pkg.obten_var_page(10774, 'Insert'), 36415, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 49234092301815122, 'O', null, null, null, null, 'N', null, 'Mot de passe', 'P12030_NOUV_MOT_PASSE', sie$migrt$pkg.obten_var_page(10774, 'Insert'), 36420, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 49234280457815124, 'O', null, null, null, null, 'N', null, 'Confirmation', 'P12030_CONFR_MOT_PASSE', sie$migrt$pkg.obten_var_page(10774, 'Insert'), 36421, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 24838259102481552, 'O', null, null, null, null, 'O', null, 'Code', 'P20010_CODE', sie$migrt$pkg.obten_var_page(10781, 'Insert'), 36449, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 24838468027481553, 'O', null, null, null, null, 'O', null, 'Nom', 'P20010_NOM', sie$migrt$pkg.obten_var_page(10781, 'Insert'), 36450, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 24838660137481553, 'O', null, null, null, null, 'O', null, 'Descritpion', 'P20010_DESCR', sie$migrt$pkg.obten_var_page(10781, 'Insert'), 36451, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 25375267054774219, 'O', null, null, null, null, 'O', null, 'Serveur', 'P20010_SERVR_ENTRA', sie$migrt$pkg.obten_var_page(10781, 'Insert'), 36452, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 20868257676562170, 'O', null, null, null, null, 'N', null, '[P30030_SEQNC]', 'P30030_SEQNC', sie$migrt$pkg.obten_var_page(10776, 'Insert'), 36425, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 18914372997698109, 'O', null, null, null, null, 'N', null, '[SADA]', 'SADA', sie$migrt$pkg.obten_var_page(10778, 'Insert'), 36430, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 48459372280779017, 'O', null, null, null, null, 'N', null, 'Test', 'SIDF', sie$migrt$pkg.obten_var_page(10778, 'Insert'), 36431, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 48459599754779019, 'O', null, null, null, null, 'N', null, '[SSPC]', 'SSPC', sie$migrt$pkg.obten_var_page(10778, 'Insert'), 36432, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 48459774744779019, 'O', null, null, null, null, 'N', null, '[SCPC]', 'SCPC', sie$migrt$pkg.obten_var_page(10778, 'Insert'), 36433, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 48798593166398500, 'O', null, null, null, null, 'N', null, '[SAPC]', 'SAPC', sie$migrt$pkg.obten_var_page(10778, 'Insert'), 36434, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 70283077157455164, 'O', null, null, null, null, 'N', null, 'SNPI', 'SNPI', sie$migrt$pkg.obten_var_page(10778, 'Insert'), 36435, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 93023393554622797, 'O', null, null, null, null, 'N', null, '[SCPI]', 'SCPI', sie$migrt$pkg.obten_var_page(10778, 'Insert'), 36436, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 93023598749624320, 'O', null, null, null, null, 'N', null, '[SSPI]', 'SSPI', sie$migrt$pkg.obten_var_page(10778, 'Insert'), 36437, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 93023803597625667, 'O', null, null, null, null, 'N', null, '[SAPI]', 'SAPI', sie$migrt$pkg.obten_var_page(10778, 'Insert'), 36438, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 16844378771037104, 'O', null, null, null, null, 'N', null, '[P30050_SEQNC]', 'P30050_SEQNC', sie$migrt$pkg.obten_var_page(10780, 'Insert'), 36439, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 16517075225964441, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P20010_SEQNC', sie$migrt$pkg.obten_var_page(10781, 'Insert'), 36440, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 16517471978964443, 'O', null, null, null, null, 'O', null, 'Serveur', 'P20010_SERVR_SORTN', sie$migrt$pkg.obten_var_page(10781, 'Insert'), 36442, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 16517680227964443, 'O', null, null, null, null, 'O', null, 'Port', 'P20010_PORT_SORTN', sie$migrt$pkg.obten_var_page(10781, 'Insert'), 36443, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 16518071290964443, 'O', null, null, null, null, 'O', null, 'Nom expéditeur', 'P20010_NOM_ENVOY', sie$migrt$pkg.obten_var_page(10781, 'Insert'), 36444, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 16518270419964443, 'O', null, null, null, null, 'O', null, 'Adresse expéditeur', 'P20010_ADRES_ENVOY', sie$migrt$pkg.obten_var_page(10781, 'Insert'), 36445, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 16518461498964443, 'O', null, null, null, null, 'O', null, 'Méthode authentification', 'P20010_AUTHE_METHD_SORTN', sie$migrt$pkg.obten_var_page(10781, 'Insert'), 36446, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 16518674329964443, 'O', null, null, null, null, 'O', null, 'Utilisateur authentification', 'P20010_AUTHE_USAGR_SORTN', sie$migrt$pkg.obten_var_page(10781, 'Insert'), 36447, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 16518853265964443, 'O', null, null, null, null, 'O', null, 'Mot de passe authentification', 'P20010_AUTHE_MDP_SORTN', sie$migrt$pkg.obten_var_page(10781, 'Insert'), 36448, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 25375456491774220, 'O', null, null, null, null, 'O', null, 'Port', 'P20010_PORT_ENTRA', sie$migrt$pkg.obten_var_page(10781, 'Insert'), 36453, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 25375666453774220, 'O', null, null, null, null, 'O', null, 'Méthode authentification', 'P20010_AUTHE_METHD_ENTRA', sie$migrt$pkg.obten_var_page(10781, 'Insert'), 36454, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 25375868672774220, 'O', null, null, null, null, 'O', null, 'Utilisateur authentification', 'P20010_AUTHE_USAGR_ENTRA', sie$migrt$pkg.obten_var_page(10781, 'Insert'), 36455, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 25376071727774220, 'O', null, null, null, null, 'O', null, 'Mot de passe authentification', 'P20010_AUTHE_MDP_ENTRA', sie$migrt$pkg.obten_var_page(10781, 'Insert'), 36456, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 16484861005644777, 'O', null, null, null, null, 'O', null, 'Courriel', 'P12020_COURL', sie$migrt$pkg.obten_var_page(10782, 'Insert'), 36461, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 48491794913891841, 'O', null, null, null, null, 'O', null, 'Séquence', 'P12020_SEQNC', sie$migrt$pkg.obten_var_page(10782, 'Insert'), 36462, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 48492004135891842, 'O', null, null, null, null, 'O', null, 'Nom', 'P12020_NOM', sie$migrt$pkg.obten_var_page(10782, 'Insert'), 36463, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 48492179448891844, 'O', null, null, null, null, 'O', null, 'Prénom', 'P12020_PRENM', sie$migrt$pkg.obten_var_page(10782, 'Insert'), 36464, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 48492579677891844, 'O', null, null, null, null, 'O', null, 'Code', 'P12020_CODE_UTILS', sie$migrt$pkg.obten_var_page(10782, 'Insert'), 36465, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 48493185874891847, 'O', null, null, null, null, 'O', null, 'Date expiration', 'P12020_DATE_EXPIR', sie$migrt$pkg.obten_var_page(10782, 'Insert'), 36466, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 48493400798891847, 'O', null, null, null, null, 'O', null, 'Compte verrouillé', 'P12020_INDIC_VERL', sie$migrt$pkg.obten_var_page(10782, 'Insert'), 36467, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 48493775768891847, 'O', null, null, null, null, 'O', null, 'Changer mot passe prochaine connexion', 'P12020_INDIC_CHANG_MOT_PASSE', sie$migrt$pkg.obten_var_page(10782, 'Insert'), 36468, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 50557086641823891, 'O', null, null, null, null, 'N', null, 'Type', 'P13053_TYPE_DEFNT_ACCES', sie$migrt$pkg.obten_var_page(10783, 'Insert'), 36479, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 50374594369705484, 'O', null, null, null, null, 'N', null, 'Espace de travail:', 'P12141_CONTX', sie$migrt$pkg.obten_var_page(10785, 'Insert'), 36489, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 50357281263172758, 'O', null, null, null, null, 'N', null, 'Espace de travail:', 'P12121_CONTX', sie$migrt$pkg.obten_var_page(10786, 'Insert'), 36491, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 51128901223975111, 'O', null, null, null, null, 'O', null, 'Séquence', 'P12336_SEQNC', sie$migrt$pkg.obten_var_page(10787, 'Insert'), 36493, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 51129100555975113, 'O', null, null, null, null, 'O', null, 'Code', 'P12336_CODE', sie$migrt$pkg.obten_var_page(10787, 'Insert'), 36494, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 51129292575975113, 'O', null, null, null, null, 'O', null, 'Nom', 'P12336_NOM', sie$migrt$pkg.obten_var_page(10787, 'Insert'), 36495, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 51129474786975113, 'O', null, null, null, null, 'O', null, 'Description', 'P12336_DESCR', sie$migrt$pkg.obten_var_page(10787, 'Insert'), 36496, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 51129675792975113, 'O', null, null, null, null, 'O', null, 'Application', 'P12336_REF_PRODT', sie$migrt$pkg.obten_var_page(10787, 'Insert'), 36497, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 20868074860557712, 'O', null, null, null, null, 'N', null, '[P30020_SEQNC]', 'P30020_SEQNC', sie$migrt$pkg.obten_var_page(10788, 'Insert'), 36502, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 24381363146737675, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P34100_SEQNC', sie$migrt$pkg.obten_var_page(10789, 'Insert'), 36503, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 24381548633737684, 'O', null, null, null, null, 'O', null, 'Code', 'P34100_CODE', sie$migrt$pkg.obten_var_page(10789, 'Insert'), 36504, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 24381763552737685, 'O', null, null, null, null, 'O', null, 'Nom', 'P34100_NOM', sie$migrt$pkg.obten_var_page(10789, 'Insert'), 36505, 'ITEM');
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('sie_13_page_item');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('sie_13_page_item');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 24381976223737686, 'O', null, null, null, null, 'O', null, 'Description', 'P34100_DESCR', sie$migrt$pkg.obten_var_page(10789, 'Insert'), 36506, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 24382151055737688, 'O', null, null, null, null, 'O', null, 'Couleur texte', 'P34100_COULR_TEXTE', sie$migrt$pkg.obten_var_page(10789, 'Insert'), 36507, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 24382366758737689, 'O', null, null, null, null, 'O', null, 'Taille texte', 'P34100_TAIL_TEXTE', sie$migrt$pkg.obten_var_page(10789, 'Insert'), 36508, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 24382555060737689, 'O', null, null, null, null, 'O', null, 'Couleur titre', 'P34100_COULR_TITRE', sie$migrt$pkg.obten_var_page(10789, 'Insert'), 36509, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 24382768211737689, 'O', null, null, null, null, 'O', null, 'Taille titre', 'P34100_TAIL_TITRE', sie$migrt$pkg.obten_var_page(10789, 'Insert'), 36510, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 24382979790737689, 'O', null, null, null, null, 'O', null, 'Temps affichage', 'P34100_TEMPS_AFICH', sie$migrt$pkg.obten_var_page(10789, 'Insert'), 36511, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 24383170224737689, 'O', null, null, null, null, 'O', null, 'Icône', 'P34100_REF_RESRC_ICON', sie$migrt$pkg.obten_var_page(10789, 'Insert'), 36512, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 24383359769737690, 'O', null, null, null, null, 'O', null, 'Format icône', 'P34100_REF_FORMT_RESRC_ICON', sie$migrt$pkg.obten_var_page(10789, 'Insert'), 36513, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 24383569178737690, 'O', null, null, null, null, 'O', null, 'Occurence icône', 'P34100_REF_OCURN_RESRC_ICON', sie$migrt$pkg.obten_var_page(10789, 'Insert'), 36514, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 24684877751424292, 'O', null, null, null, null, 'O', null, 'Type', 'P34100_REF_TYPE_COMNC', sie$migrt$pkg.obten_var_page(10789, 'Insert'), 36515, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 24688472883621542, 'O', null, null, null, null, 'N', null, '[P34100_SEQNC_TYPE_COMNC_ECRAN]', 'P34100_SEQNC_TYPE_COMNC_ECRAN', sie$migrt$pkg.obten_var_page(10789, 'Insert'), 36516, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 24742753516472224, 'O', null, null, null, null, 'O', null, 'Modèle', 'P34100_REF_MODL_COMNC', sie$migrt$pkg.obten_var_page(10789, 'Insert'), 36517, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 22975263268226537, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P12210_SEQNC', sie$migrt$pkg.obten_var_page(10792, 'Insert'), 36523, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 22975471647226543, 'O', null, null, null, null, 'O', null, 'Code', 'P12210_CODE', sie$migrt$pkg.obten_var_page(10792, 'Insert'), 36524, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 22975677159226544, 'O', null, null, null, null, 'O', null, 'Nom', 'P12210_NOM', sie$migrt$pkg.obten_var_page(10792, 'Insert'), 36525, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 22975860534226545, 'O', null, null, null, null, 'O', null, 'Description', 'P12210_DESCR', sie$migrt$pkg.obten_var_page(10792, 'Insert'), 36526, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 24845348263695958, 'O', null, null, null, null, 'O', null, 'Compte envoi télécopie défaut', 'P12210_REF_COMPT_AXIAT_DEFT', sie$migrt$pkg.obten_var_page(10792, 'Insert'), 36527, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 25059549904194159, 'O', null, null, null, null, 'O', null, 'Profil courriel notification', 'P12210_REF_PROFL_COURL_NOTFC', sie$migrt$pkg.obten_var_page(10792, 'Insert'), 36528, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 25060077440239985, 'O', null, null, null, null, 'O', null, 'Profil sms notification', 'P12210_REF_PROFL_SMS_NOTFC', sie$migrt$pkg.obten_var_page(10792, 'Insert'), 36529, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 16527763317972199, 'O', null, null, null, null, 'O', null, 'Code', 'P21010_CODE', sie$migrt$pkg.obten_var_page(10793, 'Insert'), 36534, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 16527954469972199, 'O', null, null, null, null, 'O', null, 'Nom', 'P21010_NOM', sie$migrt$pkg.obten_var_page(10793, 'Insert'), 36535, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 16528158664972199, 'O', null, null, null, null, 'O', null, 'Description', 'P21010_DESCR', sie$migrt$pkg.obten_var_page(10793, 'Insert'), 36536, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 16528348849972199, 'O', null, null, null, null, 'O', null, 'Application', 'P21010_REF_PRODT', sie$migrt$pkg.obten_var_page(10793, 'Insert'), 36537, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 16528566240972199, 'O', null, null, null, null, 'O', null, 'Profil de courriel', 'P21010_REF_PROFL_COURL', sie$migrt$pkg.obten_var_page(10793, 'Insert'), 36538, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 16528769144972201, 'O', null, null, null, null, 'O', null, 'Avertir auteur uniquement', 'P21010_INDIC_AVERT_AUTR_UNIQ', sie$migrt$pkg.obten_var_page(10793, 'Insert'), 36539, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 16529148787972201, 'O', null, null, null, null, 'N', null, '[P21010_UTILS]', 'P21010_UTILS', sie$migrt$pkg.obten_var_page(10793, 'Insert'), 36540, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 16529561940972201, 'O', null, null, null, null, 'N', null, '[P21010_GROUP_UTILS]', 'P21010_GROUP_UTILS', sie$migrt$pkg.obten_var_page(10793, 'Insert'), 36541, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 16527555135972199, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P21010_SEQNC', sie$migrt$pkg.obten_var_page(10793, 'Insert'), 36542, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 50384175810782456, 'O', null, null, null, null, 'O', null, 'Séquence', 'P12151_SEQNC', sie$migrt$pkg.obten_var_page(10797, 'Insert'), 36550, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 50384393381782456, 'O', null, null, null, null, 'O', null, 'Nom', 'P12151_NOM', sie$migrt$pkg.obten_var_page(10797, 'Insert'), 36551, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 50390488440818280, 'O', null, null, null, null, 'N', null, 'Espace de travail:', 'P12151_CONTX', sie$migrt$pkg.obten_var_page(10797, 'Insert'), 36552, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 50454681403625555, 'O', null, null, null, null, 'N', null, '[P12151_STRUC_LIE]', 'P12151_STRUC_LIE', sie$migrt$pkg.obten_var_page(10797, 'Insert'), 36553, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 51103174218812100, 'O', null, null, null, null, 'O', null, 'Type', 'P12151_REF_TYPE_STRUC', sie$migrt$pkg.obten_var_page(10797, 'Insert'), 36554, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 51244986656569952, 'O', null, null, null, null, 'O', null, 'Responsable', 'P12151_REF_RESPN', sie$migrt$pkg.obten_var_page(10797, 'Insert'), 36555, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 71505695880588303, 'O', null, null, null, null, 'O', null, 'Début effectivité', 'P12151_DEBUT_EFECT', sie$migrt$pkg.obten_var_page(10797, 'Insert'), 36556, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 71505878003592536, 'O', null, null, null, null, 'O', null, 'Fin effectivité', 'P12151_FIN_EFECT', sie$migrt$pkg.obten_var_page(10797, 'Insert'), 36557, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 103152394019791689, 'O', null, null, null, null, 'O', null, 'Défaut', 'P12151_INDIC_DEFT', sie$migrt$pkg.obten_var_page(10797, 'Insert'), 36558, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 50348400881089916, 'O', null, null, null, null, 'O', null, 'Nom', 'P12131_NOM', sie$migrt$pkg.obten_var_page(10798, 'Insert'), 36563, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 50348590852089916, 'O', null, null, null, null, 'O', null, 'Description', 'P12131_DESCR', sie$migrt$pkg.obten_var_page(10798, 'Insert'), 36564, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 50349002956089916, 'O', null, null, null, null, 'O', null, 'Séquence', 'P12131_SEQNC', sie$migrt$pkg.obten_var_page(10798, 'Insert'), 36565, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 50788182186646225, 'O', null, null, null, null, 'O', null, 'Code', 'P12131_CODE', sie$migrt$pkg.obten_var_page(10798, 'Insert'), 36568, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 60019570682550110, 'O', null, null, null, null, 'O', null, 'Ignorer groupe administrateur', 'P12131_INDIC_IGNOR_GROUP_ADMIN', sie$migrt$pkg.obten_var_page(10798, 'Insert'), 36570, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 96007876358255878, 'O', null, null, null, null, 'O', null, 'domaine', 'P12131_REF_DOMN', sie$migrt$pkg.obten_var_page(10798, 'Insert'), 36571, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 19400236901260254, 'O', null, null, null, null, 'N', null, 'Domaine', 'P101_DOMN', sie$migrt$pkg.obten_var_page(10808, 'Insert'), 36577, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 19400436664260255, 'O', null, null, null, null, 'N', null, '[P101_LANG]', 'P101_LANG', sie$migrt$pkg.obten_var_page(10808, 'Insert'), 36578, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 19400635424260255, 'O', null, null, null, null, 'N', null, '[P101_FORCE_DOMN]', 'P101_FORCE_DOMN', sie$migrt$pkg.obten_var_page(10808, 'Insert'), 36579, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 19399664018260242, 'O', null, null, null, null, 'N', null, 'Code d''utilisateur', 'P101_CODE_UTILS', sie$migrt$pkg.obten_var_page(10808, 'Insert'), 36580, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 19399860307260242, 'O', null, null, null, null, 'N', null, 'Mot de passe', 'P101_MOT_PASSE', sie$migrt$pkg.obten_var_page(10808, 'Insert'), 36581, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 19400042833260253, 'O', null, null, null, null, 'N', null, 'Connexion', 'P101_LOGIN', sie$migrt$pkg.obten_var_page(10808, 'Insert'), 36582, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 428164852725124486, 'O', null, null, null, null, 'O', null, 'Compte actif', 'P12020_INDIC_ACTIF', sie$migrt$pkg.obten_var_page(10782, 'Insert'), 110108, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 422820658471889578, 'O', null, null, null, null, 'O', null, 'SMS', 'P34820_MESG_SMS', sie$migrt$pkg.obten_var_page(11446, 'Insert'), 79374, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 423411233541694343, 'O', null, null, null, null, 'O', null, 'Code', 'P19030_CODE', sie$migrt$pkg.obten_var_page(11545, 'Insert'), 82220, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 423411455012700542, 'O', null, null, null, null, 'O', null, 'Nom', 'P19030_NOM', sie$migrt$pkg.obten_var_page(11545, 'Insert'), 82221, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 423410858213682542, 'O', null, null, null, null, 'O', null, '[P19030_SEQNC]', 'P19030_SEQNC', sie$migrt$pkg.obten_var_page(11545, 'Insert'), 82222, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 423411041028687058, 'O', null, null, null, null, 'O', null, 'Domaine', 'P19030_REF_DOMN', sie$migrt$pkg.obten_var_page(11545, 'Insert'), 82223, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 423411638174705207, 'O', null, null, null, null, 'O', null, 'Description', 'P19030_DESCR', sie$migrt$pkg.obten_var_page(11545, 'Insert'), 82224, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 423953753353245396, 'O', null, null, null, null, 'N', null, 'Ajouter', 'AJOUT_DESTN', sie$migrt$pkg.obten_var_page(11446, 'Insert'), 88178, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 241484159569255018, 'O', null, null, null, null, 'N', null, '[P0_RECHR_GLOBL]', 'P0_RECHR_GLOBL', sie$migrt$pkg.obten_var_page(10778, 'Insert'), 43728, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 423452263250840777, 'O', null, null, null, null, 'O', null, 'Affichage', 'P19040_REF_ATRIB_STRUC_APLIC_AFICH', sie$migrt$pkg.obten_var_page(11564, 'Insert'), 88196, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 426928743107054106, 'O', null, null, null, null, 'N', null, '[P34820_STRUC_APLIC]', 'P34820_STRUC_APLIC', sie$migrt$pkg.obten_var_page(11446, 'Insert'), 106360, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 426931263520258604, 'O', null, null, null, null, 'O', null, 'Défaut', 'P34820_INDIC_DEFT', sie$migrt$pkg.obten_var_page(11446, 'Insert'), 106361, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 422667863084037666, 'O', null, null, null, null, 'O', null, 'Code', 'P34810_CODE', sie$migrt$pkg.obten_var_page(11444, 'Insert'), 70052, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 422668034524037666, 'O', null, null, null, null, 'O', null, 'Nom', 'P34810_NOM', sie$migrt$pkg.obten_var_page(11444, 'Insert'), 70053, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 422668252493037667, 'O', null, null, null, null, 'O', null, 'Description', 'P34810_DESCR', sie$migrt$pkg.obten_var_page(11444, 'Insert'), 70054, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 422668443127037667, 'O', null, null, null, null, 'O', null, 'Structure applicative', 'P34810_REF_STRUC_APLIC', sie$migrt$pkg.obten_var_page(11444, 'Insert'), 70055, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 422671542291037671, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P34810_SEQNC', sie$migrt$pkg.obten_var_page(11444, 'Insert'), 70056, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 567115531932113021, 'O', null, null, null, null, 'N', null, '[P12020_MESG_AUTOR_CONXN_DERV]', 'P12020_MESG_AUTOR_CONXN_DERV', sie$migrt$pkg.obten_var_page(10782, 'Insert'), 586156, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 567113254564053302, 'O', null, null, null, null, 'N', null, '[P12020_MESG_SUPER_UTILS]', 'P12020_MESG_SUPER_UTILS', sie$migrt$pkg.obten_var_page(10782, 'Insert'), 586157, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 558613056617308383, 'O', null, null, null, null, 'O', null, '[P12131_INDIC_ACCES_GLOBL]', 'P12131_INDIC_ACCES_GLOBL', sie$migrt$pkg.obten_var_page(10798, 'Insert'), 586158, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 425879509693917010, 'N', null, null, null, null, 'N', null, 'Liste', 'LISTR_GROUP', sie$migrt$pkg.obten_var_page(10798, 'Insert'), 577090, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 425880121598929973, 'N', null, null, null, null, 'N', null, 'Liste', 'LISTR_UTILS', sie$migrt$pkg.obten_var_page(10798, 'Insert'), 577091, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 425880326100931250, 'N', null, null, null, null, 'N', null, 'Liste', 'LISTR_DROIT', sie$migrt$pkg.obten_var_page(10798, 'Insert'), 577092, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 425086303750924427, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(12064, 'Insert'), 577115, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 425086103636924427, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', sie$migrt$pkg.obten_var_page(12064, 'Insert'), 577116, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 446747156066032423, 'O', null, null, null, null, 'N', null, '[P1_SEQNC]', 'P1_SEQNC', sie$migrt$pkg.obten_var_page(10791, 'Insert'), 583348, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 446748143299057115, 'O', null, null, null, null, 'O', null, 'Nom', 'P1_NOM', sie$migrt$pkg.obten_var_page(10791, 'Insert'), 583349, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 446748347801058473, 'O', null, null, null, null, 'O', null, 'Code', 'P1_CODE', sie$migrt$pkg.obten_var_page(10791, 'Insert'), 583350, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 443197617922153878, 'N', null, null, null, null, 'N', null, 'Éditer', 'EDITR', sie$migrt$pkg.obten_var_page(10791, 'Insert'), 583351, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(11, 'Insert'), 456767237354450715, 'O', null, null, null, null, 'O', null, 'Complexité maximal', 'P12020_REF_DV_COMPL_MAXM', sie$migrt$pkg.obten_var_page(10782, 'Insert'), 585091, 'ITEM');
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin partie - sie_13_page_item');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut partie - sie_13_page_item');

merge into sie_13_page_item t
                        using tc$13$page$item tf
               on ((t.nom_apex = tf.nom_apex) and (t.ref_page = tf.ref_page or (t.ref_page is null and tf.ref_page is null) or tf.ref_page is null ))
when not matched then
              insert (t.depsm_alias_coln, t.dnr_ref_aplic, t.id_apex, t.indic_confr_sauvg, t.indic_creat, t.indic_en_creat, t.indic_en_modfc, t.indic_modfc, t.indic_rechr, t.indic_suprs, t.libl, t.nom_apex, t.ref_page, t.type_item)
              values (tf.depsm_alias_coln, tf.dnr_ref_aplic, tf.id_apex, tf.indic_confr_sauvg, tf.indic_creat, tf.indic_en_creat, tf.indic_en_modfc, tf.indic_modfc, tf.indic_rechr, tf.indic_suprs, tf.libl, tf.nom_apex, tf.ref_page, tf.type_item)
when matched then
              update set t.depsm_alias_coln = tf.depsm_alias_coln, t.dnr_ref_aplic = tf.dnr_ref_aplic, t.id_apex = tf.id_apex, t.indic_confr_sauvg = tf.indic_confr_sauvg, t.indic_creat = tf.indic_creat, t.indic_en_creat = tf.indic_en_creat, t.indic_en_modfc = tf.indic_en_modfc, t.indic_modfc = tf.indic_modfc, t.indic_rechr = tf.indic_rechr, t.indic_suprs = tf.indic_suprs, t.libl = tf.libl, t.type_item = tf.type_item
log errors into em$13_page_item
reject limit unlimited
;

declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_page_item;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Merge sur sie_13_page_item');
  end if;
end;

null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin partie - sie_13_page_item');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut partie - sie_13_page_item');
select seqnc into sie$migrt$pkg.var_page_item(81915) from sie_13_page_item where nom_apex = 'P34820_SEQNC_TYPE_COURL' and ref_page = sie$migrt$pkg.obten_var_page(11446, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(81916) from sie_13_page_item where nom_apex = 'P34820_SEQNC_TYPE_SMS' and ref_page = sie$migrt$pkg.obten_var_page(11446, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(81917) from sie_13_page_item where nom_apex = 'P34820_SEQNC_TYPE_ECRAN' and ref_page = sie$migrt$pkg.obten_var_page(11446, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(81924) from sie_13_page_item where nom_apex = 'P34830_RESLT_2' and ref_page = sie$migrt$pkg.obten_var_page(11483, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(81925) from sie_13_page_item where nom_apex = 'P34830_AFICH_RESLT_1' and ref_page = sie$migrt$pkg.obten_var_page(11483, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(81926) from sie_13_page_item where nom_apex = 'P34830_RESLT_4' and ref_page = sie$migrt$pkg.obten_var_page(11483, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(81927) from sie_13_page_item where nom_apex = 'P34830_RESLT_5' and ref_page = sie$migrt$pkg.obten_var_page(11483, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(81928) from sie_13_page_item where nom_apex = 'P34830_RESLT_6' and ref_page = sie$migrt$pkg.obten_var_page(11483, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(81929) from sie_13_page_item where nom_apex = 'P34830_CHAMP_1' and ref_page = sie$migrt$pkg.obten_var_page(11483, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(81930) from sie_13_page_item where nom_apex = 'P34830_RESLT_3' and ref_page = sie$migrt$pkg.obten_var_page(11483, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(69964) from sie_13_page_item where nom_apex = 'P34310_REF_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(11424, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(69965) from sie_13_page_item where nom_apex = 'P34310_CODE' and ref_page = sie$migrt$pkg.obten_var_page(11424, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(69966) from sie_13_page_item where nom_apex = 'P34310_NOM' and ref_page = sie$migrt$pkg.obten_var_page(11424, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(69967) from sie_13_page_item where nom_apex = 'P34310_DESCR' and ref_page = sie$migrt$pkg.obten_var_page(11424, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(69968) from sie_13_page_item where nom_apex = 'P34310_OBJET' and ref_page = sie$migrt$pkg.obten_var_page(11424, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(69969) from sie_13_page_item where nom_apex = 'P34310_CORPS_MESG' and ref_page = sie$migrt$pkg.obten_var_page(11424, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(69970) from sie_13_page_item where nom_apex = 'P34310_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(11424, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(110068) from sie_13_page_item where nom_apex = 'P20010_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(10781, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(586015) from sie_13_page_item where nom_apex = 'P12220_REF_GROUP_UTILS_FORMT' and ref_page = sie$migrt$pkg.obten_var_page(53503, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(586016) from sie_13_page_item where nom_apex = 'P12220_REF_OPERT' and ref_page = sie$migrt$pkg.obten_var_page(53503, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(586017) from sie_13_page_item where nom_apex = 'P12220_REF_OPERT_OPTIO' and ref_page = sie$migrt$pkg.obten_var_page(53503, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(586018) from sie_13_page_item where nom_apex = 'P12220_REF_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(53503, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(586019) from sie_13_page_item where nom_apex = 'P12220_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(53503, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585995) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(53503, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(586020) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(53503, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(586034) from sie_13_page_item where nom_apex = 'P12220_REF_OPERT_FORMT' and ref_page = sie$migrt$pkg.obten_var_page(53503, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(583131) from sie_13_page_item where nom_apex = 'P19030_DNR_REF_PRODT' and ref_page = sie$migrt$pkg.obten_var_page(11545, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585954) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(53483, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(87585) from sie_13_page_item where nom_apex = 'P34820_MODE' and ref_page = sie$migrt$pkg.obten_var_page(11446, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(87586) from sie_13_page_item where nom_apex = 'P34820_REF_COMPT_COURL' and ref_page = sie$migrt$pkg.obten_var_page(11446, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(87587) from sie_13_page_item where nom_apex = 'P34820_REF_COMPT_TWILI' and ref_page = sie$migrt$pkg.obten_var_page(11446, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(87589) from sie_13_page_item where nom_apex = 'P34820_RESLT_DESTN' and ref_page = sie$migrt$pkg.obten_var_page(11446, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(87590) from sie_13_page_item where nom_apex = 'P34820_CHAMP_NOM_FORMT' and ref_page = sie$migrt$pkg.obten_var_page(11446, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(87591) from sie_13_page_item where nom_apex = 'P34820_CHAMP_ADRES_COURL' and ref_page = sie$migrt$pkg.obten_var_page(11446, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(87592) from sie_13_page_item where nom_apex = 'P34820_CHAMP_NATR_COURL' and ref_page = sie$migrt$pkg.obten_var_page(11446, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(87593) from sie_13_page_item where nom_apex = 'P34820_CHAMP_NUMR_SMS' and ref_page = sie$migrt$pkg.obten_var_page(11446, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(87594) from sie_13_page_item where nom_apex = 'P34820_REF_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(11446, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585955) from sie_13_page_item where nom_apex = 'P35042_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(53484, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109589) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(10763, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(577088) from sie_13_page_item where nom_apex = 'P12020_GROUP_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(10782, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(577089) from sie_13_page_item where nom_apex = 'P12020_GROUP_DROIT' and ref_page = sie$migrt$pkg.obten_var_page(10782, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(577093) from sie_13_page_item where nom_apex = 'P12210_PROCD_AUTHE_EXTER_AFW' and ref_page = sie$migrt$pkg.obten_var_page(10792, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(577094) from sie_13_page_item where nom_apex = 'P12210_PROCD_VALD_NIV_SECRT_MP' and ref_page = sie$migrt$pkg.obten_var_page(10792, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(577095) from sie_13_page_item where nom_apex = 'P12210_MODE' and ref_page = sie$migrt$pkg.obten_var_page(10792, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(577101) from sie_13_page_item where nom_apex = 'P19030_REF_PRODT' and ref_page = sie$migrt$pkg.obten_var_page(11545, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(577102) from sie_13_page_item where nom_apex = 'P20030_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(12064, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(577103) from sie_13_page_item where nom_apex = 'P20030_SERVR' and ref_page = sie$migrt$pkg.obten_var_page(12064, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(577104) from sie_13_page_item where nom_apex = 'P20030_PORT' and ref_page = sie$migrt$pkg.obten_var_page(12064, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(577105) from sie_13_page_item where nom_apex = 'P20030_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(12064, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(577106) from sie_13_page_item where nom_apex = 'P20030_NOM_ENVOY' and ref_page = sie$migrt$pkg.obten_var_page(12064, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(577107) from sie_13_page_item where nom_apex = 'P20030_ADRES_ENVOY' and ref_page = sie$migrt$pkg.obten_var_page(12064, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(577108) from sie_13_page_item where nom_apex = 'P20030_SUJET' and ref_page = sie$migrt$pkg.obten_var_page(12064, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(577109) from sie_13_page_item where nom_apex = 'P20030_INDIC_FORMT_HTML' and ref_page = sie$migrt$pkg.obten_var_page(12064, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(577110) from sie_13_page_item where nom_apex = 'P20030_CORPS' and ref_page = sie$migrt$pkg.obten_var_page(12064, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(577111) from sie_13_page_item where nom_apex = 'P20030_NOMBR_TENTV' and ref_page = sie$migrt$pkg.obten_var_page(12064, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(577112) from sie_13_page_item where nom_apex = 'P20030_NOMBR_TENTV_MAX' and ref_page = sie$migrt$pkg.obten_var_page(12064, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(577113) from sie_13_page_item where nom_apex = 'P20030_SENS' and ref_page = sie$migrt$pkg.obten_var_page(12064, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(577114) from sie_13_page_item where nom_apex = 'P20030_STAT_SOUMS' and ref_page = sie$migrt$pkg.obten_var_page(12064, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585956) from sie_13_page_item where nom_apex = 'P35042_REF_FONCT' and ref_page = sie$migrt$pkg.obten_var_page(53484, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585958) from sie_13_page_item where nom_apex = 'P35042_REF_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(53484, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585960) from sie_13_page_item where nom_apex = 'P35042_INDIC_ACTIF' and ref_page = sie$migrt$pkg.obten_var_page(53484, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585961) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(53484, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585962) from sie_13_page_item where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(53484, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585963) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(53484, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585964) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(53484, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(106302) from sie_13_page_item where nom_apex = 'P20010_REF_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(10781, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(103782) from sie_13_page_item where nom_apex = 'P34840_AFICH_RESLT_1' and ref_page = sie$migrt$pkg.obten_var_page(11963, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(103783) from sie_13_page_item where nom_apex = 'P34840_CHAMP_1' and ref_page = sie$migrt$pkg.obten_var_page(11963, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(103784) from sie_13_page_item where nom_apex = 'P34840_ELEMN_SUBST_MESG' and ref_page = sie$migrt$pkg.obten_var_page(11963, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(103785) from sie_13_page_item where nom_apex = 'P34840_CODE' and ref_page = sie$migrt$pkg.obten_var_page(11963, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(103786) from sie_13_page_item where nom_apex = 'P34840_RESLT_2' and ref_page = sie$migrt$pkg.obten_var_page(11963, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(103787) from sie_13_page_item where nom_apex = 'P34840_RESLT_4' and ref_page = sie$migrt$pkg.obten_var_page(11963, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(103788) from sie_13_page_item where nom_apex = 'P34840_RESLT_5' and ref_page = sie$migrt$pkg.obten_var_page(11963, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(103789) from sie_13_page_item where nom_apex = 'P34840_RESLT_6' and ref_page = sie$migrt$pkg.obten_var_page(11963, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(103790) from sie_13_page_item where nom_apex = 'P34840_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(11963, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(103791) from sie_13_page_item where nom_apex = 'P34840_REF_CONFG_EVENM_NOTFB' and ref_page = sie$migrt$pkg.obten_var_page(11963, 'Select');
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('sie_13_page_item');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('sie_13_page_item');
select seqnc into sie$migrt$pkg.var_page_item(103792) from sie_13_page_item where nom_apex = 'P34840_IDENT_ACCES' and ref_page = sie$migrt$pkg.obten_var_page(11963, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(103793) from sie_13_page_item where nom_apex = 'P34840_RESLT_3' and ref_page = sie$migrt$pkg.obten_var_page(11963, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(103794) from sie_13_page_item where nom_apex = 'P34840_IDENT_ACCES_FORMT' and ref_page = sie$migrt$pkg.obten_var_page(11963, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(103795) from sie_13_page_item where nom_apex = 'P34840_RESLT_1' and ref_page = sie$migrt$pkg.obten_var_page(11963, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(103800) from sie_13_page_item where nom_apex = 'P34830_ELEMN_SUBST_MESG' and ref_page = sie$migrt$pkg.obten_var_page(11483, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(103801) from sie_13_page_item where nom_apex = 'P34830_RESLT_1' and ref_page = sie$migrt$pkg.obten_var_page(11483, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109571) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(11583, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109572) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(11963, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109573) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(11963, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(82463) from sie_13_page_item where nom_apex = 'P19041_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(11583, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(82464) from sie_13_page_item where nom_apex = 'P19041_REF_APLIC_MODL_RECHR' and ref_page = sie$migrt$pkg.obten_var_page(11583, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(82465) from sie_13_page_item where nom_apex = 'P19041_REF_ATRIB_STRUC_APLIC' and ref_page = sie$migrt$pkg.obten_var_page(11583, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(82466) from sie_13_page_item where nom_apex = 'P19041_REF_PATRN_RECHR' and ref_page = sie$migrt$pkg.obten_var_page(11583, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(82467) from sie_13_page_item where nom_apex = 'P19041_ORDRE_EXECT' and ref_page = sie$migrt$pkg.obten_var_page(11583, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(82468) from sie_13_page_item where nom_apex = 'P19041_PERTN' and ref_page = sie$migrt$pkg.obten_var_page(11583, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109469) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(10764, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109470) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(10764, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109471) from sie_13_page_item where nom_apex = 'CREER' and ref_page = sie$migrt$pkg.obten_var_page(10765, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109472) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(10767, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109473) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(10769, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109474) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(10769, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109475) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(10769, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109476) from sie_13_page_item where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(10769, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109477) from sie_13_page_item where nom_apex = 'CREER' and ref_page = sie$migrt$pkg.obten_var_page(10771, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109478) from sie_13_page_item where nom_apex = 'ADD' and ref_page = sie$migrt$pkg.obten_var_page(10772, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109479) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(10772, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109480) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(10772, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109481) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(10772, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109482) from sie_13_page_item where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(10772, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109483) from sie_13_page_item where nom_apex = 'MULTI_ROW_DELETE' and ref_page = sie$migrt$pkg.obten_var_page(10772, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109484) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(10774, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109485) from sie_13_page_item where nom_apex = 'DEFNR' and ref_page = sie$migrt$pkg.obten_var_page(10774, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109486) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(10777, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109487) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(10777, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109488) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(10777, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109489) from sie_13_page_item where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(10777, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109490) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(10781, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109491) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(10781, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109492) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(10781, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109493) from sie_13_page_item where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(10781, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109494) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(10782, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109495) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(10782, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109496) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(10782, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109497) from sie_13_page_item where nom_apex = 'CREATE_ADD' and ref_page = sie$migrt$pkg.obten_var_page(10782, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109498) from sie_13_page_item where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(10782, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109499) from sie_13_page_item where nom_apex = 'P12020_MOT_PASSE' and ref_page = sie$migrt$pkg.obten_var_page(10782, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109500) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(10783, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109501) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(10784, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109502) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(10785, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109503) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(10786, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109504) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(10787, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109505) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(10787, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109506) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(10787, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109507) from sie_13_page_item where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(10787, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109508) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(10789, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109509) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(10789, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109510) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(10789, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109511) from sie_13_page_item where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(10789, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109512) from sie_13_page_item where nom_apex = 'CREAT' and ref_page = sie$migrt$pkg.obten_var_page(10790, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109513) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(10792, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109514) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(10792, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109515) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(10792, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109516) from sie_13_page_item where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(10792, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109517) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(10793, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109518) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(10793, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(583525) from sie_13_page_item where nom_apex = 'P35011_NOMBR_MINM_OCURN_INTER' and ref_page = sie$migrt$pkg.obten_var_page(52125, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(583526) from sie_13_page_item where nom_apex = 'P35011_NOMBR_MAXM_OCURN_INTER' and ref_page = sie$migrt$pkg.obten_var_page(52125, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(583527) from sie_13_page_item where nom_apex = 'P35011_REF_DV_TYPE_CHAMP_REPNS' and ref_page = sie$migrt$pkg.obten_var_page(52125, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(583529) from sie_13_page_item where nom_apex = 'P35011_NOMBR_CARCT_REPNS' and ref_page = sie$migrt$pkg.obten_var_page(52125, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(583530) from sie_13_page_item where nom_apex = 'P35011_REF_DV_MASQ_FORMT_REPNS' and ref_page = sie$migrt$pkg.obten_var_page(52125, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(583531) from sie_13_page_item where nom_apex = 'P35011_LARGR_REPNS' and ref_page = sie$migrt$pkg.obten_var_page(52125, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(583532) from sie_13_page_item where nom_apex = 'P35011_NOMBR_COLN_REPNS' and ref_page = sie$migrt$pkg.obten_var_page(52125, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(583533) from sie_13_page_item where nom_apex = 'P35011_NOMBR_RANGE_REPNS' and ref_page = sie$migrt$pkg.obten_var_page(52125, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(583534) from sie_13_page_item where nom_apex = 'P35011_INDIC_AUTRE' and ref_page = sie$migrt$pkg.obten_var_page(52125, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(583535) from sie_13_page_item where nom_apex = 'P35011_REF_DV_TYPE_CHAMP_AUTRE' and ref_page = sie$migrt$pkg.obten_var_page(52125, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(583536) from sie_13_page_item where nom_apex = 'P35011_NOMBR_CARCT_AUTRE' and ref_page = sie$migrt$pkg.obten_var_page(52125, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(583537) from sie_13_page_item where nom_apex = 'P35011_REF_DV_MASQ_FORMT_AUTRE' and ref_page = sie$migrt$pkg.obten_var_page(52125, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(583538) from sie_13_page_item where nom_apex = 'P35011_LARGR_AUTRE' and ref_page = sie$migrt$pkg.obten_var_page(52125, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(583539) from sie_13_page_item where nom_apex = 'P35011_NOMBR_COLN_AUTRE' and ref_page = sie$migrt$pkg.obten_var_page(52125, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(583540) from sie_13_page_item where nom_apex = 'P35011_NOMBR_RANGE_AUTRE' and ref_page = sie$migrt$pkg.obten_var_page(52125, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(583541) from sie_13_page_item where nom_apex = 'P35011_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(52125, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(583542) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(52125, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(583543) from sie_13_page_item where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(52125, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(583544) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(52125, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(583545) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(52125, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109519) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(10793, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109520) from sie_13_page_item where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(10793, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109521) from sie_13_page_item where nom_apex = 'CREAT' and ref_page = sie$migrt$pkg.obten_var_page(10794, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109522) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(10796, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109523) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(10797, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109524) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(10797, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109525) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(10797, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109526) from sie_13_page_item where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(10797, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109527) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(10798, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109528) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(10798, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109529) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(10798, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109530) from sie_13_page_item where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(10798, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109531) from sie_13_page_item where nom_apex = 'MULTI_ROW_DELETE' and ref_page = sie$migrt$pkg.obten_var_page(10798, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109532) from sie_13_page_item where nom_apex = 'ADD' and ref_page = sie$migrt$pkg.obten_var_page(10798, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109533) from sie_13_page_item where nom_apex = 'EDITR_GROUP' and ref_page = sie$migrt$pkg.obten_var_page(10798, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109534) from sie_13_page_item where nom_apex = 'EDITR_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(10798, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109535) from sie_13_page_item where nom_apex = 'EDITR_DROIT' and ref_page = sie$migrt$pkg.obten_var_page(10798, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109536) from sie_13_page_item where nom_apex = 'CREAT' and ref_page = sie$migrt$pkg.obten_var_page(10799, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109537) from sie_13_page_item where nom_apex = 'SUBMIT' and ref_page = sie$migrt$pkg.obten_var_page(11385, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109538) from sie_13_page_item where nom_apex = 'CRÉER' and ref_page = sie$migrt$pkg.obten_var_page(11423, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109539) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(11424, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109540) from sie_13_page_item where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(11424, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(82345) from sie_13_page_item where nom_apex = 'P19040_NOMBR_MAXIM_RESLT' and ref_page = sie$migrt$pkg.obten_var_page(11564, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(82346) from sie_13_page_item where nom_apex = 'P19040_REF_MODL_RECHR' and ref_page = sie$migrt$pkg.obten_var_page(11564, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(82347) from sie_13_page_item where nom_apex = 'P19040_REF_STRUC_APLIC_RECHR' and ref_page = sie$migrt$pkg.obten_var_page(11564, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(82348) from sie_13_page_item where nom_apex = 'P19040_REF_STRUC_APLIC_LIEN' and ref_page = sie$migrt$pkg.obten_var_page(11564, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(82349) from sie_13_page_item where nom_apex = 'P19040_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(11564, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109541) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(11424, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109542) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(11424, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(40757) from sie_13_page_item where nom_apex = 'P12131_MODE' and ref_page = sie$migrt$pkg.obten_var_page(10798, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109543) from sie_13_page_item where nom_apex = 'CRÉER' and ref_page = sie$migrt$pkg.obten_var_page(11443, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109544) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(11444, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109545) from sie_13_page_item where nom_apex = 'CREAT_CONFG' and ref_page = sie$migrt$pkg.obten_var_page(11444, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109546) from sie_13_page_item where nom_apex = 'AFICH_ELEMN_SUBST_MESG' and ref_page = sie$migrt$pkg.obten_var_page(11446, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109547) from sie_13_page_item where nom_apex = 'CREAT_DESTN_CONFIG' and ref_page = sie$migrt$pkg.obten_var_page(11446, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109548) from sie_13_page_item where nom_apex = 'SUPRM_ELEMN_CONFIG' and ref_page = sie$migrt$pkg.obten_var_page(11446, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109549) from sie_13_page_item where nom_apex = 'CREAT_ELEMN_CONFIG' and ref_page = sie$migrt$pkg.obten_var_page(11446, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109550) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(11446, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109551) from sie_13_page_item where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(11446, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109552) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(11446, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109553) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(11446, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109554) from sie_13_page_item where nom_apex = 'SUPRM_DESTN_CONFG' and ref_page = sie$migrt$pkg.obten_var_page(11446, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109555) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(11483, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109556) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(11483, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109557) from sie_13_page_item where nom_apex = 'CREER' and ref_page = sie$migrt$pkg.obten_var_page(11544, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109558) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(11545, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109559) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(11545, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109560) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(11545, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109561) from sie_13_page_item where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(11545, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109562) from sie_13_page_item where nom_apex = 'CRÉER' and ref_page = sie$migrt$pkg.obten_var_page(11545, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109563) from sie_13_page_item where nom_apex = 'CREATE1' and ref_page = sie$migrt$pkg.obten_var_page(11564, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109564) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(11564, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109565) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(11564, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109566) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(11564, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109567) from sie_13_page_item where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(11564, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109568) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(11583, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109569) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(11583, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(109570) from sie_13_page_item where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(11583, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(583520) from sie_13_page_item where nom_apex = 'P35011_INDIC_REPNS_OBLIG' and ref_page = sie$migrt$pkg.obten_var_page(52125, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(583521) from sie_13_page_item where nom_apex = 'P35011_NOM' and ref_page = sie$migrt$pkg.obten_var_page(52125, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(583522) from sie_13_page_item where nom_apex = 'P35011_INDIC_INTER' and ref_page = sie$migrt$pkg.obten_var_page(52125, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(583523) from sie_13_page_item where nom_apex = 'P35011_REF_DV_TYPE_DON_SAIS' and ref_page = sie$migrt$pkg.obten_var_page(52125, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(583524) from sie_13_page_item where nom_apex = 'P35011_INDIC_REPNS_MULTP' and ref_page = sie$migrt$pkg.obten_var_page(52125, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585934) from sie_13_page_item where nom_apex = 'P12020_CODE_UTILS_BASE_DON' and ref_page = sie$migrt$pkg.obten_var_page(10782, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(71096) from sie_13_page_item where nom_apex = 'P34820_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(11446, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(71097) from sie_13_page_item where nom_apex = 'P34820_REF_TYPE_COMNC' and ref_page = sie$migrt$pkg.obten_var_page(11446, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(71098) from sie_13_page_item where nom_apex = 'P34820_OBJET' and ref_page = sie$migrt$pkg.obten_var_page(11446, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(71099) from sie_13_page_item where nom_apex = 'P34820_MESG' and ref_page = sie$migrt$pkg.obten_var_page(11446, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(71100) from sie_13_page_item where nom_apex = 'P34820_REF_EVENM_NOTFB' and ref_page = sie$migrt$pkg.obten_var_page(11446, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(71102) from sie_13_page_item where nom_apex = 'P34820_NOM' and ref_page = sie$migrt$pkg.obten_var_page(11446, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(71103) from sie_13_page_item where nom_apex = 'P34820_DESCR' and ref_page = sie$migrt$pkg.obten_var_page(11446, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(103008) from sie_13_page_item where nom_apex = 'P34830_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(11483, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(103009) from sie_13_page_item where nom_apex = 'P34830_REF_CONFG_EVENM_NOTFB' and ref_page = sie$migrt$pkg.obten_var_page(11483, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(103010) from sie_13_page_item where nom_apex = 'P34830_CODE' and ref_page = sie$migrt$pkg.obten_var_page(11483, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(103011) from sie_13_page_item where nom_apex = 'P34830_IDENT_ACCES' and ref_page = sie$migrt$pkg.obten_var_page(11483, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(103012) from sie_13_page_item where nom_apex = 'P34830_IDENT_ACCES_FORMT' and ref_page = sie$migrt$pkg.obten_var_page(11483, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(583570) from sie_13_page_item where nom_apex = 'P12011_REF_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(52163, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(583571) from sie_13_page_item where nom_apex = 'P12011_REF_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(52163, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(583572) from sie_13_page_item where nom_apex = 'P12011_DATE_DEBUT_EFECT' and ref_page = sie$migrt$pkg.obten_var_page(52163, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36371) from sie_13_page_item where nom_apex = 'P12010_LIBL_CONTX' and ref_page = sie$migrt$pkg.obten_var_page(10763, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36372) from sie_13_page_item where nom_apex = 'P12010_CONTX' and ref_page = sie$migrt$pkg.obten_var_page(10763, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36374) from sie_13_page_item where nom_apex = 'P12181_STRUC_ADMIN' and ref_page = sie$migrt$pkg.obten_var_page(10764, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36375) from sie_13_page_item where nom_apex = 'P12181_MEMBR_STRUC' and ref_page = sie$migrt$pkg.obten_var_page(10764, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36376) from sie_13_page_item where nom_apex = 'P12181_CONTX' and ref_page = sie$migrt$pkg.obten_var_page(10764, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36380) from sie_13_page_item where nom_apex = 'P30010_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(10766, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(583573) from sie_13_page_item where nom_apex = 'P12011_DATE_FIN_EFECT' and ref_page = sie$migrt$pkg.obten_var_page(52163, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(583508) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(52123, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(583568) from sie_13_page_item where nom_apex = 'LIER' and ref_page = sie$migrt$pkg.obten_var_page(10763, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(583569) from sie_13_page_item where nom_apex = 'P12011_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(52163, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(583575) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(52163, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36310) from sie_13_page_item where nom_apex = 'P34710_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(10777, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36311) from sie_13_page_item where nom_apex = 'P34710_CODE' and ref_page = sie$migrt$pkg.obten_var_page(10777, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36312) from sie_13_page_item where nom_apex = 'P34710_NOM' and ref_page = sie$migrt$pkg.obten_var_page(10777, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36313) from sie_13_page_item where nom_apex = 'P34710_DESCR' and ref_page = sie$migrt$pkg.obten_var_page(10777, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36314) from sie_13_page_item where nom_apex = 'P34710_NUMR' and ref_page = sie$migrt$pkg.obten_var_page(10777, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36315) from sie_13_page_item where nom_apex = 'P34710_REF_PROFL_COURL' and ref_page = sie$migrt$pkg.obten_var_page(10777, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36316) from sie_13_page_item where nom_apex = 'P34710_REF_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(10777, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36317) from sie_13_page_item where nom_apex = 'P34710_REF_PUBLC_PAGE_GARDE' and ref_page = sie$migrt$pkg.obten_var_page(10777, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(65975) from sie_13_page_item where nom_apex = 'P102_APPLICATION_ID' and ref_page = sie$migrt$pkg.obten_var_page(11385, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(65976) from sie_13_page_item where nom_apex = 'P102_PAGE_ID' and ref_page = sie$migrt$pkg.obten_var_page(11385, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(65977) from sie_13_page_item where nom_apex = 'P102_A' and ref_page = sie$migrt$pkg.obten_var_page(11385, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(65978) from sie_13_page_item where nom_apex = 'P102_FEEDBACK' and ref_page = sie$migrt$pkg.obten_var_page(11385, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(65979) from sie_13_page_item where nom_apex = 'P102_X' and ref_page = sie$migrt$pkg.obten_var_page(11385, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(65980) from sie_13_page_item where nom_apex = 'P102_FEEDBACK_TYPE' and ref_page = sie$migrt$pkg.obten_var_page(11385, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(65981) from sie_13_page_item where nom_apex = 'P102_Y' and ref_page = sie$migrt$pkg.obten_var_page(11385, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36393) from sie_13_page_item where nom_apex = 'P34210_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(10769, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36394) from sie_13_page_item where nom_apex = 'P34210_CODE' and ref_page = sie$migrt$pkg.obten_var_page(10769, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36395) from sie_13_page_item where nom_apex = 'P34210_NOM' and ref_page = sie$migrt$pkg.obten_var_page(10769, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36396) from sie_13_page_item where nom_apex = 'P34210_REF_EVENM_NOTFB' and ref_page = sie$migrt$pkg.obten_var_page(10769, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36402) from sie_13_page_item where nom_apex = 'P34500_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(10772, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36403) from sie_13_page_item where nom_apex = 'P34500_CODE' and ref_page = sie$migrt$pkg.obten_var_page(10772, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36404) from sie_13_page_item where nom_apex = 'P34500_NOM' and ref_page = sie$migrt$pkg.obten_var_page(10772, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36405) from sie_13_page_item where nom_apex = 'P34500_DESCR' and ref_page = sie$migrt$pkg.obten_var_page(10772, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36406) from sie_13_page_item where nom_apex = 'P34500_REF_TYPE_COMNC' and ref_page = sie$migrt$pkg.obten_var_page(10772, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36407) from sie_13_page_item where nom_apex = 'P34500_INDIC_SYSTM' and ref_page = sie$migrt$pkg.obten_var_page(10772, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36414) from sie_13_page_item where nom_apex = 'P30040_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(10773, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36415) from sie_13_page_item where nom_apex = 'P12030_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(10774, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36420) from sie_13_page_item where nom_apex = 'P12030_NOUV_MOT_PASSE' and ref_page = sie$migrt$pkg.obten_var_page(10774, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36421) from sie_13_page_item where nom_apex = 'P12030_CONFR_MOT_PASSE' and ref_page = sie$migrt$pkg.obten_var_page(10774, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36449) from sie_13_page_item where nom_apex = 'P20010_CODE' and ref_page = sie$migrt$pkg.obten_var_page(10781, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36450) from sie_13_page_item where nom_apex = 'P20010_NOM' and ref_page = sie$migrt$pkg.obten_var_page(10781, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36451) from sie_13_page_item where nom_apex = 'P20010_DESCR' and ref_page = sie$migrt$pkg.obten_var_page(10781, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36452) from sie_13_page_item where nom_apex = 'P20010_SERVR_ENTRA' and ref_page = sie$migrt$pkg.obten_var_page(10781, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36425) from sie_13_page_item where nom_apex = 'P30030_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(10776, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36430) from sie_13_page_item where nom_apex = 'SADA' and ref_page = sie$migrt$pkg.obten_var_page(10778, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36431) from sie_13_page_item where nom_apex = 'SIDF' and ref_page = sie$migrt$pkg.obten_var_page(10778, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36432) from sie_13_page_item where nom_apex = 'SSPC' and ref_page = sie$migrt$pkg.obten_var_page(10778, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36433) from sie_13_page_item where nom_apex = 'SCPC' and ref_page = sie$migrt$pkg.obten_var_page(10778, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36434) from sie_13_page_item where nom_apex = 'SAPC' and ref_page = sie$migrt$pkg.obten_var_page(10778, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36435) from sie_13_page_item where nom_apex = 'SNPI' and ref_page = sie$migrt$pkg.obten_var_page(10778, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36436) from sie_13_page_item where nom_apex = 'SCPI' and ref_page = sie$migrt$pkg.obten_var_page(10778, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36437) from sie_13_page_item where nom_apex = 'SSPI' and ref_page = sie$migrt$pkg.obten_var_page(10778, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36438) from sie_13_page_item where nom_apex = 'SAPI' and ref_page = sie$migrt$pkg.obten_var_page(10778, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36439) from sie_13_page_item where nom_apex = 'P30050_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(10780, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36440) from sie_13_page_item where nom_apex = 'P20010_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(10781, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36442) from sie_13_page_item where nom_apex = 'P20010_SERVR_SORTN' and ref_page = sie$migrt$pkg.obten_var_page(10781, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36443) from sie_13_page_item where nom_apex = 'P20010_PORT_SORTN' and ref_page = sie$migrt$pkg.obten_var_page(10781, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36444) from sie_13_page_item where nom_apex = 'P20010_NOM_ENVOY' and ref_page = sie$migrt$pkg.obten_var_page(10781, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36445) from sie_13_page_item where nom_apex = 'P20010_ADRES_ENVOY' and ref_page = sie$migrt$pkg.obten_var_page(10781, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36446) from sie_13_page_item where nom_apex = 'P20010_AUTHE_METHD_SORTN' and ref_page = sie$migrt$pkg.obten_var_page(10781, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36447) from sie_13_page_item where nom_apex = 'P20010_AUTHE_USAGR_SORTN' and ref_page = sie$migrt$pkg.obten_var_page(10781, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36448) from sie_13_page_item where nom_apex = 'P20010_AUTHE_MDP_SORTN' and ref_page = sie$migrt$pkg.obten_var_page(10781, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36453) from sie_13_page_item where nom_apex = 'P20010_PORT_ENTRA' and ref_page = sie$migrt$pkg.obten_var_page(10781, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36454) from sie_13_page_item where nom_apex = 'P20010_AUTHE_METHD_ENTRA' and ref_page = sie$migrt$pkg.obten_var_page(10781, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36455) from sie_13_page_item where nom_apex = 'P20010_AUTHE_USAGR_ENTRA' and ref_page = sie$migrt$pkg.obten_var_page(10781, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36456) from sie_13_page_item where nom_apex = 'P20010_AUTHE_MDP_ENTRA' and ref_page = sie$migrt$pkg.obten_var_page(10781, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36461) from sie_13_page_item where nom_apex = 'P12020_COURL' and ref_page = sie$migrt$pkg.obten_var_page(10782, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36462) from sie_13_page_item where nom_apex = 'P12020_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(10782, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36463) from sie_13_page_item where nom_apex = 'P12020_NOM' and ref_page = sie$migrt$pkg.obten_var_page(10782, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36464) from sie_13_page_item where nom_apex = 'P12020_PRENM' and ref_page = sie$migrt$pkg.obten_var_page(10782, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36465) from sie_13_page_item where nom_apex = 'P12020_CODE_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(10782, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36466) from sie_13_page_item where nom_apex = 'P12020_DATE_EXPIR' and ref_page = sie$migrt$pkg.obten_var_page(10782, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36467) from sie_13_page_item where nom_apex = 'P12020_INDIC_VERL' and ref_page = sie$migrt$pkg.obten_var_page(10782, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36468) from sie_13_page_item where nom_apex = 'P12020_INDIC_CHANG_MOT_PASSE' and ref_page = sie$migrt$pkg.obten_var_page(10782, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36479) from sie_13_page_item where nom_apex = 'P13053_TYPE_DEFNT_ACCES' and ref_page = sie$migrt$pkg.obten_var_page(10783, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36489) from sie_13_page_item where nom_apex = 'P12141_CONTX' and ref_page = sie$migrt$pkg.obten_var_page(10785, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36491) from sie_13_page_item where nom_apex = 'P12121_CONTX' and ref_page = sie$migrt$pkg.obten_var_page(10786, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36493) from sie_13_page_item where nom_apex = 'P12336_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(10787, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36494) from sie_13_page_item where nom_apex = 'P12336_CODE' and ref_page = sie$migrt$pkg.obten_var_page(10787, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36495) from sie_13_page_item where nom_apex = 'P12336_NOM' and ref_page = sie$migrt$pkg.obten_var_page(10787, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36496) from sie_13_page_item where nom_apex = 'P12336_DESCR' and ref_page = sie$migrt$pkg.obten_var_page(10787, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36497) from sie_13_page_item where nom_apex = 'P12336_REF_PRODT' and ref_page = sie$migrt$pkg.obten_var_page(10787, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36502) from sie_13_page_item where nom_apex = 'P30020_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(10788, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36503) from sie_13_page_item where nom_apex = 'P34100_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(10789, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36504) from sie_13_page_item where nom_apex = 'P34100_CODE' and ref_page = sie$migrt$pkg.obten_var_page(10789, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36505) from sie_13_page_item where nom_apex = 'P34100_NOM' and ref_page = sie$migrt$pkg.obten_var_page(10789, 'Select');
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('sie_13_page_item');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('sie_13_page_item');
select seqnc into sie$migrt$pkg.var_page_item(36506) from sie_13_page_item where nom_apex = 'P34100_DESCR' and ref_page = sie$migrt$pkg.obten_var_page(10789, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36507) from sie_13_page_item where nom_apex = 'P34100_COULR_TEXTE' and ref_page = sie$migrt$pkg.obten_var_page(10789, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36508) from sie_13_page_item where nom_apex = 'P34100_TAIL_TEXTE' and ref_page = sie$migrt$pkg.obten_var_page(10789, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36509) from sie_13_page_item where nom_apex = 'P34100_COULR_TITRE' and ref_page = sie$migrt$pkg.obten_var_page(10789, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36510) from sie_13_page_item where nom_apex = 'P34100_TAIL_TITRE' and ref_page = sie$migrt$pkg.obten_var_page(10789, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36511) from sie_13_page_item where nom_apex = 'P34100_TEMPS_AFICH' and ref_page = sie$migrt$pkg.obten_var_page(10789, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36512) from sie_13_page_item where nom_apex = 'P34100_REF_RESRC_ICON' and ref_page = sie$migrt$pkg.obten_var_page(10789, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36513) from sie_13_page_item where nom_apex = 'P34100_REF_FORMT_RESRC_ICON' and ref_page = sie$migrt$pkg.obten_var_page(10789, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36514) from sie_13_page_item where nom_apex = 'P34100_REF_OCURN_RESRC_ICON' and ref_page = sie$migrt$pkg.obten_var_page(10789, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36515) from sie_13_page_item where nom_apex = 'P34100_REF_TYPE_COMNC' and ref_page = sie$migrt$pkg.obten_var_page(10789, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36516) from sie_13_page_item where nom_apex = 'P34100_SEQNC_TYPE_COMNC_ECRAN' and ref_page = sie$migrt$pkg.obten_var_page(10789, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36517) from sie_13_page_item where nom_apex = 'P34100_REF_MODL_COMNC' and ref_page = sie$migrt$pkg.obten_var_page(10789, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36523) from sie_13_page_item where nom_apex = 'P12210_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(10792, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36524) from sie_13_page_item where nom_apex = 'P12210_CODE' and ref_page = sie$migrt$pkg.obten_var_page(10792, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36525) from sie_13_page_item where nom_apex = 'P12210_NOM' and ref_page = sie$migrt$pkg.obten_var_page(10792, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36526) from sie_13_page_item where nom_apex = 'P12210_DESCR' and ref_page = sie$migrt$pkg.obten_var_page(10792, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36527) from sie_13_page_item where nom_apex = 'P12210_REF_COMPT_AXIAT_DEFT' and ref_page = sie$migrt$pkg.obten_var_page(10792, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36528) from sie_13_page_item where nom_apex = 'P12210_REF_PROFL_COURL_NOTFC' and ref_page = sie$migrt$pkg.obten_var_page(10792, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36529) from sie_13_page_item where nom_apex = 'P12210_REF_PROFL_SMS_NOTFC' and ref_page = sie$migrt$pkg.obten_var_page(10792, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36534) from sie_13_page_item where nom_apex = 'P21010_CODE' and ref_page = sie$migrt$pkg.obten_var_page(10793, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36535) from sie_13_page_item where nom_apex = 'P21010_NOM' and ref_page = sie$migrt$pkg.obten_var_page(10793, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36536) from sie_13_page_item where nom_apex = 'P21010_DESCR' and ref_page = sie$migrt$pkg.obten_var_page(10793, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36537) from sie_13_page_item where nom_apex = 'P21010_REF_PRODT' and ref_page = sie$migrt$pkg.obten_var_page(10793, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36538) from sie_13_page_item where nom_apex = 'P21010_REF_PROFL_COURL' and ref_page = sie$migrt$pkg.obten_var_page(10793, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36539) from sie_13_page_item where nom_apex = 'P21010_INDIC_AVERT_AUTR_UNIQ' and ref_page = sie$migrt$pkg.obten_var_page(10793, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36540) from sie_13_page_item where nom_apex = 'P21010_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(10793, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36541) from sie_13_page_item where nom_apex = 'P21010_GROUP_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(10793, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36542) from sie_13_page_item where nom_apex = 'P21010_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(10793, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36550) from sie_13_page_item where nom_apex = 'P12151_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(10797, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36551) from sie_13_page_item where nom_apex = 'P12151_NOM' and ref_page = sie$migrt$pkg.obten_var_page(10797, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36552) from sie_13_page_item where nom_apex = 'P12151_CONTX' and ref_page = sie$migrt$pkg.obten_var_page(10797, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36553) from sie_13_page_item where nom_apex = 'P12151_STRUC_LIE' and ref_page = sie$migrt$pkg.obten_var_page(10797, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36554) from sie_13_page_item where nom_apex = 'P12151_REF_TYPE_STRUC' and ref_page = sie$migrt$pkg.obten_var_page(10797, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36555) from sie_13_page_item where nom_apex = 'P12151_REF_RESPN' and ref_page = sie$migrt$pkg.obten_var_page(10797, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36556) from sie_13_page_item where nom_apex = 'P12151_DEBUT_EFECT' and ref_page = sie$migrt$pkg.obten_var_page(10797, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36557) from sie_13_page_item where nom_apex = 'P12151_FIN_EFECT' and ref_page = sie$migrt$pkg.obten_var_page(10797, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36558) from sie_13_page_item where nom_apex = 'P12151_INDIC_DEFT' and ref_page = sie$migrt$pkg.obten_var_page(10797, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36563) from sie_13_page_item where nom_apex = 'P12131_NOM' and ref_page = sie$migrt$pkg.obten_var_page(10798, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36564) from sie_13_page_item where nom_apex = 'P12131_DESCR' and ref_page = sie$migrt$pkg.obten_var_page(10798, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36565) from sie_13_page_item where nom_apex = 'P12131_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(10798, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36568) from sie_13_page_item where nom_apex = 'P12131_CODE' and ref_page = sie$migrt$pkg.obten_var_page(10798, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36570) from sie_13_page_item where nom_apex = 'P12131_INDIC_IGNOR_GROUP_ADMIN' and ref_page = sie$migrt$pkg.obten_var_page(10798, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36571) from sie_13_page_item where nom_apex = 'P12131_REF_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(10798, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36577) from sie_13_page_item where nom_apex = 'P101_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(10808, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36578) from sie_13_page_item where nom_apex = 'P101_LANG' and ref_page = sie$migrt$pkg.obten_var_page(10808, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36579) from sie_13_page_item where nom_apex = 'P101_FORCE_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(10808, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36580) from sie_13_page_item where nom_apex = 'P101_CODE_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(10808, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36581) from sie_13_page_item where nom_apex = 'P101_MOT_PASSE' and ref_page = sie$migrt$pkg.obten_var_page(10808, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(36582) from sie_13_page_item where nom_apex = 'P101_LOGIN' and ref_page = sie$migrt$pkg.obten_var_page(10808, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(110108) from sie_13_page_item where nom_apex = 'P12020_INDIC_ACTIF' and ref_page = sie$migrt$pkg.obten_var_page(10782, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(79374) from sie_13_page_item where nom_apex = 'P34820_MESG_SMS' and ref_page = sie$migrt$pkg.obten_var_page(11446, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(82220) from sie_13_page_item where nom_apex = 'P19030_CODE' and ref_page = sie$migrt$pkg.obten_var_page(11545, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(82221) from sie_13_page_item where nom_apex = 'P19030_NOM' and ref_page = sie$migrt$pkg.obten_var_page(11545, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(82222) from sie_13_page_item where nom_apex = 'P19030_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(11545, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(82223) from sie_13_page_item where nom_apex = 'P19030_REF_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(11545, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(82224) from sie_13_page_item where nom_apex = 'P19030_DESCR' and ref_page = sie$migrt$pkg.obten_var_page(11545, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(88178) from sie_13_page_item where nom_apex = 'AJOUT_DESTN' and ref_page = sie$migrt$pkg.obten_var_page(11446, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(43728) from sie_13_page_item where nom_apex = 'P0_RECHR_GLOBL' and ref_page = sie$migrt$pkg.obten_var_page(10778, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(88196) from sie_13_page_item where nom_apex = 'P19040_REF_ATRIB_STRUC_APLIC_AFICH' and ref_page = sie$migrt$pkg.obten_var_page(11564, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(106360) from sie_13_page_item where nom_apex = 'P34820_STRUC_APLIC' and ref_page = sie$migrt$pkg.obten_var_page(11446, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(106361) from sie_13_page_item where nom_apex = 'P34820_INDIC_DEFT' and ref_page = sie$migrt$pkg.obten_var_page(11446, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(70052) from sie_13_page_item where nom_apex = 'P34810_CODE' and ref_page = sie$migrt$pkg.obten_var_page(11444, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(70053) from sie_13_page_item where nom_apex = 'P34810_NOM' and ref_page = sie$migrt$pkg.obten_var_page(11444, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(70054) from sie_13_page_item where nom_apex = 'P34810_DESCR' and ref_page = sie$migrt$pkg.obten_var_page(11444, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(70055) from sie_13_page_item where nom_apex = 'P34810_REF_STRUC_APLIC' and ref_page = sie$migrt$pkg.obten_var_page(11444, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(70056) from sie_13_page_item where nom_apex = 'P34810_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(11444, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(586156) from sie_13_page_item where nom_apex = 'P12020_MESG_AUTOR_CONXN_DERV' and ref_page = sie$migrt$pkg.obten_var_page(10782, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(586157) from sie_13_page_item where nom_apex = 'P12020_MESG_SUPER_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(10782, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(586158) from sie_13_page_item where nom_apex = 'P12131_INDIC_ACCES_GLOBL' and ref_page = sie$migrt$pkg.obten_var_page(10798, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(577090) from sie_13_page_item where nom_apex = 'LISTR_GROUP' and ref_page = sie$migrt$pkg.obten_var_page(10798, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(577091) from sie_13_page_item where nom_apex = 'LISTR_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(10798, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(577092) from sie_13_page_item where nom_apex = 'LISTR_DROIT' and ref_page = sie$migrt$pkg.obten_var_page(10798, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(577115) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(12064, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(577116) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(12064, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(583348) from sie_13_page_item where nom_apex = 'P1_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(10791, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(583349) from sie_13_page_item where nom_apex = 'P1_NOM' and ref_page = sie$migrt$pkg.obten_var_page(10791, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(583350) from sie_13_page_item where nom_apex = 'P1_CODE' and ref_page = sie$migrt$pkg.obten_var_page(10791, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(583351) from sie_13_page_item where nom_apex = 'EDITR' and ref_page = sie$migrt$pkg.obten_var_page(10791, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(585091) from sie_13_page_item where nom_apex = 'P12020_REF_DV_COMPL_MAXM' and ref_page = sie$migrt$pkg.obten_var_page(10782, 'Select');
--Fin - sie_13_page_item
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin - sie_13_page_item');
end;
/

--Debut - sie_13_page_item_lang
begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut - sie_13_page_item_lang');
delete from tc$13$page$item$lang;

--Fin - sie_13_page_item_lang
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin - sie_13_page_item_lang');
end;
/

--Debut - sie_13_condt_piltb
begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut - sie_13_condt_piltb');
delete from tc$13$condt$piltb;

--Fin - sie_13_condt_piltb
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin - sie_13_condt_piltb');
end;
/

--Debut - sie_13_lien_condt_piltb
begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut - sie_13_lien_condt_piltb');
delete from tc$13$lien$condt$piltb;

--Fin - sie_13_lien_condt_piltb
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin - sie_13_lien_condt_piltb');
end;
/

--Debut - sie_13_regn_piltb
begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut - sie_13_regn_piltb');
delete from tc$13$regn$piltb;

--Fin - sie_13_regn_piltb
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin - sie_13_regn_piltb');
end;
/

--Debut - sie_13_regn_piltb_lang
begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut - sie_13_regn_piltb_lang');
delete from tc$13$regn$piltb$lang;

--Fin - sie_13_regn_piltb_lang
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin - sie_13_regn_piltb_lang');
end;
/

--Debut - sie_13_prefr
begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut - sie_13_prefr');
delete from tc$13$prefr;

--Fin - sie_13_prefr
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin - sie_13_prefr');
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
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(14165, 'Update') where numr_apex = 20020 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(14165, 'Update') where numr_apex = 20030 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(2782, 'Update') where numr_apex = 34830 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(2802, 'Update') where numr_apex = 34840 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(2342, 'Update') where numr_apex = 102 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(14168, 'Update') where numr_apex = 34310 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(2098, 'Update') where numr_apex = 34200 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(2098, 'Update') where numr_apex = 34810 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(2098, 'Update') where numr_apex = 34800 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(2402, 'Update') where numr_apex = 34820 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(2662, 'Update') where numr_apex = 19020 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(2662, 'Update') where numr_apex = 19030 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(2663, 'Update') where numr_apex = 19040 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(2664, 'Update') where numr_apex = 19041 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(2074, 'Update') where numr_apex = 12011 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(14243, 'Update') where numr_apex = 35020 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(2074, 'Update') where numr_apex = 12010 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(14163, 'Update') where numr_apex = 12181 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(14171, 'Update') where numr_apex = 34700 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(2097, 'Update') where numr_apex = 30010 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(14164, 'Update') where numr_apex = 12326 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(2442, 'Update') where numr_apex = 34210 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(13218, 'Update') where numr_apex = 34600 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(2095, 'Update') where numr_apex = 12200 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(14170, 'Update') where numr_apex = 34500 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(2097, 'Update') where numr_apex = 30040 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(14142, 'Update') where numr_apex = 12030 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(13218, 'Update') where numr_apex = 34610 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(2097, 'Update') where numr_apex = 30030 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(14171, 'Update') where numr_apex = 34710 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = null where numr_apex = 0 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(14143, 'Update') where numr_apex = 12021 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(2097, 'Update') where numr_apex = 30050 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(2842, 'Update') where numr_apex = 20010 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(2074, 'Update') where numr_apex = 12020 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(13196, 'Update') where numr_apex = 13053 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(14166, 'Update') where numr_apex = 21000 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(2090, 'Update') where numr_apex = 12141 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(2089, 'Update') where numr_apex = 12121 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(14164, 'Update') where numr_apex = 12336 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(2097, 'Update') where numr_apex = 30020 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(14167, 'Update') where numr_apex = 34100 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(14167, 'Update') where numr_apex = 34000 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(2095, 'Update') where numr_apex = 1 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(2095, 'Update') where numr_apex = 12210 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(14166, 'Update') where numr_apex = 21010 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(14170, 'Update') where numr_apex = 34400 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(2842, 'Update') where numr_apex = 20000 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(2090, 'Update') where numr_apex = 12151 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(2089, 'Update') where numr_apex = 12131 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(2442, 'Update') where numr_apex = 34211 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(2862, 'Update') where numr_apex = 101 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(2068, 'Update') where numr_apex = 12220 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(14168, 'Update') where numr_apex = 34300 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(2822, 'Update') where numr_apex = 34900 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(14042, 'Update') where numr_apex = 35011 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(14042, 'Update') where numr_apex = 35010 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(14882, 'Update') where numr_apex = 35041 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(14882, 'Update') where numr_apex = 35042 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(13165, 'Update') where numr_apex = 35031 and ref_aplic = sie$migrt$pkg.obten_var_aplic(11, 'Select');
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_page;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_13_page');
  end if;
end;

null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_13_page');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_page_lang;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_13_page_lang');
  end if;
end;

null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_13_page_lang');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_page_ir;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_13_page_ir');
  end if;
end;

null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_13_page_ir');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'TYPE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25256, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'STAT_SOUMS' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25256, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOMBR_TENTV' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25256, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SUJET' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25256, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM_ENVOY' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25256, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SERVR' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25256, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'PORT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25256, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DOMN' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25256, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DATE_CREAT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25256, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4437, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4437, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4437, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DESCR' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4437, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_DV_TYPE_DON_SAIS_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25176, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_DV_TYPE_CHAMP_REPNS_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25176, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'INDIC_REPNS_OBLIG_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25176, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'INDIC_AUTRE_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25176, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'GRP' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4266, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4496, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4496, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_STRUC_APLIC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4496, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4776, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'ADRES_ENVOY' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4776, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SUJET' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4776, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'STAT_SOUMS_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4776, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4496, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_PRODT_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4456, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'INDIC_ACTIF_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4253, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25816, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_FONCT_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25816, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4253, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4253, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'PRENM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4253, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE_UTILS' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4253, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DATE_EXPIR' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4253, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DATE_CREAT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4253, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'UTILS_CREAT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4253, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'INDIC_VERL_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4253, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'INDIC_CHANG_MOT_PASSE_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4253, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'MOT_PASSE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4253, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4254, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4254, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4254, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NUMR' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4254, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_PROFL_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4254, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4255, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4255, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4255, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NUMR_APLIC_APEX' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4255, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4256, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4256, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DESCR' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4256, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4256, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4258, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4258, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4258, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4259, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4259, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NUMR_MESG' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4259, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'MESG' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4259, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_PRODT_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4259, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'TYPE_MESG' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4259, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_PRODT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4259, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NUMR_APLIC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4260, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'APLIC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4260, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NUMR_PAGE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4260, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'PAGE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4260, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4260, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4260, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_DV_TYPE_EVENM_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4261, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DATE_EVENM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4261, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NUMR_APLIC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4262, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'APLIC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4262, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NUMR_PAGE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4262, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'PAGE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4262, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4262, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4262, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_PRODT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4262, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4263, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4264, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4264, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_PRODT_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4264, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_PROFL_COURL_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4264, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4265, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4265, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_TYPE_STRUC_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4265, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4266, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4266, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4266, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NUMR_APLIC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4267, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'APLIC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4267, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NUMR_PAGE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4267, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'PAGE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4267, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4267, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4267, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_PRODT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4267, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4268, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4268, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DESCR' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4268, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4268, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4269, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4269, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4269, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DESCR' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4269, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_TYPE_COMNC_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4269, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4271, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM_ENVOY' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4271, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'ADRES_ENVOY' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4271, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4271, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4271, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4272, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4272, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4272, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4277, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_GROUP' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4277, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_UTILS' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4277, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DATE_DEBUT_EFECT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4277, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DATE_FIN_EFECT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4277, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_GROUP_UTILS_LIE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4277, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DATE_DEBUT_EFECT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4263, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DATE_FIN_EFECT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4263, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_GROUP' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4263, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_UTILS' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4263, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_GROUP_UTILS_LIE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4263, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4456, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4456, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4456, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_STRUC_APLIC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4456, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4556, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4556, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4556, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4756, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_UTILS_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4756, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_DV_TYPE_REQT_INTER_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4756, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DATE_DEBUT_EFECT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4756, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DATE_FIN_EFECT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4756, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DATE_TRAIT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4756, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'ADRES_IP' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(4261, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'INDIC_ACTIF_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25816, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25176, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25176, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25796, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25796, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(25796, 'Select');
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_page_ir_coln;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_13_page_ir_coln');
  end if;
end;

null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_13_page_ir_coln');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_page_prefr_navgt;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_13_page_prefr_navgt');
  end if;
end;

null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_13_page_prefr_navgt');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_liste_navgt;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_13_liste_navgt');
  end if;
end;

null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_13_liste_navgt');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34820_SEQNC_TYPE_COURL' and ref_page = sie$migrt$pkg.obten_var_page(11446, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34820_SEQNC_TYPE_SMS' and ref_page = sie$migrt$pkg.obten_var_page(11446, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34820_SEQNC_TYPE_ECRAN' and ref_page = sie$migrt$pkg.obten_var_page(11446, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34830_RESLT_2' and ref_page = sie$migrt$pkg.obten_var_page(11483, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34830_AFICH_RESLT_1' and ref_page = sie$migrt$pkg.obten_var_page(11483, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34830_RESLT_4' and ref_page = sie$migrt$pkg.obten_var_page(11483, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34830_RESLT_5' and ref_page = sie$migrt$pkg.obten_var_page(11483, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34830_RESLT_6' and ref_page = sie$migrt$pkg.obten_var_page(11483, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34830_CHAMP_1' and ref_page = sie$migrt$pkg.obten_var_page(11483, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34830_RESLT_3' and ref_page = sie$migrt$pkg.obten_var_page(11483, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34310_REF_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(11424, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34310_CODE' and ref_page = sie$migrt$pkg.obten_var_page(11424, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34310_NOM' and ref_page = sie$migrt$pkg.obten_var_page(11424, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34310_DESCR' and ref_page = sie$migrt$pkg.obten_var_page(11424, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34310_OBJET' and ref_page = sie$migrt$pkg.obten_var_page(11424, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34310_CORPS_MESG' and ref_page = sie$migrt$pkg.obten_var_page(11424, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34310_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(11424, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20010_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(10781, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12220_REF_GROUP_UTILS_FORMT' and ref_page = sie$migrt$pkg.obten_var_page(53503, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12220_REF_OPERT' and ref_page = sie$migrt$pkg.obten_var_page(53503, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12220_REF_OPERT_OPTIO' and ref_page = sie$migrt$pkg.obten_var_page(53503, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12220_REF_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(53503, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12220_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(53503, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(53503, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(53503, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12220_REF_OPERT_FORMT' and ref_page = sie$migrt$pkg.obten_var_page(53503, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P19030_DNR_REF_PRODT' and ref_page = sie$migrt$pkg.obten_var_page(11545, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(53483, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34820_MODE' and ref_page = sie$migrt$pkg.obten_var_page(11446, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34820_REF_COMPT_COURL' and ref_page = sie$migrt$pkg.obten_var_page(11446, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34820_REF_COMPT_TWILI' and ref_page = sie$migrt$pkg.obten_var_page(11446, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34820_RESLT_DESTN' and ref_page = sie$migrt$pkg.obten_var_page(11446, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34820_CHAMP_NOM_FORMT' and ref_page = sie$migrt$pkg.obten_var_page(11446, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34820_CHAMP_ADRES_COURL' and ref_page = sie$migrt$pkg.obten_var_page(11446, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34820_CHAMP_NATR_COURL' and ref_page = sie$migrt$pkg.obten_var_page(11446, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34820_CHAMP_NUMR_SMS' and ref_page = sie$migrt$pkg.obten_var_page(11446, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34820_REF_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(11446, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35042_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(53484, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(10763, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12020_GROUP_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(10782, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12020_GROUP_DROIT' and ref_page = sie$migrt$pkg.obten_var_page(10782, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12210_PROCD_AUTHE_EXTER_AFW' and ref_page = sie$migrt$pkg.obten_var_page(10792, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12210_PROCD_VALD_NIV_SECRT_MP' and ref_page = sie$migrt$pkg.obten_var_page(10792, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12210_MODE' and ref_page = sie$migrt$pkg.obten_var_page(10792, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P19030_REF_PRODT' and ref_page = sie$migrt$pkg.obten_var_page(11545, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20030_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(12064, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20030_SERVR' and ref_page = sie$migrt$pkg.obten_var_page(12064, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20030_PORT' and ref_page = sie$migrt$pkg.obten_var_page(12064, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20030_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(12064, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20030_NOM_ENVOY' and ref_page = sie$migrt$pkg.obten_var_page(12064, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20030_ADRES_ENVOY' and ref_page = sie$migrt$pkg.obten_var_page(12064, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20030_SUJET' and ref_page = sie$migrt$pkg.obten_var_page(12064, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20030_INDIC_FORMT_HTML' and ref_page = sie$migrt$pkg.obten_var_page(12064, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20030_CORPS' and ref_page = sie$migrt$pkg.obten_var_page(12064, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20030_NOMBR_TENTV' and ref_page = sie$migrt$pkg.obten_var_page(12064, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20030_NOMBR_TENTV_MAX' and ref_page = sie$migrt$pkg.obten_var_page(12064, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20030_SENS' and ref_page = sie$migrt$pkg.obten_var_page(12064, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20030_STAT_SOUMS' and ref_page = sie$migrt$pkg.obten_var_page(12064, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35042_REF_FONCT' and ref_page = sie$migrt$pkg.obten_var_page(53484, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35042_REF_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(53484, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35042_INDIC_ACTIF' and ref_page = sie$migrt$pkg.obten_var_page(53484, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(53484, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(53484, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(53484, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(53484, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20010_REF_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(10781, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34840_AFICH_RESLT_1' and ref_page = sie$migrt$pkg.obten_var_page(11963, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34840_CHAMP_1' and ref_page = sie$migrt$pkg.obten_var_page(11963, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34840_ELEMN_SUBST_MESG' and ref_page = sie$migrt$pkg.obten_var_page(11963, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34840_CODE' and ref_page = sie$migrt$pkg.obten_var_page(11963, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34840_RESLT_2' and ref_page = sie$migrt$pkg.obten_var_page(11963, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34840_RESLT_4' and ref_page = sie$migrt$pkg.obten_var_page(11963, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34840_RESLT_5' and ref_page = sie$migrt$pkg.obten_var_page(11963, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34840_RESLT_6' and ref_page = sie$migrt$pkg.obten_var_page(11963, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34840_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(11963, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34840_REF_CONFG_EVENM_NOTFB' and ref_page = sie$migrt$pkg.obten_var_page(11963, 'Select');
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('sie_13_page_item');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('sie_13_page_item');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34840_IDENT_ACCES' and ref_page = sie$migrt$pkg.obten_var_page(11963, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34840_RESLT_3' and ref_page = sie$migrt$pkg.obten_var_page(11963, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34840_IDENT_ACCES_FORMT' and ref_page = sie$migrt$pkg.obten_var_page(11963, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34840_RESLT_1' and ref_page = sie$migrt$pkg.obten_var_page(11963, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34830_ELEMN_SUBST_MESG' and ref_page = sie$migrt$pkg.obten_var_page(11483, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34830_RESLT_1' and ref_page = sie$migrt$pkg.obten_var_page(11483, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(11583, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(11963, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(11963, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P19041_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(11583, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P19041_REF_APLIC_MODL_RECHR' and ref_page = sie$migrt$pkg.obten_var_page(11583, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P19041_REF_ATRIB_STRUC_APLIC' and ref_page = sie$migrt$pkg.obten_var_page(11583, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P19041_REF_PATRN_RECHR' and ref_page = sie$migrt$pkg.obten_var_page(11583, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P19041_ORDRE_EXECT' and ref_page = sie$migrt$pkg.obten_var_page(11583, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P19041_PERTN' and ref_page = sie$migrt$pkg.obten_var_page(11583, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(10764, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(10764, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREER' and ref_page = sie$migrt$pkg.obten_var_page(10765, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(10767, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(10769, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(10769, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(10769, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(10769, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREER' and ref_page = sie$migrt$pkg.obten_var_page(10771, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'ADD' and ref_page = sie$migrt$pkg.obten_var_page(10772, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(10772, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(10772, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(10772, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(10772, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'MULTI_ROW_DELETE' and ref_page = sie$migrt$pkg.obten_var_page(10772, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(10774, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DEFNR' and ref_page = sie$migrt$pkg.obten_var_page(10774, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(10777, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(10777, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(10777, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(10777, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(10781, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(10781, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(10781, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(10781, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(10782, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(10782, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(10782, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE_ADD' and ref_page = sie$migrt$pkg.obten_var_page(10782, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(10782, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12020_MOT_PASSE' and ref_page = sie$migrt$pkg.obten_var_page(10782, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(10783, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(10784, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(10785, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(10786, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(10787, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(10787, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(10787, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(10787, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(10789, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(10789, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(10789, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(10789, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREAT' and ref_page = sie$migrt$pkg.obten_var_page(10790, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(10792, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(10792, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(10792, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(10792, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(10793, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(10793, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35011_NOMBR_MINM_OCURN_INTER' and ref_page = sie$migrt$pkg.obten_var_page(52125, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35011_NOMBR_MAXM_OCURN_INTER' and ref_page = sie$migrt$pkg.obten_var_page(52125, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35011_REF_DV_TYPE_CHAMP_REPNS' and ref_page = sie$migrt$pkg.obten_var_page(52125, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35011_NOMBR_CARCT_REPNS' and ref_page = sie$migrt$pkg.obten_var_page(52125, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35011_REF_DV_MASQ_FORMT_REPNS' and ref_page = sie$migrt$pkg.obten_var_page(52125, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35011_LARGR_REPNS' and ref_page = sie$migrt$pkg.obten_var_page(52125, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35011_NOMBR_COLN_REPNS' and ref_page = sie$migrt$pkg.obten_var_page(52125, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35011_NOMBR_RANGE_REPNS' and ref_page = sie$migrt$pkg.obten_var_page(52125, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35011_INDIC_AUTRE' and ref_page = sie$migrt$pkg.obten_var_page(52125, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35011_REF_DV_TYPE_CHAMP_AUTRE' and ref_page = sie$migrt$pkg.obten_var_page(52125, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35011_NOMBR_CARCT_AUTRE' and ref_page = sie$migrt$pkg.obten_var_page(52125, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35011_REF_DV_MASQ_FORMT_AUTRE' and ref_page = sie$migrt$pkg.obten_var_page(52125, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35011_LARGR_AUTRE' and ref_page = sie$migrt$pkg.obten_var_page(52125, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35011_NOMBR_COLN_AUTRE' and ref_page = sie$migrt$pkg.obten_var_page(52125, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35011_NOMBR_RANGE_AUTRE' and ref_page = sie$migrt$pkg.obten_var_page(52125, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35011_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(52125, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(52125, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(52125, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(52125, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(52125, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(10793, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(10793, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREAT' and ref_page = sie$migrt$pkg.obten_var_page(10794, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(10796, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(10797, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(10797, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(10797, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(10797, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(10798, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(10798, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(10798, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(10798, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'MULTI_ROW_DELETE' and ref_page = sie$migrt$pkg.obten_var_page(10798, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'ADD' and ref_page = sie$migrt$pkg.obten_var_page(10798, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'EDITR_GROUP' and ref_page = sie$migrt$pkg.obten_var_page(10798, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'EDITR_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(10798, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'EDITR_DROIT' and ref_page = sie$migrt$pkg.obten_var_page(10798, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREAT' and ref_page = sie$migrt$pkg.obten_var_page(10799, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SUBMIT' and ref_page = sie$migrt$pkg.obten_var_page(11385, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CRÉER' and ref_page = sie$migrt$pkg.obten_var_page(11423, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(11424, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(11424, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P19040_NOMBR_MAXIM_RESLT' and ref_page = sie$migrt$pkg.obten_var_page(11564, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P19040_REF_MODL_RECHR' and ref_page = sie$migrt$pkg.obten_var_page(11564, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P19040_REF_STRUC_APLIC_RECHR' and ref_page = sie$migrt$pkg.obten_var_page(11564, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P19040_REF_STRUC_APLIC_LIEN' and ref_page = sie$migrt$pkg.obten_var_page(11564, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P19040_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(11564, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(11424, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(11424, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12131_MODE' and ref_page = sie$migrt$pkg.obten_var_page(10798, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CRÉER' and ref_page = sie$migrt$pkg.obten_var_page(11443, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(11444, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREAT_CONFG' and ref_page = sie$migrt$pkg.obten_var_page(11444, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'AFICH_ELEMN_SUBST_MESG' and ref_page = sie$migrt$pkg.obten_var_page(11446, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREAT_DESTN_CONFIG' and ref_page = sie$migrt$pkg.obten_var_page(11446, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SUPRM_ELEMN_CONFIG' and ref_page = sie$migrt$pkg.obten_var_page(11446, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREAT_ELEMN_CONFIG' and ref_page = sie$migrt$pkg.obten_var_page(11446, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(11446, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(11446, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(11446, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(11446, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SUPRM_DESTN_CONFG' and ref_page = sie$migrt$pkg.obten_var_page(11446, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(11483, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(11483, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREER' and ref_page = sie$migrt$pkg.obten_var_page(11544, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(11545, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(11545, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(11545, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(11545, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CRÉER' and ref_page = sie$migrt$pkg.obten_var_page(11545, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE1' and ref_page = sie$migrt$pkg.obten_var_page(11564, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(11564, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(11564, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(11564, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(11564, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(11583, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(11583, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(11583, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35011_INDIC_REPNS_OBLIG' and ref_page = sie$migrt$pkg.obten_var_page(52125, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35011_NOM' and ref_page = sie$migrt$pkg.obten_var_page(52125, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35011_INDIC_INTER' and ref_page = sie$migrt$pkg.obten_var_page(52125, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35011_REF_DV_TYPE_DON_SAIS' and ref_page = sie$migrt$pkg.obten_var_page(52125, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35011_INDIC_REPNS_MULTP' and ref_page = sie$migrt$pkg.obten_var_page(52125, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12020_CODE_UTILS_BASE_DON' and ref_page = sie$migrt$pkg.obten_var_page(10782, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34820_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(11446, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34820_REF_TYPE_COMNC' and ref_page = sie$migrt$pkg.obten_var_page(11446, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34820_OBJET' and ref_page = sie$migrt$pkg.obten_var_page(11446, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34820_MESG' and ref_page = sie$migrt$pkg.obten_var_page(11446, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34820_REF_EVENM_NOTFB' and ref_page = sie$migrt$pkg.obten_var_page(11446, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34820_NOM' and ref_page = sie$migrt$pkg.obten_var_page(11446, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34820_DESCR' and ref_page = sie$migrt$pkg.obten_var_page(11446, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34830_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(11483, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34830_REF_CONFG_EVENM_NOTFB' and ref_page = sie$migrt$pkg.obten_var_page(11483, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34830_CODE' and ref_page = sie$migrt$pkg.obten_var_page(11483, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34830_IDENT_ACCES' and ref_page = sie$migrt$pkg.obten_var_page(11483, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34830_IDENT_ACCES_FORMT' and ref_page = sie$migrt$pkg.obten_var_page(11483, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12011_REF_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(52163, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12011_REF_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(52163, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12011_DATE_DEBUT_EFECT' and ref_page = sie$migrt$pkg.obten_var_page(52163, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12010_LIBL_CONTX' and ref_page = sie$migrt$pkg.obten_var_page(10763, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12010_CONTX' and ref_page = sie$migrt$pkg.obten_var_page(10763, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12181_STRUC_ADMIN' and ref_page = sie$migrt$pkg.obten_var_page(10764, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12181_MEMBR_STRUC' and ref_page = sie$migrt$pkg.obten_var_page(10764, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12181_CONTX' and ref_page = sie$migrt$pkg.obten_var_page(10764, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P30010_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(10766, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12011_DATE_FIN_EFECT' and ref_page = sie$migrt$pkg.obten_var_page(52163, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(52123, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'LIER' and ref_page = sie$migrt$pkg.obten_var_page(10763, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12011_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(52163, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(52163, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34710_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(10777, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34710_CODE' and ref_page = sie$migrt$pkg.obten_var_page(10777, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34710_NOM' and ref_page = sie$migrt$pkg.obten_var_page(10777, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34710_DESCR' and ref_page = sie$migrt$pkg.obten_var_page(10777, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34710_NUMR' and ref_page = sie$migrt$pkg.obten_var_page(10777, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34710_REF_PROFL_COURL' and ref_page = sie$migrt$pkg.obten_var_page(10777, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34710_REF_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(10777, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34710_REF_PUBLC_PAGE_GARDE' and ref_page = sie$migrt$pkg.obten_var_page(10777, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_APPLICATION_ID' and ref_page = sie$migrt$pkg.obten_var_page(11385, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_PAGE_ID' and ref_page = sie$migrt$pkg.obten_var_page(11385, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_A' and ref_page = sie$migrt$pkg.obten_var_page(11385, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_FEEDBACK' and ref_page = sie$migrt$pkg.obten_var_page(11385, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_X' and ref_page = sie$migrt$pkg.obten_var_page(11385, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_FEEDBACK_TYPE' and ref_page = sie$migrt$pkg.obten_var_page(11385, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_Y' and ref_page = sie$migrt$pkg.obten_var_page(11385, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34210_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(10769, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34210_CODE' and ref_page = sie$migrt$pkg.obten_var_page(10769, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34210_NOM' and ref_page = sie$migrt$pkg.obten_var_page(10769, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34210_REF_EVENM_NOTFB' and ref_page = sie$migrt$pkg.obten_var_page(10769, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34500_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(10772, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34500_CODE' and ref_page = sie$migrt$pkg.obten_var_page(10772, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34500_NOM' and ref_page = sie$migrt$pkg.obten_var_page(10772, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34500_DESCR' and ref_page = sie$migrt$pkg.obten_var_page(10772, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34500_REF_TYPE_COMNC' and ref_page = sie$migrt$pkg.obten_var_page(10772, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34500_INDIC_SYSTM' and ref_page = sie$migrt$pkg.obten_var_page(10772, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P30040_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(10773, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12030_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(10774, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12030_NOUV_MOT_PASSE' and ref_page = sie$migrt$pkg.obten_var_page(10774, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12030_CONFR_MOT_PASSE' and ref_page = sie$migrt$pkg.obten_var_page(10774, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20010_CODE' and ref_page = sie$migrt$pkg.obten_var_page(10781, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20010_NOM' and ref_page = sie$migrt$pkg.obten_var_page(10781, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20010_DESCR' and ref_page = sie$migrt$pkg.obten_var_page(10781, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20010_SERVR_ENTRA' and ref_page = sie$migrt$pkg.obten_var_page(10781, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P30030_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(10776, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SADA' and ref_page = sie$migrt$pkg.obten_var_page(10778, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SIDF' and ref_page = sie$migrt$pkg.obten_var_page(10778, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SSPC' and ref_page = sie$migrt$pkg.obten_var_page(10778, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SCPC' and ref_page = sie$migrt$pkg.obten_var_page(10778, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAPC' and ref_page = sie$migrt$pkg.obten_var_page(10778, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SNPI' and ref_page = sie$migrt$pkg.obten_var_page(10778, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SCPI' and ref_page = sie$migrt$pkg.obten_var_page(10778, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SSPI' and ref_page = sie$migrt$pkg.obten_var_page(10778, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAPI' and ref_page = sie$migrt$pkg.obten_var_page(10778, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P30050_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(10780, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20010_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(10781, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20010_SERVR_SORTN' and ref_page = sie$migrt$pkg.obten_var_page(10781, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20010_PORT_SORTN' and ref_page = sie$migrt$pkg.obten_var_page(10781, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20010_NOM_ENVOY' and ref_page = sie$migrt$pkg.obten_var_page(10781, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20010_ADRES_ENVOY' and ref_page = sie$migrt$pkg.obten_var_page(10781, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20010_AUTHE_METHD_SORTN' and ref_page = sie$migrt$pkg.obten_var_page(10781, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20010_AUTHE_USAGR_SORTN' and ref_page = sie$migrt$pkg.obten_var_page(10781, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20010_AUTHE_MDP_SORTN' and ref_page = sie$migrt$pkg.obten_var_page(10781, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20010_PORT_ENTRA' and ref_page = sie$migrt$pkg.obten_var_page(10781, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20010_AUTHE_METHD_ENTRA' and ref_page = sie$migrt$pkg.obten_var_page(10781, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20010_AUTHE_USAGR_ENTRA' and ref_page = sie$migrt$pkg.obten_var_page(10781, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20010_AUTHE_MDP_ENTRA' and ref_page = sie$migrt$pkg.obten_var_page(10781, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12020_COURL' and ref_page = sie$migrt$pkg.obten_var_page(10782, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12020_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(10782, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12020_NOM' and ref_page = sie$migrt$pkg.obten_var_page(10782, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12020_PRENM' and ref_page = sie$migrt$pkg.obten_var_page(10782, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12020_CODE_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(10782, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12020_DATE_EXPIR' and ref_page = sie$migrt$pkg.obten_var_page(10782, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12020_INDIC_VERL' and ref_page = sie$migrt$pkg.obten_var_page(10782, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12020_INDIC_CHANG_MOT_PASSE' and ref_page = sie$migrt$pkg.obten_var_page(10782, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P13053_TYPE_DEFNT_ACCES' and ref_page = sie$migrt$pkg.obten_var_page(10783, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12141_CONTX' and ref_page = sie$migrt$pkg.obten_var_page(10785, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12121_CONTX' and ref_page = sie$migrt$pkg.obten_var_page(10786, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12336_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(10787, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12336_CODE' and ref_page = sie$migrt$pkg.obten_var_page(10787, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12336_NOM' and ref_page = sie$migrt$pkg.obten_var_page(10787, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12336_DESCR' and ref_page = sie$migrt$pkg.obten_var_page(10787, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12336_REF_PRODT' and ref_page = sie$migrt$pkg.obten_var_page(10787, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P30020_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(10788, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34100_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(10789, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34100_CODE' and ref_page = sie$migrt$pkg.obten_var_page(10789, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34100_NOM' and ref_page = sie$migrt$pkg.obten_var_page(10789, 'Select');
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('sie_13_page_item');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('sie_13_page_item');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34100_DESCR' and ref_page = sie$migrt$pkg.obten_var_page(10789, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34100_COULR_TEXTE' and ref_page = sie$migrt$pkg.obten_var_page(10789, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34100_TAIL_TEXTE' and ref_page = sie$migrt$pkg.obten_var_page(10789, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34100_COULR_TITRE' and ref_page = sie$migrt$pkg.obten_var_page(10789, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34100_TAIL_TITRE' and ref_page = sie$migrt$pkg.obten_var_page(10789, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34100_TEMPS_AFICH' and ref_page = sie$migrt$pkg.obten_var_page(10789, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34100_REF_RESRC_ICON' and ref_page = sie$migrt$pkg.obten_var_page(10789, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34100_REF_FORMT_RESRC_ICON' and ref_page = sie$migrt$pkg.obten_var_page(10789, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34100_REF_OCURN_RESRC_ICON' and ref_page = sie$migrt$pkg.obten_var_page(10789, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34100_REF_TYPE_COMNC' and ref_page = sie$migrt$pkg.obten_var_page(10789, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34100_SEQNC_TYPE_COMNC_ECRAN' and ref_page = sie$migrt$pkg.obten_var_page(10789, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34100_REF_MODL_COMNC' and ref_page = sie$migrt$pkg.obten_var_page(10789, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12210_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(10792, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12210_CODE' and ref_page = sie$migrt$pkg.obten_var_page(10792, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12210_NOM' and ref_page = sie$migrt$pkg.obten_var_page(10792, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12210_DESCR' and ref_page = sie$migrt$pkg.obten_var_page(10792, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12210_REF_COMPT_AXIAT_DEFT' and ref_page = sie$migrt$pkg.obten_var_page(10792, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12210_REF_PROFL_COURL_NOTFC' and ref_page = sie$migrt$pkg.obten_var_page(10792, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12210_REF_PROFL_SMS_NOTFC' and ref_page = sie$migrt$pkg.obten_var_page(10792, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P21010_CODE' and ref_page = sie$migrt$pkg.obten_var_page(10793, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P21010_NOM' and ref_page = sie$migrt$pkg.obten_var_page(10793, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P21010_DESCR' and ref_page = sie$migrt$pkg.obten_var_page(10793, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P21010_REF_PRODT' and ref_page = sie$migrt$pkg.obten_var_page(10793, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P21010_REF_PROFL_COURL' and ref_page = sie$migrt$pkg.obten_var_page(10793, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P21010_INDIC_AVERT_AUTR_UNIQ' and ref_page = sie$migrt$pkg.obten_var_page(10793, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P21010_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(10793, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P21010_GROUP_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(10793, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P21010_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(10793, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12151_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(10797, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12151_NOM' and ref_page = sie$migrt$pkg.obten_var_page(10797, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12151_CONTX' and ref_page = sie$migrt$pkg.obten_var_page(10797, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12151_STRUC_LIE' and ref_page = sie$migrt$pkg.obten_var_page(10797, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12151_REF_TYPE_STRUC' and ref_page = sie$migrt$pkg.obten_var_page(10797, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12151_REF_RESPN' and ref_page = sie$migrt$pkg.obten_var_page(10797, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12151_DEBUT_EFECT' and ref_page = sie$migrt$pkg.obten_var_page(10797, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12151_FIN_EFECT' and ref_page = sie$migrt$pkg.obten_var_page(10797, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12151_INDIC_DEFT' and ref_page = sie$migrt$pkg.obten_var_page(10797, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12131_NOM' and ref_page = sie$migrt$pkg.obten_var_page(10798, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12131_DESCR' and ref_page = sie$migrt$pkg.obten_var_page(10798, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12131_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(10798, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12131_CODE' and ref_page = sie$migrt$pkg.obten_var_page(10798, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12131_INDIC_IGNOR_GROUP_ADMIN' and ref_page = sie$migrt$pkg.obten_var_page(10798, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12131_REF_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(10798, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(10808, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_LANG' and ref_page = sie$migrt$pkg.obten_var_page(10808, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_FORCE_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(10808, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_CODE_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(10808, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_MOT_PASSE' and ref_page = sie$migrt$pkg.obten_var_page(10808, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_LOGIN' and ref_page = sie$migrt$pkg.obten_var_page(10808, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12020_INDIC_ACTIF' and ref_page = sie$migrt$pkg.obten_var_page(10782, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34820_MESG_SMS' and ref_page = sie$migrt$pkg.obten_var_page(11446, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P19030_CODE' and ref_page = sie$migrt$pkg.obten_var_page(11545, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P19030_NOM' and ref_page = sie$migrt$pkg.obten_var_page(11545, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P19030_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(11545, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P19030_REF_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(11545, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P19030_DESCR' and ref_page = sie$migrt$pkg.obten_var_page(11545, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'AJOUT_DESTN' and ref_page = sie$migrt$pkg.obten_var_page(11446, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P0_RECHR_GLOBL' and ref_page = sie$migrt$pkg.obten_var_page(10778, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P19040_REF_ATRIB_STRUC_APLIC_AFICH' and ref_page = sie$migrt$pkg.obten_var_page(11564, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34820_STRUC_APLIC' and ref_page = sie$migrt$pkg.obten_var_page(11446, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34820_INDIC_DEFT' and ref_page = sie$migrt$pkg.obten_var_page(11446, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34810_CODE' and ref_page = sie$migrt$pkg.obten_var_page(11444, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34810_NOM' and ref_page = sie$migrt$pkg.obten_var_page(11444, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34810_DESCR' and ref_page = sie$migrt$pkg.obten_var_page(11444, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34810_REF_STRUC_APLIC' and ref_page = sie$migrt$pkg.obten_var_page(11444, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34810_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(11444, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12020_MESG_AUTOR_CONXN_DERV' and ref_page = sie$migrt$pkg.obten_var_page(10782, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12020_MESG_SUPER_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(10782, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12131_INDIC_ACCES_GLOBL' and ref_page = sie$migrt$pkg.obten_var_page(10798, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'LISTR_GROUP' and ref_page = sie$migrt$pkg.obten_var_page(10798, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'LISTR_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(10798, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'LISTR_DROIT' and ref_page = sie$migrt$pkg.obten_var_page(10798, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(12064, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(12064, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(10791, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1_NOM' and ref_page = sie$migrt$pkg.obten_var_page(10791, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1_CODE' and ref_page = sie$migrt$pkg.obten_var_page(10791, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'EDITR' and ref_page = sie$migrt$pkg.obten_var_page(10791, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12020_REF_DV_COMPL_MAXM' and ref_page = sie$migrt$pkg.obten_var_page(10782, 'Select');
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_page_item;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_13_page_item');
  end if;
end;

null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_13_page_item');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_page_item_lang;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_13_page_item_lang');
  end if;
end;

null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_13_page_item_lang');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_condt_piltb;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_13_condt_piltb');
  end if;
end;

null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_13_condt_piltb');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_lien_condt_piltb;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_13_lien_condt_piltb');
  end if;
end;

null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_13_lien_condt_piltb');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_regn_piltb;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_13_regn_piltb');
  end if;
end;

null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_13_regn_piltb');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_regn_piltb_lang;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_13_regn_piltb_lang');
  end if;
end;

null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_13_regn_piltb_lang');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
declare
  vnu_count pls_integer;
begin
  select count(1) into vnu_count from em$13_prefr;

  if vnu_count > 0 then
    sie$migrt$pkg.defnr_ereur ('Update sur sie_13_prefr');
  end if;
end;

null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_13_prefr');
end;
/

begin
if sie$migrt$pkg.vnu_sql_code = 0 then
update sie_11_aplic
                       set ref_versn = null,
                           indic_aplic_authe = 'N',
                           ref_aplic_authe = sie$migrt$pkg.obten_var_aplic(5, 'Update'),
                           ref_page_conxn = sie$migrt$pkg.obten_var_page(10808, 'Update')
                     where seqnc = sie$migrt$pkg.obten_var_aplic(11);
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_11_aplic');
end;
/
begin
  if sie$migrt$pkg.vnu_sql_code = 0 then
    dbms_output.put_line ('Mise a jour du referentiel pour application : SAFD - SIE APEX Framework - Domaine');
    sie_13_page_pkg.maj_table_a_partr_refrt_apex(sie$migrt$pkg.var_aplic(11),'O');
  end if;
end;
/

