set define off
set serveroutput on
set feedback off

alter session set current_schema = afw_040215;


begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut - Initialisation - Application - SAFM');
  sie$migrt$pkg.var_aplic(190) := sie_11_aplic_pkg.maj_aplic ('SAFM','SIE APEX Framework - Méthodologie',1000006, sie$migrt$pkg.vnu_seqnc_prodt);

  sie_13_page_pkg.maj_table_a_partr_refrt_apex(sie$migrt$pkg.var_aplic(190),'O');
null;
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Fin - Initialisation - Application - SAFM');
end;
/


--Debut - sie_11_versn
begin
if sie$migrt$pkg.vnu_sql_code = 0 then
sie_03_journ_pkg.ecrir_journ('Debut - sie_11_versn');
delete from tc$11$versn;

insert into tc$11$versn (code, dnr_ref_aplic, dnr_ref_prodt, indic_docmn_verl, nom, numr_versn_1, numr_versn_2, numr_versn_3, numr_versn_4, ref_aplic, ref_plugn, ref_prodt, seqnc) values ('0100', sie$migrt$pkg.obten_var_aplic(190, 'Insert'), null, 'O', null, 0, 1, 0, 0, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), null, null, 223);

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

select seqnc into sie$migrt$pkg.var_versn(223) from sie_11_versn where code = '0100' and ref_aplic = sie$migrt$pkg.obten_var_aplic(190, 'Select') and ref_plugn is null and ref_prodt is null;
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

insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:06', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Page commune', 0, null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 17213);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:06', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Accueil', 1, null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 17214);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:06', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Page de connexion', 101, null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 17215);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:06', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Commentaire', 102, null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 17216);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:06', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Liste des produits', 1001, null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 17217);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:06', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Rôle utilisateur', 1043, null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 17969);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:06', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Rôles', 1041, null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 17970);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:06', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Disponibilités', 1031, null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 17971);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:06', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Équipes', 1011, null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 17972);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:06', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Planification', 2, null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 17973);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:06', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Jalons', 1021, null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 17974);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:06', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Tâches', 1051, null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 17975);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:06', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Équipe jalon', 1023, null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 17976);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:06', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Disponibilité', 1032, null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 17977);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:06', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Équipe', 1012, null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 17978);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:06', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Affectations', 1053, null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 17979);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:06', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Lien équipe', 1013, null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 17980);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:06', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Rôle', 1042, null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 17981);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:06', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Jalon', 1022, null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 17982);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:06', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Tâche', 1052, null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 17983);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:06', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Planification efforts', 1054, null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 18059);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:06', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Consulter une tâche', 1056, null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 18060);
insert into tc$13$page (date_dernr_maj_refrn_apex, descr, dnr_ref_aplic, indic_prise_charg_sie01, indic_prise_charg_sie04, indic_prise_charg_sie13_confr, indic_prise_charg_sie13_navgt, indic_prise_charg_sie14_popup, indic_prise_charg_sie18, indic_prise_charg_sie19, nom, numr_apex, prefx_mesg, ref_aplic, seqnc) values (to_date('2013-12-18 22:14:06', 'YYYY-MM-DD HH24:MI:SS'), null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 'O', 'O', 'N', 'O', 'N', 'N', 'O', 'Mes tâches', 1055, null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 18061);

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

select seqnc into sie$migrt$pkg.var_page(17213) from sie_13_page where numr_apex = 0 and ref_aplic = sie$migrt$pkg.obten_var_aplic(190, 'Select');
select seqnc into sie$migrt$pkg.var_page(17214) from sie_13_page where numr_apex = 1 and ref_aplic = sie$migrt$pkg.obten_var_aplic(190, 'Select');
select seqnc into sie$migrt$pkg.var_page(17215) from sie_13_page where numr_apex = 101 and ref_aplic = sie$migrt$pkg.obten_var_aplic(190, 'Select');
select seqnc into sie$migrt$pkg.var_page(17216) from sie_13_page where numr_apex = 102 and ref_aplic = sie$migrt$pkg.obten_var_aplic(190, 'Select');
select seqnc into sie$migrt$pkg.var_page(17217) from sie_13_page where numr_apex = 1001 and ref_aplic = sie$migrt$pkg.obten_var_aplic(190, 'Select');
select seqnc into sie$migrt$pkg.var_page(17969) from sie_13_page where numr_apex = 1043 and ref_aplic = sie$migrt$pkg.obten_var_aplic(190, 'Select');
select seqnc into sie$migrt$pkg.var_page(17970) from sie_13_page where numr_apex = 1041 and ref_aplic = sie$migrt$pkg.obten_var_aplic(190, 'Select');
select seqnc into sie$migrt$pkg.var_page(17971) from sie_13_page where numr_apex = 1031 and ref_aplic = sie$migrt$pkg.obten_var_aplic(190, 'Select');
select seqnc into sie$migrt$pkg.var_page(17972) from sie_13_page where numr_apex = 1011 and ref_aplic = sie$migrt$pkg.obten_var_aplic(190, 'Select');
select seqnc into sie$migrt$pkg.var_page(17973) from sie_13_page where numr_apex = 2 and ref_aplic = sie$migrt$pkg.obten_var_aplic(190, 'Select');
select seqnc into sie$migrt$pkg.var_page(17974) from sie_13_page where numr_apex = 1021 and ref_aplic = sie$migrt$pkg.obten_var_aplic(190, 'Select');
select seqnc into sie$migrt$pkg.var_page(17975) from sie_13_page where numr_apex = 1051 and ref_aplic = sie$migrt$pkg.obten_var_aplic(190, 'Select');
select seqnc into sie$migrt$pkg.var_page(17976) from sie_13_page where numr_apex = 1023 and ref_aplic = sie$migrt$pkg.obten_var_aplic(190, 'Select');
select seqnc into sie$migrt$pkg.var_page(17977) from sie_13_page where numr_apex = 1032 and ref_aplic = sie$migrt$pkg.obten_var_aplic(190, 'Select');
select seqnc into sie$migrt$pkg.var_page(17978) from sie_13_page where numr_apex = 1012 and ref_aplic = sie$migrt$pkg.obten_var_aplic(190, 'Select');
select seqnc into sie$migrt$pkg.var_page(17979) from sie_13_page where numr_apex = 1053 and ref_aplic = sie$migrt$pkg.obten_var_aplic(190, 'Select');
select seqnc into sie$migrt$pkg.var_page(17980) from sie_13_page where numr_apex = 1013 and ref_aplic = sie$migrt$pkg.obten_var_aplic(190, 'Select');
select seqnc into sie$migrt$pkg.var_page(17981) from sie_13_page where numr_apex = 1042 and ref_aplic = sie$migrt$pkg.obten_var_aplic(190, 'Select');
select seqnc into sie$migrt$pkg.var_page(17982) from sie_13_page where numr_apex = 1022 and ref_aplic = sie$migrt$pkg.obten_var_aplic(190, 'Select');
select seqnc into sie$migrt$pkg.var_page(17983) from sie_13_page where numr_apex = 1052 and ref_aplic = sie$migrt$pkg.obten_var_aplic(190, 'Select');
select seqnc into sie$migrt$pkg.var_page(18059) from sie_13_page where numr_apex = 1054 and ref_aplic = sie$migrt$pkg.obten_var_aplic(190, 'Select');
select seqnc into sie$migrt$pkg.var_page(18060) from sie_13_page where numr_apex = 1056 and ref_aplic = sie$migrt$pkg.obten_var_aplic(190, 'Select');
select seqnc into sie$migrt$pkg.var_page(18061) from sie_13_page where numr_apex = 1055 and ref_aplic = sie$migrt$pkg.obten_var_aplic(190, 'Select');
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

insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 'Page commune', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17213, 'Insert'), 13898);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 'Méthodologie', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17214, 'Insert'), 13899);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 'Page de connexion', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17215, 'Insert'), 13900);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 'Commentaire', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17216, 'Insert'), 13901);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 'Produits', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17217, 'Insert'), 13902);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 'Rôle utilisateur', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17969, 'Insert'), 14652);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 'Rôles', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17970, 'Insert'), 14653);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 'Disponibilités', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17971, 'Insert'), 14654);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 'Équipes', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17972, 'Insert'), 14655);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 'Planification', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17973, 'Insert'), 14656);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 'Jalons', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17974, 'Insert'), 14657);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 'Tâches', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17975, 'Insert'), 14658);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 'Équipe', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17976, 'Insert'), 14659);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 'Disponibilité', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17977, 'Insert'), 14660);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 'Équipe', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17978, 'Insert'), 14661);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 'Effort', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17979, 'Insert'), 14662);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 'Membre', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17980, 'Insert'), 14663);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 'Rôle', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17981, 'Insert'), 14664);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 'Jalon', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17982, 'Insert'), 14665);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 'Tâche', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(17983, 'Insert'), 14666);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 'Mes tâches', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(18061, 'Insert'), 14742);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 'Consulter une tâche', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(18060, 'Insert'), 14743);
insert into tc$13$page$lang (dnr_ref_aplic, nom, ref_lang, ref_page, seqnc) values (sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 'Affectations', sie$migrt$pkg.obten_var_lang(61, 'Insert'), sie$migrt$pkg.obten_var_page(18059, 'Insert'), 14744);

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

