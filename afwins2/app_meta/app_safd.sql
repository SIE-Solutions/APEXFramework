set define off
set serveroutput on
set feedback off

alter session set current_schema = afw_040215;


begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut - Initialisation - Application - SAFD');
  sie$migrt$pkg.var_aplic(188) := sie_11_aplic_pkg.maj_aplic ('SAFD','SIE APEX Framework - Domaine',1000004, sie$migrt$pkg.vnu_seqnc_prodt);

  sie_13_page_pkg.maj_table_a_partr_refrt_apex(sie$migrt$pkg.var_aplic(188),'O');
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

insert into tc$11$versn (code, dnr_ref_aplic, dnr_ref_prodt, indic_docmn_verl, nom, numr_versn_1, numr_versn_2, numr_versn_3, numr_versn_4, ref_aplic, ref_plugn, ref_prodt, seqnc) values ('0100', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), null, 'O', null, 0, 1, 0, 0, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), null, null, 184);

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

select seqnc into sie$migrt$pkg.var_versn(184) from sie_11_versn where code = '0100' and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select') and ref_plugn is null and ref_prodt is null;
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

insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:07', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Format de réponse', 35011, null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 17939);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:07', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Page commune', 0, null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 17156);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:07', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Tableau de board', 1, null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 17157);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:07', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Page de connexion', 101, null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 17158);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:07', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'O', 'O', 'N', 'N', 'N', 'N', 'N', 'Commentaire', 102, null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 17159);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:07', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des utilisateurs', 12010, null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 17160);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:07', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mettre à jour un utilisateur', 12020, null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 17161);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:07', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Historique des accès', 12021, null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 17162);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:07', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Modifier le mot de passe', 12030, null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 17163);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:07', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des groupes utilisateur', 12121, null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 17164);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:07', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mettre à jour un groupe utilisateur', 12131, null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 17165);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:07', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des structures administratives', 12141, null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 17166);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:07', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mettre à jour une structure administrative', 12151, null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 17167);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:07', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mettre à jour les membres', 12181, null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 17168);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:07', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des domaines', 12200, null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 17169);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:07', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mettre à jour un domaine', 12210, null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 17170);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:07', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des types de structure', 12326, null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 17172);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:07', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mettre à jour un type de structure', 12336, null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 17173);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:07', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Créer et mettre à jour les autorisations', 13053, null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 17174);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:07', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Modèle de recherche', 19020, null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 17175);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:07', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mettre à jour un modèle de recherche', 19030, null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 17176);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:07', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Application du modèle de recherche', 19040, null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 17177);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:07', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Détail de l''application du modèle de recherche', 19041, null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 17178);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:07', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des profils de courriels', 20000, null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 17179);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:07', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mettre à jour un profil de courriel', 20010, null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 17180);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:07', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'File d''attente', 20020, null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 17181);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:07', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mettre à jour un courriel', 20030, null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 17182);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:07', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des classes d''intervention', 21000, null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 17183);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:07', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mettre à jour une classe d''intervention', 21010, null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 17184);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:07', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste de valeurs interactive - Applications', 30010, null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 17185);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:07', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste de valeurs interactive - Pages', 30020, null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 17186);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:07', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste de valeurs interactive - Items de pages', 30030, null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 17187);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:07', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste de valeurs interactive - Messages', 30040, null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 17188);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:07', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste de valeurs interactive - Pages Popup IR LOV', 30050, null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 17189);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:07', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des modèles de notification', 34000, null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 17190);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:07', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mettre à jour un modèle de notification', 34100, null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 17191);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:07', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des événements notifiables', 34200, null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 17192);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:07', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mettre à jour un destinataire', 34210, null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 17193);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:07', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des destinataires', 34211, null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 17194);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:07', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des modèles de message de notification', 34300, null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 17195);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:07', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mettre à jour modèle de message de notification', 34310, null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 17196);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:07', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des modèles de communication', 34400, null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 17197);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:07', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mettre à jour un modèle de communication', 34500, null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 17198);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:07', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des comptes de notification sms', 34600, null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 17199);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:07', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mettre à jour un compte de notification sms', 34610, null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 17200);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:07', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des comptes de télécopie', 34700, null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 17201);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:07', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mettre à jour un compte de télécopie', 34710, null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 17202);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:07', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des événements notifiables', 34800, null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 17203);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:07', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mettre à jour un événement notifiable', 34810, null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 17204);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:07', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mettre à jour une configuration', 34820, null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 17205);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:07', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Créer un élément de configuration d''événement notifiable', 34830, null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 17206);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:07', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Créer un destinataire de configuration d''événement notifiable', 34840, null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 17207);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:07', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des requêtes d''intervention', 34900, null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 17208);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:07', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des courriels', 35020, null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 17936);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:07', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Lier un utilisateur au domaine', 12011, null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 17937);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:07', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des formats de réponse', 35010, null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 17938);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:07', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Modifier une fonctionnalité', 35042, null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 18055);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:07', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des produits', 35031, null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 18056);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:07', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Opérations', 12220, null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 18057);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:07', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des fonctionnalités', 35041, null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 18058);

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

select seqnc into sie$migrt$pkg.var_page(17939) from sie_13_page where numr_apex = 35011 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
select seqnc into sie$migrt$pkg.var_page(17156) from sie_13_page where numr_apex = 0 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
select seqnc into sie$migrt$pkg.var_page(17157) from sie_13_page where numr_apex = 1 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
select seqnc into sie$migrt$pkg.var_page(17158) from sie_13_page where numr_apex = 101 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
select seqnc into sie$migrt$pkg.var_page(17159) from sie_13_page where numr_apex = 102 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
select seqnc into sie$migrt$pkg.var_page(17160) from sie_13_page where numr_apex = 12010 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
select seqnc into sie$migrt$pkg.var_page(17161) from sie_13_page where numr_apex = 12020 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
select seqnc into sie$migrt$pkg.var_page(17162) from sie_13_page where numr_apex = 12021 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
select seqnc into sie$migrt$pkg.var_page(17163) from sie_13_page where numr_apex = 12030 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
select seqnc into sie$migrt$pkg.var_page(17164) from sie_13_page where numr_apex = 12121 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
select seqnc into sie$migrt$pkg.var_page(17165) from sie_13_page where numr_apex = 12131 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
select seqnc into sie$migrt$pkg.var_page(17166) from sie_13_page where numr_apex = 12141 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
select seqnc into sie$migrt$pkg.var_page(17167) from sie_13_page where numr_apex = 12151 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
select seqnc into sie$migrt$pkg.var_page(17168) from sie_13_page where numr_apex = 12181 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
select seqnc into sie$migrt$pkg.var_page(17169) from sie_13_page where numr_apex = 12200 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
select seqnc into sie$migrt$pkg.var_page(17170) from sie_13_page where numr_apex = 12210 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
select seqnc into sie$migrt$pkg.var_page(17172) from sie_13_page where numr_apex = 12326 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
select seqnc into sie$migrt$pkg.var_page(17173) from sie_13_page where numr_apex = 12336 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
select seqnc into sie$migrt$pkg.var_page(17174) from sie_13_page where numr_apex = 13053 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
select seqnc into sie$migrt$pkg.var_page(17175) from sie_13_page where numr_apex = 19020 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
select seqnc into sie$migrt$pkg.var_page(17176) from sie_13_page where numr_apex = 19030 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
select seqnc into sie$migrt$pkg.var_page(17177) from sie_13_page where numr_apex = 19040 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
select seqnc into sie$migrt$pkg.var_page(17178) from sie_13_page where numr_apex = 19041 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
select seqnc into sie$migrt$pkg.var_page(17179) from sie_13_page where numr_apex = 20000 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
select seqnc into sie$migrt$pkg.var_page(17180) from sie_13_page where numr_apex = 20010 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
select seqnc into sie$migrt$pkg.var_page(17181) from sie_13_page where numr_apex = 20020 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
select seqnc into sie$migrt$pkg.var_page(17182) from sie_13_page where numr_apex = 20030 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
select seqnc into sie$migrt$pkg.var_page(17183) from sie_13_page where numr_apex = 21000 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
select seqnc into sie$migrt$pkg.var_page(17184) from sie_13_page where numr_apex = 21010 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
select seqnc into sie$migrt$pkg.var_page(17185) from sie_13_page where numr_apex = 30010 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
select seqnc into sie$migrt$pkg.var_page(17186) from sie_13_page where numr_apex = 30020 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
select seqnc into sie$migrt$pkg.var_page(17187) from sie_13_page where numr_apex = 30030 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
select seqnc into sie$migrt$pkg.var_page(17188) from sie_13_page where numr_apex = 30040 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
select seqnc into sie$migrt$pkg.var_page(17189) from sie_13_page where numr_apex = 30050 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
select seqnc into sie$migrt$pkg.var_page(17190) from sie_13_page where numr_apex = 34000 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
select seqnc into sie$migrt$pkg.var_page(17191) from sie_13_page where numr_apex = 34100 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
select seqnc into sie$migrt$pkg.var_page(17192) from sie_13_page where numr_apex = 34200 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
select seqnc into sie$migrt$pkg.var_page(17193) from sie_13_page where numr_apex = 34210 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
select seqnc into sie$migrt$pkg.var_page(17194) from sie_13_page where numr_apex = 34211 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
select seqnc into sie$migrt$pkg.var_page(17195) from sie_13_page where numr_apex = 34300 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
select seqnc into sie$migrt$pkg.var_page(17196) from sie_13_page where numr_apex = 34310 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
select seqnc into sie$migrt$pkg.var_page(17197) from sie_13_page where numr_apex = 34400 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
select seqnc into sie$migrt$pkg.var_page(17198) from sie_13_page where numr_apex = 34500 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
select seqnc into sie$migrt$pkg.var_page(17199) from sie_13_page where numr_apex = 34600 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
select seqnc into sie$migrt$pkg.var_page(17200) from sie_13_page where numr_apex = 34610 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
select seqnc into sie$migrt$pkg.var_page(17201) from sie_13_page where numr_apex = 34700 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
select seqnc into sie$migrt$pkg.var_page(17202) from sie_13_page where numr_apex = 34710 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
select seqnc into sie$migrt$pkg.var_page(17203) from sie_13_page where numr_apex = 34800 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
select seqnc into sie$migrt$pkg.var_page(17204) from sie_13_page where numr_apex = 34810 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
select seqnc into sie$migrt$pkg.var_page(17205) from sie_13_page where numr_apex = 34820 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
select seqnc into sie$migrt$pkg.var_page(17206) from sie_13_page where numr_apex = 34830 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
select seqnc into sie$migrt$pkg.var_page(17207) from sie_13_page where numr_apex = 34840 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
select seqnc into sie$migrt$pkg.var_page(17208) from sie_13_page where numr_apex = 34900 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
select seqnc into sie$migrt$pkg.var_page(17936) from sie_13_page where numr_apex = 35020 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
select seqnc into sie$migrt$pkg.var_page(17937) from sie_13_page where numr_apex = 12011 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
select seqnc into sie$migrt$pkg.var_page(17938) from sie_13_page where numr_apex = 35010 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
select seqnc into sie$migrt$pkg.var_page(18055) from sie_13_page where numr_apex = 35042 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
select seqnc into sie$migrt$pkg.var_page(18056) from sie_13_page where numr_apex = 35031 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
select seqnc into sie$migrt$pkg.var_page(18057) from sie_13_page where numr_apex = 12220 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
select seqnc into sie$migrt$pkg.var_page(18058) from sie_13_page where numr_apex = 35041 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
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

insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'Page commune', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17156, 'Insert'), 13841);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'Accueil Domaine', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17157, 'Insert'), 13842);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'Page de connexion', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17158, 'Insert'), 13843);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'Feedback', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17159, 'Insert'), 13844);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'Utilisateurs', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17160, 'Insert'), 13845);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'Utilisateur', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17161, 'Insert'), 13846);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'Historique des accès', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17162, 'Insert'), 13847);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'Gérer le mot de passe', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17163, 'Insert'), 13848);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'Groupes utilisateur', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17164, 'Insert'), 13849);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'Groupe utilisateur', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17165, 'Insert'), 13850);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'Structures administratives', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17166, 'Insert'), 13851);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'Structure administrative', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17167, 'Insert'), 13852);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'Mettre à jour les membres', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17168, 'Insert'), 13853);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'Domaines', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17169, 'Insert'), 13854);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'Domaine', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17170, 'Insert'), 13855);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'Types de structure', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17172, 'Insert'), 13857);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'Type de structure', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17173, 'Insert'), 13858);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'Créer et mettre à jour les autorisations', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17174, 'Insert'), 13859);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'Modèle de recherche', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17175, 'Insert'), 13860);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'Modèle de recherche', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17176, 'Insert'), 13861);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'Application du modèle de recherche', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17177, 'Insert'), 13862);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'Détail de l''application du modèle de recherche', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17178, 'Insert'), 13863);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'Profils de courriels', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17179, 'Insert'), 13864);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'Profil de courriel', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17180, 'Insert'), 13865);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'File d''attente', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17181, 'Insert'), 13866);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'Courriel', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17182, 'Insert'), 13867);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'Classes d''intervention', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17183, 'Insert'), 13868);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'Classe d''intervention', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17184, 'Insert'), 13869);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'Liste de valeurs interactive - Applications', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17185, 'Insert'), 13870);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'Liste de valeurs interactive - Pages', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17186, 'Insert'), 13871);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'Liste de valeurs interactive - Items de pages', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17187, 'Insert'), 13872);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'Liste de valeurs interactive - Messages', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17188, 'Insert'), 13873);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'Liste de valeurs interactive - Pages Popup IR LOV', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17189, 'Insert'), 13874);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'Modèles de notifiation', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17190, 'Insert'), 13875);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'Modèle de notification', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17191, 'Insert'), 13876);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'Événements notifiables', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17192, 'Insert'), 13877);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'Destinataire', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17193, 'Insert'), 13878);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'Destinataires', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17194, 'Insert'), 13879);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'Modèles de message de notification', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17195, 'Insert'), 13880);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'Modèle de message de notification', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17196, 'Insert'), 13881);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'Modèles de communication', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17197, 'Insert'), 13882);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'Modèle de communication', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17198, 'Insert'), 13883);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'Comptes de notification sms', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17199, 'Insert'), 13884);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'Compte de notification SMS', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17200, 'Insert'), 13885);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'Comptes de télécopie', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17201, 'Insert'), 13886);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'Compte de télécopie', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17202, 'Insert'), 13887);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'Événements notifiables', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17203, 'Insert'), 13888);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'Événement notifiable', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17204, 'Insert'), 13889);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'Configuration', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17205, 'Insert'), 13890);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'Créer un élément', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17206, 'Insert'), 13891);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'Créer un destinataire', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17207, 'Insert'), 13892);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'Requêtes d''intervention', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17208, 'Insert'), 13893);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'Liste des fonctionnalités', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(18058, 'Insert'), 14738);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'Opération domaine', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(18057, 'Insert'), 14739);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'Liste des produits', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(18056, 'Insert'), 14740);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'Modifier une fonctionnalité', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(18055, 'Insert'), 14741);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'Format de réponse', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17939, 'Insert'), 14619);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'Courriels', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17936, 'Insert'), 14620);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'Lier un utilisateur au domaine', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17937, 'Insert'), 14621);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'Formats de réponse', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17938, 'Insert'), 14622);

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

select seqnc into sie$migrt$pkg.var_page_lang(13841) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17156, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(13842) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17157, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(13843) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17158, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(13844) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17159, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(13845) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17160, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(13846) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17161, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(13847) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17162, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(13848) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17163, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(13849) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17164, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(13850) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17165, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(13851) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17166, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(13852) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17167, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(13853) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17168, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(13854) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17169, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(13855) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17170, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(13857) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17172, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(13858) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17173, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(13859) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17174, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(13860) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17175, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(13861) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17176, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(13862) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17177, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(13863) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17178, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(13864) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17179, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(13865) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17180, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(13866) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17181, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(13867) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17182, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(13868) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17183, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(13869) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17184, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(13870) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17185, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(13871) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17186, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(13872) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17187, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(13873) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17188, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(13874) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17189, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(13875) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17190, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(13876) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17191, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(13877) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17192, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(13878) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17193, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(13879) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17194, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(13880) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17195, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(13881) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17196, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(13882) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17197, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(13883) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17198, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(13884) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17199, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(13885) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17200, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(13886) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17201, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(13887) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17202, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(13888) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17203, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(13889) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17204, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(13890) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17205, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(13891) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17206, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(13892) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17207, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(13893) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17208, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(14738) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(18058, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(14739) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(18057, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(14740) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(18056, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(14741) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(18055, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(14619) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17939, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(14620) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17936, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(14621) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17937, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(14622) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17938, 'Select');
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

insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'N', null, 'Liste des évènements notifiables', 1, sie$migrt$pkg.obten_var_page(17192, 'Insert'), 7026, null);
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
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'N', null, 'Liste des utilisateurs', 1, sie$migrt$pkg.obten_var_page(17160, 'Insert'), 7027, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'N', null, 'Liste des comptes de télécopies', 1, sie$migrt$pkg.obten_var_page(17201, 'Insert'), 7028, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'N', null, 'Liste des types de structure', 1, sie$migrt$pkg.obten_var_page(17172, 'Insert'), 7030, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'N', null, 'Liste des domaines', 1, sie$migrt$pkg.obten_var_page(17169, 'Insert'), 7031, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'N', null, 'Liste des messages', 1, sie$migrt$pkg.obten_var_page(17188, 'Insert'), 7032, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'N', null, 'Historique des accès', 1, sie$migrt$pkg.obten_var_page(17162, 'Insert'), 7034, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'N', null, 'Pages Popup IR LOV', 1, sie$migrt$pkg.obten_var_page(17189, 'Insert'), 7035, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'N', null, 'Autorisations', 1, sie$migrt$pkg.obten_var_page(17174, 'Insert'), 7036, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'N', null, 'Liste des structures administratives', 1, sie$migrt$pkg.obten_var_page(17166, 'Insert'), 7038, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'N', null, 'Liste des groupes utilisateur', 1, sie$migrt$pkg.obten_var_page(17164, 'Insert'), 7039, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'N', null, 'Pages', 1, sie$migrt$pkg.obten_var_page(17186, 'Insert'), 7040, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'N', null, 'Liste des modèles de notification', 1, sie$migrt$pkg.obten_var_page(17190, 'Insert'), 7041, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'N', null, 'Liste des profils de courriels', 1, sie$migrt$pkg.obten_var_page(17179, 'Insert'), 7043, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'N', null, 'Liste des destinataires', 1, sie$migrt$pkg.obten_var_page(17194, 'Insert'), 7044, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'N', null, 'Liste des autorisations', 1, sie$migrt$pkg.obten_var_page(17165, 'Insert'), 7045, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'N', null, 'Liste des évènements notifiables', 1, sie$migrt$pkg.obten_var_page(17203, 'Insert'), 7046, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'N', null, 'Liste des modèles de message de notification', 1, sie$migrt$pkg.obten_var_page(17195, 'Insert'), 7048, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'N', null, 'Applications', 1, sie$migrt$pkg.obten_var_page(17185, 'Insert'), 7029, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'N', null, 'Items de pages', 1, sie$migrt$pkg.obten_var_page(17187, 'Insert'), 7033, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'N', null, 'Liste des classes d''intervention', 1, sie$migrt$pkg.obten_var_page(17183, 'Insert'), 7037, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'N', null, 'Liste des modèles de communication', 1, sie$migrt$pkg.obten_var_page(17197, 'Insert'), 7042, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'N', null, 'Liste des courriels', 1, sie$migrt$pkg.obten_var_page(17181, 'Insert'), 7047, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'N', null, 'Liste des formats de réponse', 1, sie$migrt$pkg.obten_var_page(17938, 'Insert'), 7346, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'N', null, 'Liste des courriels', 1, sie$migrt$pkg.obten_var_page(17936, 'Insert'), 7347, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'N', null, 'Liste des requêtes d''intervention', 1, sie$migrt$pkg.obten_var_page(17208, 'Insert'), 7050, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'N', null, 'Liste des produits', 1, sie$migrt$pkg.obten_var_page(18056, 'Insert'), 7426, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'N', null, 'Liste des fonctionnalités', 1, sie$migrt$pkg.obten_var_page(18058, 'Insert'), 7427, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'N', null, 'Liste de modèle de recherche', 1, sie$migrt$pkg.obten_var_page(17175, 'Insert'), 7049, null);
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
select seqnc into sie$migrt$pkg.var_page_ir(7026) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(17192, 'Select');
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
select seqnc into sie$migrt$pkg.var_page_ir(7027) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(17160, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(7028) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(17201, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(7030) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(17172, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(7031) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(17169, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(7032) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(17188, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(7034) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(17162, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(7035) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(17189, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(7036) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(17174, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(7038) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(17166, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(7039) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(17164, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(7040) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(17186, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(7041) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(17190, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(7043) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(17179, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(7044) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(17194, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(7045) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(17165, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(7046) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(17203, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(7048) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(17195, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(7029) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(17185, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(7033) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(17187, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(7037) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(17183, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(7042) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(17197, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(7047) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(17181, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(7346) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(17938, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(7347) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(17936, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(7050) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(17208, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(7426) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(18056, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(7427) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(18058, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(7049) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(17175, 'Select');
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

insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('TYPE', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 455669332186180902, 'O', null, 'Type', 1, sie$migrt$pkg.obten_var_page_ir(7347, 'Insert'), 61465, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('STAT_SOUMS', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 455669437117180907, 'O', null, 'Statut', 2, sie$migrt$pkg.obten_var_page_ir(7347, 'Insert'), 61466, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOMBR_TENTV', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 455669548641180908, 'O', null, 'Nombre tentatives', 3, sie$migrt$pkg.obten_var_page_ir(7347, 'Insert'), 61467, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SUJET', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 455669636790180908, 'O', null, 'Sujet', 4, sie$migrt$pkg.obten_var_page_ir(7347, 'Insert'), 61468, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM_ENVOY', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 455669738069180908, 'O', null, 'Courriel envoi', 5, sie$migrt$pkg.obten_var_page_ir(7347, 'Insert'), 61469, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SERVR', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 455669843362180908, 'O', null, 'Serveur', 6, sie$migrt$pkg.obten_var_page_ir(7347, 'Insert'), 61470, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('PORT', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 455669957748180913, 'O', null, 'Port', 7, sie$migrt$pkg.obten_var_page_ir(7347, 'Insert'), 61471, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DOMN', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 455670061452180913, 'O', null, 'Domaine', 8, sie$migrt$pkg.obten_var_page_ir(7347, 'Insert'), 61472, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DATE_CREAT', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 455670140053180913, 'O', null, 'Date création', 9, sie$migrt$pkg.obten_var_page_ir(7347, 'Insert'), 61473, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 423390349766417408, 'O', null, 'Code', 2, sie$migrt$pkg.obten_var_page_ir(7049, 'Insert'), 57998, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 423390452357417408, 'O', null, 'Nom', 3, sie$migrt$pkg.obten_var_page_ir(7049, 'Insert'), 57999, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 429166431938838417, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(7050, 'Insert'), 58001, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_DV_TYPE_REQT_INTER_FORMT', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 429166639230838418, 'O', null, 'Type', 3, sie$migrt$pkg.obten_var_page_ir(7050, 'Insert'), 58002, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DATE_DEBUT_EFECT', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 429166746728838418, 'O', null, 'Début effectivité', 4, sie$migrt$pkg.obten_var_page_ir(7050, 'Insert'), 58003, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DATE_FIN_EFECT', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 429166835320838418, 'O', null, 'Fin effectivité', 5, sie$migrt$pkg.obten_var_page_ir(7050, 'Insert'), 58004, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DATE_TRAIT', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 429166957030838418, 'O', null, 'Traitement', 6, sie$migrt$pkg.obten_var_page_ir(7050, 'Insert'), 58005, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 422619260649875947, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(7048, 'Insert'), 58006, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 422619361517875951, 'O', null, 'Code', 2, sie$migrt$pkg.obten_var_page_ir(7048, 'Insert'), 58007, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 422619453905875951, 'O', null, 'Nom', 3, sie$migrt$pkg.obten_var_page_ir(7048, 'Insert'), 58008, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DESCR', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 422619560189875951, 'O', null, 'Description', 4, sie$migrt$pkg.obten_var_page_ir(7048, 'Insert'), 58009, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 422661036113019192, 'O', null, 'Code', 2, sie$migrt$pkg.obten_var_page_ir(7026, 'Insert'), 58010, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 422661148953019193, 'O', null, 'Nom', 3, sie$migrt$pkg.obten_var_page_ir(7026, 'Insert'), 58011, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_STRUC_APLIC', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 422661232358019193, 'O', null, 'Structure applicative', 4, sie$migrt$pkg.obten_var_page_ir(7026, 'Insert'), 58012, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 428622746337006524, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(7047, 'Insert'), 58013, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('ADRES_ENVOY', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 428622857139006525, 'O', null, 'Adresse d''envoi', 2, sie$migrt$pkg.obten_var_page_ir(7047, 'Insert'), 58014, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SUJET', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 428622931825006526, 'O', null, 'Sujet', 3, sie$migrt$pkg.obten_var_page_ir(7047, 'Insert'), 58015, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('STAT_SOUMS_FORMT', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 428627643573069070, 'O', null, 'Statut', 4, sie$migrt$pkg.obten_var_page_ir(7047, 'Insert'), 58016, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 422660938446019191, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(7026, 'Insert'), 58017, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_PRODT_FORMT', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 425375148648051625, 'O', null, 'Produit', 5, sie$migrt$pkg.obten_var_page_ir(7046, 'Insert'), 58018, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('INDIC_ACTIF_FORMT', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 427655353361456550, 'O', null, 'Actif', 15, sie$migrt$pkg.obten_var_page_ir(7027, 'Insert'), 58019, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 48447773766609313, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(7027, 'Insert'), 58020, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 48447878342609314, 'O', null, 'Nom', 3, sie$migrt$pkg.obten_var_page_ir(7027, 'Insert'), 58021, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('PRENM', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 48453477515683509, 'O', null, 'Prénom', 4, sie$migrt$pkg.obten_var_page_ir(7027, 'Insert'), 58022, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE_UTILS', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 48453687164683511, 'O', null, 'Code', 2, sie$migrt$pkg.obten_var_page_ir(7027, 'Insert'), 58023, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DATE_EXPIR', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 48453881726683511, 'O', null, 'Date expiration', 7, sie$migrt$pkg.obten_var_page_ir(7027, 'Insert'), 58024, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DATE_CREAT', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 48454194504683511, 'O', null, 'Date Creat', 10, sie$migrt$pkg.obten_var_page_ir(7027, 'Insert'), 58025, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('UTILS_CREAT', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 48454279506683513, 'O', null, 'Utils Creat', 11, sie$migrt$pkg.obten_var_page_ir(7027, 'Insert'), 58026, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('INDIC_VERL_FORMT', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 48455692369735175, 'O', null, 'Verrouillé', 12, sie$migrt$pkg.obten_var_page_ir(7027, 'Insert'), 58027, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('INDIC_CHANG_MOT_PASSE_FORMT', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 48455795071735175, 'O', null, 'Changer mot de passe', 13, sie$migrt$pkg.obten_var_page_ir(7027, 'Insert'), 58028, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('MOT_PASSE', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 51956672231668377, 'O', null, 'Mot de passe', 14, sie$migrt$pkg.obten_var_page_ir(7027, 'Insert'), 58029, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 24866077326957832, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(7028, 'Insert'), 58030, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 24866148827957833, 'O', null, 'Code', 2, sie$migrt$pkg.obten_var_page_ir(7028, 'Insert'), 58031, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 24866264268957833, 'O', null, 'Nom', 3, sie$migrt$pkg.obten_var_page_ir(7028, 'Insert'), 58032, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NUMR', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 24866450551957834, 'O', null, 'Numéro expéditeur', 5, sie$migrt$pkg.obten_var_page_ir(7028, 'Insert'), 58034, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_PROFL_FORMT', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 24866570124957834, 'O', null, 'Profil de courriel expéditeur', 6, sie$migrt$pkg.obten_var_page_ir(7028, 'Insert'), 58035, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 74894273964119124, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(7029, 'Insert'), 58037, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 74894370660119129, 'O', null, 'Code', 2, sie$migrt$pkg.obten_var_page_ir(7029, 'Insert'), 58038, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 74894448832119129, 'O', null, 'Nom', 3, sie$migrt$pkg.obten_var_page_ir(7029, 'Insert'), 58039, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NUMR_APLIC_APEX', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 74895152113119129, 'O', null, 'Numéro', 10, sie$migrt$pkg.obten_var_page_ir(7029, 'Insert'), 58040, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 51105185115837049, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(7030, 'Insert'), 58041, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 51105375602837050, 'O', null, 'Nom', 4, sie$migrt$pkg.obten_var_page_ir(7030, 'Insert'), 58042, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DESCR', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 51105474623837050, 'O', null, 'Description', 5, sie$migrt$pkg.obten_var_page_ir(7030, 'Insert'), 58043, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 51105574433837050, 'O', null, 'Code', 3, sie$migrt$pkg.obten_var_page_ir(7030, 'Insert'), 58044, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 21850153474469724, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(7031, 'Insert'), 58046, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 21850352866469727, 'O', null, 'Nom', 3, sie$migrt$pkg.obten_var_page_ir(7031, 'Insert'), 58048, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 75080668343605113, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(7032, 'Insert'), 58049, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 75080763984605113, 'O', null, 'Nom', 2, sie$migrt$pkg.obten_var_page_ir(7032, 'Insert'), 58050, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('MESG', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 75084263909754723, 'O', null, 'Message', 4, sie$migrt$pkg.obten_var_page_ir(7032, 'Insert'), 58052, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('TYPE_MESG', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 75084454829754723, 'O', null, 'Type', 5, sie$migrt$pkg.obten_var_page_ir(7032, 'Insert'), 58053, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_PRODT', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 75109047924197256, 'O', null, 'Ref Prodt', 7, sie$migrt$pkg.obten_var_page_ir(7032, 'Insert'), 58054, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NUMR_APLIC', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 75078551023592543, 'O', null, 'Numéro application', 1, sie$migrt$pkg.obten_var_page_ir(7033, 'Insert'), 58055, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('PAGE', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 75078878489592545, 'O', null, 'Page', 4, sie$migrt$pkg.obten_var_page_ir(7033, 'Insert'), 58057, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 75078949516592545, 'O', null, 'Seqnc', 5, sie$migrt$pkg.obten_var_page_ir(7033, 'Insert'), 58058, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 75079049418592545, 'O', null, 'Nom', 6, sie$migrt$pkg.obten_var_page_ir(7033, 'Insert'), 58059, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_DV_TYPE_EVENM_FORMT', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 56682859243634467, 'O', null, 'Événement', 2, sie$migrt$pkg.obten_var_page_ir(7034, 'Insert'), 58060, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('APLIC', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 77669448547770074, 'O', null, 'Application', 2, sie$migrt$pkg.obten_var_page_ir(7035, 'Insert'), 58062, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NUMR_PAGE', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 77669552705770074, 'O', null, 'Numéro page', 3, sie$migrt$pkg.obten_var_page_ir(7035, 'Insert'), 58063, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('PAGE', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 77669675779770074, 'O', null, 'Page', 4, sie$migrt$pkg.obten_var_page_ir(7035, 'Insert'), 58064, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_PRODT', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 77669954654770074, 'O', null, 'Ref Prodt', 7, sie$migrt$pkg.obten_var_page_ir(7035, 'Insert'), 58066, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 69901380808677452, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(7036, 'Insert'), 58067, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 16523665072966779, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(7037, 'Insert'), 58078, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 16523754933966779, 'O', null, 'Nom', 2, sie$migrt$pkg.obten_var_page_ir(7037, 'Insert'), 58079, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_PROFL_COURL_FORMT', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 16523969043966781, 'O', null, 'Profil de courriel', 4, sie$migrt$pkg.obten_var_page_ir(7037, 'Insert'), 58081, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 50373793722705478, 'O', null, 'Éditer', 1, sie$migrt$pkg.obten_var_page_ir(7038, 'Insert'), 58082, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 50373897671705481, 'O', null, 'Nom', 3, sie$migrt$pkg.obten_var_page_ir(7038, 'Insert'), 58083, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_TYPE_STRUC_FORMT', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 51100893817732697, 'O', null, 'Type', 6, sie$migrt$pkg.obten_var_page_ir(7038, 'Insert'), 58084, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 50345091104084819, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(7039, 'Insert'), 58085, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 50788989936657909, 'O', null, 'Code', 5, sie$migrt$pkg.obten_var_page_ir(7039, 'Insert'), 58088, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('APLIC', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 74906255000190949, 'O', null, 'Application', 2, sie$migrt$pkg.obten_var_page_ir(7040, 'Insert'), 58091, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NUMR_PAGE', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 74906370227190949, 'O', null, 'Numéro page', 3, sie$migrt$pkg.obten_var_page_ir(7040, 'Insert'), 58092, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('PAGE', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 74906458254190949, 'O', null, 'Page', 4, sie$migrt$pkg.obten_var_page_ir(7040, 'Insert'), 58093, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 74929370833330904, 'O', null, 'Seqnc', 5, sie$migrt$pkg.obten_var_page_ir(7040, 'Insert'), 58094, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 74929448203330909, 'O', null, 'Nom', 6, sie$migrt$pkg.obten_var_page_ir(7040, 'Insert'), 58095, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_PRODT', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 75115468889316874, 'O', null, 'Ref Prodt', 7, sie$migrt$pkg.obten_var_page_ir(7040, 'Insert'), 58096, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 24376158919321289, 'O', null, 'Code', 2, sie$migrt$pkg.obten_var_page_ir(7041, 'Insert'), 58097, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 24376278598321294, 'O', null, 'Nom', 3, sie$migrt$pkg.obten_var_page_ir(7041, 'Insert'), 58098, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DESCR', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 24376358125321294, 'O', null, 'Description', 4, sie$migrt$pkg.obten_var_page_ir(7041, 'Insert'), 58099, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 24690561511722350, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(7041, 'Insert'), 58100, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 24722470545234075, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(7042, 'Insert'), 58101, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 24722553235234078, 'O', null, 'Code', 3, sie$migrt$pkg.obten_var_page_ir(7042, 'Insert'), 58102, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 24722663281234078, 'O', null, 'Nom', 4, sie$migrt$pkg.obten_var_page_ir(7042, 'Insert'), 58103, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DESCR', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 24722777076234078, 'O', null, 'Description', 5, sie$migrt$pkg.obten_var_page_ir(7042, 'Insert'), 58104, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_TYPE_COMNC_FORMT', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 24722868919234078, 'O', null, 'Type', 2, sie$migrt$pkg.obten_var_page_ir(7042, 'Insert'), 58105, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 16512578059960087, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(7043, 'Insert'), 58106, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM_ENVOY', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 16513048023960088, 'O', null, 'Nom expéditeur', 6, sie$migrt$pkg.obten_var_page_ir(7043, 'Insert'), 58107, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('ADRES_ENVOY', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 16513148425960088, 'O', null, 'Adresse expéditeur', 7, sie$migrt$pkg.obten_var_page_ir(7043, 'Insert'), 58108, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 24841879758553763, 'O', null, 'Code', 11, sie$migrt$pkg.obten_var_page_ir(7043, 'Insert'), 58109, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 24841976160553765, 'O', null, 'Nom', 12, sie$migrt$pkg.obten_var_page_ir(7043, 'Insert'), 58110, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 25066872216665346, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(7044, 'Insert'), 58112, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 25066960377665349, 'O', null, 'Code', 2, sie$migrt$pkg.obten_var_page_ir(7044, 'Insert'), 58113, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 25067062335665350, 'O', null, 'Nom', 3, sie$migrt$pkg.obten_var_page_ir(7044, 'Insert'), 58114, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 96900141429204955, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(7045, 'Insert'), 58115, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_GROUP', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 96900248109204958, 'O', null, 'ref grp', 2, sie$migrt$pkg.obten_var_page_ir(7045, 'Insert'), 58116, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_UTILS', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 299187138374240457, 'O', null, 'Utilisateur', 7, sie$migrt$pkg.obten_var_page_ir(7045, 'Insert'), 58117, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DATE_DEBUT_EFECT', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 96900452641204958, 'O', null, 'Début effectivité', 4, sie$migrt$pkg.obten_var_page_ir(7045, 'Insert'), 58118, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DATE_FIN_EFECT', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 96900544095204959, 'O', null, 'Fin effectivité', 5, sie$migrt$pkg.obten_var_page_ir(7045, 'Insert'), 58119, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_GROUP_UTILS_LIE', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 96900639199204959, 'O', null, 'Groupe', 6, sie$migrt$pkg.obten_var_page_ir(7045, 'Insert'), 58120, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DATE_DEBUT_EFECT', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 111199557322316813, 'O', null, 'Début effectivité', 4, sie$migrt$pkg.obten_var_page_ir(7036, 'Insert'), 58121, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DATE_FIN_EFECT', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 111199644453316814, 'O', null, 'Fin effectivité', 5, sie$migrt$pkg.obten_var_page_ir(7036, 'Insert'), 58122, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_GROUP', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 111256946174363265, 'O', null, 'Groupe', 6, sie$migrt$pkg.obten_var_page_ir(7036, 'Insert'), 58123, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_UTILS', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 111257032241363265, 'O', null, 'Utilisateur', 7, sie$migrt$pkg.obten_var_page_ir(7036, 'Insert'), 58124, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_GROUP_UTILS_LIE', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 111257146319363265, 'O', null, 'Groupe lié', 8, sie$migrt$pkg.obten_var_page_ir(7036, 'Insert'), 58125, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 422663761288028812, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(7046, 'Insert'), 58126, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 422663844155028812, 'O', null, 'Code', 2, sie$migrt$pkg.obten_var_page_ir(7046, 'Insert'), 58127, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 422663963297028812, 'O', null, 'Nom', 3, sie$migrt$pkg.obten_var_page_ir(7046, 'Insert'), 58128, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_STRUC_APLIC', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 422664063740028812, 'O', null, 'Structure applicative', 4, sie$migrt$pkg.obten_var_page_ir(7046, 'Insert'), 58129, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 423390254774417407, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(7049, 'Insert'), 58130, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_PRODT_FORMT', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 75084379381754723, 'O', null, 'Application', 6, sie$migrt$pkg.obten_var_page_ir(7032, 'Insert'), 58131, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NUMR_PAGE', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 75078748024592545, 'O', null, 'Numéro page', 3, sie$migrt$pkg.obten_var_page_ir(7033, 'Insert'), 58132, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NUMR_APLIC', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 77669358761770073, 'O', null, 'Numéro application', 1, sie$migrt$pkg.obten_var_page_ir(7035, 'Insert'), 58133, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 77669857017770074, 'O', null, 'Nom', 6, sie$migrt$pkg.obten_var_page_ir(7035, 'Insert'), 58134, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_UTILS_FORMT', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 429166562498838418, 'O', null, 'Utilisateur', 2, sie$migrt$pkg.obten_var_page_ir(7050, 'Insert'), 58136, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('ADRES_IP', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 440541035623938512, 'O', null, 'Adresse IP', 3, sie$migrt$pkg.obten_var_page_ir(7034, 'Insert'), 58137, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 21850256375469727, 'O', null, 'Code', 2, sie$migrt$pkg.obten_var_page_ir(7031, 'Insert'), 58047, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NUMR_MESG', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 75084175977754715, 'O', null, 'Numéro', 3, sie$migrt$pkg.obten_var_page_ir(7032, 'Insert'), 58051, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('APLIC', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 75078665009592545, 'O', null, 'Application', 2, sie$migrt$pkg.obten_var_page_ir(7033, 'Insert'), 58056, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DATE_EVENM', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 56685555906673842, 'O', null, 'Date', 1, sie$migrt$pkg.obten_var_page_ir(7034, 'Insert'), 58061, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 77669766701770074, 'O', null, 'Seqnc', 5, sie$migrt$pkg.obten_var_page_ir(7035, 'Insert'), 58065, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_PRODT_FORMT', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 16523851459966779, 'O', null, 'Application', 3, sie$migrt$pkg.obten_var_page_ir(7037, 'Insert'), 58080, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 50345186526084819, 'O', null, 'Nom', 3, sie$migrt$pkg.obten_var_page_ir(7039, 'Insert'), 58086, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NUMR_APLIC', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 74906177872190943, 'O', null, 'Numéro application', 1, sie$migrt$pkg.obten_var_page_ir(7040, 'Insert'), 58090, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_DV_TYPE_DON_SAIS_FORMT', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 453361431630866444, 'O', null, 'Type donnée', 4, sie$migrt$pkg.obten_var_page_ir(7346, 'Insert'), 61425, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_DV_TYPE_CHAMP_REPNS_FORMT', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 453361547116866449, 'O', null, 'Type champ', 5, sie$migrt$pkg.obten_var_page_ir(7346, 'Insert'), 61426, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('INDIC_REPNS_OBLIG_FORMT', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 453364657612949606, 'O', null, 'Réponse obligatoire', 7, sie$migrt$pkg.obten_var_page_ir(7346, 'Insert'), 61427, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('INDIC_AUTRE_FORMT', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 453365662937960584, 'O', null, 'Autre réponse', 8, sie$migrt$pkg.obten_var_page_ir(7346, 'Insert'), 61428, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 453142038452813574, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(7346, 'Insert'), 61435, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 453142236643813578, 'O', null, 'Nom', 3, sie$migrt$pkg.obten_var_page_ir(7346, 'Insert'), 61437, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('INDIC_ACTIF_FORMT', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 558110336908919552, 'O', null, 'Actif', 3, sie$migrt$pkg.obten_var_page_ir(7427, 'Insert'), 61745, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 558046861100745733, 'O', null, 'Code', 2, sie$migrt$pkg.obten_var_page_ir(7426, 'Insert'), 61746, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 558046958606745734, 'O', null, 'Nom', 3, sie$migrt$pkg.obten_var_page_ir(7426, 'Insert'), 61747, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 558046749064745725, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(7426, 'Insert'), 61748, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('GRP', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 558622239760511730, 'O', null, 'Grp', 6, sie$migrt$pkg.obten_var_page_ir(7039, 'Insert'), 61749, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 558064449532019060, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(7427, 'Insert'), 61750, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_FONCT_FORMT', sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 558064561190019062, 'O', null, 'Fonctionnalité', 2, sie$migrt$pkg.obten_var_page_ir(7427, 'Insert'), 61751, null);
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
select seqnc into sie$migrt$pkg.var_page_ir_coln(61465) from sie_13_page_ir_coln where coln_table = 'TYPE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7347, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61466) from sie_13_page_ir_coln where coln_table = 'STAT_SOUMS' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7347, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61467) from sie_13_page_ir_coln where coln_table = 'NOMBR_TENTV' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7347, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61468) from sie_13_page_ir_coln where coln_table = 'SUJET' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7347, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61469) from sie_13_page_ir_coln where coln_table = 'NOM_ENVOY' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7347, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61470) from sie_13_page_ir_coln where coln_table = 'SERVR' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7347, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61471) from sie_13_page_ir_coln where coln_table = 'PORT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7347, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61472) from sie_13_page_ir_coln where coln_table = 'DOMN' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7347, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61473) from sie_13_page_ir_coln where coln_table = 'DATE_CREAT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7347, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(57998) from sie_13_page_ir_coln where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7049, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(57999) from sie_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7049, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58001) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7050, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58002) from sie_13_page_ir_coln where coln_table = 'REF_DV_TYPE_REQT_INTER_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7050, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58003) from sie_13_page_ir_coln where coln_table = 'DATE_DEBUT_EFECT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7050, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58004) from sie_13_page_ir_coln where coln_table = 'DATE_FIN_EFECT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7050, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58005) from sie_13_page_ir_coln where coln_table = 'DATE_TRAIT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7050, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58006) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7048, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58007) from sie_13_page_ir_coln where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7048, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58008) from sie_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7048, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58009) from sie_13_page_ir_coln where coln_table = 'DESCR' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7048, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58010) from sie_13_page_ir_coln where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7026, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58011) from sie_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7026, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58012) from sie_13_page_ir_coln where coln_table = 'REF_STRUC_APLIC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7026, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58013) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7047, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58014) from sie_13_page_ir_coln where coln_table = 'ADRES_ENVOY' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7047, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58015) from sie_13_page_ir_coln where coln_table = 'SUJET' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7047, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58016) from sie_13_page_ir_coln where coln_table = 'STAT_SOUMS_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7047, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58017) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7026, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58018) from sie_13_page_ir_coln where coln_table = 'REF_PRODT_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7046, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58019) from sie_13_page_ir_coln where coln_table = 'INDIC_ACTIF_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7027, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58020) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7027, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58021) from sie_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7027, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58022) from sie_13_page_ir_coln where coln_table = 'PRENM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7027, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58023) from sie_13_page_ir_coln where coln_table = 'CODE_UTILS' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7027, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58024) from sie_13_page_ir_coln where coln_table = 'DATE_EXPIR' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7027, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58025) from sie_13_page_ir_coln where coln_table = 'DATE_CREAT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7027, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58026) from sie_13_page_ir_coln where coln_table = 'UTILS_CREAT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7027, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58027) from sie_13_page_ir_coln where coln_table = 'INDIC_VERL_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7027, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58028) from sie_13_page_ir_coln where coln_table = 'INDIC_CHANG_MOT_PASSE_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7027, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58029) from sie_13_page_ir_coln where coln_table = 'MOT_PASSE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7027, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58030) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7028, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58031) from sie_13_page_ir_coln where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7028, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58032) from sie_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7028, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58034) from sie_13_page_ir_coln where coln_table = 'NUMR' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7028, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58035) from sie_13_page_ir_coln where coln_table = 'REF_PROFL_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7028, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58037) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7029, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58038) from sie_13_page_ir_coln where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7029, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58039) from sie_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7029, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58040) from sie_13_page_ir_coln where coln_table = 'NUMR_APLIC_APEX' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7029, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58041) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7030, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58042) from sie_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7030, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58043) from sie_13_page_ir_coln where coln_table = 'DESCR' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7030, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58044) from sie_13_page_ir_coln where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7030, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58046) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7031, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58048) from sie_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7031, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58049) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7032, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58050) from sie_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7032, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58052) from sie_13_page_ir_coln where coln_table = 'MESG' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7032, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58053) from sie_13_page_ir_coln where coln_table = 'TYPE_MESG' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7032, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58054) from sie_13_page_ir_coln where coln_table = 'REF_PRODT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7032, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58055) from sie_13_page_ir_coln where coln_table = 'NUMR_APLIC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7033, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58057) from sie_13_page_ir_coln where coln_table = 'PAGE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7033, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58058) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7033, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58059) from sie_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7033, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58060) from sie_13_page_ir_coln where coln_table = 'REF_DV_TYPE_EVENM_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7034, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58062) from sie_13_page_ir_coln where coln_table = 'APLIC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7035, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58063) from sie_13_page_ir_coln where coln_table = 'NUMR_PAGE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7035, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58064) from sie_13_page_ir_coln where coln_table = 'PAGE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7035, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58066) from sie_13_page_ir_coln where coln_table = 'REF_PRODT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7035, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58067) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7036, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58078) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7037, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58079) from sie_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7037, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58081) from sie_13_page_ir_coln where coln_table = 'REF_PROFL_COURL_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7037, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58082) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7038, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58083) from sie_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7038, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58084) from sie_13_page_ir_coln where coln_table = 'REF_TYPE_STRUC_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7038, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58085) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7039, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58088) from sie_13_page_ir_coln where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7039, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58091) from sie_13_page_ir_coln where coln_table = 'APLIC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7040, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58092) from sie_13_page_ir_coln where coln_table = 'NUMR_PAGE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7040, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58093) from sie_13_page_ir_coln where coln_table = 'PAGE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7040, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58094) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7040, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58095) from sie_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7040, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58096) from sie_13_page_ir_coln where coln_table = 'REF_PRODT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7040, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58097) from sie_13_page_ir_coln where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7041, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58098) from sie_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7041, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58099) from sie_13_page_ir_coln where coln_table = 'DESCR' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7041, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58100) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7041, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58101) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7042, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58102) from sie_13_page_ir_coln where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7042, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58103) from sie_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7042, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58104) from sie_13_page_ir_coln where coln_table = 'DESCR' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7042, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58105) from sie_13_page_ir_coln where coln_table = 'REF_TYPE_COMNC_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7042, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58106) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7043, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58107) from sie_13_page_ir_coln where coln_table = 'NOM_ENVOY' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7043, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58108) from sie_13_page_ir_coln where coln_table = 'ADRES_ENVOY' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7043, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58109) from sie_13_page_ir_coln where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7043, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58110) from sie_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7043, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58112) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7044, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58113) from sie_13_page_ir_coln where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7044, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58114) from sie_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7044, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58115) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7045, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58116) from sie_13_page_ir_coln where coln_table = 'REF_GROUP' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7045, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58117) from sie_13_page_ir_coln where coln_table = 'REF_UTILS' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7045, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58118) from sie_13_page_ir_coln where coln_table = 'DATE_DEBUT_EFECT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7045, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58119) from sie_13_page_ir_coln where coln_table = 'DATE_FIN_EFECT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7045, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58120) from sie_13_page_ir_coln where coln_table = 'REF_GROUP_UTILS_LIE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7045, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58121) from sie_13_page_ir_coln where coln_table = 'DATE_DEBUT_EFECT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7036, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58122) from sie_13_page_ir_coln where coln_table = 'DATE_FIN_EFECT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7036, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58123) from sie_13_page_ir_coln where coln_table = 'REF_GROUP' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7036, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58124) from sie_13_page_ir_coln where coln_table = 'REF_UTILS' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7036, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58125) from sie_13_page_ir_coln where coln_table = 'REF_GROUP_UTILS_LIE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7036, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58126) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7046, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58127) from sie_13_page_ir_coln where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7046, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58128) from sie_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7046, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58129) from sie_13_page_ir_coln where coln_table = 'REF_STRUC_APLIC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7046, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58130) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7049, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58131) from sie_13_page_ir_coln where coln_table = 'REF_PRODT_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7032, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58132) from sie_13_page_ir_coln where coln_table = 'NUMR_PAGE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7033, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58133) from sie_13_page_ir_coln where coln_table = 'NUMR_APLIC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7035, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58134) from sie_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7035, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58136) from sie_13_page_ir_coln where coln_table = 'REF_UTILS_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7050, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58137) from sie_13_page_ir_coln where coln_table = 'ADRES_IP' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7034, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58047) from sie_13_page_ir_coln where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7031, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58051) from sie_13_page_ir_coln where coln_table = 'NUMR_MESG' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7032, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58056) from sie_13_page_ir_coln where coln_table = 'APLIC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7033, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58061) from sie_13_page_ir_coln where coln_table = 'DATE_EVENM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7034, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58065) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7035, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58080) from sie_13_page_ir_coln where coln_table = 'REF_PRODT_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7037, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58086) from sie_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7039, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(58090) from sie_13_page_ir_coln where coln_table = 'NUMR_APLIC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7040, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61425) from sie_13_page_ir_coln where coln_table = 'REF_DV_TYPE_DON_SAIS_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7346, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61426) from sie_13_page_ir_coln where coln_table = 'REF_DV_TYPE_CHAMP_REPNS_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7346, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61427) from sie_13_page_ir_coln where coln_table = 'INDIC_REPNS_OBLIG_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7346, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61428) from sie_13_page_ir_coln where coln_table = 'INDIC_AUTRE_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7346, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61435) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7346, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61437) from sie_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7346, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61745) from sie_13_page_ir_coln where coln_table = 'INDIC_ACTIF_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7427, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61746) from sie_13_page_ir_coln where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7426, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61747) from sie_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7426, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61748) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7426, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61749) from sie_13_page_ir_coln where coln_table = 'GRP' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7039, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61750) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7427, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61751) from sie_13_page_ir_coln where coln_table = 'REF_FONCT_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7427, 'Select');
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