select seqnc into sie$migrt$pkg.var_page_lang(13898) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17213, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(13899) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17214, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(13900) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17215, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(13901) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17216, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(13902) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17217, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(14652) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17969, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(14653) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17970, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(14654) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17971, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(14655) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17972, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(14656) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17973, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(14657) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17974, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(14658) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17975, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(14659) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17976, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(14660) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17977, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(14661) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17978, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(14662) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17979, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(14663) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17980, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(14664) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17981, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(14665) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17982, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(14666) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(17983, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(14742) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(18061, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(14743) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(18060, 'Select');
select seqnc into sie$migrt$pkg.var_page_lang(14744) from sie_13_page_lang where ref_lang = sie$migrt$pkg.obten_var_lang(61, 'Select') and ref_page = sie$migrt$pkg.obten_var_page(18059, 'Select');
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

insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 'N', null, 'Liste des produits', 1, sie$migrt$pkg.obten_var_page(17217, 'Insert'), 7051, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 'N', null, 'Affectation', 1, sie$migrt$pkg.obten_var_page(17981, 'Insert'), 7370, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 'N', null, 'Équipes', 1, sie$migrt$pkg.obten_var_page(17972, 'Insert'), 7371, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 'N', null, 'Jalons', 1, sie$migrt$pkg.obten_var_page(17974, 'Insert'), 7372, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 'N', null, 'Membres', 1, sie$migrt$pkg.obten_var_page(17978, 'Insert'), 7374, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 'N', null, 'Disponibilités utilisateurs', 1, sie$migrt$pkg.obten_var_page(17971, 'Insert'), 7375, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 'N', null, 'Rôles', 1, sie$migrt$pkg.obten_var_page(17970, 'Insert'), 7376, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 'N', null, 'Équipes', 1, sie$migrt$pkg.obten_var_page(17982, 'Insert'), 7377, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 'N', null, 'Tâches', 1, sie$migrt$pkg.obten_var_page(17975, 'Insert'), 7378, null);
insert into tc$13$page$ir (dnr_ref_aplic, indic_forcr_ajust_page, largr_deft, libl_regn, nombr_page_largr, ref_page, seqnc, unite_mesr_largr_deft) values (sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 'N', null, 'Mes tâches', 1, sie$migrt$pkg.obten_var_page(18061, 'Insert'), 7428, null);
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
select seqnc into sie$migrt$pkg.var_page_ir(7051) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(17217, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(7370) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(17981, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(7371) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(17972, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(7372) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(17974, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(7374) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(17978, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(7375) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(17971, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(7376) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(17970, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(7377) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(17982, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(7378) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(17975, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir(7428) from sie_13_page_ir where ref_page = sie$migrt$pkg.obten_var_page(18061, 'Select');
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

insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456630419351618337, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(7051, 'Insert'), 58138, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456675448652875891, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(7374, 'Insert'), 61494, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_EQUIP', sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456675531745875891, 'O', null, 'Équipe', 2, sie$migrt$pkg.obten_var_page_ir(7374, 'Insert'), 61495, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_UTILS', sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456675643324875892, 'O', null, 'Utilisateur', 3, sie$migrt$pkg.obten_var_page_ir(7374, 'Insert'), 61496, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DEBUT_EFECT', sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456675735863875892, 'O', null, 'Début effectivité', 4, sie$migrt$pkg.obten_var_page_ir(7374, 'Insert'), 61497, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('FIN_EFECT', sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456675819768875892, 'O', null, 'Fin effectivité', 5, sie$migrt$pkg.obten_var_page_ir(7374, 'Insert'), 61498, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('POURC_IMPLI_EQUIP', sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456675950708875892, 'O', null, 'Pourcentage', 6, sie$migrt$pkg.obten_var_page_ir(7374, 'Insert'), 61499, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_UTILS_FORMT', sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456713934433037159, 'O', null, 'Utilisateur', 7, sie$migrt$pkg.obten_var_page_ir(7374, 'Insert'), 61500, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456766239635401708, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(7375, 'Insert'), 61501, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_UTILS_FORMT', sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456766344688401710, 'O', null, 'Utilisateur', 2, sie$migrt$pkg.obten_var_page_ir(7375, 'Insert'), 61502, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DEBUT_EFECT', sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456766446609401711, 'O', null, 'Debut effectivité', 3, sie$migrt$pkg.obten_var_page_ir(7375, 'Insert'), 61503, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('EFORT_DISPN_SEMN', sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456766537222401711, 'O', null, 'Effort disponible', 4, sie$migrt$pkg.obten_var_page_ir(7375, 'Insert'), 61504, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('FIN_EFECT', sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456766630657401711, 'O', null, 'Fin effectivité', 5, sie$migrt$pkg.obten_var_page_ir(7375, 'Insert'), 61505, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456804625609591164, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(7376, 'Insert'), 61506, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE', sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456804730253591165, 'O', null, 'Code', 2, sie$migrt$pkg.obten_var_page_ir(7376, 'Insert'), 61507, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456804834924591165, 'O', null, 'Nom', 3, sie$migrt$pkg.obten_var_page_ir(7376, 'Insert'), 61508, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DESCR', sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456804945120591165, 'O', null, 'Description', 4, sie$migrt$pkg.obten_var_page_ir(7376, 'Insert'), 61509, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DATE_INSCR', sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 479300123339227584, 'O', null, 'Date inscription', 14, sie$migrt$pkg.obten_var_page_ir(7378, 'Insert'), 61510, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456665924366694157, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(7377, 'Insert'), 61518, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_EQUIP_FORMT', sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456666048204694158, 'O', null, 'Équipe', 2, sie$migrt$pkg.obten_var_page_ir(7377, 'Insert'), 61519, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DEBUT_EFECT', sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456666225777694158, 'O', null, 'Début effectivité', 4, sie$migrt$pkg.obten_var_page_ir(7377, 'Insert'), 61520, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('FIN_EFECT', sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456666319564694158, 'O', null, 'Fin effectivité', 5, sie$migrt$pkg.obten_var_page_ir(7377, 'Insert'), 61521, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('POURC_AFECT_EQUIP_JALON', sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456666449024694158, 'O', null, 'Pourcentage affecté', 6, sie$migrt$pkg.obten_var_page_ir(7377, 'Insert'), 61522, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456604726227000102, 'O', null, 'Nom', 4, sie$migrt$pkg.obten_var_page_ir(7372, 'Insert'), 61523, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_UTILS_FORMT', sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456881834660813370, 'O', null, 'Utilisateur', 6, sie$migrt$pkg.obten_var_page_ir(7370, 'Insert'), 61524, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456902423851104448, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(7378, 'Insert'), 61525, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NUMR_SIGNF', sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456902541441104448, 'O', null, 'Numéro', 2, sie$migrt$pkg.obten_var_page_ir(7378, 'Insert'), 61526, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456902723966104449, 'O', null, 'Nom', 4, sie$migrt$pkg.obten_var_page_ir(7378, 'Insert'), 61528, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_ENVIR_FORMT', sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456903420186104451, 'O', null, 'Environnement', 11, sie$migrt$pkg.obten_var_page_ir(7378, 'Insert'), 61535, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_DV_PRIOR_FORMT', sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456903528923104451, 'O', null, 'Priorité', 12, sie$migrt$pkg.obten_var_page_ir(7378, 'Insert'), 61536, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_STAT_FORMT', sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456903633911104451, 'O', null, 'Statut', 13, sie$migrt$pkg.obten_var_page_ir(7378, 'Insert'), 61537, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE', sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456630545061618338, 'O', null, 'Code', 2, sie$migrt$pkg.obten_var_page_ir(7051, 'Insert'), 61538, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456630628450618340, 'O', null, 'Nom', 3, sie$migrt$pkg.obten_var_page_ir(7051, 'Insert'), 61539, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456846724906257114, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(7370, 'Insert'), 61545, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_ROLE', sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456846837944257115, 'O', null, 'Ref Role', 2, sie$migrt$pkg.obten_var_page_ir(7370, 'Insert'), 61546, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_UTILS', sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456846927031257115, 'O', null, 'Ref Utils', 3, sie$migrt$pkg.obten_var_page_ir(7370, 'Insert'), 61547, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DEBUT_EFECT', sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456847049296257115, 'O', null, 'Début effectivité', 4, sie$migrt$pkg.obten_var_page_ir(7370, 'Insert'), 61548, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('FIN_EFECT', sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456847127458257115, 'O', null, 'Fin effectivité', 5, sie$migrt$pkg.obten_var_page_ir(7370, 'Insert'), 61549, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456613147364082191, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(7371, 'Insert'), 61550, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('CODE', sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456613241608082192, 'O', null, 'Code', 2, sie$migrt$pkg.obten_var_page_ir(7371, 'Insert'), 61551, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456613331618082192, 'O', null, 'Nom', 3, sie$migrt$pkg.obten_var_page_ir(7371, 'Insert'), 61552, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DESCR', sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456613441886082192, 'O', null, 'Description', 4, sie$migrt$pkg.obten_var_page_ir(7371, 'Insert'), 61553, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456603039842955400, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(7372, 'Insert'), 61555, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('DATE_PREVU', sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456603247432955401, 'O', null, 'Date prévue', 3, sie$migrt$pkg.obten_var_page_ir(7372, 'Insert'), 61557, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_NATR_TACHE_FORMT', sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 486034219560213597, 'O', null, 'Nature', 21, sie$migrt$pkg.obten_var_page_ir(7378, 'Insert'), 61752, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_PRODT_FORMT', sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 486034338406213598, 'O', null, 'Produit', 22, sie$migrt$pkg.obten_var_page_ir(7378, 'Insert'), 61753, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_STAT_REALS', sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 533564440395110972, 'O', null, 'Ref Stat Reals', 10, sie$migrt$pkg.obten_var_page_ir(7428, 'Insert'), 61754, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NUMR_SIGNF', sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 532983847431719386, 'O', null, 'Numéro', 2, sie$migrt$pkg.obten_var_page_ir(7428, 'Insert'), 61755, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('NOM', sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 532983933484719386, 'O', null, 'Nom', 3, sie$migrt$pkg.obten_var_page_ir(7428, 'Insert'), 61756, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_ENVIR_FORMT', sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 532984022677719386, 'O', null, 'Environnement', 4, sie$migrt$pkg.obten_var_page_ir(7428, 'Insert'), 61757, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_PRODT_FORMT', sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 532984134125719387, 'O', null, 'Produit', 5, sie$migrt$pkg.obten_var_page_ir(7428, 'Insert'), 61758, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_NATR_TACHE_FORMT', sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 532984222612719388, 'O', null, 'Nature ', 6, sie$migrt$pkg.obten_var_page_ir(7428, 'Insert'), 61759, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_DV_PRIOR_FORMT', sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 532984321187719388, 'O', null, 'Priorité', 7, sie$migrt$pkg.obten_var_page_ir(7428, 'Insert'), 61760, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_DV_PRIOR', sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 532998931021736655, 'O', null, 'Ref Dv Prior', 8, sie$migrt$pkg.obten_var_page_ir(7428, 'Insert'), 61761, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('REF_UTILS', sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 532999641167872100, 'O', null, 'Ref Utils', 9, sie$migrt$pkg.obten_var_page_ir(7428, 'Insert'), 61762, null);
insert into tc$13$page$ir$coln (coln_table, dnr_ref_aplic, id_apex, indic_exprt, largr, libl, ordre_afich, ref_page_ir, seqnc, type_largr) values ('SEQNC', sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 532983727436719382, 'O', null, 'Seqnc', 1, sie$migrt$pkg.obten_var_page_ir(7428, 'Insert'), 61763, null);
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
select seqnc into sie$migrt$pkg.var_page_ir_coln(58138) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7051, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61494) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7374, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61495) from sie_13_page_ir_coln where coln_table = 'REF_EQUIP' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7374, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61496) from sie_13_page_ir_coln where coln_table = 'REF_UTILS' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7374, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61497) from sie_13_page_ir_coln where coln_table = 'DEBUT_EFECT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7374, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61498) from sie_13_page_ir_coln where coln_table = 'FIN_EFECT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7374, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61499) from sie_13_page_ir_coln where coln_table = 'POURC_IMPLI_EQUIP' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7374, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61500) from sie_13_page_ir_coln where coln_table = 'REF_UTILS_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7374, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61501) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7375, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61502) from sie_13_page_ir_coln where coln_table = 'REF_UTILS_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7375, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61503) from sie_13_page_ir_coln where coln_table = 'DEBUT_EFECT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7375, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61504) from sie_13_page_ir_coln where coln_table = 'EFORT_DISPN_SEMN' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7375, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61505) from sie_13_page_ir_coln where coln_table = 'FIN_EFECT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7375, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61506) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7376, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61507) from sie_13_page_ir_coln where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7376, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61508) from sie_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7376, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61509) from sie_13_page_ir_coln where coln_table = 'DESCR' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7376, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61510) from sie_13_page_ir_coln where coln_table = 'DATE_INSCR' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7378, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61518) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7377, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61519) from sie_13_page_ir_coln where coln_table = 'REF_EQUIP_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7377, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61520) from sie_13_page_ir_coln where coln_table = 'DEBUT_EFECT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7377, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61521) from sie_13_page_ir_coln where coln_table = 'FIN_EFECT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7377, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61522) from sie_13_page_ir_coln where coln_table = 'POURC_AFECT_EQUIP_JALON' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7377, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61523) from sie_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7372, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61524) from sie_13_page_ir_coln where coln_table = 'REF_UTILS_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7370, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61525) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7378, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61526) from sie_13_page_ir_coln where coln_table = 'NUMR_SIGNF' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7378, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61528) from sie_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7378, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61535) from sie_13_page_ir_coln where coln_table = 'REF_ENVIR_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7378, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61536) from sie_13_page_ir_coln where coln_table = 'REF_DV_PRIOR_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7378, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61537) from sie_13_page_ir_coln where coln_table = 'REF_STAT_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7378, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61538) from sie_13_page_ir_coln where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7051, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61539) from sie_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7051, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61545) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7370, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61546) from sie_13_page_ir_coln where coln_table = 'REF_ROLE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7370, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61547) from sie_13_page_ir_coln where coln_table = 'REF_UTILS' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7370, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61548) from sie_13_page_ir_coln where coln_table = 'DEBUT_EFECT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7370, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61549) from sie_13_page_ir_coln where coln_table = 'FIN_EFECT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7370, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61550) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7371, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61551) from sie_13_page_ir_coln where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7371, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61552) from sie_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7371, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61553) from sie_13_page_ir_coln where coln_table = 'DESCR' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7371, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61555) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7372, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61557) from sie_13_page_ir_coln where coln_table = 'DATE_PREVU' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7372, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61752) from sie_13_page_ir_coln where coln_table = 'REF_NATR_TACHE_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7378, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61753) from sie_13_page_ir_coln where coln_table = 'REF_PRODT_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7378, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61754) from sie_13_page_ir_coln where coln_table = 'REF_STAT_REALS' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7428, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61755) from sie_13_page_ir_coln where coln_table = 'NUMR_SIGNF' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7428, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61756) from sie_13_page_ir_coln where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7428, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61757) from sie_13_page_ir_coln where coln_table = 'REF_ENVIR_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7428, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61758) from sie_13_page_ir_coln where coln_table = 'REF_PRODT_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7428, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61759) from sie_13_page_ir_coln where coln_table = 'REF_NATR_TACHE_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7428, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61760) from sie_13_page_ir_coln where coln_table = 'REF_DV_PRIOR_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7428, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61761) from sie_13_page_ir_coln where coln_table = 'REF_DV_PRIOR' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7428, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61762) from sie_13_page_ir_coln where coln_table = 'REF_UTILS' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7428, 'Select');
select seqnc into sie$migrt$pkg.var_page_ir_coln(61763) from sie_13_page_ir_coln where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7428, 'Select');
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

insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 1526270456949481907, 'O', null, null, null, null, 'N', null, '[SADA]', 'SADA', sie$migrt$pkg.obten_var_page(17213, 'Insert'), 218825, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 1555815456232562815, 'O', null, null, null, null, 'N', null, 'Test', 'SIDF', sie$migrt$pkg.obten_var_page(17213, 'Insert'), 218826, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 1555815683706562817, 'O', null, null, null, null, 'N', null, '[SSPC]', 'SSPC', sie$migrt$pkg.obten_var_page(17213, 'Insert'), 218827, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 1555815858696562817, 'O', null, null, null, null, 'N', null, '[SCPC]', 'SCPC', sie$migrt$pkg.obten_var_page(17213, 'Insert'), 218828, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 1556154677118182298, 'O', null, null, null, null, 'N', null, '[SAPC]', 'SAPC', sie$migrt$pkg.obten_var_page(17213, 'Insert'), 218829, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 1577639161109238962, 'O', null, null, null, null, 'N', null, 'SNPI', 'SNPI', sie$migrt$pkg.obten_var_page(17213, 'Insert'), 218830, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 1600379477506406595, 'O', null, null, null, null, 'N', null, '[SCPI]', 'SCPI', sie$migrt$pkg.obten_var_page(17213, 'Insert'), 218831, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 1600379682701408118, 'O', null, null, null, null, 'N', null, '[SSPI]', 'SSPI', sie$migrt$pkg.obten_var_page(17213, 'Insert'), 218832, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 1600379887549409465, 'O', null, null, null, null, 'N', null, '[SAPI]', 'SAPI', sie$migrt$pkg.obten_var_page(17213, 'Insert'), 218833, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 1672093221206470408, 'O', null, null, null, null, 'N', null, '[P0_RECHR_GLOBL]', 'P0_RECHR_GLOBL', sie$migrt$pkg.obten_var_page(17213, 'Insert'), 218834, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 1526569236949039059, 'O', null, null, null, null, 'N', null, 'Code d''utilisateur', 'P101_CODE_UTILS', sie$migrt$pkg.obten_var_page(17215, 'Insert'), 218835, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 1526569445333039060, 'O', null, null, null, null, 'N', null, 'Mot de passe', 'P101_MOT_PASSE', sie$migrt$pkg.obten_var_page(17215, 'Insert'), 218836, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 1526569634664039060, 'O', null, null, null, null, 'N', null, 'Connexion', 'P101_LOGIN', sie$migrt$pkg.obten_var_page(17215, 'Insert'), 218837, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 1526569837217039060, 'O', null, null, null, null, 'N', null, 'Domaine', 'P101_DOMN', sie$migrt$pkg.obten_var_page(17215, 'Insert'), 218838, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 1526570037181039061, 'O', null, null, null, null, 'N', null, '[P101_LANG]', 'P101_LANG', sie$migrt$pkg.obten_var_page(17215, 'Insert'), 218839, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 1526570230662039061, 'O', null, null, null, null, 'N', null, '[P101_FORCE_DOMN]', 'P101_FORCE_DOMN', sie$migrt$pkg.obten_var_page(17215, 'Insert'), 218840, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 1929810544890374428, 'O', null, null, null, null, 'N', null, 'Application:', 'P102_APPLICATION_ID', sie$migrt$pkg.obten_var_page(17216, 'Insert'), 218841, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 1929811048714374431, 'O', null, null, null, null, 'N', null, 'Page:', 'P102_PAGE_ID', sie$migrt$pkg.obten_var_page(17216, 'Insert'), 218842, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 1929811528641374431, 'O', null, null, null, null, 'N', null, '[P102_A]', 'P102_A', sie$migrt$pkg.obten_var_page(17216, 'Insert'), 218843, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 1929811745567374432, 'O', null, null, null, null, 'N', null, 'Commentaire', 'P102_FEEDBACK', sie$migrt$pkg.obten_var_page(17216, 'Insert'), 218844, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 1929812243662374433, 'O', null, null, null, null, 'N', null, '[P102_X]', 'P102_X', sie$migrt$pkg.obten_var_page(17216, 'Insert'), 218845, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 1929812451604374433, 'O', null, null, null, null, 'N', null, 'Type de commentaire', 'P102_FEEDBACK_TYPE', sie$migrt$pkg.obten_var_page(17216, 'Insert'), 218846, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 1929812951375374433, 'O', null, null, null, null, 'N', null, '[P102_Y]', 'P102_Y', sie$migrt$pkg.obten_var_page(17216, 'Insert'), 218847, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 1262400684601292385, 'N', null, null, null, null, 'N', null, 'Appliquer', 'SUBMIT', sie$migrt$pkg.obten_var_page(17216, 'Insert'), 218848, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456871046500646537, 'O', null, null, null, null, 'O', null, '[P1043_SEQNC]', 'P1043_SEQNC', sie$migrt$pkg.obten_var_page(17969, 'Insert'), 228025, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456871438320653640, 'O', null, null, null, null, 'O', null, '[P1043_REF_ROLE]', 'P1043_REF_ROLE', sie$migrt$pkg.obten_var_page(17969, 'Insert'), 228026, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456873735166699972, 'O', null, null, null, null, 'O', null, 'Utilisateur', 'P1043_REF_UTILS', sie$migrt$pkg.obten_var_page(17969, 'Insert'), 228027, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456874230926717688, 'O', null, null, null, null, 'O', null, 'Date début effectif', 'P1043_DEBUT_EFECT', sie$migrt$pkg.obten_var_page(17969, 'Insert'), 228028, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456874433481727899, 'O', null, null, null, null, 'O', null, 'Date fin effectif', 'P1043_FIN_EFECT', sie$migrt$pkg.obten_var_page(17969, 'Insert'), 228029, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 453284129591291116, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(17969, 'Insert'), 228030, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 453286705612303102, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', sie$migrt$pkg.obten_var_page(17969, 'Insert'), 228031, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 453287731154329400, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', sie$migrt$pkg.obten_var_page(17969, 'Insert'), 228032, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 453287418556316304, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', sie$migrt$pkg.obten_var_page(17969, 'Insert'), 228033, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 453222218032282718, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', sie$migrt$pkg.obten_var_page(17970, 'Insert'), 228034, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456772830630578836, 'O', null, null, null, null, 'N', null, '[P1031_DISPN_UTILS]', 'P1031_DISPN_UTILS', sie$migrt$pkg.obten_var_page(17971, 'Insert'), 228035, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 453183915405093263, 'N', null, null, null, null, 'N', null, 'Ajouter', 'CREATE', sie$migrt$pkg.obten_var_page(17971, 'Insert'), 228036, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 453030800639773745, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', sie$migrt$pkg.obten_var_page(17972, 'Insert'), 228037, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 453020922802646956, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', sie$migrt$pkg.obten_var_page(17974, 'Insert'), 228038, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 485937428808966829, 'O', null, null, null, null, 'N', null, 'Date inscription', 'P1052_DATE_INSCR', sie$migrt$pkg.obten_var_page(17983, 'Insert'), 228640, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 485942720441210381, 'O', null, null, null, null, 'O', null, 'Nature de la tâche', 'P1052_REF_NATR_TACHE', sie$migrt$pkg.obten_var_page(17983, 'Insert'), 228641, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 485944139797263209, 'O', null, null, null, null, 'O', null, 'Produit', 'P1052_REF_PRODT', sie$migrt$pkg.obten_var_page(17983, 'Insert'), 228642, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 486806641102875421, 'O', null, null, null, null, 'N', null, 'Complexité', 'P1052_REF_DV_COMPL', sie$migrt$pkg.obten_var_page(17983, 'Insert'), 228643, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 486911323064087529, 'O', null, null, null, null, 'N', null, '[P1052_PLANIF_EFORT]', 'P1052_PLANIF_EFORT', sie$migrt$pkg.obten_var_page(17983, 'Insert'), 228644, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 488769730767881068, 'O', null, null, null, null, 'N', null, 'Jalon', 'P1052_REF_JALON', sie$migrt$pkg.obten_var_page(17983, 'Insert'), 228645, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 510280222891290485, 'O', null, null, null, null, 'N', null, '[P1052_AFECT]', 'P1052_AFECT', sie$migrt$pkg.obten_var_page(17983, 'Insert'), 228646, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 483321628205530330, 'N', null, null, null, null, 'N', null, 'Éditer', 'EDITER_PLANIF_EFORT', sie$migrt$pkg.obten_var_page(17983, 'Insert'), 228647, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 483354329336287519, 'N', null, null, null, null, 'N', null, 'Éditer', 'EDITER_AFECT', sie$migrt$pkg.obten_var_page(17983, 'Insert'), 228648, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 487119232249771153, 'O', null, null, null, null, 'O', null, 'Rôle', 'P1054_REF_ROLE_FORMT', sie$migrt$pkg.obten_var_page(18059, 'Insert'), 228649, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 487120522253796591, 'O', null, null, null, null, 'N', null, 'Ajouter', 'P1054_AJOUTER', sie$migrt$pkg.obten_var_page(18059, 'Insert'), 228650, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 483379531770163082, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(18059, 'Insert'), 228651, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 483379606561163082, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SUBMIT', sie$migrt$pkg.obten_var_page(18059, 'Insert'), 228652, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 483379803047163082, 'N', null, null, null, null, 'N', null, 'Ajouter', 'ADD', sie$migrt$pkg.obten_var_page(18059, 'Insert'), 228653, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 533015048123419875, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P1056_SEQNC', sie$migrt$pkg.obten_var_page(18060, 'Insert'), 228654, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 533015232086419876, 'O', null, null, null, null, 'N', null, '[P1056_PLANIF_EFORT]', 'P1056_PLANIF_EFORT', sie$migrt$pkg.obten_var_page(18060, 'Insert'), 228655, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 533572518988634574, 'O', null, null, null, null, 'O', null, 'Précision de réalisation', 'P1056_REF_STAT_REALS', sie$migrt$pkg.obten_var_page(18060, 'Insert'), 228656, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 533009821953419858, 'O', null, null, null, null, 'O', null, 'Numéro', 'P1056_NUMR_SIGNF', sie$migrt$pkg.obten_var_page(18060, 'Insert'), 228657, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 533010026866419861, 'O', null, null, null, null, 'O', null, 'Nom', 'P1056_NOM', sie$migrt$pkg.obten_var_page(18060, 'Insert'), 228658, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 533010244450419861, 'O', null, null, null, null, 'O', null, 'Description', 'P1056_DESCR', sie$migrt$pkg.obten_var_page(18060, 'Insert'), 228659, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 533010427815419862, 'O', null, null, null, null, 'O', null, 'Priorité', 'P1056_REF_DV_PRIOR', sie$migrt$pkg.obten_var_page(18060, 'Insert'), 228660, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 533010624826419862, 'O', null, null, null, null, 'O', null, 'Statut', 'P1056_REF_STAT', sie$migrt$pkg.obten_var_page(18060, 'Insert'), 228661, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 533010844224419862, 'O', null, null, null, null, 'O', null, 'Commentaire', 'P1056_COMNT', sie$migrt$pkg.obten_var_page(18060, 'Insert'), 228662, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 533011041359419863, 'O', null, null, null, null, 'N', null, 'Complexité', 'P1056_REF_DV_COMPL', sie$migrt$pkg.obten_var_page(18060, 'Insert'), 228663, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 533011242380419863, 'O', null, null, null, null, 'O', null, 'Date inscription', 'P1056_DATE_INSCR', sie$migrt$pkg.obten_var_page(18060, 'Insert'), 228664, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 533011432112419863, 'O', null, null, null, null, 'N', null, 'Jalon', 'P1056_REF_JALON', sie$migrt$pkg.obten_var_page(18060, 'Insert'), 228665, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 533011649461419864, 'O', null, null, null, null, 'O', null, 'Nature de la tâche', 'P1056_REF_NATR_TACHE', sie$migrt$pkg.obten_var_page(18060, 'Insert'), 228666, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 533012643215419869, 'O', null, null, null, null, 'O', null, 'Environnement', 'P1056_REF_ENVIR', sie$migrt$pkg.obten_var_page(18060, 'Insert'), 228667, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 533012829108419869, 'O', null, null, null, null, 'O', null, 'Produit', 'P1056_REF_PRODT', sie$migrt$pkg.obten_var_page(18060, 'Insert'), 228668, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 529431324720111424, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', sie$migrt$pkg.obten_var_page(18060, 'Insert'), 228669, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 529431527620111425, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(18060, 'Insert'), 228670, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 529431706585111425, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', sie$migrt$pkg.obten_var_page(18060, 'Insert'), 228671, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 529431908869111425, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', sie$migrt$pkg.obten_var_page(18060, 'Insert'), 228672, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 529448821260849714, 'N', null, null, null, null, 'N', null, 'Éditer', 'EDITER', sie$migrt$pkg.obten_var_page(18060, 'Insert'), 228673, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 529984310109111121, 'N', null, null, null, null, 'N', null, 'Consulter', 'CONSULTER', sie$migrt$pkg.obten_var_page(18060, 'Insert'), 228674, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 453321028221796006, 'N', null, null, null, null, 'N', null, 'Créer', 'CREATE', sie$migrt$pkg.obten_var_page(17975, 'Insert'), 228039, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456679018288991833, 'O', null, null, null, null, 'O', null, '[P1023_REF_JALON]', 'P1023_REF_JALON', sie$migrt$pkg.obten_var_page(17976, 'Insert'), 228040, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456681238337044917, 'O', null, null, null, null, 'O', null, '[P1023_SEQNC]', 'P1023_SEQNC', sie$migrt$pkg.obten_var_page(17976, 'Insert'), 228041, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456681730157052015, 'O', null, null, null, null, 'O', null, 'Début effectivité', 'P1023_DEBUT_EFEC', sie$migrt$pkg.obten_var_page(17976, 'Insert'), 228042, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456681942277055513, 'O', null, null, null, null, 'O', null, 'Fin effectivité', 'P1023_FIN_EFECT', sie$migrt$pkg.obten_var_page(17976, 'Insert'), 228043, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456682634490091113, 'O', null, null, null, null, 'O', null, 'Équipe', 'P1023_REF_EQUIP', sie$migrt$pkg.obten_var_page(17976, 'Insert'), 228044, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456702227637694630, 'O', null, null, null, null, 'O', null, 'Pourcentage affecté', 'P1023_POURC_AFECT_EQUIP_JALON', sie$migrt$pkg.obten_var_page(17976, 'Insert'), 228045, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 453094324927643248, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', sie$migrt$pkg.obten_var_page(17976, 'Insert'), 228046, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 453095208089647752, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(17976, 'Insert'), 228047, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 453093626050624590, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', sie$migrt$pkg.obten_var_page(17976, 'Insert'), 228048, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 453093925489633922, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', sie$migrt$pkg.obten_var_page(17976, 'Insert'), 228049, 'BOUTN');
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
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456763639232401682, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P1032_SEQNC', sie$migrt$pkg.obten_var_page(17977, 'Insert'), 228050, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456764226065401692, 'O', null, null, null, null, 'O', null, 'Début effectivitée', 'P1032_DEBUT_EFECT', sie$migrt$pkg.obten_var_page(17977, 'Insert'), 228051, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456764435406401692, 'O', null, null, null, null, 'O', null, 'Effort disponible', 'P1032_EFORT_DISPN_SEMN', sie$migrt$pkg.obten_var_page(17977, 'Insert'), 228052, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456764634476401692, 'O', null, null, null, null, 'O', null, 'Date début effectivitée', 'P1032_FIN_EFECT', sie$migrt$pkg.obten_var_page(17977, 'Insert'), 228053, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456796643807434129, 'O', null, null, null, null, 'O', null, 'Utilisateur', 'P1032_REF_UTILS', sie$migrt$pkg.obten_var_page(17977, 'Insert'), 228054, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 453179300461093230, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', sie$migrt$pkg.obten_var_page(17977, 'Insert'), 228055, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 453179605616093230, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(17977, 'Insert'), 228056, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 453179232342093230, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', sie$migrt$pkg.obten_var_page(17977, 'Insert'), 228057, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 453179428170093230, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', sie$migrt$pkg.obten_var_page(17977, 'Insert'), 228058, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456610638012082171, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P1012_SEQNC', sie$migrt$pkg.obten_var_page(17978, 'Insert'), 228059, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456610827753082180, 'O', null, null, null, null, 'O', null, 'Code', 'P1012_CODE', sie$migrt$pkg.obten_var_page(17978, 'Insert'), 228060, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456611028177082181, 'O', null, null, null, null, 'O', null, 'Nom', 'P1012_NOM', sie$migrt$pkg.obten_var_page(17978, 'Insert'), 228061, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456611221099082181, 'O', null, null, null, null, 'O', null, 'Description', 'P1012_DESCR', sie$migrt$pkg.obten_var_page(17978, 'Insert'), 228062, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456704419419749073, 'O', null, null, null, null, 'N', null, '[P1012_LIEN_EQUIP]', 'P1012_LIEN_EQUIP', sie$migrt$pkg.obten_var_page(17978, 'Insert'), 228063, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 453026615784773718, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(17978, 'Insert'), 228064, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 453026317409773718, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', sie$migrt$pkg.obten_var_page(17978, 'Insert'), 228065, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 453026207016773718, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', sie$migrt$pkg.obten_var_page(17978, 'Insert'), 228066, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 453087218067470956, 'N', null, null, null, null, 'N', null, 'Ajouter', 'CREER_LIEN_EQUIP', sie$migrt$pkg.obten_var_page(17978, 'Insert'), 228067, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 453026416313773718, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', sie$migrt$pkg.obten_var_page(17978, 'Insert'), 228068, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 487147323918667427, 'O', null, null, null, null, 'O', null, '[P1053_SEQNC]', 'P1053_SEQNC', sie$migrt$pkg.obten_var_page(17979, 'Insert'), 228069, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 487145247485475576, 'O', null, null, null, null, 'O', null, 'Utilisateurs', 'P1053_REF_UTILS', sie$migrt$pkg.obten_var_page(17979, 'Insert'), 228072, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 453477510045562723, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', sie$migrt$pkg.obten_var_page(17979, 'Insert'), 228075, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 453477800247562723, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(17979, 'Insert'), 228076, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456690931971383727, 'O', null, null, null, null, 'O', null, '[P1013_SEQNC]', 'P1013_SEQNC', sie$migrt$pkg.obten_var_page(17980, 'Insert'), 228079, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456691123445390704, 'O', null, null, null, null, 'O', null, '[P1013_REF_EQUIP]', 'P1013_REF_EQUIP', sie$migrt$pkg.obten_var_page(17980, 'Insert'), 228080, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456691922714437799, 'O', null, null, null, null, 'O', null, 'Utilisateur', 'P1013_REF_UTILS', sie$migrt$pkg.obten_var_page(17980, 'Insert'), 228081, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456692525270447998, 'O', null, null, null, null, 'O', null, 'Date début effectif', 'P1013_DEBUT_EFECT', sie$migrt$pkg.obten_var_page(17980, 'Insert'), 228082, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456692718821455555, 'O', null, null, null, null, 'O', null, 'Date fin effectif', 'P1013_FIN_EFECT', sie$migrt$pkg.obten_var_page(17980, 'Insert'), 228083, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456693128995467941, 'O', null, null, null, null, 'O', null, 'Pourcentage d''implication', 'P1013_POURC_IMPLI_EQUIP', sie$migrt$pkg.obten_var_page(17980, 'Insert'), 228084, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 453098019657736236, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(17980, 'Insert'), 228085, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 453099325245766291, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', sie$migrt$pkg.obten_var_page(17980, 'Insert'), 228086, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 453107507621063928, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', sie$migrt$pkg.obten_var_page(17980, 'Insert'), 228087, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 453107211514046104, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', sie$migrt$pkg.obten_var_page(17980, 'Insert'), 228088, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456802431386591143, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P1042_SEQNC', sie$migrt$pkg.obten_var_page(17981, 'Insert'), 228089, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456802632555591151, 'O', null, null, null, null, 'O', null, 'Code', 'P1042_CODE', sie$migrt$pkg.obten_var_page(17981, 'Insert'), 228090, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456802821128591152, 'O', null, null, null, null, 'O', null, 'Nom', 'P1042_NOM', sie$migrt$pkg.obten_var_page(17981, 'Insert'), 228091, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456803031294591152, 'O', null, null, null, null, 'O', null, 'Description', 'P1042_DESCR', sie$migrt$pkg.obten_var_page(17981, 'Insert'), 228092, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456848419190316916, 'O', null, null, null, null, 'N', null, '[P1042_ROLE_UTILS]', 'P1042_ROLE_UTILS', sie$migrt$pkg.obten_var_page(17981, 'Insert'), 228093, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 453218401688282688, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(17981, 'Insert'), 228094, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 453218126000282688, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', sie$migrt$pkg.obten_var_page(17981, 'Insert'), 228095, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 453218029888282688, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', sie$migrt$pkg.obten_var_page(17981, 'Insert'), 228096, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 453266413933031103, 'N', null, null, null, null, 'N', null, 'Ajouter', 'CREER_ROLE_UTILS', sie$migrt$pkg.obten_var_page(17981, 'Insert'), 228097, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 453218200548282688, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', sie$migrt$pkg.obten_var_page(17981, 'Insert'), 228098, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456600848134955374, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P1022_SEQNC', sie$migrt$pkg.obten_var_page(17982, 'Insert'), 228099, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456601018129955381, 'O', null, null, null, null, 'O', null, 'Nom', 'P1022_NOM', sie$migrt$pkg.obten_var_page(17982, 'Insert'), 228100, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456601224925955382, 'O', null, null, null, null, 'O', null, '[P1022_REF_PRODT]', 'P1022_REF_PRODT', sie$migrt$pkg.obten_var_page(17982, 'Insert'), 228101, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456601437732955382, 'O', null, null, null, null, 'O', null, 'Date prévue', 'P1022_DATE_PREVU', sie$migrt$pkg.obten_var_page(17982, 'Insert'), 228102, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456695642594528611, 'O', null, null, null, null, 'N', null, '[P1022_JALON_EQUIP]', 'P1022_JALON_EQUIP', sie$migrt$pkg.obten_var_page(17982, 'Insert'), 228103, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 453016923090646910, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(17982, 'Insert'), 228104, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 453086032349456133, 'N', null, null, null, null, 'N', null, 'Ajouter', 'CREER_JALON_EQUIP', sie$migrt$pkg.obten_var_page(17982, 'Insert'), 228105, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 453016611514646910, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', sie$migrt$pkg.obten_var_page(17982, 'Insert'), 228106, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 453016509512646910, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', sie$migrt$pkg.obten_var_page(17982, 'Insert'), 228107, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 453016709197646910, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', sie$migrt$pkg.obten_var_page(17982, 'Insert'), 228108, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456897136743104413, 'O', null, null, null, null, 'O', null, 'Seqnc', 'P1052_SEQNC', sie$migrt$pkg.obten_var_page(17983, 'Insert'), 228109, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456897330602104422, 'O', null, null, null, null, 'O', null, 'Numéro', 'P1052_NUMR_SIGNF', sie$migrt$pkg.obten_var_page(17983, 'Insert'), 228110, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456897730270104424, 'O', null, null, null, null, 'O', null, 'Nom', 'P1052_NOM', sie$migrt$pkg.obten_var_page(17983, 'Insert'), 228111, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456897941653104424, 'O', null, null, null, null, 'O', null, 'Description', 'P1052_DESCR', sie$migrt$pkg.obten_var_page(17983, 'Insert'), 228112, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456899122852104428, 'O', null, null, null, null, 'O', null, 'Environnement', 'P1052_REF_ENVIR', sie$migrt$pkg.obten_var_page(17983, 'Insert'), 228117, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456899338930104428, 'O', null, null, null, null, 'O', null, 'Priorité', 'P1052_REF_DV_PRIOR', sie$migrt$pkg.obten_var_page(17983, 'Insert'), 228118, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456899531811104428, 'O', null, null, null, null, 'O', null, 'Statut', 'P1052_REF_STAT', sie$migrt$pkg.obten_var_page(17983, 'Insert'), 228119, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 456899750186104429, 'O', null, null, null, null, 'O', null, 'Commentaire', 'P1052_COMNT', sie$migrt$pkg.obten_var_page(17983, 'Insert'), 228120, 'ITEM');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 453312832067795955, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'SAVE', sie$migrt$pkg.obten_var_page(17983, 'Insert'), 228122, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 453313108711795955, 'N', null, null, null, null, 'N', null, 'Annuler', 'CANCEL', sie$migrt$pkg.obten_var_page(17983, 'Insert'), 228123, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 453312707860795955, 'N', null, null, null, null, 'N', null, 'Enregistrer', 'CREATE', sie$migrt$pkg.obten_var_page(17983, 'Insert'), 228124, 'BOUTN');
insert into tc$13$page$item (depsm_alias_coln, dnr_ref_aplic, id_apex, indic_confr_sauvg, indic_creat, indic_en_creat, indic_en_modfc, indic_modfc, indic_rechr, indic_suprs, libl, nom_apex, ref_page, seqnc, type_item) values (null, sie$migrt$pkg.obten_var_aplic(190, 'Insert'), 453312932508795955, 'N', null, null, null, null, 'N', null, 'Supprimer', 'DELETE', sie$migrt$pkg.obten_var_page(17983, 'Insert'), 228126, 'BOUTN');
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
select seqnc into sie$migrt$pkg.var_page_item(218825) from sie_13_page_item where nom_apex = 'SADA' and ref_page = sie$migrt$pkg.obten_var_page(17213, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218826) from sie_13_page_item where nom_apex = 'SIDF' and ref_page = sie$migrt$pkg.obten_var_page(17213, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218827) from sie_13_page_item where nom_apex = 'SSPC' and ref_page = sie$migrt$pkg.obten_var_page(17213, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218828) from sie_13_page_item where nom_apex = 'SCPC' and ref_page = sie$migrt$pkg.obten_var_page(17213, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218829) from sie_13_page_item where nom_apex = 'SAPC' and ref_page = sie$migrt$pkg.obten_var_page(17213, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218830) from sie_13_page_item where nom_apex = 'SNPI' and ref_page = sie$migrt$pkg.obten_var_page(17213, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218831) from sie_13_page_item where nom_apex = 'SCPI' and ref_page = sie$migrt$pkg.obten_var_page(17213, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218832) from sie_13_page_item where nom_apex = 'SSPI' and ref_page = sie$migrt$pkg.obten_var_page(17213, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218833) from sie_13_page_item where nom_apex = 'SAPI' and ref_page = sie$migrt$pkg.obten_var_page(17213, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218834) from sie_13_page_item where nom_apex = 'P0_RECHR_GLOBL' and ref_page = sie$migrt$pkg.obten_var_page(17213, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218835) from sie_13_page_item where nom_apex = 'P101_CODE_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(17215, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218836) from sie_13_page_item where nom_apex = 'P101_MOT_PASSE' and ref_page = sie$migrt$pkg.obten_var_page(17215, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218837) from sie_13_page_item where nom_apex = 'P101_LOGIN' and ref_page = sie$migrt$pkg.obten_var_page(17215, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218838) from sie_13_page_item where nom_apex = 'P101_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(17215, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218839) from sie_13_page_item where nom_apex = 'P101_LANG' and ref_page = sie$migrt$pkg.obten_var_page(17215, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218840) from sie_13_page_item where nom_apex = 'P101_FORCE_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(17215, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218841) from sie_13_page_item where nom_apex = 'P102_APPLICATION_ID' and ref_page = sie$migrt$pkg.obten_var_page(17216, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218842) from sie_13_page_item where nom_apex = 'P102_PAGE_ID' and ref_page = sie$migrt$pkg.obten_var_page(17216, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218843) from sie_13_page_item where nom_apex = 'P102_A' and ref_page = sie$migrt$pkg.obten_var_page(17216, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218844) from sie_13_page_item where nom_apex = 'P102_FEEDBACK' and ref_page = sie$migrt$pkg.obten_var_page(17216, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218845) from sie_13_page_item where nom_apex = 'P102_X' and ref_page = sie$migrt$pkg.obten_var_page(17216, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218846) from sie_13_page_item where nom_apex = 'P102_FEEDBACK_TYPE' and ref_page = sie$migrt$pkg.obten_var_page(17216, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218847) from sie_13_page_item where nom_apex = 'P102_Y' and ref_page = sie$migrt$pkg.obten_var_page(17216, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(218848) from sie_13_page_item where nom_apex = 'SUBMIT' and ref_page = sie$migrt$pkg.obten_var_page(17216, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228025) from sie_13_page_item where nom_apex = 'P1043_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17969, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228026) from sie_13_page_item where nom_apex = 'P1043_REF_ROLE' and ref_page = sie$migrt$pkg.obten_var_page(17969, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228027) from sie_13_page_item where nom_apex = 'P1043_REF_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(17969, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228028) from sie_13_page_item where nom_apex = 'P1043_DEBUT_EFECT' and ref_page = sie$migrt$pkg.obten_var_page(17969, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228029) from sie_13_page_item where nom_apex = 'P1043_FIN_EFECT' and ref_page = sie$migrt$pkg.obten_var_page(17969, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228030) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17969, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228031) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17969, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228032) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(17969, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228033) from sie_13_page_item where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(17969, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228034) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17970, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228035) from sie_13_page_item where nom_apex = 'P1031_DISPN_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(17971, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228036) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17971, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228037) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17972, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228038) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17974, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228640) from sie_13_page_item where nom_apex = 'P1052_DATE_INSCR' and ref_page = sie$migrt$pkg.obten_var_page(17983, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228641) from sie_13_page_item where nom_apex = 'P1052_REF_NATR_TACHE' and ref_page = sie$migrt$pkg.obten_var_page(17983, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228642) from sie_13_page_item where nom_apex = 'P1052_REF_PRODT' and ref_page = sie$migrt$pkg.obten_var_page(17983, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228643) from sie_13_page_item where nom_apex = 'P1052_REF_DV_COMPL' and ref_page = sie$migrt$pkg.obten_var_page(17983, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228644) from sie_13_page_item where nom_apex = 'P1052_PLANIF_EFORT' and ref_page = sie$migrt$pkg.obten_var_page(17983, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228645) from sie_13_page_item where nom_apex = 'P1052_REF_JALON' and ref_page = sie$migrt$pkg.obten_var_page(17983, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228646) from sie_13_page_item where nom_apex = 'P1052_AFECT' and ref_page = sie$migrt$pkg.obten_var_page(17983, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228647) from sie_13_page_item where nom_apex = 'EDITER_PLANIF_EFORT' and ref_page = sie$migrt$pkg.obten_var_page(17983, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228648) from sie_13_page_item where nom_apex = 'EDITER_AFECT' and ref_page = sie$migrt$pkg.obten_var_page(17983, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228649) from sie_13_page_item where nom_apex = 'P1054_REF_ROLE_FORMT' and ref_page = sie$migrt$pkg.obten_var_page(18059, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228650) from sie_13_page_item where nom_apex = 'P1054_AJOUTER' and ref_page = sie$migrt$pkg.obten_var_page(18059, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228651) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(18059, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228652) from sie_13_page_item where nom_apex = 'SUBMIT' and ref_page = sie$migrt$pkg.obten_var_page(18059, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228653) from sie_13_page_item where nom_apex = 'ADD' and ref_page = sie$migrt$pkg.obten_var_page(18059, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228654) from sie_13_page_item where nom_apex = 'P1056_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(18060, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228655) from sie_13_page_item where nom_apex = 'P1056_PLANIF_EFORT' and ref_page = sie$migrt$pkg.obten_var_page(18060, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228656) from sie_13_page_item where nom_apex = 'P1056_REF_STAT_REALS' and ref_page = sie$migrt$pkg.obten_var_page(18060, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228657) from sie_13_page_item where nom_apex = 'P1056_NUMR_SIGNF' and ref_page = sie$migrt$pkg.obten_var_page(18060, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228658) from sie_13_page_item where nom_apex = 'P1056_NOM' and ref_page = sie$migrt$pkg.obten_var_page(18060, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228659) from sie_13_page_item where nom_apex = 'P1056_DESCR' and ref_page = sie$migrt$pkg.obten_var_page(18060, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228660) from sie_13_page_item where nom_apex = 'P1056_REF_DV_PRIOR' and ref_page = sie$migrt$pkg.obten_var_page(18060, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228661) from sie_13_page_item where nom_apex = 'P1056_REF_STAT' and ref_page = sie$migrt$pkg.obten_var_page(18060, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228662) from sie_13_page_item where nom_apex = 'P1056_COMNT' and ref_page = sie$migrt$pkg.obten_var_page(18060, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228663) from sie_13_page_item where nom_apex = 'P1056_REF_DV_COMPL' and ref_page = sie$migrt$pkg.obten_var_page(18060, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228664) from sie_13_page_item where nom_apex = 'P1056_DATE_INSCR' and ref_page = sie$migrt$pkg.obten_var_page(18060, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228665) from sie_13_page_item where nom_apex = 'P1056_REF_JALON' and ref_page = sie$migrt$pkg.obten_var_page(18060, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228666) from sie_13_page_item where nom_apex = 'P1056_REF_NATR_TACHE' and ref_page = sie$migrt$pkg.obten_var_page(18060, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228667) from sie_13_page_item where nom_apex = 'P1056_REF_ENVIR' and ref_page = sie$migrt$pkg.obten_var_page(18060, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228668) from sie_13_page_item where nom_apex = 'P1056_REF_PRODT' and ref_page = sie$migrt$pkg.obten_var_page(18060, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228669) from sie_13_page_item where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(18060, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228670) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(18060, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228671) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(18060, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228672) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(18060, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228673) from sie_13_page_item where nom_apex = 'EDITER' and ref_page = sie$migrt$pkg.obten_var_page(18060, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228674) from sie_13_page_item where nom_apex = 'CONSULTER' and ref_page = sie$migrt$pkg.obten_var_page(18060, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228039) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17975, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228040) from sie_13_page_item where nom_apex = 'P1023_REF_JALON' and ref_page = sie$migrt$pkg.obten_var_page(17976, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228041) from sie_13_page_item where nom_apex = 'P1023_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17976, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228042) from sie_13_page_item where nom_apex = 'P1023_DEBUT_EFEC' and ref_page = sie$migrt$pkg.obten_var_page(17976, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228043) from sie_13_page_item where nom_apex = 'P1023_FIN_EFECT' and ref_page = sie$migrt$pkg.obten_var_page(17976, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228044) from sie_13_page_item where nom_apex = 'P1023_REF_EQUIP' and ref_page = sie$migrt$pkg.obten_var_page(17976, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228045) from sie_13_page_item where nom_apex = 'P1023_POURC_AFECT_EQUIP_JALON' and ref_page = sie$migrt$pkg.obten_var_page(17976, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228046) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(17976, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228047) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17976, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228048) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17976, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228049) from sie_13_page_item where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(17976, 'Select');
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
select seqnc into sie$migrt$pkg.var_page_item(228050) from sie_13_page_item where nom_apex = 'P1032_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17977, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228051) from sie_13_page_item where nom_apex = 'P1032_DEBUT_EFECT' and ref_page = sie$migrt$pkg.obten_var_page(17977, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228052) from sie_13_page_item where nom_apex = 'P1032_EFORT_DISPN_SEMN' and ref_page = sie$migrt$pkg.obten_var_page(17977, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228053) from sie_13_page_item where nom_apex = 'P1032_FIN_EFECT' and ref_page = sie$migrt$pkg.obten_var_page(17977, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228054) from sie_13_page_item where nom_apex = 'P1032_REF_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(17977, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228055) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(17977, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228056) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17977, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228057) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17977, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228058) from sie_13_page_item where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(17977, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228059) from sie_13_page_item where nom_apex = 'P1012_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17978, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228060) from sie_13_page_item where nom_apex = 'P1012_CODE' and ref_page = sie$migrt$pkg.obten_var_page(17978, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228061) from sie_13_page_item where nom_apex = 'P1012_NOM' and ref_page = sie$migrt$pkg.obten_var_page(17978, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228062) from sie_13_page_item where nom_apex = 'P1012_DESCR' and ref_page = sie$migrt$pkg.obten_var_page(17978, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228063) from sie_13_page_item where nom_apex = 'P1012_LIEN_EQUIP' and ref_page = sie$migrt$pkg.obten_var_page(17978, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228064) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17978, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228065) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(17978, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228066) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17978, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228067) from sie_13_page_item where nom_apex = 'CREER_LIEN_EQUIP' and ref_page = sie$migrt$pkg.obten_var_page(17978, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228068) from sie_13_page_item where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(17978, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228069) from sie_13_page_item where nom_apex = 'P1053_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17979, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228072) from sie_13_page_item where nom_apex = 'P1053_REF_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(17979, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228075) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(17979, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228076) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17979, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228079) from sie_13_page_item where nom_apex = 'P1013_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17980, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228080) from sie_13_page_item where nom_apex = 'P1013_REF_EQUIP' and ref_page = sie$migrt$pkg.obten_var_page(17980, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228081) from sie_13_page_item where nom_apex = 'P1013_REF_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(17980, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228082) from sie_13_page_item where nom_apex = 'P1013_DEBUT_EFECT' and ref_page = sie$migrt$pkg.obten_var_page(17980, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228083) from sie_13_page_item where nom_apex = 'P1013_FIN_EFECT' and ref_page = sie$migrt$pkg.obten_var_page(17980, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228084) from sie_13_page_item where nom_apex = 'P1013_POURC_IMPLI_EQUIP' and ref_page = sie$migrt$pkg.obten_var_page(17980, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228085) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17980, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228086) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17980, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228087) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(17980, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228088) from sie_13_page_item where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(17980, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228089) from sie_13_page_item where nom_apex = 'P1042_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17981, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228090) from sie_13_page_item where nom_apex = 'P1042_CODE' and ref_page = sie$migrt$pkg.obten_var_page(17981, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228091) from sie_13_page_item where nom_apex = 'P1042_NOM' and ref_page = sie$migrt$pkg.obten_var_page(17981, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228092) from sie_13_page_item where nom_apex = 'P1042_DESCR' and ref_page = sie$migrt$pkg.obten_var_page(17981, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228093) from sie_13_page_item where nom_apex = 'P1042_ROLE_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(17981, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228094) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17981, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228095) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(17981, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228096) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17981, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228097) from sie_13_page_item where nom_apex = 'CREER_ROLE_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(17981, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228098) from sie_13_page_item where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(17981, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228099) from sie_13_page_item where nom_apex = 'P1022_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17982, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228100) from sie_13_page_item where nom_apex = 'P1022_NOM' and ref_page = sie$migrt$pkg.obten_var_page(17982, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228101) from sie_13_page_item where nom_apex = 'P1022_REF_PRODT' and ref_page = sie$migrt$pkg.obten_var_page(17982, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228102) from sie_13_page_item where nom_apex = 'P1022_DATE_PREVU' and ref_page = sie$migrt$pkg.obten_var_page(17982, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228103) from sie_13_page_item where nom_apex = 'P1022_JALON_EQUIP' and ref_page = sie$migrt$pkg.obten_var_page(17982, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228104) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17982, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228105) from sie_13_page_item where nom_apex = 'CREER_JALON_EQUIP' and ref_page = sie$migrt$pkg.obten_var_page(17982, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228106) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(17982, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228107) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17982, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228108) from sie_13_page_item where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(17982, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228109) from sie_13_page_item where nom_apex = 'P1052_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17983, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228110) from sie_13_page_item where nom_apex = 'P1052_NUMR_SIGNF' and ref_page = sie$migrt$pkg.obten_var_page(17983, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228111) from sie_13_page_item where nom_apex = 'P1052_NOM' and ref_page = sie$migrt$pkg.obten_var_page(17983, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228112) from sie_13_page_item where nom_apex = 'P1052_DESCR' and ref_page = sie$migrt$pkg.obten_var_page(17983, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228117) from sie_13_page_item where nom_apex = 'P1052_REF_ENVIR' and ref_page = sie$migrt$pkg.obten_var_page(17983, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228118) from sie_13_page_item where nom_apex = 'P1052_REF_DV_PRIOR' and ref_page = sie$migrt$pkg.obten_var_page(17983, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228119) from sie_13_page_item where nom_apex = 'P1052_REF_STAT' and ref_page = sie$migrt$pkg.obten_var_page(17983, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228120) from sie_13_page_item where nom_apex = 'P1052_COMNT' and ref_page = sie$migrt$pkg.obten_var_page(17983, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228122) from sie_13_page_item where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(17983, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228123) from sie_13_page_item where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17983, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228124) from sie_13_page_item where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17983, 'Select');
select seqnc into sie$migrt$pkg.var_page_item(228126) from sie_13_page_item where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(17983, 'Select');
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
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = null where numr_apex = 0 and ref_aplic = sie$migrt$pkg.obten_var_aplic(190, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = null where numr_apex = 1 and ref_aplic = sie$migrt$pkg.obten_var_aplic(190, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4574, 'Update') where numr_apex = 101 and ref_aplic = sie$migrt$pkg.obten_var_aplic(190, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4561, 'Update') where numr_apex = 102 and ref_aplic = sie$migrt$pkg.obten_var_aplic(190, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4541, 'Update') where numr_apex = 1001 and ref_aplic = sie$migrt$pkg.obten_var_aplic(190, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4943, 'Update') where numr_apex = 1043 and ref_aplic = sie$migrt$pkg.obten_var_aplic(190, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4934, 'Update') where numr_apex = 1041 and ref_aplic = sie$migrt$pkg.obten_var_aplic(190, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4942, 'Update') where numr_apex = 1031 and ref_aplic = sie$migrt$pkg.obten_var_aplic(190, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4941, 'Update') where numr_apex = 1011 and ref_aplic = sie$migrt$pkg.obten_var_aplic(190, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = null where numr_apex = 2 and ref_aplic = sie$migrt$pkg.obten_var_aplic(190, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4940, 'Update') where numr_apex = 1021 and ref_aplic = sie$migrt$pkg.obten_var_aplic(190, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4937, 'Update') where numr_apex = 1051 and ref_aplic = sie$migrt$pkg.obten_var_aplic(190, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4936, 'Update') where numr_apex = 1023 and ref_aplic = sie$migrt$pkg.obten_var_aplic(190, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4942, 'Update') where numr_apex = 1032 and ref_aplic = sie$migrt$pkg.obten_var_aplic(190, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4941, 'Update') where numr_apex = 1012 and ref_aplic = sie$migrt$pkg.obten_var_aplic(190, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4938, 'Update') where numr_apex = 1053 and ref_aplic = sie$migrt$pkg.obten_var_aplic(190, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4939, 'Update') where numr_apex = 1013 and ref_aplic = sie$migrt$pkg.obten_var_aplic(190, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4934, 'Update') where numr_apex = 1042 and ref_aplic = sie$migrt$pkg.obten_var_aplic(190, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4940, 'Update') where numr_apex = 1022 and ref_aplic = sie$migrt$pkg.obten_var_aplic(190, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4937, 'Update') where numr_apex = 1052 and ref_aplic = sie$migrt$pkg.obten_var_aplic(190, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = null where numr_apex = 1054 and ref_aplic = sie$migrt$pkg.obten_var_aplic(190, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4937, 'Update') where numr_apex = 1056 and ref_aplic = sie$migrt$pkg.obten_var_aplic(190, 'Select');
update sie_13_page set ref_mesg_aucun_don_trouv = null, ref_mesg_echec_specf = null, ref_mesg_fetch_specf = null, ref_mesg_range_inser_specf = null, ref_mesg_range_modf_specf = null, ref_mesg_range_suprm_specf = null, ref_mesg_sucs_specf = null, ref_mesg_suprs_specf = null, ref_mesg_trop_don_trouv = null, ref_page_rechr = null, ref_struc_aplic = sie$migrt$pkg.obten_var_struc_aplic(4937, 'Update') where numr_apex = 1055 and ref_aplic = sie$migrt$pkg.obten_var_aplic(190, 'Select');
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
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7051, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7374, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_EQUIP' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7374, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_UTILS' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7374, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DEBUT_EFECT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7374, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'FIN_EFECT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7374, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'POURC_IMPLI_EQUIP' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7374, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_UTILS_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7374, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7375, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_UTILS_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7375, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DEBUT_EFECT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7375, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'EFORT_DISPN_SEMN' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7375, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'FIN_EFECT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7375, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7376, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7376, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7376, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DESCR' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7376, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DATE_INSCR' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7378, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7377, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_EQUIP_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7377, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DEBUT_EFECT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7377, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'FIN_EFECT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7377, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'POURC_AFECT_EQUIP_JALON' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7377, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7372, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_UTILS_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7370, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7378, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NUMR_SIGNF' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7378, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7378, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_ENVIR_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7378, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_DV_PRIOR_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7378, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_STAT_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7378, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7051, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7051, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7370, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_ROLE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7370, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_UTILS' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7370, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DEBUT_EFECT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7370, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'FIN_EFECT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7370, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7371, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'CODE' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7371, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7371, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DESCR' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7371, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7372, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'DATE_PREVU' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7372, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_NATR_TACHE_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7378, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_PRODT_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7378, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_STAT_REALS' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7428, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NUMR_SIGNF' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7428, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'NOM' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7428, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_ENVIR_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7428, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_PRODT_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7428, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_NATR_TACHE_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7428, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_DV_PRIOR_FORMT' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7428, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_DV_PRIOR' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7428, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'REF_UTILS' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7428, 'Select');
update sie_13_page_ir_coln set ref_mesg_aide = null where coln_table = 'SEQNC' and ref_page_ir = sie$migrt$pkg.obten_var_page_ir(7428, 'Select');
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
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SADA' and ref_page = sie$migrt$pkg.obten_var_page(17213, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SIDF' and ref_page = sie$migrt$pkg.obten_var_page(17213, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SSPC' and ref_page = sie$migrt$pkg.obten_var_page(17213, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SCPC' and ref_page = sie$migrt$pkg.obten_var_page(17213, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAPC' and ref_page = sie$migrt$pkg.obten_var_page(17213, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SNPI' and ref_page = sie$migrt$pkg.obten_var_page(17213, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SCPI' and ref_page = sie$migrt$pkg.obten_var_page(17213, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SSPI' and ref_page = sie$migrt$pkg.obten_var_page(17213, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAPI' and ref_page = sie$migrt$pkg.obten_var_page(17213, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P0_RECHR_GLOBL' and ref_page = sie$migrt$pkg.obten_var_page(17213, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_CODE_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(17215, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_MOT_PASSE' and ref_page = sie$migrt$pkg.obten_var_page(17215, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_LOGIN' and ref_page = sie$migrt$pkg.obten_var_page(17215, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(17215, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_LANG' and ref_page = sie$migrt$pkg.obten_var_page(17215, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P101_FORCE_DOMN' and ref_page = sie$migrt$pkg.obten_var_page(17215, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_APPLICATION_ID' and ref_page = sie$migrt$pkg.obten_var_page(17216, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_PAGE_ID' and ref_page = sie$migrt$pkg.obten_var_page(17216, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_A' and ref_page = sie$migrt$pkg.obten_var_page(17216, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_FEEDBACK' and ref_page = sie$migrt$pkg.obten_var_page(17216, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_X' and ref_page = sie$migrt$pkg.obten_var_page(17216, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_FEEDBACK_TYPE' and ref_page = sie$migrt$pkg.obten_var_page(17216, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P102_Y' and ref_page = sie$migrt$pkg.obten_var_page(17216, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SUBMIT' and ref_page = sie$migrt$pkg.obten_var_page(17216, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1043_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17969, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1043_REF_ROLE' and ref_page = sie$migrt$pkg.obten_var_page(17969, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1043_REF_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(17969, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1043_DEBUT_EFECT' and ref_page = sie$migrt$pkg.obten_var_page(17969, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1043_FIN_EFECT' and ref_page = sie$migrt$pkg.obten_var_page(17969, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17969, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17969, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(17969, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(17969, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17970, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1031_DISPN_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(17971, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17971, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17972, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17974, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1052_DATE_INSCR' and ref_page = sie$migrt$pkg.obten_var_page(17983, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1052_REF_NATR_TACHE' and ref_page = sie$migrt$pkg.obten_var_page(17983, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1052_REF_PRODT' and ref_page = sie$migrt$pkg.obten_var_page(17983, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1052_REF_DV_COMPL' and ref_page = sie$migrt$pkg.obten_var_page(17983, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1052_PLANIF_EFORT' and ref_page = sie$migrt$pkg.obten_var_page(17983, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1052_REF_JALON' and ref_page = sie$migrt$pkg.obten_var_page(17983, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1052_AFECT' and ref_page = sie$migrt$pkg.obten_var_page(17983, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'EDITER_PLANIF_EFORT' and ref_page = sie$migrt$pkg.obten_var_page(17983, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'EDITER_AFECT' and ref_page = sie$migrt$pkg.obten_var_page(17983, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1054_REF_ROLE_FORMT' and ref_page = sie$migrt$pkg.obten_var_page(18059, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1054_AJOUTER' and ref_page = sie$migrt$pkg.obten_var_page(18059, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(18059, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SUBMIT' and ref_page = sie$migrt$pkg.obten_var_page(18059, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'ADD' and ref_page = sie$migrt$pkg.obten_var_page(18059, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1056_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(18060, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1056_PLANIF_EFORT' and ref_page = sie$migrt$pkg.obten_var_page(18060, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1056_REF_STAT_REALS' and ref_page = sie$migrt$pkg.obten_var_page(18060, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1056_NUMR_SIGNF' and ref_page = sie$migrt$pkg.obten_var_page(18060, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1056_NOM' and ref_page = sie$migrt$pkg.obten_var_page(18060, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1056_DESCR' and ref_page = sie$migrt$pkg.obten_var_page(18060, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1056_REF_DV_PRIOR' and ref_page = sie$migrt$pkg.obten_var_page(18060, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1056_REF_STAT' and ref_page = sie$migrt$pkg.obten_var_page(18060, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1056_COMNT' and ref_page = sie$migrt$pkg.obten_var_page(18060, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1056_REF_DV_COMPL' and ref_page = sie$migrt$pkg.obten_var_page(18060, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1056_DATE_INSCR' and ref_page = sie$migrt$pkg.obten_var_page(18060, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1056_REF_JALON' and ref_page = sie$migrt$pkg.obten_var_page(18060, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1056_REF_NATR_TACHE' and ref_page = sie$migrt$pkg.obten_var_page(18060, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1056_REF_ENVIR' and ref_page = sie$migrt$pkg.obten_var_page(18060, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1056_REF_PRODT' and ref_page = sie$migrt$pkg.obten_var_page(18060, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(18060, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(18060, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(18060, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(18060, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'EDITER' and ref_page = sie$migrt$pkg.obten_var_page(18060, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CONSULTER' and ref_page = sie$migrt$pkg.obten_var_page(18060, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17975, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1023_REF_JALON' and ref_page = sie$migrt$pkg.obten_var_page(17976, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1023_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17976, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1023_DEBUT_EFEC' and ref_page = sie$migrt$pkg.obten_var_page(17976, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1023_FIN_EFECT' and ref_page = sie$migrt$pkg.obten_var_page(17976, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1023_REF_EQUIP' and ref_page = sie$migrt$pkg.obten_var_page(17976, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1023_POURC_AFECT_EQUIP_JALON' and ref_page = sie$migrt$pkg.obten_var_page(17976, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(17976, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17976, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17976, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(17976, 'Select');
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
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1032_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17977, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1032_DEBUT_EFECT' and ref_page = sie$migrt$pkg.obten_var_page(17977, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1032_EFORT_DISPN_SEMN' and ref_page = sie$migrt$pkg.obten_var_page(17977, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1032_FIN_EFECT' and ref_page = sie$migrt$pkg.obten_var_page(17977, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1032_REF_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(17977, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(17977, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17977, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17977, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(17977, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1012_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17978, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1012_CODE' and ref_page = sie$migrt$pkg.obten_var_page(17978, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1012_NOM' and ref_page = sie$migrt$pkg.obten_var_page(17978, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1012_DESCR' and ref_page = sie$migrt$pkg.obten_var_page(17978, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1012_LIEN_EQUIP' and ref_page = sie$migrt$pkg.obten_var_page(17978, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17978, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(17978, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17978, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREER_LIEN_EQUIP' and ref_page = sie$migrt$pkg.obten_var_page(17978, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(17978, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1053_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17979, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1053_REF_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(17979, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(17979, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17979, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1013_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17980, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1013_REF_EQUIP' and ref_page = sie$migrt$pkg.obten_var_page(17980, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1013_REF_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(17980, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1013_DEBUT_EFECT' and ref_page = sie$migrt$pkg.obten_var_page(17980, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1013_FIN_EFECT' and ref_page = sie$migrt$pkg.obten_var_page(17980, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1013_POURC_IMPLI_EQUIP' and ref_page = sie$migrt$pkg.obten_var_page(17980, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17980, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17980, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(17980, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(17980, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1042_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17981, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1042_CODE' and ref_page = sie$migrt$pkg.obten_var_page(17981, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1042_NOM' and ref_page = sie$migrt$pkg.obten_var_page(17981, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1042_DESCR' and ref_page = sie$migrt$pkg.obten_var_page(17981, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1042_ROLE_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(17981, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17981, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(17981, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17981, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREER_ROLE_UTILS' and ref_page = sie$migrt$pkg.obten_var_page(17981, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(17981, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1022_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17982, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1022_NOM' and ref_page = sie$migrt$pkg.obten_var_page(17982, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1022_REF_PRODT' and ref_page = sie$migrt$pkg.obten_var_page(17982, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1022_DATE_PREVU' and ref_page = sie$migrt$pkg.obten_var_page(17982, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1022_JALON_EQUIP' and ref_page = sie$migrt$pkg.obten_var_page(17982, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17982, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREER_JALON_EQUIP' and ref_page = sie$migrt$pkg.obten_var_page(17982, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(17982, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17982, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(17982, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1052_SEQNC' and ref_page = sie$migrt$pkg.obten_var_page(17983, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1052_NUMR_SIGNF' and ref_page = sie$migrt$pkg.obten_var_page(17983, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1052_NOM' and ref_page = sie$migrt$pkg.obten_var_page(17983, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1052_DESCR' and ref_page = sie$migrt$pkg.obten_var_page(17983, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1052_REF_ENVIR' and ref_page = sie$migrt$pkg.obten_var_page(17983, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1052_REF_DV_PRIOR' and ref_page = sie$migrt$pkg.obten_var_page(17983, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1052_REF_STAT' and ref_page = sie$migrt$pkg.obten_var_page(17983, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'P1052_COMNT' and ref_page = sie$migrt$pkg.obten_var_page(17983, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'SAVE' and ref_page = sie$migrt$pkg.obten_var_page(17983, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CANCEL' and ref_page = sie$migrt$pkg.obten_var_page(17983, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'CREATE' and ref_page = sie$migrt$pkg.obten_var_page(17983, 'Select');
update sie_13_page_item set ref_mesg_aide = null, ref_opert = null where nom_apex = 'DELETE' and ref_page = sie$migrt$pkg.obten_var_page(17983, 'Select');
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
                       set ref_versn = sie$migrt$pkg.obten_var_versn(223, 'Update'),
                           indic_aplic_authe = 'O',
                           ref_aplic_authe = sie$migrt$pkg.obten_var_aplic(187, 'Update'),
                           ref_page_conxn = sie$migrt$pkg.obten_var_page(17215, 'Update')
                     where seqnc = sie$migrt$pkg.obten_var_aplic(190);
end if;
exception
when others then
sie$migrt$pkg.defnr_ereur ('Update sur sie_11_aplic');
end;
/
begin
  if sie$migrt$pkg.vnu_sql_code = 0 then
    dbms_output.put_line ('Mise a jour du referentiel pour application : SAFM - SIE APEX Framework - Méthodologie');
    sie_13_page_pkg.maj_table_a_partr_refrt_apex(sie$migrt$pkg.var_aplic(190),'O');
  end if;
end;
/