insert into tc$13$liste$navgt (aplic, code, css_icone_boots, dnr_ref_aplic, indic_reint_sidf, libl, ordre_presn, page, ref_page, sapc, sapi, seqnc, sspc, sspi) values ('1000006', 'DISPN_UTILS', null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'N', 'Disponibilité', 2, '1031', sie$migrt$pkg.obten_var_page(17161, 'Insert'), null, null, 3766, null, null);
insert into tc$13$liste$navgt (aplic, code, css_icone_boots, dnr_ref_aplic, indic_reint_sidf, libl, ordre_presn, page, ref_page, sapc, sapi, seqnc, sspc, sspi) values ('1000004', 'COURL', null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 'N', 'Courriel', 1, '20020', sie$migrt$pkg.obten_var_page(17161, 'Insert'), null, null, 3746, null, null);

merge into sie_13_liste_navgt t
                        using tc$13$liste$navgt tf
               on ((t.code = tf.code) and (t.ref_page = tf.ref_page or (t.ref_page is null and tf.ref_page is null) or tf.ref_page is null ))
when not matched then
              insert (t.aplic, t.code, t.css_icone_boots, t.dnr_ref_aplic, t.indic_reint_sidf, t.libl, t.ordre_presn, t.page, t.ref_page, t.sapc, t.sapi, t.sspc, t.sspi)
              values (tf.aplic, tf.code, tf.css_icone_boots, tf.dnr_ref_aplic, tf.indic_reint_sidf, tf.libl, tf.ordre_presn, tf.page, tf.ref_page, tf.sapc, tf.sapi, tf.sspc, tf.sspi)
when matched then
              update set t.aplic = tf.aplic, t.css_icone_boots = tf.css_icone_boots, t.dnr_ref_aplic = tf.dnr_ref_aplic, t.indic_reint_sidf = tf.indic_reint_sidf, t.libl = tf.libl, t.ordre_presn = tf.ordre_presn, t.page = tf.page, t.sapc = tf.sapc, t.sapi = tf.sapi, t.sspc = tf.sspc, t.sspi = tf.sspi
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
            where t.dnr_ref_aplic = sie$migrt$pkg.var_aplic(188)
              and not exists (select null
                                from tc$13$liste$navgt tf
                               where (t.code = tf.code) and (t.ref_page = tf.ref_page or (t.ref_page is null and tf.ref_page is null) or tf.ref_page is null ));

select seqnc into sie$migrt$pkg.var_liste_navgt(3766) from sie_13_liste_navgt where code = 'DISPN_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(17161, 'Select');
select seqnc into sie$migrt$pkg.var_liste_navgt(3746) from sie_13_liste_navgt where code = 'COURL' and ref_page = sie$migrt$pkg.obten_var_page(17161, 'Select');
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

insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 456767237354450715, 'O', null, null, null, null, 'O', null, 'Complexité maximal', 'P12020_REF_DV_COMPL_MAXM', sie$migrt$pkg.obten_var_page(17161, 'Insert'), 228618, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 422624151710113158, 'O', null, null, null, null, 'O', null, 'Corps Message', 'P34310_CORPS_MESG', sie$migrt$pkg.obten_var_page(17196, 'Insert'), 218695, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 18914372997698109, 'O', null, null, null, null, 'N', null, '[SADA]', 'SADA', sie$migrt$pkg.obten_var_page(17156, 'Insert'), 218439, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 48459372280779017, 'O', null, null, null, null, 'N', null, 'Test', 'SIDF', sie$migrt$pkg.obten_var_page(17156, 'Insert'), 218440, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 48459599754779019, 'O', null, null, null, null, 'N', null, '[SSPC]', 'SSPC', sie$migrt$pkg.obten_var_page(17156, 'Insert'), 218441, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 48459774744779019, 'O', null, null, null, null, 'N', null, '[SCPC]', 'SCPC', sie$migrt$pkg.obten_var_page(17156, 'Insert'), 218442, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 48798593166398500, 'O', null, null, null, null, 'N', null, '[SAPC]', 'SAPC', sie$migrt$pkg.obten_var_page(17156, 'Insert'), 218443, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 70283077157455164, 'O', null, null, null, null, 'N', null, 'SNPI', 'SNPI', sie$migrt$pkg.obten_var_page(17156, 'Insert'), 218444, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 93023393554622797, 'O', null, null, null, null, 'N', null, '[SCPI]', 'SCPI', sie$migrt$pkg.obten_var_page(17156, 'Insert'), 218445, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 93023598749624320, 'O', null, null, null, null, 'N', null, '[SSPI]', 'SSPI', sie$migrt$pkg.obten_var_page(17156, 'Insert'), 218446, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 93023803597625667, 'O', null, null, null, null, 'N', null, '[SAPI]', 'SAPI', sie$migrt$pkg.obten_var_page(17156, 'Insert'), 218447, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 241484159569255018, 'O', null, null, null, null, 'N', null, '[P0_RECHR_GLOBL]', 'P0_RECHR_GLOBL', sie$migrt$pkg.obten_var_page(17156, 'Insert'), 218448, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 19399664018260242, 'O', null, null, null, null, 'N', null, 'Code d''utilisateur', 'P101_CODE_UTILS', sie$migrt$pkg.obten_var_page(17158, 'Insert'), 218449, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 19399860307260242, 'O', null, null, null, null, 'N', null, 'Mot de passe', 'P101_MOT_PASSE', sie$migrt$pkg.obten_var_page(17158, 'Insert'), 218450, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 19400042833260253, 'O', null, null, null, null, 'N', null, 'Connexion', 'P101_LOGIN', sie$migrt$pkg.obten_var_page(17158, 'Insert'), 218451, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 19400236901260254, 'O', null, null, null, null, 'N', null, 'Domaine', 'P101_DOMN', sie$migrt$pkg.obten_var_page(17158, 'Insert'), 218452, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 19400436664260255, 'O', null, null, null, null, 'N', null, '[P101_LANG]', 'P101_LANG', sie$migrt$pkg.obten_var_page(17158, 'Insert'), 218453, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 19400635424260255, 'O', null, null, null, null, 'N', null, '[P101_FORCE_DOMN]', 'P101_FORCE_DOMN', sie$migrt$pkg.obten_var_page(17158, 'Insert'), 218454, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 422481057225435252, 'O', null, null, null, null, 'N', null, 'Application:', 'P102_APPLICATION_ID', sie$migrt$pkg.obten_var_page(17159, 'Insert'), 218455, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 422481564309435255, 'O', null, null, null, null, 'N', null, 'Page:', 'P102_PAGE_ID', sie$migrt$pkg.obten_var_page(17159, 'Insert'), 218456, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 422482063955435256, 'O', null, null, null, null, 'N', null, '[P102_A]', 'P102_A', sie$migrt$pkg.obten_var_page(17159, 'Insert'), 218457, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 422482241849435256, 'O', null, null, null, null, 'N', null, 'Commentaire', 'P102_FEEDBACK', sie$migrt$pkg.obten_var_page(17159, 'Insert'), 218458, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 422482763985435256, 'O', null, null, null, null, 'N', null, '[P102_X]', 'P102_X', sie$migrt$pkg.obten_var_page(17159, 'Insert'), 218459, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 422482932833435256, 'O', null, null, null, null, 'N', null, 'Type de commentaire', 'P102_FEEDBACK_TYPE', sie$migrt$pkg.obten_var_page(17159, 'Insert'), 218460, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 422483461629435256, 'O', null, null, null, null, 'N', null, '[P102_Y]', 'P102_Y', sie$migrt$pkg.obten_var_page(17159, 'Insert'), 218461, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 418927901783132831, 'N', null, null, null, null, 'N', null, 'Appliquer', 'SUBMIT', sie$migrt$pkg.obten_var_page(17159, 'Insert'), 218462, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 48759095828712141, 'O', null, null, null, null, 'N', null, 'Libl Contx', 'P12010_LIBL_CONTX', sie$migrt$pkg.obten_var_page(17160, 'Insert'), 218463, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 48759275180715664, 'O', null, null, null, null, 'N', null, '&P12010_LIBL_CONTX.', 'P12010_CONTX', sie$migrt$pkg.obten_var_page(17160, 'Insert'), 218464, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 44895769878306901, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', sie$migrt$pkg.obten_var_page(17160, 'Insert'), 218465, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 16484861005644777, 'O', null, null, null, null, 'O', null, 'Courriel', 'P12020_COURL', sie$migrt$pkg.obten_var_page(17161, 'Insert'), 218466, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 48491794913891841, 'O', null, null, null, null, 'O', null, 'Séquence', 'P12020_SEQNC', sie$migrt$pkg.obten_var_page(17161, 'Insert'), 218467, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 48492004135891842, 'O', null, null, null, null, 'O', null, 'Nom', 'P12020_NOM', sie$migrt$pkg.obten_var_page(17161, 'Insert'), 218468, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 48492179448891844, 'O', null, null, null, null, 'O', null, 'Prénom', 'P12020_PRENM', sie$migrt$pkg.obten_var_page(17161, 'Insert'), 218469, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 48492579677891844, 'O', null, null, null, null, 'O', null, 'Code', 'P12020_CODE_UTILS', sie$migrt$pkg.obten_var_page(17161, 'Insert'), 218470, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 48493185874891847, 'O', null, null, null, null, 'O', null, 'Date expiration', 'P12020_DATE_EXPIR', sie$migrt$pkg.obten_var_page(17161, 'Insert'), 218471, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 48493400798891847, 'O', null, null, null, null, 'O', null, 'Compte verrouillé', 'P12020_INDIC_VERL', sie$migrt$pkg.obten_var_page(17161, 'Insert'), 218472, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 48493775768891847, 'O', null, null, null, null, 'O', null, 'Changer mot passe prochaine connexion', 'P12020_INDIC_CHANG_MOT_PASSE', sie$migrt$pkg.obten_var_page(17161, 'Insert'), 218473, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 428164852725124486, 'O', null, null, null, null, 'O', null, 'Compte actif', 'P12020_INDIC_ACTIF', sie$migrt$pkg.obten_var_page(17161, 'Insert'), 218480, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 428231659168684244, 'O', null, null, null, null, 'N', null, 'Groupe de droit', 'P12020_GROUP_DROIT', sie$migrt$pkg.obten_var_page(17161, 'Insert'), 218481, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 428234042358915901, 'O', null, null, null, null, 'N', null, 'Groupe d''utilisateurs', 'P12020_GROUP_UTILS', sie$migrt$pkg.obten_var_page(17161, 'Insert'), 218482, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 44937950124589419, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', sie$migrt$pkg.obten_var_page(17161, 'Insert'), 218483, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 44938271398589420, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(17161, 'Insert'), 218485, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 44937853239589419, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', sie$migrt$pkg.obten_var_page(17161, 'Insert'), 218486, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 44943447918599286, 'N', null, null, null, null, 'N', null, 'Enregistrer et ajouter', 'CREATE_ADD', sie$migrt$pkg.obten_var_page(17161, 'Insert'), 218487, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 44938041589589419, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', sie$migrt$pkg.obten_var_page(17161, 'Insert'), 218488, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 49229274809790508, 'O', null, null, null, null, 'O', null, 'Séquence', 'P12030_SEQNC', sie$migrt$pkg.obten_var_page(17163, 'Insert'), 218489, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 49234092301815122, 'O', null, null, null, null, 'N', null, 'Mot de passe', 'P12030_NOUV_MOT_PASSE', sie$migrt$pkg.obten_var_page(17163, 'Insert'), 218490, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 49234280457815124, 'O', null, null, null, null, 'N', null, 'Confirmation', 'P12030_CONFR_MOT_PASSE', sie$migrt$pkg.obten_var_page(17163, 'Insert'), 218491, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 421653406896793935, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'DEFNR', sie$migrt$pkg.obten_var_page(17163, 'Insert'), 218493, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 50357281263172758, 'O', null, null, null, null, 'N', null, 'Espace de travail:', 'P12121_CONTX', sie$migrt$pkg.obten_var_page(17164, 'Insert'), 218494, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 46792965290782400, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', sie$migrt$pkg.obten_var_page(17164, 'Insert'), 218495, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 50348400881089916, 'O', null, null, null, null, 'O', null, 'Nom', 'P12131_NOM', sie$migrt$pkg.obten_var_page(17165, 'Insert'), 218496, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 50348590852089916, 'O', null, null, null, null, 'O', null, 'Description', 'P12131_DESCR', sie$migrt$pkg.obten_var_page(17165, 'Insert'), 218497, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 50788182186646225, 'O', null, null, null, null, 'O', null, 'Code', 'P12131_CODE', sie$migrt$pkg.obten_var_page(17165, 'Insert'), 218499, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 60019570682550110, 'O', null, null, null, null, 'O', null, 'Ignorer groupe administrateur', 'P12131_INDIC_IGNOR_GROUP_ADMIN', sie$migrt$pkg.obten_var_page(17165, 'Insert'), 218500, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 87241653874491700, 'O', null, null, null, null, 'N', null, '[P12131_MODE]', 'P12131_MODE', sie$migrt$pkg.obten_var_page(17165, 'Insert'), 218501, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 96007876358255878, 'O', null, null, null, null, 'O', null, 'domaine', 'P12131_REF_DOMN', sie$migrt$pkg.obten_var_page(17165, 'Insert'), 218502, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 83362727510153045, 'N', null, null, null, null, 'N', null, 'Supprimer', 'MULTI_ROW_DELETE', sie$migrt$pkg.obten_var_page(17165, 'Insert'), 218503, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 83362808150153045, 'N', null, null, null, null, 'N', null, 'Ajouter', 'ADD', sie$migrt$pkg.obten_var_page(17165, 'Insert'), 218504, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 46795452465787497, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(17165, 'Insert'), 218506, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 46795252837787497, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', sie$migrt$pkg.obten_var_page(17165, 'Insert'), 218507, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 46794853159787495, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', sie$migrt$pkg.obten_var_page(17165, 'Insert'), 218508, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 425879509693917010, 'N', null, null, null, null, 'N', null, 'Liste', 'LISTR_GROUP', sie$migrt$pkg.obten_var_page(17165, 'Insert'), 218509, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 425880121598929973, 'N', null, null, null, null, 'N', null, 'Liste', 'LISTR_UTILS', sie$migrt$pkg.obten_var_page(17165, 'Insert'), 218510, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 425880326100931250, 'N', null, null, null, null, 'N', null, 'Liste', 'LISTR_DROIT', sie$migrt$pkg.obten_var_page(17165, 'Insert'), 218511, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 99832702727524388, 'N', null, null, null, null, 'N', null, 'Éditer', 'EDITR_GROUP', sie$migrt$pkg.obten_var_page(17165, 'Insert'), 218512, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 99930603204533994, 'N', null, null, null, null, 'N', null, 'Éditer', 'EDITR_UTILS', sie$migrt$pkg.obten_var_page(17165, 'Insert'), 218513, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 294591624407421332, 'N', null, null, null, null, 'N', null, 'Éditer', 'EDITR_DROIT', sie$migrt$pkg.obten_var_page(17165, 'Insert'), 218514, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 50374594369705484, 'O', null, null, null, null, 'N', null, 'Espace de travail:', 'P12141_CONTX', sie$migrt$pkg.obten_var_page(17166, 'Insert'), 218515, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 46821657643403064, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', sie$migrt$pkg.obten_var_page(17166, 'Insert'), 218516, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 50384175810782456, 'O', null, null, null, null, 'O', null, 'Séquence', 'P12151_SEQNC', sie$migrt$pkg.obten_var_page(17167, 'Insert'), 218517, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 50384393381782456, 'O', null, null, null, null, 'O', null, 'Nom', 'P12151_NOM', sie$migrt$pkg.obten_var_page(17167, 'Insert'), 218518, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 50390488440818280, 'O', null, null, null, null, 'N', null, 'Espace de travail:', 'P12151_CONTX', sie$migrt$pkg.obten_var_page(17167, 'Insert'), 218519, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 50454681403625555, 'O', null, null, null, null, 'N', null, '[P12151_STRUC_LIE]', 'P12151_STRUC_LIE', sie$migrt$pkg.obten_var_page(17167, 'Insert'), 218520, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 51103174218812100, 'O', null, null, null, null, 'O', null, 'Type', 'P12151_REF_TYPE_STRUC', sie$migrt$pkg.obten_var_page(17167, 'Insert'), 218521, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 51244986656569952, 'O', null, null, null, null, 'O', null, 'Responsable', 'P12151_REF_RESPN', sie$migrt$pkg.obten_var_page(17167, 'Insert'), 218522, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 71505695880588303, 'O', null, null, null, null, 'O', null, 'Début effectivité', 'P12151_DEBUT_EFECT', sie$migrt$pkg.obten_var_page(17167, 'Insert'), 218523, 'ITEM');
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
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 71505878003592536, 'O', null, null, null, null, 'O', null, 'Fin effectivité', 'P12151_FIN_EFECT', sie$migrt$pkg.obten_var_page(17167, 'Insert'), 218524, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 103152394019791689, 'O', null, null, null, null, 'O', null, 'Défaut', 'P12151_INDIC_DEFT', sie$migrt$pkg.obten_var_page(17167, 'Insert'), 218525, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 46830871356480037, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', sie$migrt$pkg.obten_var_page(17167, 'Insert'), 218526, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 46831263830480037, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(17167, 'Insert'), 218527, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 46831044440480037, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', sie$migrt$pkg.obten_var_page(17167, 'Insert'), 218528, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 46830670629480036, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', sie$migrt$pkg.obten_var_page(17167, 'Insert'), 218529, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 48764197484807267, 'O', null, null, null, null, 'N', null, 'Struc Admin', 'P12181_STRUC_ADMIN', sie$migrt$pkg.obten_var_page(17168, 'Insert'), 218530, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 51337091214242659, 'O', null, null, null, null, 'N', null, '[P12181_MEMBR_STRUC]', 'P12181_MEMBR_STRUC', sie$migrt$pkg.obten_var_page(17168, 'Insert'), 218531, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 51337274853242663, 'O', null, null, null, null, 'N', null, 'Structure', 'P12181_CONTX', sie$migrt$pkg.obten_var_page(17168, 'Insert'), 218532, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 47784158224940240, 'N', null, null, null, null, 'N', null, 'Appliquer', 'SAVE', sie$migrt$pkg.obten_var_page(17168, 'Insert'), 218533, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 47783957506940237, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(17168, 'Insert'), 218534, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 18805541362464536, 'N', null, null, null, null, 'N', null, 'Créer', 'CREER', sie$migrt$pkg.obten_var_page(17169, 'Insert'), 218535, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 22975263268226537, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P12210_SEQNC', sie$migrt$pkg.obten_var_page(17170, 'Insert'), 218536, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 22975471647226543, 'O', null, null, null, null, 'O', null, 'Code', 'P12210_CODE', sie$migrt$pkg.obten_var_page(17170, 'Insert'), 218537, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 22975677159226544, 'O', null, null, null, null, 'O', null, 'Nom', 'P12210_NOM', sie$migrt$pkg.obten_var_page(17170, 'Insert'), 218538, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 22975860534226545, 'O', null, null, null, null, 'O', null, 'Description', 'P12210_DESCR', sie$migrt$pkg.obten_var_page(17170, 'Insert'), 218539, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 24845348263695958, 'O', null, null, null, null, 'O', null, 'Compte envoi télécopie défaut', 'P12210_REF_COMPT_AXIAT_DEFT', sie$migrt$pkg.obten_var_page(17170, 'Insert'), 218540, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 25059549904194159, 'O', null, null, null, null, 'O', null, 'Profil courriel notification', 'P12210_REF_PROFL_COURL_NOTFC', sie$migrt$pkg.obten_var_page(17170, 'Insert'), 218541, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 25060077440239985, 'O', null, null, null, null, 'O', null, 'Profil sms notification', 'P12210_REF_PROFL_SMS_NOTFC', sie$migrt$pkg.obten_var_page(17170, 'Insert'), 218542, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 19421419710924115, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', sie$migrt$pkg.obten_var_page(17170, 'Insert'), 218547, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 434269646235606778, 'O', null, null, null, null, 'O', null, 'Procédure PL/SQL authentification externe', 'P12210_PROCD_AUTHE_EXTER_AFW', sie$migrt$pkg.obten_var_page(17170, 'Insert'), 218544, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 434475950628393040, 'O', null, null, null, null, 'N', null, '[P12210_MODE]', 'P12210_MODE', sie$migrt$pkg.obten_var_page(17170, 'Insert'), 218546, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 19421743568924115, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(17170, 'Insert'), 218548, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 19421341536924115, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', sie$migrt$pkg.obten_var_page(17170, 'Insert'), 218549, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 19421546187924115, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', sie$migrt$pkg.obten_var_page(17170, 'Insert'), 218551, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 47553241483534633, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', sie$migrt$pkg.obten_var_page(17172, 'Insert'), 218556, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 51128901223975111, 'O', null, null, null, null, 'O', null, 'Séquence', 'P12336_SEQNC', sie$migrt$pkg.obten_var_page(17173, 'Insert'), 218557, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 51129100555975113, 'O', null, null, null, null, 'O', null, 'Code', 'P12336_CODE', sie$migrt$pkg.obten_var_page(17173, 'Insert'), 218558, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 51129292575975113, 'O', null, null, null, null, 'O', null, 'Nom', 'P12336_NOM', sie$migrt$pkg.obten_var_page(17173, 'Insert'), 218559, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 51129474786975113, 'O', null, null, null, null, 'O', null, 'Description', 'P12336_DESCR', sie$migrt$pkg.obten_var_page(17173, 'Insert'), 218560, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 51129675792975113, 'O', null, null, null, null, 'O', null, 'Application', 'P12336_REF_DOMN', sie$migrt$pkg.obten_var_page(17173, 'Insert'), 218561, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 47575563160672690, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', sie$migrt$pkg.obten_var_page(17173, 'Insert'), 218562, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 47575963373672692, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(17173, 'Insert'), 218563, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 47575746666672690, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', sie$migrt$pkg.obten_var_page(17173, 'Insert'), 218564, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 47575366840672690, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', sie$migrt$pkg.obten_var_page(17173, 'Insert'), 218565, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 50557086641823891, 'O', null, null, null, null, 'N', null, 'Type', 'P13053_TYPE_DEFNT_ACCES', sie$migrt$pkg.obten_var_page(17174, 'Insert'), 218566, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 47032943616806984, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(17174, 'Insert'), 218567, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 419839530469182566, 'N', null, null, null, null, 'N', null, 'Créer', 'CREER', sie$migrt$pkg.obten_var_page(17175, 'Insert'), 218568, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 423410858213682542, 'O', null, null, null, null, 'O', null, '[P19030_SEQNC]', 'P19030_SEQNC', sie$migrt$pkg.obten_var_page(17176, 'Insert'), 218569, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 423411041028687058, 'O', null, null, null, null, 'O', null, 'Domaine', 'P19030_REF_DOMN', sie$migrt$pkg.obten_var_page(17176, 'Insert'), 218570, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 423411233541694343, 'O', null, null, null, null, 'O', null, 'Code', 'P19030_CODE', sie$migrt$pkg.obten_var_page(17176, 'Insert'), 218571, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 423411455012700542, 'O', null, null, null, null, 'O', null, 'Nom', 'P19030_NOM', sie$migrt$pkg.obten_var_page(17176, 'Insert'), 218572, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 423411638174705207, 'O', null, null, null, null, 'O', null, 'Description', 'P19030_DESCR', sie$migrt$pkg.obten_var_page(17176, 'Insert'), 218573, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 434471056667205555, 'O', null, null, null, null, 'O', null, 'Produit', 'P19030_REF_PRODT', sie$migrt$pkg.obten_var_page(17176, 'Insert'), 218574, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 80971116276870002, 'O', null, null, null, null, 'O', null, '[P19030_DNR_REF_PRODT]', 'P19030_DNR_REF_PRODT', sie$migrt$pkg.obten_var_page(17176, 'Insert'), 218575, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 419842117843292486, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(17176, 'Insert'), 218576, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 419842722045322079, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', sie$migrt$pkg.obten_var_page(17176, 'Insert'), 218577, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 419842430094305463, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', sie$migrt$pkg.obten_var_page(17176, 'Insert'), 218578, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 419894829676093125, 'N', null, null, null, null, 'N', null, 'Créer', 'CRÉER', sie$migrt$pkg.obten_var_page(17176, 'Insert'), 218579, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 419843109148337265, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', sie$migrt$pkg.obten_var_page(17176, 'Insert'), 218580, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 423450843006598456, 'O', null, null, null, null, 'O', null, '[P19040_SEQNC]', 'P19040_SEQNC', sie$migrt$pkg.obten_var_page(17177, 'Insert'), 218581, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 423451037297634592, 'O', null, null, null, null, 'O', null, 'Modèle de recherche', 'P19040_REF_MODL_RECHR', sie$migrt$pkg.obten_var_page(17177, 'Insert'), 218582, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 423451239852644823, 'O', null, null, null, null, 'O', null, 'Structure applicative de la recherche ', 'P19040_REF_STRUC_APLIC_RECHR', sie$migrt$pkg.obten_var_page(17177, 'Insert'), 218583, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 423451463017698842, 'O', null, null, null, null, 'O', null, 'Lien ', 'P19040_REF_STRUC_APLIC_LIEN', sie$migrt$pkg.obten_var_page(17177, 'Insert'), 218584, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 423452263250840777, 'O', null, null, null, null, 'O', null, 'Affichage', 'P19040_REF_ATRIB_STRUC_APLIC_AFICH', sie$migrt$pkg.obten_var_page(17177, 'Insert'), 218585, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 423459636931550036, 'O', null, null, null, null, 'O', null, 'Nombre maximum de résultats', 'P19040_NOMBR_MAXIM_RESLT', sie$migrt$pkg.obten_var_page(17177, 'Insert'), 218586, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 419896810863229591, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(17177, 'Insert'), 218587, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 419897020691241865, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', sie$migrt$pkg.obten_var_page(17177, 'Insert'), 218588, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 419897224631252543, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', sie$migrt$pkg.obten_var_page(17177, 'Insert'), 218589, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 419922304385127134, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE1', sie$migrt$pkg.obten_var_page(17177, 'Insert'), 218590, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 419897417836260052, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', sie$migrt$pkg.obten_var_page(17177, 'Insert'), 218591, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 423477662285512864, 'O', null, null, null, null, 'O', null, '[P19041_SEQNC]', 'P19041_SEQNC', sie$migrt$pkg.obten_var_page(17178, 'Insert'), 218592, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 423477851681519237, 'O', null, null, null, null, 'O', null, 'Application du modèle de recherche', 'P19041_REF_APLIC_MODL_RECHR', sie$migrt$pkg.obten_var_page(17178, 'Insert'), 218593, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 423478142377544954, 'O', null, null, null, null, 'O', null, 'Attribut de la structure applicative', 'P19041_REF_ATRIB_STRUC_APLIC', sie$migrt$pkg.obten_var_page(17178, 'Insert'), 218594, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 423478464241579641, 'O', null, null, null, null, 'O', null, 'Patron de recherche', 'P19041_REF_PATRN_RECHR', sie$migrt$pkg.obten_var_page(17178, 'Insert'), 218595, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 423478735891599826, 'O', null, null, null, null, 'O', null, 'Ordre d''execution', 'P19041_ORDRE_EXECT', sie$migrt$pkg.obten_var_page(17178, 'Insert'), 218596, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 423478962903607618, 'O', null, null, null, null, 'O', null, 'Pertinence', 'P19041_PERTN', sie$migrt$pkg.obten_var_page(17178, 'Insert'), 218597, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 419923428888153198, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(17178, 'Insert'), 218598, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 419923725556161614, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', sie$migrt$pkg.obten_var_page(17178, 'Insert'), 218599, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 419924322702179779, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', sie$migrt$pkg.obten_var_page(17178, 'Insert'), 218600, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 12961025750657680, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', sie$migrt$pkg.obten_var_page(17179, 'Insert'), 218602, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 16517075225964441, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P20010_SEQNC', sie$migrt$pkg.obten_var_page(17180, 'Insert'), 218603, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 16517471978964443, 'O', null, null, null, null, 'O', null, 'Serveur', 'P20010_SERVR_SORTN', sie$migrt$pkg.obten_var_page(17180, 'Insert'), 218604, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 16517680227964443, 'O', null, null, null, null, 'O', null, 'Port', 'P20010_PORT_SORTN', sie$migrt$pkg.obten_var_page(17180, 'Insert'), 218605, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 16518071290964443, 'O', null, null, null, null, 'O', null, 'Nom expéditeur', 'P20010_NOM_ENVOY', sie$migrt$pkg.obten_var_page(17180, 'Insert'), 218606, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 16518461498964443, 'O', null, null, null, null, 'O', null, 'Méthode authentification', 'P20010_AUTHE_METHD_SORTN', sie$migrt$pkg.obten_var_page(17180, 'Insert'), 218608, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 16518674329964443, 'O', null, null, null, null, 'O', null, 'Utilisateur authentification', 'P20010_AUTHE_USAGR_SORTN', sie$migrt$pkg.obten_var_page(17180, 'Insert'), 218609, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 16518853265964443, 'O', null, null, null, null, 'O', null, 'Mot de passe authentification', 'P20010_AUTHE_MDP_SORTN', sie$migrt$pkg.obten_var_page(17180, 'Insert'), 218610, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 24838259102481552, 'O', null, null, null, null, 'O', null, 'Code', 'P20010_CODE', sie$migrt$pkg.obten_var_page(17180, 'Insert'), 218611, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 24838468027481553, 'O', null, null, null, null, 'O', null, 'Nom', 'P20010_NOM', sie$migrt$pkg.obten_var_page(17180, 'Insert'), 218612, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 25375267054774219, 'O', null, null, null, null, 'O', null, 'Serveur', 'P20010_SERVR_ENTRA', sie$migrt$pkg.obten_var_page(17180, 'Insert'), 218614, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 25375456491774220, 'O', null, null, null, null, 'O', null, 'Port', 'P20010_PORT_ENTRA', sie$migrt$pkg.obten_var_page(17180, 'Insert'), 218615, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 25375666453774220, 'O', null, null, null, null, 'O', null, 'Méthode authentification', 'P20010_AUTHE_METHD_ENTRA', sie$migrt$pkg.obten_var_page(17180, 'Insert'), 218616, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 25375868672774220, 'O', null, null, null, null, 'O', null, 'Utilisateur authentification', 'P20010_AUTHE_USAGR_ENTRA', sie$migrt$pkg.obten_var_page(17180, 'Insert'), 218617, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 25376071727774220, 'O', null, null, null, null, 'O', null, 'Mot de passe authentification', 'P20010_AUTHE_MDP_ENTRA', sie$migrt$pkg.obten_var_page(17180, 'Insert'), 218618, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 427684132762881665, 'O', null, null, null, null, 'O', null, 'Domaine', 'P20010_DOMN', sie$migrt$pkg.obten_var_page(17180, 'Insert'), 218620, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 12963525085662021, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', sie$migrt$pkg.obten_var_page(17180, 'Insert'), 218621, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 12963742065662022, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(17180, 'Insert'), 218622, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 12963933994662022, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', sie$migrt$pkg.obten_var_page(17180, 'Insert'), 218623, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 12964130561662022, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', sie$migrt$pkg.obten_var_page(17180, 'Insert'), 218624, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 428640853351226858, 'O', null, null, null, null, 'O', null, 'Format HTML', 'P20030_INDIC_FORMT_HTML', sie$migrt$pkg.obten_var_page(17182, 'Insert'), 218625, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 428641035682226858, 'O', null, null, null, null, 'O', null, 'Corps', 'P20030_CORPS', sie$migrt$pkg.obten_var_page(17182, 'Insert'), 218626, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 428641232608226858, 'O', null, null, null, null, 'O', null, 'Nombre de tentative', 'P20030_NOMBR_TENTV', sie$migrt$pkg.obten_var_page(17182, 'Insert'), 218627, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 428641435135226858, 'O', null, null, null, null, 'O', null, 'Nombre de tentative maximale', 'P20030_NOMBR_TENTV_MAX', sie$migrt$pkg.obten_var_page(17182, 'Insert'), 218628, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 428641643005226858, 'O', null, null, null, null, 'O', null, 'Sens', 'P20030_SENS', sie$migrt$pkg.obten_var_page(17182, 'Insert'), 218629, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 428641841329226859, 'O', null, null, null, null, 'O', null, 'Statut', 'P20030_STAT_SOUMS', sie$migrt$pkg.obten_var_page(17182, 'Insert'), 218630, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 428639456527226847, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P20030_SEQNC', sie$migrt$pkg.obten_var_page(17182, 'Insert'), 218631, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 428639643050226855, 'O', null, null, null, null, 'O', null, 'Serveur', 'P20030_SERVR', sie$migrt$pkg.obten_var_page(17182, 'Insert'), 218632, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 428639859809226856, 'O', null, null, null, null, 'O', null, 'Port', 'P20030_PORT', sie$migrt$pkg.obten_var_page(17182, 'Insert'), 218633, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 428640046360226857, 'O', null, null, null, null, 'O', null, 'Domaine', 'P20030_DOMN', sie$migrt$pkg.obten_var_page(17182, 'Insert'), 218634, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 428640251082226857, 'O', null, null, null, null, 'O', null, 'Nom d''envoi', 'P20030_NOM_ENVOY', sie$migrt$pkg.obten_var_page(17182, 'Insert'), 218635, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 428640439798226857, 'O', null, null, null, null, 'O', null, 'Adresse d''envoi', 'P20030_ADRES_ENVOY', sie$migrt$pkg.obten_var_page(17182, 'Insert'), 218636, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 428640659224226857, 'O', null, null, null, null, 'O', null, 'Sujet', 'P20030_SUJET', sie$migrt$pkg.obten_var_page(17182, 'Insert'), 218637, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 425086103636924427, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', sie$migrt$pkg.obten_var_page(17182, 'Insert'), 218638, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 425086303750924427, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(17182, 'Insert'), 218639, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 12971540060664362, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', sie$migrt$pkg.obten_var_page(17183, 'Insert'), 218640, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 16527763317972199, 'O', null, null, null, null, 'O', null, 'Code', 'P21010_CODE', sie$migrt$pkg.obten_var_page(17184, 'Insert'), 218641, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 16527954469972199, 'O', null, null, null, null, 'O', null, 'Nom', 'P21010_NOM', sie$migrt$pkg.obten_var_page(17184, 'Insert'), 218642, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 16528158664972199, 'O', null, null, null, null, 'O', null, 'Description', 'P21010_DESCR', sie$migrt$pkg.obten_var_page(17184, 'Insert'), 218643, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 16528348849972199, 'O', null, null, null, null, 'O', null, 'Application', 'P21010_REF_PRODT', sie$migrt$pkg.obten_var_page(17184, 'Insert'), 218644, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 16528566240972199, 'O', null, null, null, null, 'O', null, 'Profil de courriel', 'P21010_REF_PROFL_COURL', sie$migrt$pkg.obten_var_page(17184, 'Insert'), 218645, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 16528769144972201, 'O', null, null, null, null, 'O', null, 'Avertir auteur uniquement', 'P21010_INDIC_AVERT_AUTR_UNIQ', sie$migrt$pkg.obten_var_page(17184, 'Insert'), 218646, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 16529148787972201, 'O', null, null, null, null, 'N', null, '[P21010_UTILS]', 'P21010_UTILS', sie$migrt$pkg.obten_var_page(17184, 'Insert'), 218647, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 16529561940972201, 'O', null, null, null, null, 'N', null, '[P21010_GROUP_UTILS]', 'P21010_GROUP_UTILS', sie$migrt$pkg.obten_var_page(17184, 'Insert'), 218648, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 16527555135972199, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P21010_SEQNC', sie$migrt$pkg.obten_var_page(17184, 'Insert'), 218649, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 12974039960669779, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', sie$migrt$pkg.obten_var_page(17184, 'Insert'), 218650, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 12974246998669780, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(17184, 'Insert'), 218651, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 12974440396669780, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', sie$migrt$pkg.obten_var_page(17184, 'Insert'), 218652, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 12974628640669780, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', sie$migrt$pkg.obten_var_page(17184, 'Insert'), 218653, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 20867865856555143, 'O', null, null, null, null, 'N', null, '[P30010_SEQNC]', 'P30010_SEQNC', sie$migrt$pkg.obten_var_page(17185, 'Insert'), 218654, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 20868074860557712, 'O', null, null, null, null, 'N', null, '[P30020_SEQNC]', 'P30020_SEQNC', sie$migrt$pkg.obten_var_page(17186, 'Insert'), 218655, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 20868257676562170, 'O', null, null, null, null, 'N', null, '[P30030_SEQNC]', 'P30030_SEQNC', sie$migrt$pkg.obten_var_page(17187, 'Insert'), 218656, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 16930953643902987, 'O', null, null, null, null, 'N', null, '[P30040_SEQNC]', 'P30040_SEQNC', sie$migrt$pkg.obten_var_page(17188, 'Insert'), 218657, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 16844378771037104, 'O', null, null, null, null, 'N', null, '[P30050_SEQNC]', 'P30050_SEQNC', sie$migrt$pkg.obten_var_page(17189, 'Insert'), 218658, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 20824841696039803, 'N', null, null, null, null, 'N', null, 'Créer', 'CREAT', sie$migrt$pkg.obten_var_page(17190, 'Insert'), 218659, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 24381363146737675, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P34100_SEQNC', sie$migrt$pkg.obten_var_page(17191, 'Insert'), 218660, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 24381548633737684, 'O', null, null, null, null, 'O', null, 'Code', 'P34100_CODE', sie$migrt$pkg.obten_var_page(17191, 'Insert'), 218661, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 24381763552737685, 'O', null, null, null, null, 'O', null, 'Nom', 'P34100_NOM', sie$migrt$pkg.obten_var_page(17191, 'Insert'), 218662, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 24381976223737686, 'O', null, null, null, null, 'O', null, 'Description', 'P34100_DESCR', sie$migrt$pkg.obten_var_page(17191, 'Insert'), 218663, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 24382151055737688, 'O', null, null, null, null, 'O', null, 'Couleur texte', 'P34100_COULR_TEXTE', sie$migrt$pkg.obten_var_page(17191, 'Insert'), 218664, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 24382366758737689, 'O', null, null, null, null, 'O', null, 'Taille texte', 'P34100_TAIL_TEXTE', sie$migrt$pkg.obten_var_page(17191, 'Insert'), 218665, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 24382555060737689, 'O', null, null, null, null, 'O', null, 'Couleur titre', 'P34100_COULR_TITRE', sie$migrt$pkg.obten_var_page(17191, 'Insert'), 218666, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 24382768211737689, 'O', null, null, null, null, 'O', null, 'Taille titre', 'P34100_TAIL_TITRE', sie$migrt$pkg.obten_var_page(17191, 'Insert'), 218667, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 24382979790737689, 'O', null, null, null, null, 'O', null, 'Temps affichage', 'P34100_TEMPS_AFICH', sie$migrt$pkg.obten_var_page(17191, 'Insert'), 218668, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 24383170224737689, 'O', null, null, null, null, 'O', null, 'Icône', 'P34100_REF_RESRC_ICON', sie$migrt$pkg.obten_var_page(17191, 'Insert'), 218669, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 24383569178737690, 'O', null, null, null, null, 'O', null, 'Occurence icône', 'P34100_REF_OCURN_RESRC_ICON', sie$migrt$pkg.obten_var_page(17191, 'Insert'), 218671, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 24684877751424292, 'O', null, null, null, null, 'O', null, 'Type', 'P34100_REF_TYPE_COMNC', sie$migrt$pkg.obten_var_page(17191, 'Insert'), 218672, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 24688472883621542, 'O', null, null, null, null, 'N', null, '[P34100_SEQNC_TYPE_COMNC_ECRAN]', 'P34100_SEQNC_TYPE_COMNC_ECRAN', sie$migrt$pkg.obten_var_page(17191, 'Insert'), 218673, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 24742753516472224, 'O', null, null, null, null, 'O', null, 'Modèle', 'P34100_REF_MODL_COMNC', sie$migrt$pkg.obten_var_page(17191, 'Insert'), 218674, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 20827533416435251, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', sie$migrt$pkg.obten_var_page(17191, 'Insert'), 218675, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 20827835614435252, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(17191, 'Insert'), 218676, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 20827627445435251, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', sie$migrt$pkg.obten_var_page(17191, 'Insert'), 218678, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 419107710491716766, 'N', null, null, null, null, 'N', null, 'Créer', 'CRÉER', sie$migrt$pkg.obten_var_page(17192, 'Insert'), 218679, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 24810360431655312, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P34210_SEQNC', sie$migrt$pkg.obten_var_page(17193, 'Insert'), 218680, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 24810748028655320, 'O', null, null, null, null, 'O', null, 'Nom', 'P34210_NOM', sie$migrt$pkg.obten_var_page(17193, 'Insert'), 218682, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 24810972226655320, 'O', null, null, null, null, 'O', null, 'Ref Evenm Notfb', 'P34210_REF_EVENM_NOTFB', sie$migrt$pkg.obten_var_page(17193, 'Insert'), 218683, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 21256535261352890, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', sie$migrt$pkg.obten_var_page(17193, 'Insert'), 218684, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 21256830189352890, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(17193, 'Insert'), 218685, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 21256435566352890, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', sie$migrt$pkg.obten_var_page(17193, 'Insert'), 218686, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 21514429363384627, 'N', null, null, null, null, 'N', null, 'Créer', 'CREAT', sie$migrt$pkg.obten_var_page(17194, 'Insert'), 218688, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 419073002881985767, 'N', null, null, null, null, 'N', null, 'Créer', 'CRÉER', sie$migrt$pkg.obten_var_page(17195, 'Insert'), 218689, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 422623146855113149, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P34310_SEQNC', sie$migrt$pkg.obten_var_page(17196, 'Insert'), 218690, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 422623346548113156, 'O', null, null, null, null, 'O', null, 'Code', 'P34310_CODE', sie$migrt$pkg.obten_var_page(17196, 'Insert'), 218691, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 422623560847113156, 'O', null, null, null, null, 'O', null, 'Nom', 'P34310_NOM', sie$migrt$pkg.obten_var_page(17196, 'Insert'), 218692, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 422623939654113157, 'O', null, null, null, null, 'O', null, 'Objet', 'P34310_OBJET', sie$migrt$pkg.obten_var_page(17196, 'Insert'), 218694, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 422632563804365738, 'O', null, null, null, null, 'O', null, '[P34310_REF_DOMN]', 'P34310_REF_DOMN', sie$migrt$pkg.obten_var_page(17196, 'Insert'), 218696, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 419069023647810724, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', sie$migrt$pkg.obten_var_page(17196, 'Insert'), 218697, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 419069305089810725, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(17196, 'Insert'), 218698, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 419068923885810724, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', sie$migrt$pkg.obten_var_page(17196, 'Insert'), 218699, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 419069111226810724, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', sie$migrt$pkg.obten_var_page(17196, 'Insert'), 218700, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 21170335386943690, 'N', null, null, null, null, 'N', null, 'Créer', 'CREAT', sie$migrt$pkg.obten_var_page(17197, 'Insert'), 218701, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 24701372468401060, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P34500_SEQNC', sie$migrt$pkg.obten_var_page(17198, 'Insert'), 218702, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 24701567107401066, 'O', null, null, null, null, 'O', null, 'Code', 'P34500_CODE', sie$migrt$pkg.obten_var_page(17198, 'Insert'), 218703, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 24701753242401066, 'O', null, null, null, null, 'O', null, 'Nom', 'P34500_NOM', sie$migrt$pkg.obten_var_page(17198, 'Insert'), 218704, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 24701958943401067, 'O', null, null, null, null, 'O', null, 'Description', 'P34500_DESCR', sie$migrt$pkg.obten_var_page(17198, 'Insert'), 218705, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 24702150586401067, 'O', null, null, null, null, 'O', null, 'Type', 'P34500_REF_TYPE_COMNC', sie$migrt$pkg.obten_var_page(17198, 'Insert'), 218706, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 24702378371401067, 'O', null, null, null, null, 'O', null, 'Indic Systm', 'P34500_INDIC_SYSTM', sie$migrt$pkg.obten_var_page(17198, 'Insert'), 218707, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 21147435966098638, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', sie$migrt$pkg.obten_var_page(17198, 'Insert'), 218708, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 21154216945227431, 'N', null, null, null, null, 'N', null, 'Ajouter', 'ADD', sie$migrt$pkg.obten_var_page(17198, 'Insert'), 218709, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 21147542117098638, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', sie$migrt$pkg.obten_var_page(17198, 'Insert'), 218710, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 21147819917098639, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(17198, 'Insert'), 218711, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 21147623945098638, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', sie$migrt$pkg.obten_var_page(17198, 'Insert'), 218712, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 21154136737227431, 'N', null, null, null, null, 'N', null, 'Supprimer', 'MULTI_ROW_DELETE', sie$migrt$pkg.obten_var_page(17198, 'Insert'), 218713, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 21314028482666003, 'N', null, null, null, null, 'N', null, 'Créer', 'CREER', sie$migrt$pkg.obten_var_page(17201, 'Insert'), 218714, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 24869053315981727, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P34710_SEQNC', sie$migrt$pkg.obten_var_page(17202, 'Insert'), 218715, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 24869265452981734, 'O', null, null, null, null, 'O', null, 'Code', 'P34710_CODE', sie$migrt$pkg.obten_var_page(17202, 'Insert'), 218716, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 24869456683981735, 'O', null, null, null, null, 'O', null, 'Nom', 'P34710_NOM', sie$migrt$pkg.obten_var_page(17202, 'Insert'), 218717, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 24869668403981736, 'O', null, null, null, null, 'O', null, 'Description', 'P34710_DESCR', sie$migrt$pkg.obten_var_page(17202, 'Insert'), 218718, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 24869866837981736, 'O', null, null, null, null, 'O', null, 'Numéro expéditeur', 'P34710_NUMR', sie$migrt$pkg.obten_var_page(17202, 'Insert'), 218719, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 24870068901981737, 'O', null, null, null, null, 'O', null, 'Profil de courriel expéditeur', 'P34710_REF_PROFL_COURL', sie$migrt$pkg.obten_var_page(17202, 'Insert'), 218720, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 24870279207981737, 'O', null, null, null, null, 'O', null, '[P34710_REF_DOMN]', 'P34710_REF_DOMN', sie$migrt$pkg.obten_var_page(17202, 'Insert'), 218721, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 25306969741871775, 'O', null, null, null, null, 'O', null, 'Page de garde ', 'P34710_REF_PUBLC_PAGE_GARDE', sie$migrt$pkg.obten_var_page(17202, 'Insert'), 218722, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 21315236305679306, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', sie$migrt$pkg.obten_var_page(17202, 'Insert'), 218723, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 21315519347679306, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(17202, 'Insert'), 218724, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 21315131190679306, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', sie$migrt$pkg.obten_var_page(17202, 'Insert'), 218725, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 21315340920679306, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', sie$migrt$pkg.obten_var_page(17202, 'Insert'), 218726, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 422667863084037666, 'O', null, null, null, null, 'O', null, 'Code', 'P34810_CODE', sie$migrt$pkg.obten_var_page(17204, 'Insert'), 218727, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 422668034524037666, 'O', null, null, null, null, 'O', null, 'Nom', 'P34810_NOM', sie$migrt$pkg.obten_var_page(17204, 'Insert'), 218728, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 422668252493037667, 'O', null, null, null, null, 'O', null, 'Description', 'P34810_DESCR', sie$migrt$pkg.obten_var_page(17204, 'Insert'), 218729, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 422668443127037667, 'O', null, null, null, null, 'O', null, 'Structure applicative', 'P34810_REF_STRUC_APLIC', sie$migrt$pkg.obten_var_page(17204, 'Insert'), 218730, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 422671542291037671, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P34810_SEQNC', sie$migrt$pkg.obten_var_page(17204, 'Insert'), 218731, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 419118226166735251, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(17204, 'Insert'), 218732, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 419143108497393210, 'N', null, null, null, null, 'N', null, 'Créer', 'CREAT_CONFG', sie$migrt$pkg.obten_var_page(17204, 'Insert'), 218733, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 422686155749481413, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P34820_SEQNC', sie$migrt$pkg.obten_var_page(17205, 'Insert'), 218734, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 422686342428481421, 'O', null, null, null, null, 'O', null, 'Type', 'P34820_REF_TYPE_COMNC', sie$migrt$pkg.obten_var_page(17205, 'Insert'), 218735, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 422686535984481425, 'O', null, null, null, null, 'O', null, 'Objet', 'P34820_OBJET', sie$migrt$pkg.obten_var_page(17205, 'Insert'), 218736, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 422686748719481425, 'O', null, null, null, null, 'O', null, 'Message', 'P34820_MESG', sie$migrt$pkg.obten_var_page(17205, 'Insert'), 218737, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 422686956080481426, 'O', null, null, null, null, 'O', null, 'Ref Evenm Notfb', 'P34820_REF_EVENM_NOTFB', sie$migrt$pkg.obten_var_page(17205, 'Insert'), 218738, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 422687350627481426, 'O', null, null, null, null, 'O', null, 'Nom', 'P34820_NOM', sie$migrt$pkg.obten_var_page(17205, 'Insert'), 218739, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 422687563995481426, 'O', null, null, null, null, 'O', null, 'Description', 'P34820_DESCR', sie$migrt$pkg.obten_var_page(17205, 'Insert'), 218740, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 422820658471889578, 'O', null, null, null, null, 'O', null, 'SMS', 'P34820_MESG_SMS', sie$migrt$pkg.obten_var_page(17205, 'Insert'), 218741, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 423264662887112130, 'O', null, null, null, null, 'N', null, '[P34820_SEQNC_TYPE_COURL]', 'P34820_SEQNC_TYPE_COURL', sie$migrt$pkg.obten_var_page(17205, 'Insert'), 218742, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 423264942586115782, 'O', null, null, null, null, 'N', null, '[P34820_SEQNC_TYPE_SMS]', 'P34820_SEQNC_TYPE_SMS', sie$migrt$pkg.obten_var_page(17205, 'Insert'), 218743, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 423801962831920310, 'O', null, null, null, null, 'O', null, 'Compte d''envoi', 'P34820_REF_COMPT_COURL', sie$migrt$pkg.obten_var_page(17205, 'Insert'), 218745, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 423802159632920310, 'O', null, null, null, null, 'O', null, 'Compte d''envoi', 'P34820_REF_COMPT_TWILI', sie$migrt$pkg.obten_var_page(17205, 'Insert'), 218746, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 423857354890662305, 'O', null, null, null, null, 'N', null, '[P34820_MODE]', 'P34820_MODE', sie$migrt$pkg.obten_var_page(17205, 'Insert'), 218747, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 423859848254906421, 'O', null, null, null, null, 'N', null, 'Destinataire', 'P34820_RESLT_DESTN', sie$migrt$pkg.obten_var_page(17205, 'Insert'), 218748, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 423860554806031252, 'O', null, null, null, null, 'N', null, 'Nom formatté', 'P34820_CHAMP_NOM_FORMT', sie$migrt$pkg.obten_var_page(17205, 'Insert'), 218749, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 423861134253091532, 'O', null, null, null, null, 'N', null, 'Courriel', 'P34820_CHAMP_ADRES_COURL', sie$migrt$pkg.obten_var_page(17205, 'Insert'), 218750, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 423861556547107435, 'O', null, null, null, null, 'N', null, 'Numéro sms', 'P34820_CHAMP_NUMR_SMS', sie$migrt$pkg.obten_var_page(17205, 'Insert'), 218751, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 423869136099266837, 'O', null, null, null, null, 'O', null, '[P34820_REF_DOMN]', 'P34820_REF_DOMN', sie$migrt$pkg.obten_var_page(17205, 'Insert'), 218753, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 423953753353245396, 'O', null, null, null, null, 'N', null, 'Ajouter', 'AJOUT_DESTN', sie$migrt$pkg.obten_var_page(17205, 'Insert'), 218754, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 426928743107054106, 'O', null, null, null, null, 'N', null, '[P34820_STRUC_APLIC]', 'P34820_STRUC_APLIC', sie$migrt$pkg.obten_var_page(17205, 'Insert'), 218755, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 426931263520258604, 'O', null, null, null, null, 'O', null, 'Défaut', 'P34820_INDIC_DEFT', sie$migrt$pkg.obten_var_page(17205, 'Insert'), 218756, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 419132008074178991, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', sie$migrt$pkg.obten_var_page(17205, 'Insert'), 218757, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 419132315274178991, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(17205, 'Insert'), 218758, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 419132103809178991, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', sie$migrt$pkg.obten_var_page(17205, 'Insert'), 218760, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 420297926943999494, 'N', null, null, null, null, 'N', null, 'Supprimer', 'SUPRM_ELEMN_CONFIG', sie$migrt$pkg.obten_var_page(17205, 'Insert'), 218761, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 420320005817258104, 'N', null, null, null, null, 'N', null, 'Supprimer', 'SUPRM_DESTN_CONFG', sie$migrt$pkg.obten_var_page(17205, 'Insert'), 218762, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 419646008607820495, 'N', null, null, null, null, 'N', null, 'Ajouter', 'CREAT_ELEMN_CONFIG', sie$migrt$pkg.obten_var_page(17205, 'Insert'), 218763, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 423357716113908129, 'N', null, null, null, null, 'N', null, 'Éléments substitution', 'AFICH_ELEMN_SUBST_MESG', sie$migrt$pkg.obten_var_page(17205, 'Insert'), 218765, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 423185031918988645, 'O', null, null, null, null, 'N', null, '4. Résoudre vers', 'P34830_RESLT_4', sie$migrt$pkg.obten_var_page(17206, 'Insert'), 218766, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 423185248735988645, 'O', null, null, null, null, 'N', null, '5. Résoudre vers', 'P34830_RESLT_5', sie$migrt$pkg.obten_var_page(17206, 'Insert'), 218767, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 423185433358988645, 'O', null, null, null, null, 'N', null, '6. Résoudre vers', 'P34830_RESLT_6', sie$migrt$pkg.obten_var_page(17206, 'Insert'), 218768, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 423185839132988646, 'O', null, null, null, null, 'N', null, 'Champ de données', 'P34830_CHAMP_1', sie$migrt$pkg.obten_var_page(17206, 'Insert'), 218769, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 423186257970988646, 'O', null, null, null, null, 'N', null, '[P34830_AFICH_RESLT_1]', 'P34830_AFICH_RESLT_1', sie$migrt$pkg.obten_var_page(17206, 'Insert'), 218771, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 423186663044988647, 'O', null, null, null, null, 'N', null, '3. Résoudre vers', 'P34830_RESLT_3', sie$migrt$pkg.obten_var_page(17206, 'Insert'), 218772, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 426620653369031379, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P34830_SEQNC', sie$migrt$pkg.obten_var_page(17206, 'Insert'), 218773, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 419631313768686222, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(17206, 'Insert'), 218780, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 426620862200031385, 'O', null, null, null, null, 'O', null, 'Ref Confg Evenm Notfb', 'P34830_REF_CONFG_EVENM_NOTFB', sie$migrt$pkg.obten_var_page(17206, 'Insert'), 218774, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 426621040742031386, 'O', null, null, null, null, 'O', null, 'Code', 'P34830_CODE', sie$migrt$pkg.obten_var_page(17206, 'Insert'), 218775, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 426621262805031386, 'O', null, null, null, null, 'O', null, 'Ident Acces', 'P34830_IDENT_ACCES', sie$migrt$pkg.obten_var_page(17206, 'Insert'), 218776, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 426621436355031387, 'O', null, null, null, null, 'O', null, 'Ident Acces Formt', 'P34830_IDENT_ACCES_FORMT', sie$migrt$pkg.obten_var_page(17206, 'Insert'), 218777, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 426681754050061576, 'O', null, null, null, null, 'N', null, '[P34830_RESLT_1]', 'P34830_RESLT_1', sie$migrt$pkg.obten_var_page(17206, 'Insert'), 218778, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 426865556749450034, 'O', null, null, null, null, 'N', null, 'Chaîne de substitution', 'P34830_ELEMN_SUBST_MESG', sie$migrt$pkg.obten_var_page(17206, 'Insert'), 218779, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 419631932723686225, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', sie$migrt$pkg.obten_var_page(17206, 'Insert'), 218781, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 426877236674187923, 'O', null, null, null, null, 'N', null, '6. Résoudre vers', 'P34840_RESLT_6', sie$migrt$pkg.obten_var_page(17207, 'Insert'), 218782, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 426877437889187923, 'O', null, null, null, null, 'N', null, '3. Résoudre vers', 'P34840_RESLT_3', sie$migrt$pkg.obten_var_page(17207, 'Insert'), 218783, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 426877657900187924, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P34840_SEQNC', sie$migrt$pkg.obten_var_page(17207, 'Insert'), 218784, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 426877857675187924, 'O', null, null, null, null, 'O', null, 'Ref Confg Evenm Notfb', 'P34840_REF_CONFG_EVENM_NOTFB', sie$migrt$pkg.obten_var_page(17207, 'Insert'), 218785, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 426878046498187924, 'O', null, null, null, null, 'O', null, 'Ident Acces', 'P34840_IDENT_ACCES', sie$migrt$pkg.obten_var_page(17207, 'Insert'), 218786, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 426878254168187924, 'O', null, null, null, null, 'O', null, 'Ident Acces Formt', 'P34840_IDENT_ACCES_FORMT', sie$migrt$pkg.obten_var_page(17207, 'Insert'), 218787, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 426878434950187925, 'O', null, null, null, null, 'N', null, '[P34840_RESLT_1]', 'P34840_RESLT_1', sie$migrt$pkg.obten_var_page(17207, 'Insert'), 218788, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 426874639215187915, 'O', null, null, null, null, 'N', null, '[P34840_AFICH_RESLT_1]', 'P34840_AFICH_RESLT_1', sie$migrt$pkg.obten_var_page(17207, 'Insert'), 218789, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 426875039917187917, 'O', null, null, null, null, 'N', null, 'Champ de données', 'P34840_CHAMP_1', sie$migrt$pkg.obten_var_page(17207, 'Insert'), 218790, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 426875456272187918, 'O', null, null, null, null, 'N', null, 'Chaîne de substitution', 'P34840_ELEMN_SUBST_MESG', sie$migrt$pkg.obten_var_page(17207, 'Insert'), 218791, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 426875635174187919, 'O', null, null, null, null, 'O', null, 'Code', 'P34840_CODE', sie$migrt$pkg.obten_var_page(17207, 'Insert'), 218792, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 426876637743187922, 'O', null, null, null, null, 'N', null, '2. Résoudre vers', 'P34840_RESLT_2', sie$migrt$pkg.obten_var_page(17207, 'Insert'), 218793, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 426876835078187922, 'O', null, null, null, null, 'N', null, '4. Résoudre vers', 'P34840_RESLT_4', sie$migrt$pkg.obten_var_page(17207, 'Insert'), 218794, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 426877043006187923, 'O', null, null, null, null, 'N', null, '5. Résoudre vers', 'P34840_RESLT_5', sie$migrt$pkg.obten_var_page(17207, 'Insert'), 218795, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 423323306032885501, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(17207, 'Insert'), 218796, 'BOUTN');
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
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 423323515208885503, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', sie$migrt$pkg.obten_var_page(17207, 'Insert'), 218797, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 419924023609170514, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', sie$migrt$pkg.obten_var_page(17178, 'Insert'), 218601, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 16518270419964443, 'O', null, null, null, null, 'O', null, 'Adresse expéditeur', 'P20010_ADRES_ENVOY', sie$migrt$pkg.obten_var_page(17180, 'Insert'), 218607, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 24838660137481553, 'O', null, null, null, null, 'O', null, 'Descritpion', 'P20010_DESCR', sie$migrt$pkg.obten_var_page(17180, 'Insert'), 218613, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 426981234550301057, 'O', null, null, null, null, 'O', null, 'domaine', 'P20010_REF_DOMN', sie$migrt$pkg.obten_var_page(17180, 'Insert'), 218619, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 434270045327616028, 'O', null, null, null, null, 'O', null, 'Procédure PL/SQL niveau sécurité mot passe', 'P12210_PROCD_VALD_NIV_SECRT_MP', sie$migrt$pkg.obten_var_page(17170, 'Insert'), 218545, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 24383359769737690, 'O', null, null, null, null, 'O', null, 'Format icône', 'P34100_REF_FORMT_RESRC_ICON', sie$migrt$pkg.obten_var_page(17191, 'Insert'), 218670, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 20827440218435251, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', sie$migrt$pkg.obten_var_page(17191, 'Insert'), 218677, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 24810547780655319, 'O', null, null, null, null, 'O', null, 'Code', 'P34210_CODE', sie$migrt$pkg.obten_var_page(17193, 'Insert'), 218681, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 21256642070352890, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', sie$migrt$pkg.obten_var_page(17193, 'Insert'), 218687, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 422623734016113157, 'O', null, null, null, null, 'O', null, 'Description', 'P34310_DESCR', sie$migrt$pkg.obten_var_page(17196, 'Insert'), 218693, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 423267061380177979, 'O', null, null, null, null, 'N', null, '[P34820_SEQNC_TYPE_ECRAN]', 'P34820_SEQNC_TYPE_ECRAN', sie$migrt$pkg.obten_var_page(17205, 'Insert'), 218744, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 423862832923195257, 'O', null, null, null, null, 'N', null, 'Nature', 'P34820_CHAMP_NATR_COURL', sie$migrt$pkg.obten_var_page(17205, 'Insert'), 218752, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 419131925026178991, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', sie$migrt$pkg.obten_var_page(17205, 'Insert'), 218759, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 423335122021244107, 'N', null, null, null, null, 'N', null, 'Ajouter', 'CREAT_DESTN_CONFIG', sie$migrt$pkg.obten_var_page(17205, 'Insert'), 218764, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 423186044208988646, 'O', null, null, null, null, 'N', null, '2. Résoudre vers', 'P34830_RESLT_2', sie$migrt$pkg.obten_var_page(17206, 'Insert'), 218770, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 421659219728948947, 'N', null, null, null, null, 'N', null, 'Modifier le mot de passe', 'P12020_MOT_PASSE', sie$migrt$pkg.obten_var_page(17161, 'Insert'), 218484, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 421652920271788257, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(17163, 'Insert'), 218492, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 50349002956089916, 'O', null, null, null, null, 'O', null, 'Séquence', 'P12131_SEQNC', sie$migrt$pkg.obten_var_page(17165, 'Insert'), 218498, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 46795041331787497, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', sie$migrt$pkg.obten_var_page(17165, 'Insert'), 218505, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 567115531932113021, 'O', null, null, null, null, 'N', null, '[P12020_MESG_AUTOR_CONXN_DERV]', 'P12020_MESG_AUTOR_CONXN_DERV', sie$migrt$pkg.obten_var_page(17161, 'Insert'), 228621, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 558613056617308383, 'O', null, null, null, null, 'O', null, '[P12131_INDIC_ACCES_GLOBL]', 'P12131_INDIC_ACCES_GLOBL', sie$migrt$pkg.obten_var_page(17165, 'Insert'), 228622, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 510889837540116463, 'O', null, null, null, null, 'O', null, 'Code utilisateur pour la base de données', 'P12020_CODE_UTILS_BASE_DON', sie$migrt$pkg.obten_var_page(17161, 'Insert'), 228619, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 567113254564053302, 'O', null, null, null, null, 'N', null, '[P12020_MESG_SUPER_UTILS]', 'P12020_MESG_SUPER_UTILS', sie$migrt$pkg.obten_var_page(17161, 'Insert'), 228620, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 558061837132019031, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P35042_SEQNC', sie$migrt$pkg.obten_var_page(18055, 'Insert'), 228623, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 558062044685019040, 'O', null, null, null, null, 'O', null, 'Fonctionnalité', 'P35042_REF_FONCT', sie$migrt$pkg.obten_var_page(18055, 'Insert'), 228624, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 558062456347019043, 'O', null, null, null, null, 'O', null, 'Nom de domaine', 'P35042_REF_DOMN', sie$migrt$pkg.obten_var_page(18055, 'Insert'), 228625, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 558062836856019043, 'O', null, null, null, null, 'O', null, 'Actif', 'P35042_INDIC_ACTIF', sie$migrt$pkg.obten_var_page(18055, 'Insert'), 228626, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 554507612060716604, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', sie$migrt$pkg.obten_var_page(18055, 'Insert'), 228627, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 554507703027716604, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', sie$migrt$pkg.obten_var_page(18055, 'Insert'), 228628, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 554507806075716604, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', sie$migrt$pkg.obten_var_page(18055, 'Insert'), 228629, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 554508001715716605, 'N', null, null, null, null, 'N', null, 'Annulé', 'CANCEL', sie$migrt$pkg.obten_var_page(18055, 'Insert'), 228630, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 558428158981797618, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P12220_SEQNC', sie$migrt$pkg.obten_var_page(18057, 'Insert'), 228631, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 558428544000797629, 'O', null, null, null, null, 'O', null, 'Groupe utilisateur', 'P12220_REF_GROUP_UTILS_FORMT', sie$migrt$pkg.obten_var_page(18057, 'Insert'), 228632, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 558428747618797629, 'O', null, null, null, null, 'O', null, 'Opération', 'P12220_REF_OPERT', sie$migrt$pkg.obten_var_page(18057, 'Insert'), 228633, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 558428963262797629, 'O', null, null, null, null, 'O', null, 'Option', 'P12220_REF_OPERT_OPTIO', sie$migrt$pkg.obten_var_page(18057, 'Insert'), 228634, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 558429136005797629, 'O', null, null, null, null, 'O', null, 'Ref Domn', 'P12220_REF_DOMN', sie$migrt$pkg.obten_var_page(18057, 'Insert'), 228635, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 558433552474864615, 'O', null, null, null, null, 'O', null, 'Opération', 'P12220_REF_OPERT_FORMT', sie$migrt$pkg.obten_var_page(18057, 'Insert'), 228636, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 554874824160495194, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', sie$migrt$pkg.obten_var_page(18057, 'Insert'), 228637, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 554856702182060656, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(18057, 'Insert'), 228638, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 554512125981716644, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', sie$migrt$pkg.obten_var_page(18058, 'Insert'), 228639, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 446747156066032423, 'O', null, null, null, null, 'N', null, '[P1_SEQNC]', 'P1_SEQNC', sie$migrt$pkg.obten_var_page(17157, 'Insert'), 227642, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 446748143299057115, 'O', null, null, null, null, 'O', null, 'Nom', 'P1_NOM', sie$migrt$pkg.obten_var_page(17157, 'Insert'), 227643, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 446748347801058473, 'O', null, null, null, null, 'O', null, 'Code', 'P1_CODE', sie$migrt$pkg.obten_var_page(17157, 'Insert'), 227644, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 443197617922153878, 'N', null, null, null, null, 'N', null, 'Éditer', 'EDITR', sie$migrt$pkg.obten_var_page(17157, 'Insert'), 227645, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 453162554487239322, 'O', null, null, null, null, 'O', null, 'Réponse obligatoire', 'P35011_INDIC_REPNS_OBLIG', sie$migrt$pkg.obten_var_page(17939, 'Insert'), 227810, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 453162737842239322, 'O', null, null, null, null, 'O', null, 'Nom', 'P35011_NOM', sie$migrt$pkg.obten_var_page(17939, 'Insert'), 227811, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 453162955916239324, 'O', null, null, null, null, 'O', null, 'Intervalle', 'P35011_INDIC_INTER', sie$migrt$pkg.obten_var_page(17939, 'Insert'), 227812, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 453163148180239325, 'O', null, null, null, null, 'O', null, 'Type donnée saisie', 'P35011_REF_DV_TYPE_DON_SAIS', sie$migrt$pkg.obten_var_page(17939, 'Insert'), 227813, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 453163364235239325, 'O', null, null, null, null, 'O', null, 'Réponses multiples', 'P35011_INDIC_REPNS_MULTP', sie$migrt$pkg.obten_var_page(17939, 'Insert'), 227814, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 453163550748239325, 'O', null, null, null, null, 'O', null, 'Nombre minimum occurences', 'P35011_NOMBR_MINM_OCURN_INTER', sie$migrt$pkg.obten_var_page(17939, 'Insert'), 227815, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 453163753474239325, 'O', null, null, null, null, 'O', null, 'Nombre maximum occurences', 'P35011_NOMBR_MAXM_OCURN_INTER', sie$migrt$pkg.obten_var_page(17939, 'Insert'), 227816, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 453165944886239328, 'O', null, null, null, null, 'O', null, 'Masque', 'P35011_REF_DV_MASQ_FORMT_AUTRE', sie$migrt$pkg.obten_var_page(17939, 'Insert'), 227817, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 453163937254239326, 'O', null, null, null, null, 'O', null, 'Type champ réponse', 'P35011_REF_DV_TYPE_CHAMP_REPNS', sie$migrt$pkg.obten_var_page(17939, 'Insert'), 227818, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 453164359641239326, 'O', null, null, null, null, 'O', null, 'Nombre caractères', 'P35011_NOMBR_CARCT_REPNS', sie$migrt$pkg.obten_var_page(17939, 'Insert'), 227819, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 453164532763239326, 'O', null, null, null, null, 'O', null, 'Masque', 'P35011_REF_DV_MASQ_FORMT_REPNS', sie$migrt$pkg.obten_var_page(17939, 'Insert'), 227820, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 453164757979239326, 'O', null, null, null, null, 'O', null, 'Largeur champ', 'P35011_LARGR_REPNS', sie$migrt$pkg.obten_var_page(17939, 'Insert'), 227821, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 453164948934239326, 'O', null, null, null, null, 'O', null, 'Nombre colonnes', 'P35011_NOMBR_COLN_REPNS', sie$migrt$pkg.obten_var_page(17939, 'Insert'), 227822, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 453165138150239327, 'O', null, null, null, null, 'O', null, 'Nombre rangées', 'P35011_NOMBR_RANGE_REPNS', sie$migrt$pkg.obten_var_page(17939, 'Insert'), 227823, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 453165351543239327, 'O', null, null, null, null, 'O', null, 'Autre réponse', 'P35011_INDIC_AUTRE', sie$migrt$pkg.obten_var_page(17939, 'Insert'), 227824, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 453165545385239327, 'O', null, null, null, null, 'O', null, 'Type champ réponse', 'P35011_REF_DV_TYPE_CHAMP_AUTRE', sie$migrt$pkg.obten_var_page(17939, 'Insert'), 227825, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 453165741063239328, 'O', null, null, null, null, 'O', null, 'Nombre caractère', 'P35011_NOMBR_CARCT_AUTRE', sie$migrt$pkg.obten_var_page(17939, 'Insert'), 227826, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 453166135049239328, 'O', null, null, null, null, 'O', null, 'Largeur champ', 'P35011_LARGR_AUTRE', sie$migrt$pkg.obten_var_page(17939, 'Insert'), 227827, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 453166363502239328, 'O', null, null, null, null, 'O', null, 'Nombre colonnes', 'P35011_NOMBR_COLN_AUTRE', sie$migrt$pkg.obten_var_page(17939, 'Insert'), 227828, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 453166535319239329, 'O', null, null, null, null, 'O', null, 'Nombre rangées', 'P35011_NOMBR_RANGE_AUTRE', sie$migrt$pkg.obten_var_page(17939, 'Insert'), 227829, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 453167755649239331, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P35011_SEQNC', sie$migrt$pkg.obten_var_page(17939, 'Insert'), 227830, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 449614609442936911, 'N', null, null, null, null, 'N', null, 'Appliquer', 'SAVE', sie$migrt$pkg.obten_var_page(17939, 'Insert'), 227831, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 449614214838936910, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(17939, 'Insert'), 227832, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 449614832239936911, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', sie$migrt$pkg.obten_var_page(17939, 'Insert'), 227833, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 449614426762936911, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', sie$migrt$pkg.obten_var_page(17939, 'Insert'), 227834, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 449755816424282365, 'N', null, null, null, null, 'N', null, 'Lier', 'LIER', sie$migrt$pkg.obten_var_page(17160, 'Insert'), 227835, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 453305847515574226, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P12011_SEQNC', sie$migrt$pkg.obten_var_page(17937, 'Insert'), 227836, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 453306048399574235, 'O', null, null, null, null, 'O', null, 'Utilisateur', 'P12011_REF_UTILS', sie$migrt$pkg.obten_var_page(17937, 'Insert'), 227837, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 453306263245574238, 'O', null, null, null, null, 'O', null, 'Ref Domn', 'P12011_REF_DOMN', sie$migrt$pkg.obten_var_page(17937, 'Insert'), 227838, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 453306455409574238, 'O', null, null, null, null, 'O', null, 'Début effectivité', 'P12011_DATE_DEBUT_EFECT', sie$migrt$pkg.obten_var_page(17937, 'Insert'), 227839, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 453306641772574238, 'O', null, null, null, null, 'O', null, 'Fin effectivité', 'P12011_DATE_FIN_EFECT', sie$migrt$pkg.obten_var_page(17937, 'Insert'), 227840, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 449752501089271802, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', sie$migrt$pkg.obten_var_page(17937, 'Insert'), 227841, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 449588817624511139, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', sie$migrt$pkg.obten_var_page(17938, 'Insert'), 227842, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(188, 'Insert'), 80946106591054161, 'O', null, null, null, null, 'O', null, '[P12151_REF_DOMN]', 'P12151_REF_DOMN', sie$migrt$pkg.obten_var_page(17167, 'Insert'), 229598, 'ITEM');
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
select seqnc into sie$migrt$pkg.var_page_item(228618) from sie_13_page_item where nom_apex = 'P12020_REF_DV_COMPL_MAXM' and ref_page = sie$migrt$pkg.obten_var_page(17161, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218695) from sie_13_page_item where nom_apex = 'P34310_CORPS_MESG' and ref_page = sie$migrt$pkg.obten_var_page(17196, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218439) from sie_13_page_item where nom_apex = 'SADA' and ref_page = sie$migrt$pkg.obten_var_page(17156, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218440) from sie_13_page_item where nom_apex = 'SIDF' and ref_page = sie$migrt$pkg.obten_var_page(17156, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218441) from sie_13_page_item where nom_apex = 'SSPC' and ref_page = sie$migrt$pkg.obten_var_page(17156, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218442) from sie_13_page_item where nom_apex = 'SCPC' and ref_page = sie$migrt$pkg.obten_var_page(17156, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218443) from sie_13_page_item where nom_apex = 'SAPC' and ref_page = sie$migrt$pkg.obten_var_page(17156, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218444) from sie_13_page_item where nom_apex = 'SNPI' and ref_page = sie$migrt$pkg.obten_var_page(17156, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218445) from sie_13_page_item where nom_apex = 'SCPI' and ref_page = sie$migrt$pkg.obten_var_page(17156, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218446) from sie_13_page_item where nom_apex = 'SSPI' and ref_page = sie$migrt$pkg.obten_var_page(17156, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218447) from sie_13_page_item where nom_apex = 'SAPI' and ref_page = sie$migrt$pkg.obten_var_page(17156, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218448) from sie_13_page_item where nom_apex = 'P0_RECHR_GLOBL' and ref_page = sie$migrt$pkg.obten_var_page(17156, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218449) from sie_13_page_item where nom_apex = 'P101_CODE_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(17158, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218450) from sie_13_page_item where nom_apex = 'P101_MOT_PASSE' and ref_page = sie$migrt$pkg.obten_var_page(17158, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218451) from sie_13_page_item where nom_apex = 'P101_LOGIN' and ref_page = sie$migrt$pkg.obten_var_page(17158, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218452) from sie_13_page_item where nom_apex = 'P101_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(17158, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218453) from sie_13_page_item where nom_apex = 'P101_LANG' and ref_page = sie$migrt$pkg.obten_var_page(17158, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218454) from sie_13_page_item where nom_apex = 'P101_FORCE_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(17158, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218455) from sie_13_page_item where nom_apex = 'P102_APPLICATION_ID' and ref_page = sie$migrt$pkg.obten_var_page(17159, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218456) from sie_13_page_item where nom_apex = 'P102_PAGE_ID' and ref_page = sie$migrt$pkg.obten_var_page(17159, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218457) from sie_13_page_item where nom_apex = 'P102_A' and ref_page = sie$migrt$pkg.obten_var_page(17159, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218458) from sie_13_page_item where nom_apex = 'P102_FEEDBACK' and ref_page = sie$migrt$pkg.obten_var_page(17159, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218459) from sie_13_page_item where nom_apex = 'P102_X' and ref_page = sie$migrt$pkg.obten_var_page(17159, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218460) from sie_13_page_item where nom_apex = 'P102_FEEDBACK_TYPE' and ref_page = sie$migrt$pkg.obten_var_page(17159, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218461) from sie_13_page_item where nom_apex = 'P102_Y' and ref_page = sie$migrt$pkg.obten_var_page(17159, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218462) from sie_13_page_item where nom_apex = 'SUBMIT' and ref_page = sie$migrt$pkg.obten_var_page(17159, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218463) from sie_13_page_item where nom_apex = 'P12010_LIBL_CONTX' and ref_page = sie$migrt$pkg.obten_var_page(17160, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218464) from sie_13_page_item where nom_apex = 'P12010_CONTX' and ref_page = sie$migrt$pkg.obten_var_page(17160, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218465) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17160, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218466) from sie_13_page_item where nom_apex = 'P12020_COURL' and ref_page = sie$migrt$pkg.obten_var_page(17161, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218467) from sie_13_page_item where nom_apex = 'P12020_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17161, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218468) from sie_13_page_item where nom_apex = 'P12020_NOM' and ref_page = sie$migrt$pkg.obten_var_page(17161, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218469) from sie_13_page_item where nom_apex = 'P12020_PRENM' and ref_page = sie$migrt$pkg.obten_var_page(17161, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218470) from sie_13_page_item where nom_apex = 'P12020_CODE_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(17161, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218471) from sie_13_page_item where nom_apex = 'P12020_DATE_EXPIR' and ref_page = sie$migrt$pkg.obten_var_page(17161, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218472) from sie_13_page_item where nom_apex = 'P12020_INDIC_VERL' and ref_page = sie$migrt$pkg.obten_var_page(17161, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218473) from sie_13_page_item where nom_apex = 'P12020_INDIC_CHANG_MOT_PASSE' and ref_page = sie$migrt$pkg.obten_var_page(17161, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218480) from sie_13_page_item where nom_apex = 'P12020_INDIC_ACTIF' and ref_page = sie$migrt$pkg.obten_var_page(17161, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218481) from sie_13_page_item where nom_apex = 'P12020_GROUP_DROIT' and ref_page = sie$migrt$pkg.obten_var_page(17161, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218482) from sie_13_page_item where nom_apex = 'P12020_GROUP_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(17161, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218483) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(17161, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218485) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17161, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218486) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17161, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218487) from sie_13_page_item where nom_apex = 'CREATE_ADD' and ref_page = sie$migrt$pkg.obten_var_page(17161, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218488) from sie_13_page_item where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(17161, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218489) from sie_13_page_item where nom_apex = 'P12030_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17163, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218490) from sie_13_page_item where nom_apex = 'P12030_NOUV_MOT_PASSE' and ref_page = sie$migrt$pkg.obten_var_page(17163, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218491) from sie_13_page_item where nom_apex = 'P12030_CONFR_MOT_PASSE' and ref_page = sie$migrt$pkg.obten_var_page(17163, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218493) from sie_13_page_item where nom_apex = 'DEFNR' and ref_page = sie$migrt$pkg.obten_var_page(17163, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218494) from sie_13_page_item where nom_apex = 'P12121_CONTX' and ref_page = sie$migrt$pkg.obten_var_page(17164, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218495) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17164, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218496) from sie_13_page_item where nom_apex = 'P12131_NOM' and ref_page = sie$migrt$pkg.obten_var_page(17165, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218497) from sie_13_page_item where nom_apex = 'P12131_DESCR' and ref_page = sie$migrt$pkg.obten_var_page(17165, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218499) from sie_13_page_item where nom_apex = 'P12131_CODE' and ref_page = sie$migrt$pkg.obten_var_page(17165, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218500) from sie_13_page_item where nom_apex = 'P12131_INDIC_IGNOR_GROUP_ADMIN' and ref_page = sie$migrt$pkg.obten_var_page(17165, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218501) from sie_13_page_item where nom_apex = 'P12131_MODE' and ref_page = sie$migrt$pkg.obten_var_page(17165, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218502) from sie_13_page_item where nom_apex = 'P12131_REF_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(17165, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218503) from sie_13_page_item where nom_apex = 'MULTI_ROW_DELETE' and ref_page = sie$migrt$pkg.obten_var_page(17165, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218504) from sie_13_page_item where nom_apex = 'ADD' and ref_page = sie$migrt$pkg.obten_var_page(17165, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218506) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17165, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218507) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17165, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218508) from sie_13_page_item where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(17165, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218509) from sie_13_page_item where nom_apex = 'LISTR_GROUP' and ref_page = sie$migrt$pkg.obten_var_page(17165, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218510) from sie_13_page_item where nom_apex = 'LISTR_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(17165, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218511) from sie_13_page_item where nom_apex = 'LISTR_DROIT' and ref_page = sie$migrt$pkg.obten_var_page(17165, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218512) from sie_13_page_item where nom_apex = 'EDITR_GROUP' and ref_page = sie$migrt$pkg.obten_var_page(17165, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218513) from sie_13_page_item where nom_apex = 'EDITR_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(17165, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218514) from sie_13_page_item where nom_apex = 'EDITR_DROIT' and ref_page = sie$migrt$pkg.obten_var_page(17165, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218515) from sie_13_page_item where nom_apex = 'P12141_CONTX' and ref_page = sie$migrt$pkg.obten_var_page(17166, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218516) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17166, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218517) from sie_13_page_item where nom_apex = 'P12151_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17167, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218518) from sie_13_page_item where nom_apex = 'P12151_NOM' and ref_page = sie$migrt$pkg.obten_var_page(17167, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218519) from sie_13_page_item where nom_apex = 'P12151_CONTX' and ref_page = sie$migrt$pkg.obten_var_page(17167, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218520) from sie_13_page_item where nom_apex = 'P12151_STRUC_LIE' and ref_page = sie$migrt$pkg.obten_var_page(17167, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218521) from sie_13_page_item where nom_apex = 'P12151_REF_TYPE_STRUC' and ref_page = sie$migrt$pkg.obten_var_page(17167, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218522) from sie_13_page_item where nom_apex = 'P12151_REF_RESPN' and ref_page = sie$migrt$pkg.obten_var_page(17167, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218523) from sie_13_page_item where nom_apex = 'P12151_DEBUT_EFECT' and ref_page = sie$migrt$pkg.obten_var_page(17167, 'Select');
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
select seqnc into sie$migrt$pkg.var_page_item(218524) from sie_13_page_item where nom_apex = 'P12151_FIN_EFECT' and ref_page = sie$migrt$pkg.obten_var_page(17167, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218525) from sie_13_page_item where nom_apex = 'P12151_INDIC_DEFT' and ref_page = sie$migrt$pkg.obten_var_page(17167, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218526) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(17167, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218527) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17167, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218528) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17167, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218529) from sie_13_page_item where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(17167, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218530) from sie_13_page_item where nom_apex = 'P12181_STRUC_ADMIN' and ref_page = sie$migrt$pkg.obten_var_page(17168, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218531) from sie_13_page_item where nom_apex = 'P12181_MEMBR_STRUC' and ref_page = sie$migrt$pkg.obten_var_page(17168, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218532) from sie_13_page_item where nom_apex = 'P12181_CONTX' and ref_page = sie$migrt$pkg.obten_var_page(17168, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218533) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(17168, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218534) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17168, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218535) from sie_13_page_item where nom_apex = 'CREER' and ref_page = sie$migrt$pkg.obten_var_page(17169, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218536) from sie_13_page_item where nom_apex = 'P12210_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17170, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218537) from sie_13_page_item where nom_apex = 'P12210_CODE' and ref_page = sie$migrt$pkg.obten_var_page(17170, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218538) from sie_13_page_item where nom_apex = 'P12210_NOM' and ref_page = sie$migrt$pkg.obten_var_page(17170, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218539) from sie_13_page_item where nom_apex = 'P12210_DESCR' and ref_page = sie$migrt$pkg.obten_var_page(17170, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218540) from sie_13_page_item where nom_apex = 'P12210_REF_COMPT_AXIAT_DEFT' and ref_page = sie$migrt$pkg.obten_var_page(17170, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218541) from sie_13_page_item where nom_apex = 'P12210_REF_PROFL_COURL_NOTFC' and ref_page = sie$migrt$pkg.obten_var_page(17170, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218542) from sie_13_page_item where nom_apex = 'P12210_REF_PROFL_SMS_NOTFC' and ref_page = sie$migrt$pkg.obten_var_page(17170, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218547) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(17170, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218544) from sie_13_page_item where nom_apex = 'P12210_PROCD_AUTHE_EXTER_AFW' and ref_page = sie$migrt$pkg.obten_var_page(17170, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218546) from sie_13_page_item where nom_apex = 'P12210_MODE' and ref_page = sie$migrt$pkg.obten_var_page(17170, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218548) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17170, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218549) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17170, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218551) from sie_13_page_item where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(17170, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218556) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17172, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218557) from sie_13_page_item where nom_apex = 'P12336_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17173, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218558) from sie_13_page_item where nom_apex = 'P12336_CODE' and ref_page = sie$migrt$pkg.obten_var_page(17173, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218559) from sie_13_page_item where nom_apex = 'P12336_NOM' and ref_page = sie$migrt$pkg.obten_var_page(17173, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218560) from sie_13_page_item where nom_apex = 'P12336_DESCR' and ref_page = sie$migrt$pkg.obten_var_page(17173, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218561) from sie_13_page_item where nom_apex = 'P12336_REF_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(17173, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218562) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(17173, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218563) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17173, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218564) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17173, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218565) from sie_13_page_item where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(17173, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218566) from sie_13_page_item where nom_apex = 'P13053_TYPE_DEFNT_ACCES' and ref_page = sie$migrt$pkg.obten_var_page(17174, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218567) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17174, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218568) from sie_13_page_item where nom_apex = 'CREER' and ref_page = sie$migrt$pkg.obten_var_page(17175, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218569) from sie_13_page_item where nom_apex = 'P19030_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17176, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218570) from sie_13_page_item where nom_apex = 'P19030_REF_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(17176, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218571) from sie_13_page_item where nom_apex = 'P19030_CODE' and ref_page = sie$migrt$pkg.obten_var_page(17176, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218572) from sie_13_page_item where nom_apex = 'P19030_NOM' and ref_page = sie$migrt$pkg.obten_var_page(17176, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218573) from sie_13_page_item where nom_apex = 'P19030_DESCR' and ref_page = sie$migrt$pkg.obten_var_page(17176, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218574) from sie_13_page_item where nom_apex = 'P19030_REF_PRODT' and ref_page = sie$migrt$pkg.obten_var_page(17176, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218575) from sie_13_page_item where nom_apex = 'P19030_DNR_REF_PRODT' and ref_page = sie$migrt$pkg.obten_var_page(17176, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218576) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17176, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218577) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(17176, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218578) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17176, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218579) from sie_13_page_item where nom_apex = 'CRÉER' and ref_page = sie$migrt$pkg.obten_var_page(17176, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218580) from sie_13_page_item where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(17176, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218581) from sie_13_page_item where nom_apex = 'P19040_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17177, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218582) from sie_13_page_item where nom_apex = 'P19040_REF_MODL_RECHR' and ref_page = sie$migrt$pkg.obten_var_page(17177, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218583) from sie_13_page_item where nom_apex = 'P19040_REF_STRUC_APLIC_RECHR' and ref_page = sie$migrt$pkg.obten_var_page(17177, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218584) from sie_13_page_item where nom_apex = 'P19040_REF_STRUC_APLIC_LIEN' and ref_page = sie$migrt$pkg.obten_var_page(17177, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218585) from sie_13_page_item where nom_apex = 'P19040_REF_ATRIB_STRUC_APLIC_AFICH' and ref_page = sie$migrt$pkg.obten_var_page(17177, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218586) from sie_13_page_item where nom_apex = 'P19040_NOMBR_MAXIM_RESLT' and ref_page = sie$migrt$pkg.obten_var_page(17177, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218587) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17177, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218588) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(17177, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218589) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17177, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218590) from sie_13_page_item where nom_apex = 'CREATE1' and ref_page = sie$migrt$pkg.obten_var_page(17177, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218591) from sie_13_page_item where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(17177, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218592) from sie_13_page_item where nom_apex = 'P19041_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17178, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218593) from sie_13_page_item where nom_apex = 'P19041_REF_APLIC_MODL_RECHR' and ref_page = sie$migrt$pkg.obten_var_page(17178, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218594) from sie_13_page_item where nom_apex = 'P19041_REF_ATRIB_STRUC_APLIC' and ref_page = sie$migrt$pkg.obten_var_page(17178, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218595) from sie_13_page_item where nom_apex = 'P19041_REF_PATRN_RECHR' and ref_page = sie$migrt$pkg.obten_var_page(17178, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218596) from sie_13_page_item where nom_apex = 'P19041_ORDRE_EXECT' and ref_page = sie$migrt$pkg.obten_var_page(17178, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218597) from sie_13_page_item where nom_apex = 'P19041_PERTN' and ref_page = sie$migrt$pkg.obten_var_page(17178, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218598) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17178, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218599) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(17178, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218600) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17178, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218602) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17179, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218603) from sie_13_page_item where nom_apex = 'P20010_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17180, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218604) from sie_13_page_item where nom_apex = 'P20010_SERVR_SORTN' and ref_page = sie$migrt$pkg.obten_var_page(17180, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218605) from sie_13_page_item where nom_apex = 'P20010_PORT_SORTN' and ref_page = sie$migrt$pkg.obten_var_page(17180, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218606) from sie_13_page_item where nom_apex = 'P20010_NOM_ENVOY' and ref_page = sie$migrt$pkg.obten_var_page(17180, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218608) from sie_13_page_item where nom_apex = 'P20010_AUTHE_METHD_SORTN' and ref_page = sie$migrt$pkg.obten_var_page(17180, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218609) from sie_13_page_item where nom_apex = 'P20010_AUTHE_USAGR_SORTN' and ref_page = sie$migrt$pkg.obten_var_page(17180, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218610) from sie_13_page_item where nom_apex = 'P20010_AUTHE_MDP_SORTN' and ref_page = sie$migrt$pkg.obten_var_page(17180, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218611) from sie_13_page_item where nom_apex = 'P20010_CODE' and ref_page = sie$migrt$pkg.obten_var_page(17180, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218612) from sie_13_page_item where nom_apex = 'P20010_NOM' and ref_page = sie$migrt$pkg.obten_var_page(17180, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218614) from sie_13_page_item where nom_apex = 'P20010_SERVR_ENTRA' and ref_page = sie$migrt$pkg.obten_var_page(17180, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218615) from sie_13_page_item where nom_apex = 'P20010_PORT_ENTRA' and ref_page = sie$migrt$pkg.obten_var_page(17180, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218616) from sie_13_page_item where nom_apex = 'P20010_AUTHE_METHD_ENTRA' and ref_page = sie$migrt$pkg.obten_var_page(17180, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218617) from sie_13_page_item where nom_apex = 'P20010_AUTHE_USAGR_ENTRA' and ref_page = sie$migrt$pkg.obten_var_page(17180, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218618) from sie_13_page_item where nom_apex = 'P20010_AUTHE_MDP_ENTRA' and ref_page = sie$migrt$pkg.obten_var_page(17180, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218620) from sie_13_page_item where nom_apex = 'P20010_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(17180, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218621) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(17180, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218622) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17180, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218623) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17180, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218624) from sie_13_page_item where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(17180, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218625) from sie_13_page_item where nom_apex = 'P20030_INDIC_FORMT_HTML' and ref_page = sie$migrt$pkg.obten_var_page(17182, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218626) from sie_13_page_item where nom_apex = 'P20030_CORPS' and ref_page = sie$migrt$pkg.obten_var_page(17182, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218627) from sie_13_page_item where nom_apex = 'P20030_NOMBR_TENTV' and ref_page = sie$migrt$pkg.obten_var_page(17182, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218628) from sie_13_page_item where nom_apex = 'P20030_NOMBR_TENTV_MAX' and ref_page = sie$migrt$pkg.obten_var_page(17182, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218629) from sie_13_page_item where nom_apex = 'P20030_SENS' and ref_page = sie$migrt$pkg.obten_var_page(17182, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218630) from sie_13_page_item where nom_apex = 'P20030_STAT_SOUMS' and ref_page = sie$migrt$pkg.obten_var_page(17182, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218631) from sie_13_page_item where nom_apex = 'P20030_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17182, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218632) from sie_13_page_item where nom_apex = 'P20030_SERVR' and ref_page = sie$migrt$pkg.obten_var_page(17182, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218633) from sie_13_page_item where nom_apex = 'P20030_PORT' and ref_page = sie$migrt$pkg.obten_var_page(17182, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218634) from sie_13_page_item where nom_apex = 'P20030_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(17182, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218635) from sie_13_page_item where nom_apex = 'P20030_NOM_ENVOY' and ref_page = sie$migrt$pkg.obten_var_page(17182, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218636) from sie_13_page_item where nom_apex = 'P20030_ADRES_ENVOY' and ref_page = sie$migrt$pkg.obten_var_page(17182, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218637) from sie_13_page_item where nom_apex = 'P20030_SUJET' and ref_page = sie$migrt$pkg.obten_var_page(17182, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218638) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(17182, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218639) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17182, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218640) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17183, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218641) from sie_13_page_item where nom_apex = 'P21010_CODE' and ref_page = sie$migrt$pkg.obten_var_page(17184, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218642) from sie_13_page_item where nom_apex = 'P21010_NOM' and ref_page = sie$migrt$pkg.obten_var_page(17184, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218643) from sie_13_page_item where nom_apex = 'P21010_DESCR' and ref_page = sie$migrt$pkg.obten_var_page(17184, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218644) from sie_13_page_item where nom_apex = 'P21010_REF_PRODT' and ref_page = sie$migrt$pkg.obten_var_page(17184, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218645) from sie_13_page_item where nom_apex = 'P21010_REF_PROFL_COURL' and ref_page = sie$migrt$pkg.obten_var_page(17184, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218646) from sie_13_page_item where nom_apex = 'P21010_INDIC_AVERT_AUTR_UNIQ' and ref_page = sie$migrt$pkg.obten_var_page(17184, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218647) from sie_13_page_item where nom_apex = 'P21010_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(17184, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218648) from sie_13_page_item where nom_apex = 'P21010_GROUP_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(17184, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218649) from sie_13_page_item where nom_apex = 'P21010_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17184, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218650) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(17184, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218651) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17184, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218652) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17184, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218653) from sie_13_page_item where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(17184, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218654) from sie_13_page_item where nom_apex = 'P30010_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17185, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218655) from sie_13_page_item where nom_apex = 'P30020_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17186, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218656) from sie_13_page_item where nom_apex = 'P30030_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17187, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218657) from sie_13_page_item where nom_apex = 'P30040_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17188, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218658) from sie_13_page_item where nom_apex = 'P30050_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17189, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218659) from sie_13_page_item where nom_apex = 'CREAT' and ref_page = sie$migrt$pkg.obten_var_page(17190, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218660) from sie_13_page_item where nom_apex = 'P34100_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17191, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218661) from sie_13_page_item where nom_apex = 'P34100_CODE' and ref_page = sie$migrt$pkg.obten_var_page(17191, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218662) from sie_13_page_item where nom_apex = 'P34100_NOM' and ref_page = sie$migrt$pkg.obten_var_page(17191, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218663) from sie_13_page_item where nom_apex = 'P34100_DESCR' and ref_page = sie$migrt$pkg.obten_var_page(17191, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218664) from sie_13_page_item where nom_apex = 'P34100_COULR_TEXTE' and ref_page = sie$migrt$pkg.obten_var_page(17191, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218665) from sie_13_page_item where nom_apex = 'P34100_TAIL_TEXTE' and ref_page = sie$migrt$pkg.obten_var_page(17191, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218666) from sie_13_page_item where nom_apex = 'P34100_COULR_TITRE' and ref_page = sie$migrt$pkg.obten_var_page(17191, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218667) from sie_13_page_item where nom_apex = 'P34100_TAIL_TITRE' and ref_page = sie$migrt$pkg.obten_var_page(17191, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218668) from sie_13_page_item where nom_apex = 'P34100_TEMPS_AFICH' and ref_page = sie$migrt$pkg.obten_var_page(17191, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218669) from sie_13_page_item where nom_apex = 'P34100_REF_RESRC_ICON' and ref_page = sie$migrt$pkg.obten_var_page(17191, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218671) from sie_13_page_item where nom_apex = 'P34100_REF_OCURN_RESRC_ICON' and ref_page = sie$migrt$pkg.obten_var_page(17191, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218672) from sie_13_page_item where nom_apex = 'P34100_REF_TYPE_COMNC' and ref_page = sie$migrt$pkg.obten_var_page(17191, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218673) from sie_13_page_item where nom_apex = 'P34100_SEQNC_TYPE_COMNC_ECRAN' and ref_page = sie$migrt$pkg.obten_var_page(17191, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218674) from sie_13_page_item where nom_apex = 'P34100_REF_MODL_COMNC' and ref_page = sie$migrt$pkg.obten_var_page(17191, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218675) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(17191, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218676) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17191, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218678) from sie_13_page_item where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(17191, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218679) from sie_13_page_item where nom_apex = 'CRÉER' and ref_page = sie$migrt$pkg.obten_var_page(17192, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218680) from sie_13_page_item where nom_apex = 'P34210_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17193, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218682) from sie_13_page_item where nom_apex = 'P34210_NOM' and ref_page = sie$migrt$pkg.obten_var_page(17193, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218683) from sie_13_page_item where nom_apex = 'P34210_REF_EVENM_NOTFB' and ref_page = sie$migrt$pkg.obten_var_page(17193, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218684) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(17193, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218685) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17193, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218686) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17193, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218688) from sie_13_page_item where nom_apex = 'CREAT' and ref_page = sie$migrt$pkg.obten_var_page(17194, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218689) from sie_13_page_item where nom_apex = 'CRÉER' and ref_page = sie$migrt$pkg.obten_var_page(17195, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218690) from sie_13_page_item where nom_apex = 'P34310_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17196, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218691) from sie_13_page_item where nom_apex = 'P34310_CODE' and ref_page = sie$migrt$pkg.obten_var_page(17196, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218692) from sie_13_page_item where nom_apex = 'P34310_NOM' and ref_page = sie$migrt$pkg.obten_var_page(17196, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218694) from sie_13_page_item where nom_apex = 'P34310_OBJET' and ref_page = sie$migrt$pkg.obten_var_page(17196, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218696) from sie_13_page_item where nom_apex = 'P34310_REF_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(17196, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218697) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(17196, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218698) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17196, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218699) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17196, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218700) from sie_13_page_item where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(17196, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218701) from sie_13_page_item where nom_apex = 'CREAT' and ref_page = sie$migrt$pkg.obten_var_page(17197, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218702) from sie_13_page_item where nom_apex = 'P34500_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17198, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218703) from sie_13_page_item where nom_apex = 'P34500_CODE' and ref_page = sie$migrt$pkg.obten_var_page(17198, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218704) from sie_13_page_item where nom_apex = 'P34500_NOM' and ref_page = sie$migrt$pkg.obten_var_page(17198, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218705) from sie_13_page_item where nom_apex = 'P34500_DESCR' and ref_page = sie$migrt$pkg.obten_var_page(17198, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218706) from sie_13_page_item where nom_apex = 'P34500_REF_TYPE_COMNC' and ref_page = sie$migrt$pkg.obten_var_page(17198, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218707) from sie_13_page_item where nom_apex = 'P34500_INDIC_SYSTM' and ref_page = sie$migrt$pkg.obten_var_page(17198, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218708) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17198, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218709) from sie_13_page_item where nom_apex = 'ADD' and ref_page = sie$migrt$pkg.obten_var_page(17198, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218710) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(17198, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218711) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17198, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218712) from sie_13_page_item where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(17198, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218713) from sie_13_page_item where nom_apex = 'MULTI_ROW_DELETE' and ref_page = sie$migrt$pkg.obten_var_page(17198, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218714) from sie_13_page_item where nom_apex = 'CREER' and ref_page = sie$migrt$pkg.obten_var_page(17201, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218715) from sie_13_page_item where nom_apex = 'P34710_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17202, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218716) from sie_13_page_item where nom_apex = 'P34710_CODE' and ref_page = sie$migrt$pkg.obten_var_page(17202, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218717) from sie_13_page_item where nom_apex = 'P34710_NOM' and ref_page = sie$migrt$pkg.obten_var_page(17202, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218718) from sie_13_page_item where nom_apex = 'P34710_DESCR' and ref_page = sie$migrt$pkg.obten_var_page(17202, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218719) from sie_13_page_item where nom_apex = 'P34710_NUMR' and ref_page = sie$migrt$pkg.obten_var_page(17202, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218720) from sie_13_page_item where nom_apex = 'P34710_REF_PROFL_COURL' and ref_page = sie$migrt$pkg.obten_var_page(17202, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218721) from sie_13_page_item where nom_apex = 'P34710_REF_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(17202, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218722) from sie_13_page_item where nom_apex = 'P34710_REF_PUBLC_PAGE_GARDE' and ref_page = sie$migrt$pkg.obten_var_page(17202, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218723) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(17202, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218724) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17202, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218725) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17202, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218726) from sie_13_page_item where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(17202, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218727) from sie_13_page_item where nom_apex = 'P34810_CODE' and ref_page = sie$migrt$pkg.obten_var_page(17204, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218728) from sie_13_page_item where nom_apex = 'P34810_NOM' and ref_page = sie$migrt$pkg.obten_var_page(17204, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218729) from sie_13_page_item where nom_apex = 'P34810_DESCR' and ref_page = sie$migrt$pkg.obten_var_page(17204, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218730) from sie_13_page_item where nom_apex = 'P34810_REF_STRUC_APLIC' and ref_page = sie$migrt$pkg.obten_var_page(17204, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218731) from sie_13_page_item where nom_apex = 'P34810_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17204, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218732) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17204, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218733) from sie_13_page_item where nom_apex = 'CREAT_CONFG' and ref_page = sie$migrt$pkg.obten_var_page(17204, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218734) from sie_13_page_item where nom_apex = 'P34820_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17205, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218735) from sie_13_page_item where nom_apex = 'P34820_REF_TYPE_COMNC' and ref_page = sie$migrt$pkg.obten_var_page(17205, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218736) from sie_13_page_item where nom_apex = 'P34820_OBJET' and ref_page = sie$migrt$pkg.obten_var_page(17205, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218737) from sie_13_page_item where nom_apex = 'P34820_MESG' and ref_page = sie$migrt$pkg.obten_var_page(17205, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218738) from sie_13_page_item where nom_apex = 'P34820_REF_EVENM_NOTFB' and ref_page = sie$migrt$pkg.obten_var_page(17205, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218739) from sie_13_page_item where nom_apex = 'P34820_NOM' and ref_page = sie$migrt$pkg.obten_var_page(17205, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218740) from sie_13_page_item where nom_apex = 'P34820_DESCR' and ref_page = sie$migrt$pkg.obten_var_page(17205, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218741) from sie_13_page_item where nom_apex = 'P34820_MESG_SMS' and ref_page = sie$migrt$pkg.obten_var_page(17205, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218742) from sie_13_page_item where nom_apex = 'P34820_SEQNC_TYPE_COURL' and ref_page = sie$migrt$pkg.obten_var_page(17205, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218743) from sie_13_page_item where nom_apex = 'P34820_SEQNC_TYPE_SMS' and ref_page = sie$migrt$pkg.obten_var_page(17205, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218745) from sie_13_page_item where nom_apex = 'P34820_REF_COMPT_COURL' and ref_page = sie$migrt$pkg.obten_var_page(17205, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218746) from sie_13_page_item where nom_apex = 'P34820_REF_COMPT_TWILI' and ref_page = sie$migrt$pkg.obten_var_page(17205, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218747) from sie_13_page_item where nom_apex = 'P34820_MODE' and ref_page = sie$migrt$pkg.obten_var_page(17205, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218748) from sie_13_page_item where nom_apex = 'P34820_RESLT_DESTN' and ref_page = sie$migrt$pkg.obten_var_page(17205, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218749) from sie_13_page_item where nom_apex = 'P34820_CHAMP_NOM_FORMT' and ref_page = sie$migrt$pkg.obten_var_page(17205, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218750) from sie_13_page_item where nom_apex = 'P34820_CHAMP_ADRES_COURL' and ref_page = sie$migrt$pkg.obten_var_page(17205, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218751) from sie_13_page_item where nom_apex = 'P34820_CHAMP_NUMR_SMS' and ref_page = sie$migrt$pkg.obten_var_page(17205, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218753) from sie_13_page_item where nom_apex = 'P34820_REF_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(17205, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218754) from sie_13_page_item where nom_apex = 'AJOUT_DESTN' and ref_page = sie$migrt$pkg.obten_var_page(17205, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218755) from sie_13_page_item where nom_apex = 'P34820_STRUC_APLIC' and ref_page = sie$migrt$pkg.obten_var_page(17205, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218756) from sie_13_page_item where nom_apex = 'P34820_INDIC_DEFT' and ref_page = sie$migrt$pkg.obten_var_page(17205, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218757) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(17205, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218758) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17205, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218760) from sie_13_page_item where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(17205, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218761) from sie_13_page_item where nom_apex = 'SUPRM_ELEMN_CONFIG' and ref_page = sie$migrt$pkg.obten_var_page(17205, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218762) from sie_13_page_item where nom_apex = 'SUPRM_DESTN_CONFG' and ref_page = sie$migrt$pkg.obten_var_page(17205, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218763) from sie_13_page_item where nom_apex = 'CREAT_ELEMN_CONFIG' and ref_page = sie$migrt$pkg.obten_var_page(17205, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218765) from sie_13_page_item where nom_apex = 'AFICH_ELEMN_SUBST_MESG' and ref_page = sie$migrt$pkg.obten_var_page(17205, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218766) from sie_13_page_item where nom_apex = 'P34830_RESLT_4' and ref_page = sie$migrt$pkg.obten_var_page(17206, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218767) from sie_13_page_item where nom_apex = 'P34830_RESLT_5' and ref_page = sie$migrt$pkg.obten_var_page(17206, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218768) from sie_13_page_item where nom_apex = 'P34830_RESLT_6' and ref_page = sie$migrt$pkg.obten_var_page(17206, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218769) from sie_13_page_item where nom_apex = 'P34830_CHAMP_1' and ref_page = sie$migrt$pkg.obten_var_page(17206, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218771) from sie_13_page_item where nom_apex = 'P34830_AFICH_RESLT_1' and ref_page = sie$migrt$pkg.obten_var_page(17206, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218772) from sie_13_page_item where nom_apex = 'P34830_RESLT_3' and ref_page = sie$migrt$pkg.obten_var_page(17206, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218773) from sie_13_page_item where nom_apex = 'P34830_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17206, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218780) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17206, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218774) from sie_13_page_item where nom_apex = 'P34830_REF_CONFG_EVENM_NOTFB' and ref_page = sie$migrt$pkg.obten_var_page(17206, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218775) from sie_13_page_item where nom_apex = 'P34830_CODE' and ref_page = sie$migrt$pkg.obten_var_page(17206, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218776) from sie_13_page_item where nom_apex = 'P34830_IDENT_ACCES' and ref_page = sie$migrt$pkg.obten_var_page(17206, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218777) from sie_13_page_item where nom_apex = 'P34830_IDENT_ACCES_FORMT' and ref_page = sie$migrt$pkg.obten_var_page(17206, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218778) from sie_13_page_item where nom_apex = 'P34830_RESLT_1' and ref_page = sie$migrt$pkg.obten_var_page(17206, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218779) from sie_13_page_item where nom_apex = 'P34830_ELEMN_SUBST_MESG' and ref_page = sie$migrt$pkg.obten_var_page(17206, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218781) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17206, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218782) from sie_13_page_item where nom_apex = 'P34840_RESLT_6' and ref_page = sie$migrt$pkg.obten_var_page(17207, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218783) from sie_13_page_item where nom_apex = 'P34840_RESLT_3' and ref_page = sie$migrt$pkg.obten_var_page(17207, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218784) from sie_13_page_item where nom_apex = 'P34840_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17207, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218785) from sie_13_page_item where nom_apex = 'P34840_REF_CONFG_EVENM_NOTFB' and ref_page = sie$migrt$pkg.obten_var_page(17207, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218786) from sie_13_page_item where nom_apex = 'P34840_IDENT_ACCES' and ref_page = sie$migrt$pkg.obten_var_page(17207, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218787) from sie_13_page_item where nom_apex = 'P34840_IDENT_ACCES_FORMT' and ref_page = sie$migrt$pkg.obten_var_page(17207, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218788) from sie_13_page_item where nom_apex = 'P34840_RESLT_1' and ref_page = sie$migrt$pkg.obten_var_page(17207, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218789) from sie_13_page_item where nom_apex = 'P34840_AFICH_RESLT_1' and ref_page = sie$migrt$pkg.obten_var_page(17207, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218790) from sie_13_page_item where nom_apex = 'P34840_CHAMP_1' and ref_page = sie$migrt$pkg.obten_var_page(17207, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218791) from sie_13_page_item where nom_apex = 'P34840_ELEMN_SUBST_MESG' and ref_page = sie$migrt$pkg.obten_var_page(17207, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218792) from sie_13_page_item where nom_apex = 'P34840_CODE' and ref_page = sie$migrt$pkg.obten_var_page(17207, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218793) from sie_13_page_item where nom_apex = 'P34840_RESLT_2' and ref_page = sie$migrt$pkg.obten_var_page(17207, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218794) from sie_13_page_item where nom_apex = 'P34840_RESLT_4' and ref_page = sie$migrt$pkg.obten_var_page(17207, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218795) from sie_13_page_item where nom_apex = 'P34840_RESLT_5' and ref_page = sie$migrt$pkg.obten_var_page(17207, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218796) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17207, 'Select');
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
select seqnc into sie$migrt$pkg.var_page_item(218797) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17207, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218601) from sie_13_page_item where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(17178, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218607) from sie_13_page_item where nom_apex = 'P20010_ADRES_ENVOY' and ref_page = sie$migrt$pkg.obten_var_page(17180, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218613) from sie_13_page_item where nom_apex = 'P20010_DESCR' and ref_page = sie$migrt$pkg.obten_var_page(17180, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218619) from sie_13_page_item where nom_apex = 'P20010_REF_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(17180, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218545) from sie_13_page_item where nom_apex = 'P12210_PROCD_VALD_NIV_SECRT_MP' and ref_page = sie$migrt$pkg.obten_var_page(17170, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218670) from sie_13_page_item where nom_apex = 'P34100_REF_FORMT_RESRC_ICON' and ref_page = sie$migrt$pkg.obten_var_page(17191, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218677) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17191, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218681) from sie_13_page_item where nom_apex = 'P34210_CODE' and ref_page = sie$migrt$pkg.obten_var_page(17193, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218687) from sie_13_page_item where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(17193, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218693) from sie_13_page_item where nom_apex = 'P34310_DESCR' and ref_page = sie$migrt$pkg.obten_var_page(17196, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218744) from sie_13_page_item where nom_apex = 'P34820_SEQNC_TYPE_ECRAN' and ref_page = sie$migrt$pkg.obten_var_page(17205, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218752) from sie_13_page_item where nom_apex = 'P34820_CHAMP_NATR_COURL' and ref_page = sie$migrt$pkg.obten_var_page(17205, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218759) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17205, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218764) from sie_13_page_item where nom_apex = 'CREAT_DESTN_CONFIG' and ref_page = sie$migrt$pkg.obten_var_page(17205, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218770) from sie_13_page_item where nom_apex = 'P34830_RESLT_2' and ref_page = sie$migrt$pkg.obten_var_page(17206, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218484) from sie_13_page_item where nom_apex = 'P12020_MOT_PASSE' and ref_page = sie$migrt$pkg.obten_var_page(17161, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218492) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17163, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218498) from sie_13_page_item where nom_apex = 'P12131_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17165, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218505) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(17165, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228621) from sie_13_page_item where nom_apex = 'P12020_MESG_AUTOR_CONXN_DERV' and ref_page = sie$migrt$pkg.obten_var_page(17161, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228622) from sie_13_page_item where nom_apex = 'P12131_INDIC_ACCES_GLOBL' and ref_page = sie$migrt$pkg.obten_var_page(17165, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228619) from sie_13_page_item where nom_apex = 'P12020_CODE_UTILS_BASE_DON' and ref_page = sie$migrt$pkg.obten_var_page(17161, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228620) from sie_13_page_item where nom_apex = 'P12020_MESG_SUPER_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(17161, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228623) from sie_13_page_item where nom_apex = 'P35042_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(18055, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228624) from sie_13_page_item where nom_apex = 'P35042_REF_FONCT' and ref_page = sie$migrt$pkg.obten_var_page(18055, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228625) from sie_13_page_item where nom_apex = 'P35042_REF_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(18055, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228626) from sie_13_page_item where nom_apex = 'P35042_INDIC_ACTIF' and ref_page = sie$migrt$pkg.obten_var_page(18055, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228627) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(18055, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228628) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(18055, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228629) from sie_13_page_item where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(18055, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228630) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(18055, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228631) from sie_13_page_item where nom_apex = 'P12220_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(18057, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228632) from sie_13_page_item where nom_apex = 'P12220_REF_GROUP_UTILS_FORMT' and ref_page = sie$migrt$pkg.obten_var_page(18057, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228633) from sie_13_page_item where nom_apex = 'P12220_REF_OPERT' and ref_page = sie$migrt$pkg.obten_var_page(18057, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228634) from sie_13_page_item where nom_apex = 'P12220_REF_OPERT_OPTIO' and ref_page = sie$migrt$pkg.obten_var_page(18057, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228635) from sie_13_page_item where nom_apex = 'P12220_REF_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(18057, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228636) from sie_13_page_item where nom_apex = 'P12220_REF_OPERT_FORMT' and ref_page = sie$migrt$pkg.obten_var_page(18057, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228637) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(18057, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228638) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(18057, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228639) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(18058, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(227642) from sie_13_page_item where nom_apex = 'P1_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17157, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(227643) from sie_13_page_item where nom_apex = 'P1_NOM' and ref_page = sie$migrt$pkg.obten_var_page(17157, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(227644) from sie_13_page_item where nom_apex = 'P1_CODE' and ref_page = sie$migrt$pkg.obten_var_page(17157, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(227645) from sie_13_page_item where nom_apex = 'EDITR' and ref_page = sie$migrt$pkg.obten_var_page(17157, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(227810) from sie_13_page_item where nom_apex = 'P35011_INDIC_REPNS_OBLIG' and ref_page = sie$migrt$pkg.obten_var_page(17939, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(227811) from sie_13_page_item where nom_apex = 'P35011_NOM' and ref_page = sie$migrt$pkg.obten_var_page(17939, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(227812) from sie_13_page_item where nom_apex = 'P35011_INDIC_INTER' and ref_page = sie$migrt$pkg.obten_var_page(17939, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(227813) from sie_13_page_item where nom_apex = 'P35011_REF_DV_TYPE_DON_SAIS' and ref_page = sie$migrt$pkg.obten_var_page(17939, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(227814) from sie_13_page_item where nom_apex = 'P35011_INDIC_REPNS_MULTP' and ref_page = sie$migrt$pkg.obten_var_page(17939, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(227815) from sie_13_page_item where nom_apex = 'P35011_NOMBR_MINM_OCURN_INTER' and ref_page = sie$migrt$pkg.obten_var_page(17939, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(227816) from sie_13_page_item where nom_apex = 'P35011_NOMBR_MAXM_OCURN_INTER' and ref_page = sie$migrt$pkg.obten_var_page(17939, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(227817) from sie_13_page_item where nom_apex = 'P35011_REF_DV_MASQ_FORMT_AUTRE' and ref_page = sie$migrt$pkg.obten_var_page(17939, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(227818) from sie_13_page_item where nom_apex = 'P35011_REF_DV_TYPE_CHAMP_REPNS' and ref_page = sie$migrt$pkg.obten_var_page(17939, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(227819) from sie_13_page_item where nom_apex = 'P35011_NOMBR_CARCT_REPNS' and ref_page = sie$migrt$pkg.obten_var_page(17939, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(227820) from sie_13_page_item where nom_apex = 'P35011_REF_DV_MASQ_FORMT_REPNS' and ref_page = sie$migrt$pkg.obten_var_page(17939, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(227821) from sie_13_page_item where nom_apex = 'P35011_LARGR_REPNS' and ref_page = sie$migrt$pkg.obten_var_page(17939, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(227822) from sie_13_page_item where nom_apex = 'P35011_NOMBR_COLN_REPNS' and ref_page = sie$migrt$pkg.obten_var_page(17939, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(227823) from sie_13_page_item where nom_apex = 'P35011_NOMBR_RANGE_REPNS' and ref_page = sie$migrt$pkg.obten_var_page(17939, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(227824) from sie_13_page_item where nom_apex = 'P35011_INDIC_AUTRE' and ref_page = sie$migrt$pkg.obten_var_page(17939, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(227825) from sie_13_page_item where nom_apex = 'P35011_REF_DV_TYPE_CHAMP_AUTRE' and ref_page = sie$migrt$pkg.obten_var_page(17939, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(227826) from sie_13_page_item where nom_apex = 'P35011_NOMBR_CARCT_AUTRE' and ref_page = sie$migrt$pkg.obten_var_page(17939, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(227827) from sie_13_page_item where nom_apex = 'P35011_LARGR_AUTRE' and ref_page = sie$migrt$pkg.obten_var_page(17939, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(227828) from sie_13_page_item where nom_apex = 'P35011_NOMBR_COLN_AUTRE' and ref_page = sie$migrt$pkg.obten_var_page(17939, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(227829) from sie_13_page_item where nom_apex = 'P35011_NOMBR_RANGE_AUTRE' and ref_page = sie$migrt$pkg.obten_var_page(17939, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(227830) from sie_13_page_item where nom_apex = 'P35011_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17939, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(227831) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(17939, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(227832) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17939, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(227833) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17939, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(227834) from sie_13_page_item where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(17939, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(227835) from sie_13_page_item where nom_apex = 'LIER' and ref_page = sie$migrt$pkg.obten_var_page(17160, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(227836) from sie_13_page_item where nom_apex = 'P12011_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17937, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(227837) from sie_13_page_item where nom_apex = 'P12011_REF_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(17937, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(227838) from sie_13_page_item where nom_apex = 'P12011_REF_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(17937, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(227839) from sie_13_page_item where nom_apex = 'P12011_DATE_DEBUT_EFECT' and ref_page = sie$migrt$pkg.obten_var_page(17937, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(227840) from sie_13_page_item where nom_apex = 'P12011_DATE_FIN_EFECT' and ref_page = sie$migrt$pkg.obten_var_page(17937, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(227841) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17937, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(227842) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17938, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(229598) from sie_13_page_item where nom_apex = 'P12151_REF_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(17167, 'Select');
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
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4854, 'Update') where numr_apex = 35011 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = null where numr_apex = 0 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3684, 'Update') where numr_apex = 1 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4574, 'Update') where numr_apex = 101 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4561, 'Update') where numr_apex = 102 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4551, 'Update') where numr_apex = 12010 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4551, 'Update') where numr_apex = 12020 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4905, 'Update') where numr_apex = 12021 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4904, 'Update') where numr_apex = 12030 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3701, 'Update') where numr_apex = 12121 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3701, 'Update') where numr_apex = 12131 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3676, 'Update') where numr_apex = 12141 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3676, 'Update') where numr_apex = 12151 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4896, 'Update') where numr_apex = 12181 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3684, 'Update') where numr_apex = 12200 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3684, 'Update') where numr_apex = 12210 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4897, 'Update') where numr_apex = 12326 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4897, 'Update') where numr_apex = 12336 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4519, 'Update') where numr_apex = 13053 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4533, 'Update') where numr_apex = 19020 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4533, 'Update') where numr_apex = 19030 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4565, 'Update') where numr_apex = 19040 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4566, 'Update') where numr_apex = 19041 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4573, 'Update') where numr_apex = 20000 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4573, 'Update') where numr_apex = 20010 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4898, 'Update') where numr_apex = 20020 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4898, 'Update') where numr_apex = 20030 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4899, 'Update') where numr_apex = 21000 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4899, 'Update') where numr_apex = 21010 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4552, 'Update') where numr_apex = 30010 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4552, 'Update') where numr_apex = 30020 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4552, 'Update') where numr_apex = 30030 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4552, 'Update') where numr_apex = 30040 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4552, 'Update') where numr_apex = 30050 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4900, 'Update') where numr_apex = 34000 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4900, 'Update') where numr_apex = 34100 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3691, 'Update') where numr_apex = 34200 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4563, 'Update') where numr_apex = 34210 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4563, 'Update') where numr_apex = 34211 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4901, 'Update') where numr_apex = 34300 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4901, 'Update') where numr_apex = 34310 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4902, 'Update') where numr_apex = 34400 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4902, 'Update') where numr_apex = 34500 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4539, 'Update') where numr_apex = 34600 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4539, 'Update') where numr_apex = 34610 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4906, 'Update') where numr_apex = 34700 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4906, 'Update') where numr_apex = 34710 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3691, 'Update') where numr_apex = 34800 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3691, 'Update') where numr_apex = 34810 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4562, 'Update') where numr_apex = 34820 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4570, 'Update') where numr_apex = 34830 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4534, 'Update') where numr_apex = 34840 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4572, 'Update') where numr_apex = 34900 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4895, 'Update') where numr_apex = 35020 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4551, 'Update') where numr_apex = 12011 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4854, 'Update') where numr_apex = 35010 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4999, 'Update') where numr_apex = 35042 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4541, 'Update') where numr_apex = 35031 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(3693, 'Update') where numr_apex = 12220 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4999, 'Update') where numr_apex = 35041 and ref_aplic = sie$migrt$pkg.obten_var_aplic(188, 'Select');
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
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'TYPE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7347, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'STAT_SOUMS' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7347, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOMBR_TENTV' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7347, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SUJET' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7347, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM_ENVOY' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7347, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SERVR' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7347, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'PORT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7347, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DOMN' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7347, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DATE_CREAT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7347, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7049, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7049, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7050, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_DV_TYPE_REQT_INTER_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7050, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DATE_DEBUT_EFECT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7050, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DATE_FIN_EFECT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7050, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DATE_TRAIT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7050, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7048, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7048, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7048, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DESCR' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7048, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7026, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7026, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_STRUC_APLIC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7026, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7047, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'ADRES_ENVOY' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7047, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SUJET' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7047, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'STAT_SOUMS_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7047, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7026, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_PRODT_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7046, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'INDIC_ACTIF_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7027, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7027, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7027, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'PRENM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7027, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE_UTILS' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7027, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DATE_EXPIR' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7027, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DATE_CREAT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7027, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'UTILS_CREAT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7027, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'INDIC_VERL_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7027, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'INDIC_CHANG_MOT_PASSE_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7027, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'MOT_PASSE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7027, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7028, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7028, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7028, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NUMR' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7028, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_PROFL_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7028, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7029, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7029, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7029, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NUMR_APLIC_APEX' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7029, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7030, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7030, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DESCR' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7030, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7030, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7031, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7031, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7032, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7032, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'MESG' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7032, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'TYPE_MESG' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7032, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_PRODT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7032, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NUMR_APLIC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7033, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'PAGE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7033, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7033, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7033, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_DV_TYPE_EVENM_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7034, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'APLIC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7035, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NUMR_PAGE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7035, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'PAGE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7035, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_PRODT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7035, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7036, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7037, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7037, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_PROFL_COURL_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7037, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7038, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7038, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_TYPE_STRUC_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7038, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7039, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7039, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'APLIC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7040, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NUMR_PAGE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7040, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'PAGE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7040, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7040, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7040, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_PRODT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7040, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7041, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7041, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DESCR' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7041, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7041, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7042, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7042, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7042, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DESCR' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7042, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_TYPE_COMNC_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7042, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7043, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM_ENVOY' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7043, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'ADRES_ENVOY' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7043, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7043, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7043, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7044, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7044, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7044, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7045, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_GROUP' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7045, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_UTILS' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7045, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DATE_DEBUT_EFECT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7045, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DATE_FIN_EFECT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7045, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_GROUP_UTILS_LIE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7045, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DATE_DEBUT_EFECT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7036, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DATE_FIN_EFECT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7036, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_GROUP' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7036, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_UTILS' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7036, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_GROUP_UTILS_LIE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7036, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7046, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7046, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7046, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_STRUC_APLIC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7046, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7049, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_PRODT_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7032, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NUMR_PAGE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7033, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NUMR_APLIC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7035, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7035, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_UTILS_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7050, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'ADRES_IP' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7034, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7031, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NUMR_MESG' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7032, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'APLIC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7033, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DATE_EVENM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7034, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7035, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_PRODT_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7037, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7039, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NUMR_APLIC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7040, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_DV_TYPE_DON_SAIS_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7346, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_DV_TYPE_CHAMP_REPNS_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7346, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'INDIC_REPNS_OBLIG_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7346, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'INDIC_AUTRE_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7346, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7346, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7346, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'INDIC_ACTIF_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7427, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7426, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7426, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7426, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'GRP' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7039, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7427, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_FONCT_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7427, 'Select');
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
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12020_REF_DV_COMPL_MAXM' and ref_page = sie$migrt$pkg.obten_var_page(17161, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34310_CORPS_MESG' and ref_page = sie$migrt$pkg.obten_var_page(17196, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SADA' and ref_page = sie$migrt$pkg.obten_var_page(17156, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SIDF' and ref_page = sie$migrt$pkg.obten_var_page(17156, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SSPC' and ref_page = sie$migrt$pkg.obten_var_page(17156, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SCPC' and ref_page = sie$migrt$pkg.obten_var_page(17156, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAPC' and ref_page = sie$migrt$pkg.obten_var_page(17156, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SNPI' and ref_page = sie$migrt$pkg.obten_var_page(17156, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SCPI' and ref_page = sie$migrt$pkg.obten_var_page(17156, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SSPI' and ref_page = sie$migrt$pkg.obten_var_page(17156, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAPI' and ref_page = sie$migrt$pkg.obten_var_page(17156, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P0_RECHR_GLOBL' and ref_page = sie$migrt$pkg.obten_var_page(17156, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_CODE_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(17158, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_MOT_PASSE' and ref_page = sie$migrt$pkg.obten_var_page(17158, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_LOGIN' and ref_page = sie$migrt$pkg.obten_var_page(17158, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(17158, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_LANG' and ref_page = sie$migrt$pkg.obten_var_page(17158, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_FORCE_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(17158, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_APPLICATION_ID' and ref_page = sie$migrt$pkg.obten_var_page(17159, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_PAGE_ID' and ref_page = sie$migrt$pkg.obten_var_page(17159, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_A' and ref_page = sie$migrt$pkg.obten_var_page(17159, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_FEEDBACK' and ref_page = sie$migrt$pkg.obten_var_page(17159, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_X' and ref_page = sie$migrt$pkg.obten_var_page(17159, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_FEEDBACK_TYPE' and ref_page = sie$migrt$pkg.obten_var_page(17159, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_Y' and ref_page = sie$migrt$pkg.obten_var_page(17159, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SUBMIT' and ref_page = sie$migrt$pkg.obten_var_page(17159, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12010_LIBL_CONTX' and ref_page = sie$migrt$pkg.obten_var_page(17160, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12010_CONTX' and ref_page = sie$migrt$pkg.obten_var_page(17160, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17160, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12020_COURL' and ref_page = sie$migrt$pkg.obten_var_page(17161, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12020_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17161, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12020_NOM' and ref_page = sie$migrt$pkg.obten_var_page(17161, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12020_PRENM' and ref_page = sie$migrt$pkg.obten_var_page(17161, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12020_CODE_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(17161, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12020_DATE_EXPIR' and ref_page = sie$migrt$pkg.obten_var_page(17161, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12020_INDIC_VERL' and ref_page = sie$migrt$pkg.obten_var_page(17161, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12020_INDIC_CHANG_MOT_PASSE' and ref_page = sie$migrt$pkg.obten_var_page(17161, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12020_INDIC_ACTIF' and ref_page = sie$migrt$pkg.obten_var_page(17161, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12020_GROUP_DROIT' and ref_page = sie$migrt$pkg.obten_var_page(17161, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12020_GROUP_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(17161, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(17161, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17161, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17161, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE_ADD' and ref_page = sie$migrt$pkg.obten_var_page(17161, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(17161, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12030_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17163, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12030_NOUV_MOT_PASSE' and ref_page = sie$migrt$pkg.obten_var_page(17163, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12030_CONFR_MOT_PASSE' and ref_page = sie$migrt$pkg.obten_var_page(17163, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DEFNR' and ref_page = sie$migrt$pkg.obten_var_page(17163, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12121_CONTX' and ref_page = sie$migrt$pkg.obten_var_page(17164, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17164, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12131_NOM' and ref_page = sie$migrt$pkg.obten_var_page(17165, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12131_DESCR' and ref_page = sie$migrt$pkg.obten_var_page(17165, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12131_CODE' and ref_page = sie$migrt$pkg.obten_var_page(17165, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12131_INDIC_IGNOR_GROUP_ADMIN' and ref_page = sie$migrt$pkg.obten_var_page(17165, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12131_MODE' and ref_page = sie$migrt$pkg.obten_var_page(17165, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12131_REF_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(17165, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'MULTI_ROW_DELETE' and ref_page = sie$migrt$pkg.obten_var_page(17165, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'ADD' and ref_page = sie$migrt$pkg.obten_var_page(17165, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17165, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17165, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(17165, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'LISTR_GROUP' and ref_page = sie$migrt$pkg.obten_var_page(17165, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'LISTR_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(17165, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'LISTR_DROIT' and ref_page = sie$migrt$pkg.obten_var_page(17165, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'EDITR_GROUP' and ref_page = sie$migrt$pkg.obten_var_page(17165, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'EDITR_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(17165, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'EDITR_DROIT' and ref_page = sie$migrt$pkg.obten_var_page(17165, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12141_CONTX' and ref_page = sie$migrt$pkg.obten_var_page(17166, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17166, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12151_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17167, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12151_NOM' and ref_page = sie$migrt$pkg.obten_var_page(17167, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12151_CONTX' and ref_page = sie$migrt$pkg.obten_var_page(17167, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12151_STRUC_LIE' and ref_page = sie$migrt$pkg.obten_var_page(17167, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12151_REF_TYPE_STRUC' and ref_page = sie$migrt$pkg.obten_var_page(17167, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12151_REF_RESPN' and ref_page = sie$migrt$pkg.obten_var_page(17167, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12151_DEBUT_EFECT' and ref_page = sie$migrt$pkg.obten_var_page(17167, 'Select');
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
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12151_FIN_EFECT' and ref_page = sie$migrt$pkg.obten_var_page(17167, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12151_INDIC_DEFT' and ref_page = sie$migrt$pkg.obten_var_page(17167, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(17167, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17167, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17167, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(17167, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12181_STRUC_ADMIN' and ref_page = sie$migrt$pkg.obten_var_page(17168, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12181_MEMBR_STRUC' and ref_page = sie$migrt$pkg.obten_var_page(17168, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12181_CONTX' and ref_page = sie$migrt$pkg.obten_var_page(17168, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(17168, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17168, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREER' and ref_page = sie$migrt$pkg.obten_var_page(17169, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12210_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17170, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12210_CODE' and ref_page = sie$migrt$pkg.obten_var_page(17170, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12210_NOM' and ref_page = sie$migrt$pkg.obten_var_page(17170, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12210_DESCR' and ref_page = sie$migrt$pkg.obten_var_page(17170, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12210_REF_COMPT_AXIAT_DEFT' and ref_page = sie$migrt$pkg.obten_var_page(17170, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12210_REF_PROFL_COURL_NOTFC' and ref_page = sie$migrt$pkg.obten_var_page(17170, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12210_REF_PROFL_SMS_NOTFC' and ref_page = sie$migrt$pkg.obten_var_page(17170, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(17170, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12210_PROCD_AUTHE_EXTER_AFW' and ref_page = sie$migrt$pkg.obten_var_page(17170, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12210_MODE' and ref_page = sie$migrt$pkg.obten_var_page(17170, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17170, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17170, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(17170, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17172, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12336_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17173, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12336_CODE' and ref_page = sie$migrt$pkg.obten_var_page(17173, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12336_NOM' and ref_page = sie$migrt$pkg.obten_var_page(17173, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12336_DESCR' and ref_page = sie$migrt$pkg.obten_var_page(17173, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12336_REF_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(17173, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(17173, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17173, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17173, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(17173, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P13053_TYPE_DEFNT_ACCES' and ref_page = sie$migrt$pkg.obten_var_page(17174, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17174, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREER' and ref_page = sie$migrt$pkg.obten_var_page(17175, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P19030_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17176, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P19030_REF_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(17176, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P19030_CODE' and ref_page = sie$migrt$pkg.obten_var_page(17176, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P19030_NOM' and ref_page = sie$migrt$pkg.obten_var_page(17176, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P19030_DESCR' and ref_page = sie$migrt$pkg.obten_var_page(17176, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P19030_REF_PRODT' and ref_page = sie$migrt$pkg.obten_var_page(17176, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P19030_DNR_REF_PRODT' and ref_page = sie$migrt$pkg.obten_var_page(17176, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17176, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(17176, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17176, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CRÉER' and ref_page = sie$migrt$pkg.obten_var_page(17176, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(17176, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P19040_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17177, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P19040_REF_MODL_RECHR' and ref_page = sie$migrt$pkg.obten_var_page(17177, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P19040_REF_STRUC_APLIC_RECHR' and ref_page = sie$migrt$pkg.obten_var_page(17177, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P19040_REF_STRUC_APLIC_LIEN' and ref_page = sie$migrt$pkg.obten_var_page(17177, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P19040_REF_ATRIB_STRUC_APLIC_AFICH' and ref_page = sie$migrt$pkg.obten_var_page(17177, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P19040_NOMBR_MAXIM_RESLT' and ref_page = sie$migrt$pkg.obten_var_page(17177, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17177, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(17177, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17177, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE1' and ref_page = sie$migrt$pkg.obten_var_page(17177, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(17177, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P19041_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17178, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P19041_REF_APLIC_MODL_RECHR' and ref_page = sie$migrt$pkg.obten_var_page(17178, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P19041_REF_ATRIB_STRUC_APLIC' and ref_page = sie$migrt$pkg.obten_var_page(17178, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P19041_REF_PATRN_RECHR' and ref_page = sie$migrt$pkg.obten_var_page(17178, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P19041_ORDRE_EXECT' and ref_page = sie$migrt$pkg.obten_var_page(17178, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P19041_PERTN' and ref_page = sie$migrt$pkg.obten_var_page(17178, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17178, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(17178, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17178, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17179, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20010_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17180, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20010_SERVR_SORTN' and ref_page = sie$migrt$pkg.obten_var_page(17180, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20010_PORT_SORTN' and ref_page = sie$migrt$pkg.obten_var_page(17180, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20010_NOM_ENVOY' and ref_page = sie$migrt$pkg.obten_var_page(17180, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20010_AUTHE_METHD_SORTN' and ref_page = sie$migrt$pkg.obten_var_page(17180, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20010_AUTHE_USAGR_SORTN' and ref_page = sie$migrt$pkg.obten_var_page(17180, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20010_AUTHE_MDP_SORTN' and ref_page = sie$migrt$pkg.obten_var_page(17180, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20010_CODE' and ref_page = sie$migrt$pkg.obten_var_page(17180, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20010_NOM' and ref_page = sie$migrt$pkg.obten_var_page(17180, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20010_SERVR_ENTRA' and ref_page = sie$migrt$pkg.obten_var_page(17180, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20010_PORT_ENTRA' and ref_page = sie$migrt$pkg.obten_var_page(17180, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20010_AUTHE_METHD_ENTRA' and ref_page = sie$migrt$pkg.obten_var_page(17180, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20010_AUTHE_USAGR_ENTRA' and ref_page = sie$migrt$pkg.obten_var_page(17180, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20010_AUTHE_MDP_ENTRA' and ref_page = sie$migrt$pkg.obten_var_page(17180, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20010_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(17180, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(17180, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17180, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17180, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(17180, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20030_INDIC_FORMT_HTML' and ref_page = sie$migrt$pkg.obten_var_page(17182, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20030_CORPS' and ref_page = sie$migrt$pkg.obten_var_page(17182, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20030_NOMBR_TENTV' and ref_page = sie$migrt$pkg.obten_var_page(17182, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20030_NOMBR_TENTV_MAX' and ref_page = sie$migrt$pkg.obten_var_page(17182, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20030_SENS' and ref_page = sie$migrt$pkg.obten_var_page(17182, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20030_STAT_SOUMS' and ref_page = sie$migrt$pkg.obten_var_page(17182, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20030_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17182, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20030_SERVR' and ref_page = sie$migrt$pkg.obten_var_page(17182, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20030_PORT' and ref_page = sie$migrt$pkg.obten_var_page(17182, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20030_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(17182, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20030_NOM_ENVOY' and ref_page = sie$migrt$pkg.obten_var_page(17182, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20030_ADRES_ENVOY' and ref_page = sie$migrt$pkg.obten_var_page(17182, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20030_SUJET' and ref_page = sie$migrt$pkg.obten_var_page(17182, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(17182, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17182, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17183, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P21010_CODE' and ref_page = sie$migrt$pkg.obten_var_page(17184, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P21010_NOM' and ref_page = sie$migrt$pkg.obten_var_page(17184, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P21010_DESCR' and ref_page = sie$migrt$pkg.obten_var_page(17184, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P21010_REF_PRODT' and ref_page = sie$migrt$pkg.obten_var_page(17184, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P21010_REF_PROFL_COURL' and ref_page = sie$migrt$pkg.obten_var_page(17184, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P21010_INDIC_AVERT_AUTR_UNIQ' and ref_page = sie$migrt$pkg.obten_var_page(17184, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P21010_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(17184, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P21010_GROUP_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(17184, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P21010_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17184, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(17184, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17184, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17184, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(17184, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P30010_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17185, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P30020_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17186, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P30030_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17187, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P30040_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17188, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P30050_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17189, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREAT' and ref_page = sie$migrt$pkg.obten_var_page(17190, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34100_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17191, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34100_CODE' and ref_page = sie$migrt$pkg.obten_var_page(17191, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34100_NOM' and ref_page = sie$migrt$pkg.obten_var_page(17191, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34100_DESCR' and ref_page = sie$migrt$pkg.obten_var_page(17191, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34100_COULR_TEXTE' and ref_page = sie$migrt$pkg.obten_var_page(17191, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34100_TAIL_TEXTE' and ref_page = sie$migrt$pkg.obten_var_page(17191, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34100_COULR_TITRE' and ref_page = sie$migrt$pkg.obten_var_page(17191, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34100_TAIL_TITRE' and ref_page = sie$migrt$pkg.obten_var_page(17191, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34100_TEMPS_AFICH' and ref_page = sie$migrt$pkg.obten_var_page(17191, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34100_REF_RESRC_ICON' and ref_page = sie$migrt$pkg.obten_var_page(17191, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34100_REF_OCURN_RESRC_ICON' and ref_page = sie$migrt$pkg.obten_var_page(17191, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34100_REF_TYPE_COMNC' and ref_page = sie$migrt$pkg.obten_var_page(17191, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34100_SEQNC_TYPE_COMNC_ECRAN' and ref_page = sie$migrt$pkg.obten_var_page(17191, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34100_REF_MODL_COMNC' and ref_page = sie$migrt$pkg.obten_var_page(17191, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(17191, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17191, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(17191, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CRÉER' and ref_page = sie$migrt$pkg.obten_var_page(17192, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34210_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17193, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34210_NOM' and ref_page = sie$migrt$pkg.obten_var_page(17193, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34210_REF_EVENM_NOTFB' and ref_page = sie$migrt$pkg.obten_var_page(17193, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(17193, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17193, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17193, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREAT' and ref_page = sie$migrt$pkg.obten_var_page(17194, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CRÉER' and ref_page = sie$migrt$pkg.obten_var_page(17195, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34310_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17196, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34310_CODE' and ref_page = sie$migrt$pkg.obten_var_page(17196, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34310_NOM' and ref_page = sie$migrt$pkg.obten_var_page(17196, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34310_OBJET' and ref_page = sie$migrt$pkg.obten_var_page(17196, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34310_REF_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(17196, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(17196, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17196, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17196, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(17196, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREAT' and ref_page = sie$migrt$pkg.obten_var_page(17197, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34500_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17198, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34500_CODE' and ref_page = sie$migrt$pkg.obten_var_page(17198, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34500_NOM' and ref_page = sie$migrt$pkg.obten_var_page(17198, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34500_DESCR' and ref_page = sie$migrt$pkg.obten_var_page(17198, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34500_REF_TYPE_COMNC' and ref_page = sie$migrt$pkg.obten_var_page(17198, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34500_INDIC_SYSTM' and ref_page = sie$migrt$pkg.obten_var_page(17198, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17198, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'ADD' and ref_page = sie$migrt$pkg.obten_var_page(17198, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(17198, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17198, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(17198, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'MULTI_ROW_DELETE' and ref_page = sie$migrt$pkg.obten_var_page(17198, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREER' and ref_page = sie$migrt$pkg.obten_var_page(17201, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34710_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17202, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34710_CODE' and ref_page = sie$migrt$pkg.obten_var_page(17202, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34710_NOM' and ref_page = sie$migrt$pkg.obten_var_page(17202, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34710_DESCR' and ref_page = sie$migrt$pkg.obten_var_page(17202, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34710_NUMR' and ref_page = sie$migrt$pkg.obten_var_page(17202, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34710_REF_PROFL_COURL' and ref_page = sie$migrt$pkg.obten_var_page(17202, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34710_REF_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(17202, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34710_REF_PUBLC_PAGE_GARDE' and ref_page = sie$migrt$pkg.obten_var_page(17202, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(17202, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17202, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17202, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(17202, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34810_CODE' and ref_page = sie$migrt$pkg.obten_var_page(17204, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34810_NOM' and ref_page = sie$migrt$pkg.obten_var_page(17204, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34810_DESCR' and ref_page = sie$migrt$pkg.obten_var_page(17204, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34810_REF_STRUC_APLIC' and ref_page = sie$migrt$pkg.obten_var_page(17204, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34810_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17204, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17204, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREAT_CONFG' and ref_page = sie$migrt$pkg.obten_var_page(17204, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34820_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17205, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34820_REF_TYPE_COMNC' and ref_page = sie$migrt$pkg.obten_var_page(17205, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34820_OBJET' and ref_page = sie$migrt$pkg.obten_var_page(17205, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34820_MESG' and ref_page = sie$migrt$pkg.obten_var_page(17205, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34820_REF_EVENM_NOTFB' and ref_page = sie$migrt$pkg.obten_var_page(17205, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34820_NOM' and ref_page = sie$migrt$pkg.obten_var_page(17205, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34820_DESCR' and ref_page = sie$migrt$pkg.obten_var_page(17205, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34820_MESG_SMS' and ref_page = sie$migrt$pkg.obten_var_page(17205, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34820_SEQNC_TYPE_COURL' and ref_page = sie$migrt$pkg.obten_var_page(17205, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34820_SEQNC_TYPE_SMS' and ref_page = sie$migrt$pkg.obten_var_page(17205, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34820_REF_COMPT_COURL' and ref_page = sie$migrt$pkg.obten_var_page(17205, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34820_REF_COMPT_TWILI' and ref_page = sie$migrt$pkg.obten_var_page(17205, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34820_MODE' and ref_page = sie$migrt$pkg.obten_var_page(17205, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34820_RESLT_DESTN' and ref_page = sie$migrt$pkg.obten_var_page(17205, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34820_CHAMP_NOM_FORMT' and ref_page = sie$migrt$pkg.obten_var_page(17205, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34820_CHAMP_ADRES_COURL' and ref_page = sie$migrt$pkg.obten_var_page(17205, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34820_CHAMP_NUMR_SMS' and ref_page = sie$migrt$pkg.obten_var_page(17205, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34820_REF_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(17205, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'AJOUT_DESTN' and ref_page = sie$migrt$pkg.obten_var_page(17205, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34820_STRUC_APLIC' and ref_page = sie$migrt$pkg.obten_var_page(17205, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34820_INDIC_DEFT' and ref_page = sie$migrt$pkg.obten_var_page(17205, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(17205, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17205, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(17205, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SUPRM_ELEMN_CONFIG' and ref_page = sie$migrt$pkg.obten_var_page(17205, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SUPRM_DESTN_CONFG' and ref_page = sie$migrt$pkg.obten_var_page(17205, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREAT_ELEMN_CONFIG' and ref_page = sie$migrt$pkg.obten_var_page(17205, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'AFICH_ELEMN_SUBST_MESG' and ref_page = sie$migrt$pkg.obten_var_page(17205, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34830_RESLT_4' and ref_page = sie$migrt$pkg.obten_var_page(17206, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34830_RESLT_5' and ref_page = sie$migrt$pkg.obten_var_page(17206, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34830_RESLT_6' and ref_page = sie$migrt$pkg.obten_var_page(17206, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34830_CHAMP_1' and ref_page = sie$migrt$pkg.obten_var_page(17206, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34830_AFICH_RESLT_1' and ref_page = sie$migrt$pkg.obten_var_page(17206, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34830_RESLT_3' and ref_page = sie$migrt$pkg.obten_var_page(17206, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34830_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17206, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17206, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34830_REF_CONFG_EVENM_NOTFB' and ref_page = sie$migrt$pkg.obten_var_page(17206, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34830_CODE' and ref_page = sie$migrt$pkg.obten_var_page(17206, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34830_IDENT_ACCES' and ref_page = sie$migrt$pkg.obten_var_page(17206, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34830_IDENT_ACCES_FORMT' and ref_page = sie$migrt$pkg.obten_var_page(17206, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34830_RESLT_1' and ref_page = sie$migrt$pkg.obten_var_page(17206, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34830_ELEMN_SUBST_MESG' and ref_page = sie$migrt$pkg.obten_var_page(17206, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17206, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34840_RESLT_6' and ref_page = sie$migrt$pkg.obten_var_page(17207, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34840_RESLT_3' and ref_page = sie$migrt$pkg.obten_var_page(17207, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34840_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17207, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34840_REF_CONFG_EVENM_NOTFB' and ref_page = sie$migrt$pkg.obten_var_page(17207, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34840_IDENT_ACCES' and ref_page = sie$migrt$pkg.obten_var_page(17207, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34840_IDENT_ACCES_FORMT' and ref_page = sie$migrt$pkg.obten_var_page(17207, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34840_RESLT_1' and ref_page = sie$migrt$pkg.obten_var_page(17207, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34840_AFICH_RESLT_1' and ref_page = sie$migrt$pkg.obten_var_page(17207, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34840_CHAMP_1' and ref_page = sie$migrt$pkg.obten_var_page(17207, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34840_ELEMN_SUBST_MESG' and ref_page = sie$migrt$pkg.obten_var_page(17207, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34840_CODE' and ref_page = sie$migrt$pkg.obten_var_page(17207, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34840_RESLT_2' and ref_page = sie$migrt$pkg.obten_var_page(17207, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34840_RESLT_4' and ref_page = sie$migrt$pkg.obten_var_page(17207, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34840_RESLT_5' and ref_page = sie$migrt$pkg.obten_var_page(17207, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17207, 'Select');
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
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17207, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(17178, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20010_ADRES_ENVOY' and ref_page = sie$migrt$pkg.obten_var_page(17180, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20010_DESCR' and ref_page = sie$migrt$pkg.obten_var_page(17180, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P20010_REF_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(17180, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12210_PROCD_VALD_NIV_SECRT_MP' and ref_page = sie$migrt$pkg.obten_var_page(17170, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34100_REF_FORMT_RESRC_ICON' and ref_page = sie$migrt$pkg.obten_var_page(17191, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17191, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34210_CODE' and ref_page = sie$migrt$pkg.obten_var_page(17193, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(17193, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34310_DESCR' and ref_page = sie$migrt$pkg.obten_var_page(17196, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34820_SEQNC_TYPE_ECRAN' and ref_page = sie$migrt$pkg.obten_var_page(17205, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34820_CHAMP_NATR_COURL' and ref_page = sie$migrt$pkg.obten_var_page(17205, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17205, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREAT_DESTN_CONFIG' and ref_page = sie$migrt$pkg.obten_var_page(17205, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P34830_RESLT_2' and ref_page = sie$migrt$pkg.obten_var_page(17206, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12020_MOT_PASSE' and ref_page = sie$migrt$pkg.obten_var_page(17161, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17163, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12131_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17165, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(17165, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12020_MESG_AUTOR_CONXN_DERV' and ref_page = sie$migrt$pkg.obten_var_page(17161, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12131_INDIC_ACCES_GLOBL' and ref_page = sie$migrt$pkg.obten_var_page(17165, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12020_CODE_UTILS_BASE_DON' and ref_page = sie$migrt$pkg.obten_var_page(17161, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12020_MESG_SUPER_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(17161, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35042_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(18055, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35042_REF_FONCT' and ref_page = sie$migrt$pkg.obten_var_page(18055, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35042_REF_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(18055, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35042_INDIC_ACTIF' and ref_page = sie$migrt$pkg.obten_var_page(18055, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(18055, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(18055, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(18055, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(18055, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12220_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(18057, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12220_REF_GROUP_UTILS_FORMT' and ref_page = sie$migrt$pkg.obten_var_page(18057, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12220_REF_OPERT' and ref_page = sie$migrt$pkg.obten_var_page(18057, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12220_REF_OPERT_OPTIO' and ref_page = sie$migrt$pkg.obten_var_page(18057, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12220_REF_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(18057, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12220_REF_OPERT_FORMT' and ref_page = sie$migrt$pkg.obten_var_page(18057, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(18057, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(18057, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(18058, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17157, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1_NOM' and ref_page = sie$migrt$pkg.obten_var_page(17157, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1_CODE' and ref_page = sie$migrt$pkg.obten_var_page(17157, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'EDITR' and ref_page = sie$migrt$pkg.obten_var_page(17157, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35011_INDIC_REPNS_OBLIG' and ref_page = sie$migrt$pkg.obten_var_page(17939, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35011_NOM' and ref_page = sie$migrt$pkg.obten_var_page(17939, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35011_INDIC_INTER' and ref_page = sie$migrt$pkg.obten_var_page(17939, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35011_REF_DV_TYPE_DON_SAIS' and ref_page = sie$migrt$pkg.obten_var_page(17939, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35011_INDIC_REPNS_MULTP' and ref_page = sie$migrt$pkg.obten_var_page(17939, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35011_NOMBR_MINM_OCURN_INTER' and ref_page = sie$migrt$pkg.obten_var_page(17939, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35011_NOMBR_MAXM_OCURN_INTER' and ref_page = sie$migrt$pkg.obten_var_page(17939, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35011_REF_DV_MASQ_FORMT_AUTRE' and ref_page = sie$migrt$pkg.obten_var_page(17939, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35011_REF_DV_TYPE_CHAMP_REPNS' and ref_page = sie$migrt$pkg.obten_var_page(17939, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35011_NOMBR_CARCT_REPNS' and ref_page = sie$migrt$pkg.obten_var_page(17939, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35011_REF_DV_MASQ_FORMT_REPNS' and ref_page = sie$migrt$pkg.obten_var_page(17939, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35011_LARGR_REPNS' and ref_page = sie$migrt$pkg.obten_var_page(17939, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35011_NOMBR_COLN_REPNS' and ref_page = sie$migrt$pkg.obten_var_page(17939, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35011_NOMBR_RANGE_REPNS' and ref_page = sie$migrt$pkg.obten_var_page(17939, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35011_INDIC_AUTRE' and ref_page = sie$migrt$pkg.obten_var_page(17939, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35011_REF_DV_TYPE_CHAMP_AUTRE' and ref_page = sie$migrt$pkg.obten_var_page(17939, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35011_NOMBR_CARCT_AUTRE' and ref_page = sie$migrt$pkg.obten_var_page(17939, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35011_LARGR_AUTRE' and ref_page = sie$migrt$pkg.obten_var_page(17939, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35011_NOMBR_COLN_AUTRE' and ref_page = sie$migrt$pkg.obten_var_page(17939, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35011_NOMBR_RANGE_AUTRE' and ref_page = sie$migrt$pkg.obten_var_page(17939, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P35011_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17939, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(17939, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17939, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17939, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(17939, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'LIER' and ref_page = sie$migrt$pkg.obten_var_page(17160, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12011_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17937, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12011_REF_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(17937, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12011_REF_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(17937, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12011_DATE_DEBUT_EFECT' and ref_page = sie$migrt$pkg.obten_var_page(17937, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12011_DATE_FIN_EFECT' and ref_page = sie$migrt$pkg.obten_var_page(17937, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17937, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17938, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P12151_REF_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(17167, 'Select');
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
                           ref_aplic_authe = sie$migrt$pkg.obten_var_aplic(187, 'Update'),
                           ref_page_conxn = sie$migrt$pkg.obten_var_page(17158, 'Update')
                     where seqnc = sie$migrt$pkg.obten_var_aplic(188);
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_11_aplic');
end;
/
begin
  if sie$migrt$pkg.vnu_sql_code = 0 then
    dbms_output.put_line ('Mise a jour du referentiel pour application : SAFD - SIE APEX Framework - Domaine');
    sie_13_page_pkg.maj_table_a_partr_refrt_apex(sie$migrt$pkg.var_aplic(188),'O');
  end if;
end;
/

